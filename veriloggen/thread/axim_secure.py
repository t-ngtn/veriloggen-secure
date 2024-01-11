from __future__ import absolute_import
from __future__ import print_function

import math

from veriloggen import *
import veriloggen.thread as vthread
import veriloggen.types.axi as axi
from veriloggen.thread.axi import AXIM
from veriloggen.security.hmac_sha256 import HmacSha256
from veriloggen.security.hmac_sha256_debug import HmacSha256Debug
from .ram import RAM


DATA_BLOCK_BYTE_SIZE = 32
DATA_BLOCK_BIT_SIZE = DATA_BLOCK_BYTE_SIZE * 8
HASH_BYTE_SIZE = 32
HASH_BIT_SIZE = HASH_BYTE_SIZE * 8
SEP = 2

class AXIMSecure(AXIM):
    """ AXI Master Interface with DMA controller Integrity Tree """ 
    
    __intrinsics__ = ('dma_read_secure', 'dma_write_secure', 'init', "dma_read", "dma_write")
    
    def __init__(self, m, name, clk, rst, datawidth=32, addrwidth=32,
                 waddr_id_width=0, wdata_id_width=0, wresp_id_width=0,
                 raddr_id_width=0, rdata_id_width=0,
                 waddr_user_width=2, wdata_user_width=0, wresp_user_width=0,
                 raddr_user_width=2, rdata_user_width=0,
                 waddr_burst_mode=axi.BURST_INCR, raddr_burst_mode=axi.BURST_INCR,
                 waddr_cache_mode=axi.AxCACHE_NONCOHERENT, raddr_cache_mode=axi.AxCACHE_NONCOHERENT,
                 waddr_prot_mode=axi.AxPROT_NONCOHERENT, raddr_prot_mode=axi.AxPROT_NONCOHERENT,
                 waddr_user_mode=axi.AxUSER_NONCOHERENT, wdata_user_mode=axi.xUSER_DEFAULT,
                 raddr_user_mode=axi.AxUSER_NONCOHERENT,
                 noio=False, sb_depth=1,
                 use_global_base_addr=False,
                 op_sel_width=8, req_fifo_addrwidth=3,
                 fsm_as_module=False, 
                 # global_max_addr specifies the maximum address of the memory to be used, sk is the secret key
                 global_max_addr=65535, max_ram_byte_size=1024, sk=None,
                 ):
        
        AXIM.__init__(self, m, name, clk, rst, datawidth, addrwidth,
                        waddr_id_width, wdata_id_width, wresp_id_width,
                        raddr_id_width, rdata_id_width,
                        waddr_user_width, wdata_user_width, wresp_user_width,
                        raddr_user_width, rdata_user_width,
                        waddr_burst_mode, raddr_burst_mode,
                        waddr_cache_mode, raddr_cache_mode,
                        waddr_prot_mode, raddr_prot_mode,
                        waddr_user_mode, wdata_user_mode,
                        raddr_user_mode,
                        noio, sb_depth,
                        use_global_base_addr,
                        op_sel_width, req_fifo_addrwidth,
                        fsm_as_module)
        
        self.block_bit_width = datawidth
        self.sk = sk
        self.global_max_addr = global_max_addr
        self.max_ram_byte_size = max_ram_byte_size
        self.tmp_ram = RAM(self.m, 'tmp_ram', self.clk, self.rst, datawidth=DATA_BLOCK_BIT_SIZE, addrwidth=(_align_block_ceil(self.max_ram_byte_size * 8, DATA_BLOCK_BIT_SIZE)).bit_length())

        self.data_end_addr = _next_power_of_2((self.global_max_addr + 1) // DATA_BLOCK_BYTE_SIZE) * DATA_BLOCK_BYTE_SIZE - 1
        self.total_block_cnt = (self.data_end_addr + 1) // DATA_BLOCK_BYTE_SIZE 
        self.mac_begin_addr = self.data_end_addr + 1
        self.root_addr = self.mac_begin_addr  # the root is stored ad the begin of the mac region
        self.mac_tree_height = _calc_height_from_leaf_num(self.total_block_cnt)
        self.total_mac_block_cnt = _calc_nodes_from_height(self.mac_tree_height)
        self.mac_begin_idx = SEP ** self.mac_tree_height - 1
        self.hmac_sha256 = HmacSha256(m, "hmac_sha256", self.clk, self.rst, self.sk)
        
        # for verify & update
        self.data_ram = RAM(self.m, 'data_ram', self.clk, self.rst, datawidth=DATA_BLOCK_BIT_SIZE, addrwidth=1)
        self.mac_ram = RAM(self.m, 'mac_ram', self.clk, self.rst, datawidth=HASH_BIT_SIZE, addrwidth=_calc_mac_ram_size(self.mac_tree_height))
        self.calc_mac_ram = RAM(self.m, 'calc_mac_ram', self.clk, self.rst, datawidth=HASH_BIT_SIZE, addrwidth=1)
        self.root: Reg = self.m.Reg('root', HASH_BIT_SIZE)
        self.hash_calc_reg: Reg = self.m.Reg('hash_calc_reg', HASH_BIT_SIZE)
        self.hidx: Reg = self.m.Reg('hidx', self.total_mac_block_cnt.bit_length(), initval=0)
        self.is_secure: Reg = self.m.Reg('is_secure', initval=1)
        
        self.i = self.m.Reg('i', 32, initval=0)
        
        # self.print_info()
        
    def print_info(self):
        print("global_max_addr: ", self.global_max_addr)
        print("data_end_addr: ", self.data_end_addr)
        print("total_block_cnt: ", self.total_block_cnt)
        print("mac_begin_addr: ", self.mac_begin_addr)
        print("root_addr: ", self.root_addr)
        print("mac_tree_height: ", self.mac_tree_height)
        print("total_mac_block_cnt: ", self.total_mac_block_cnt)
        print("ram_addrwidth: ", (_align_block_ceil(self.max_ram_byte_size * 8, DATA_BLOCK_BIT_SIZE)).bit_length())
        print("mac_begin_idx: ", self.mac_begin_idx)
        
    def dma_read_secure(self, fsm: FSM, ram, local_addr, global_addr, local_size,
                        local_stride=1, port=0):
        
        # dma_read_to_tmp
        begin_data_addr, begin_data_idx, end_data_addr, end_data_idx, data_block_size = self.read_to_tmp(fsm, self.tmp_ram, global_addr, local_size)
        
        fsm(self.i(0))
        fsm.goto_next()
        begin_state = fsm.current
        
        self._verify_one_block(fsm, begin_data_idx, self.i)
        fsm.add(self.i.inc())
        fsm.goto_next()
        
        end_state = fsm.current
        fsm.If(self.i < data_block_size ).goto_from(end_state, begin_state)
        fsm.If(self.i == data_block_size)(
            self.i(0)
        )
        fsm.If(self.i == data_block_size).goto_next()
            
        # copy
        # tmp -> ram (現状 ram width == datawidth のみ)
        vthread.copy(fsm, self.tmp_ram, ram, 0, local_addr, data_block_size)
        
        
    def dma_write_secure(self, fsm: FSM, ram, local_addr, global_addr, local_size,
                         local_stride=1, port=0):
        
        begin_data_addr, begin_data_idx, end_data_addr, end_data_idx, data_block_size = self.read_to_tmp(fsm, self.tmp_ram, global_addr, local_size)
        
        fsm(self.i(0))
        fsm.goto_next()
        
        begin_state = fsm.current
        
        self._verify_one_block(fsm, begin_data_idx, self.i)
        self._update(fsm, ram, begin_data_addr, local_addr, begin_data_idx, self.i)
        
        fsm(self.i.inc())
        fsm.goto_next()
        
        end_state = fsm.current
        fsm.If(self.i < data_block_size).goto_from(end_state, begin_state)
        fsm.If(self.i == data_block_size)(
            self.i(0)
        )
        fsm.If(self.i == data_block_size).goto_next()
    
    def _verify_one_block(self, fsm: FSM, begin_data_idx, idx):
        data = self.tmp_ram.read(fsm, idx)
        self.hmac_sha256.input_data(fsm, _implement0(data), with_key=True, is_last=True)
        self.hmac_sha256.wait(fsm, self.hash_calc_reg)
        
        hidx = self.mac_begin_idx + begin_data_idx + idx
        
        for i in range(self.mac_tree_height):
            begin_state = fsm.current
            fsm.set_index(begin_state + 1)
                
            # if hidx % 2:
            hidx1 = hidx + 1
            self.dma_read(fsm, self.mac_ram, i, self.root_addr + hidx1 * HASH_BYTE_SIZE, 1)
            hash_tmp = self.mac_ram.read(fsm, i)
            self.hmac_sha256.input_data(fsm, _implement0(self.hash_calc_reg), with_key=False, is_last=False)
            self.hmac_sha256.input_data(fsm, _implement0(hash_tmp), with_key=False, is_last=True)
            
            end_true_state = fsm.current
            fsm.set_index(end_true_state + 1)
            
            # else:
            hidx2 = hidx - 1
            self.dma_read(fsm, self.mac_ram, i, self.root_addr + hidx2 * HASH_BYTE_SIZE, 1)
            hash_tmp = self.mac_ram.read(fsm, i)
            self.hmac_sha256.input_data(fsm, _implement0(hash_tmp), with_key=False, is_last=False)
            self.hmac_sha256.input_data(fsm, _implement0(self.hash_calc_reg), with_key=False, is_last=True)
            
            end_false_state = fsm.current
            fsm.set_index(end_false_state + 1)
            
            fsm.If(hidx & 0x1).goto_from(begin_state, begin_state + 1)
            fsm.goto_from(end_true_state, end_false_state + 1)
            fsm.If(Not(hidx & 0x1)).goto_from(begin_state, end_true_state + 1)
            fsm.goto_from(end_false_state, end_false_state + 1)
            
            self.hmac_sha256.wait(fsm, self.hash_calc_reg)
            hidx = (hidx - 1) // 2
        
        # mac verification
        fsm.If(self.hash_calc_reg != self.root)(
            self.is_secure(0)
        )
        fsm.goto_next()
        
    def _update(self, fsm: FSM, ram: RAM, begin_data_addr, local_addr, begin_data_idx, idx):
        self.dma_write(fsm, ram, local_addr + idx, begin_data_addr + idx * DATA_BLOCK_BYTE_SIZE, 1)
        data = ram.read(fsm, local_addr + idx)
        self.hmac_sha256.input_data(fsm, _implement0(data), with_key=True, is_last=True)
        self.hmac_sha256.wait(fsm, self.hash_calc_reg)
        self.calc_mac_ram.write(fsm, 0, self.hash_calc_reg)
        hidx = self.mac_begin_idx + begin_data_idx + idx
        self.dma_write(fsm, self.calc_mac_ram, 0, self.root_addr + hidx * HASH_BYTE_SIZE, 1)
        
        for i in range(self.mac_tree_height):            
            hash_tmp = self.mac_ram.read(fsm, i)
            
            begin_state = fsm.current
            fsm.set_index(begin_state + 1)
            
            # if hidx % 2:
            self.hmac_sha256.input_data(fsm, _implement0(self.hash_calc_reg), with_key=False, is_last=False)
            self.hmac_sha256.input_data(fsm, _implement0(hash_tmp), with_key=False, is_last=True)
            
            end_true_state = fsm.current
            fsm.set_index(end_true_state + 1)
            
            # else:
            self.hmac_sha256.input_data(fsm, _implement0(hash_tmp), with_key=False, is_last=False)
            self.hmac_sha256.input_data(fsm, _implement0(self.hash_calc_reg), with_key=False, is_last=True)
            
            end_false_state = fsm.current
            fsm.If(hidx & 0x1).goto_from(begin_state, begin_state + 1)
            fsm.goto_from(end_true_state, end_false_state + 1)
            fsm.If(Not(hidx & 0x1)).goto_from(begin_state, end_true_state + 1)
            fsm.goto_from(end_false_state, end_false_state + 1)
            fsm.set_index(end_false_state + 1)
            
            self.hmac_sha256.wait(fsm, self.hash_calc_reg)
            self.calc_mac_ram.write(fsm, 0, self.hash_calc_reg)
            hidx = (hidx - 1) // 2
            self.dma_write(fsm, self.calc_mac_ram, 0, self.root_addr + hidx * HASH_BYTE_SIZE, 1)
        
        fsm().add(self.root(self.hash_calc_reg))
        fsm.goto_next()
        

    def init(self, fsm: FSM):
        # 全データからハッシュを計算して保存する
        for i in range(2 ** self.mac_tree_height):
            self.dma_read(fsm, self.data_ram, 0, i * DATA_BLOCK_BYTE_SIZE, 1)
            data = self.data_ram.read(fsm, 0)
            self.hmac_sha256.input_data(fsm, _implement0(data), with_key=True, is_last=True)
            self.hmac_sha256.wait(fsm, self.hash_calc_reg)
            self.mac_ram.write(fsm, 0, self.hash_calc_reg)
            self.dma_write(fsm, self.mac_ram, 0, self.mac_begin_addr + (self.mac_begin_idx + i) * HASH_BYTE_SIZE, 1)
        
        # ハッシュツリーの更新
        for i in range(self.mac_tree_height, 0, -1):
            hidx = 2 ** i - 1
            for j in range(2 ** (i - 1)):
                self.dma_read(fsm, self.mac_ram, 0, self.root_addr + hidx * HASH_BYTE_SIZE, 1)
                hash0 = self.mac_ram.read(fsm, 0)
                self.dma_read(fsm, self.mac_ram, 1, self.root_addr + (hidx + 1) * HASH_BYTE_SIZE, 1)
                hash1 = self.mac_ram.read(fsm, 1)
                self.hmac_sha256.input_data(fsm, _implement0(hash0), with_key=False, is_last=False)
                self.hmac_sha256.input_data(fsm, _implement0(hash1), with_key=False, is_last=True)
                self.hmac_sha256.wait(fsm, self.hash_calc_reg)
                self.mac_ram.write(fsm, 0, self.hash_calc_reg)
                self.dma_write(fsm, self.mac_ram, 0, self.root_addr + (hidx // 2) * HASH_BYTE_SIZE, 1)
                hidx += 2
        
        # rootの更新
        fsm().add(self.root(self.hash_calc_reg))
        fsm.goto_next()
        
    def read_to_tmp(self, fsm, tmp_ram, global_addr, local_size):
        begin_data_addr = _align_block_floor(global_addr, DATA_BLOCK_BYTE_SIZE)
        begin_data_idx = begin_data_addr // DATA_BLOCK_BYTE_SIZE
        end_data_addr = _align_block_floor(global_addr + (self.datawidth * local_size) // 8 - 1, DATA_BLOCK_BYTE_SIZE)
        end_data_idx = end_data_addr // DATA_BLOCK_BYTE_SIZE
        data_block_size = end_data_idx - begin_data_idx + 1
        self.dma_read(fsm, tmp_ram, 0, begin_data_addr, data_block_size)
        
        return begin_data_addr, begin_data_idx, end_data_addr, end_data_idx, data_block_size

def _align_block_ceil(x, size):
    return ((x + size - 1 ) // size) * size

def _align_block_floor(x, size):
    return (x // size) * size

def _calc_height_from_leaf_num(x):
    if x <= 0:
        return 0
    return math.ceil(math.log(x, SEP))

def _calc_nodes_from_height(h):
    if h <= 0:
        return 0
    return (SEP ** (h + 1) - 1) // (SEP - 1)

def _calc_mac_ram_size(height):
    if height <= 0:
        return 1
    return int(math.log2(height)) + 1

def _next_power_of_2(x):
    return 2 ** (x - 1).bit_length()

def _implement0(data):
    return data & Int((1 << HASH_BIT_SIZE) - 1, HASH_BIT_SIZE * 2, 16)

def _implement_data(data, data_width, impl_data, impl_data_width, begin_bit):
    if (data_width - begin_bit) < impl_data_width:
        raise ValueError("impl_data_width is too large")

    rem_bit = data_width - begin_bit - impl_data_width
    
    impl_data = impl_data << rem_bit
    mask = (2 ** impl_data_width - 1) << rem_bit
    data = data & ~mask | impl_data
    
    return data

