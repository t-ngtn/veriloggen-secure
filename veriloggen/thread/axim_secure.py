from __future__ import absolute_import
from __future__ import print_function

import math

from veriloggen import *
import veriloggen.types.axi as axi
from veriloggen.thread.axi import AXIM
from veriloggen.security.hmac_sha256 import HmacSha256
from .ram import RAM


DATA_BLOCK_BYTE_SIZE = 64
DATA_BLOCK_BIT_SIZE = DATA_BLOCK_BYTE_SIZE * 8
HASH_BYTE_SIZE = 32
HASH_BIT_SIZE = HASH_BYTE_SIZE * 8
SEP = DATA_BLOCK_BYTE_SIZE // HASH_BYTE_SIZE

class AXIMSecure(AXIM):
    """ AXI Master Interface with DMA controller Integrity Tree """ 
    
    __intrinsics__ = ('dma_read_secure', 'dma_write_secure')
    
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
        
        self.sk = sk
        self.global_max_addr = global_max_addr
        self.max_ram_byte_size = max_ram_byte_size
        self.tmp_ram = RAM(self.m, 'tmp_ram', self.clk, self.rst, datawidth=DATA_BLOCK_BIT_SIZE, addrwidth=(_align_block_ceil(self.max_ram_byte_size * 8, DATA_BLOCK_BIT_SIZE)).bit_length())
        
        self.data_end_addr = _align_block_ceil(self.global_max_addr + 1, DATA_BLOCK_BYTE_SIZE) - 1
        self.total_block_cnt = (self.data_end_addr + 1) // DATA_BLOCK_BYTE_SIZE 
        self.mac_begin_addr = self.data_end_addr + 1
        self.root_addr = self.mac_begin_addr  # the root is stored ad the begin of the mac region
        self.mac_tree_height = _calc_height_from_leaf_num(self.total_block_cnt)
        self.total_mac_block_cnt = _calc_nodes_from_height(self.mac_tree_height)
        self.mac_begin_idx = SEP ** self.mac_tree_height - 1
        
        self.hmac_sha256 = HmacSha256(m, "hmac_sha256", self.clk, self.rst, self.sk)
        
        # for verify & update
        self.data_ram = RAM(self.m, 'data_ram', self.clk, self.rst, datawidth=DATA_BLOCK_BIT_SIZE, addrwidth=1)
        self.mac_ram0 = RAM(self.m, 'mac_ram0', self.clk, self.rst, datawidth=HASH_BIT_SIZE, addrwidth=1)
        self.mac_ram1 = RAM(self.m, 'mac_ram1', self.clk, self.rst, datawidth=HASH_BIT_SIZE, addrwidth=1)
        self.root: Reg = self.m.Reg('root', HASH_BIT_SIZE)
        self.hash_calc_reg: Reg = self.m.Reg('hash_calc_reg', HASH_BIT_SIZE)
        self.hidx: Reg = self.m.Reg('hidx', self.total_mac_block_cnt.bit_length())
        self.is_secure: Reg = self.m.Reg('is_secure', initval=1)
        
        self.print_info()
        
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
        
    def dma_read_secure(self, fsm, ram, local_addr, global_addr, local_size,
                        local_stride=1, port=0):
        
        # dma_read_to_tmp
        begin_data_addr, begin_data_idx, end_data_addr, end_data_idx, data_block_size = self.read_to_tmp(fsm, global_addr, local_size)
        
        print(" --- dma_read_secure --- ")
        print("self.datawidth: ", self.datawidth)
        print("local_addr: ", local_addr)
        print("global_addr: ", global_addr)
        print("local_size: ", local_size)
        print("begin_data_addr: ", begin_data_addr)
        print("begin_dara_idx: ", begin_data_idx)
        print("end_data_addr: ", end_data_addr)
        print("end_data_idx: ", end_data_idx)
        print("data_block_size: ", data_block_size)
        
        # verify
        for i in range(begin_data_idx, end_data_idx + 1):
            self._verify(fsm, i)
        # fsm で終わるまで_verifyをぐるぐる回すようにする
            
        
        # copy
        
        
    def dma_write_secure(self, fsm: FSM, ram, local_addr, global_addr, local_size,
                         local_stride=1, port=0):
        # verify
        begin_data_addr, begin_data_idx, end_data_addr, end_data_idx, data_block_size = self.read_to_tmp(fsm, global_addr, local_size)
        a = fsm.current
        i = self.m.Reg('i', 32, initval=0)
        self._verify(fsm, i + begin_data_idx)
        b = fsm.current
        fsm(i.inc())
        fsm.If(i + begin_data_idx < end_data_idx).goto_from(b, a)
        fsm.If(i + begin_data_idx == end_data_idx)(
            i(0)
        )
        fsm.If(i + begin_data_idx == end_data_idx).goto_next()
        
        
        # for i in range(begin_data_idx, end_data_idx + 1):
        #     self._verify(fsm, i)
        # fsm で終わるまで_verifyをぐるぐる回すようにする
        
        self.dma_write(fsm, ram, local_addr, global_addr, local_size, local_stride, port)
        self._update(fsm)
    
    def _verify(self, fsm: FSM, idx):
        data = self.tmp_ram.read(fsm, idx)
        self.hmac_sha256.input_data(fsm, data, with_key=True, is_last=True)
        self.hmac_sha256.wait(fsm, self.hash_calc_reg)
        
        hidx = self.mac_begin_idx + idx
        
        for _ in range(self.mac_tree_height):            
            if hidx % 2 == 0:
                hidx -= 1
            else:
                hidx += 1
            
            self.dma_read(fsm, self.mac_ram0, 0, self.root_addr + hidx * HASH_BYTE_SIZE, 1)
            hash_tmp = self.mac_ram0.read(fsm, 0)
            self.hmac_sha256.input_data(fsm, self.hash_calc_reg, with_key=False, is_last=False)
            self.hmac_sha256.input_data(fsm, hash_tmp, with_key=False, is_last=True)
            self.hmac_sha256.wait(fsm, self.hash_calc_reg)
            
            hidx = (hidx - 1) // 2
        
        # hash verification
        fsm.If(not equals(self.hash_calc_reg.value, self.root.value))(
            self.is_secure(0)
        )
        fsm.goto_next()
        
    def _update(self, fsm: FSM):
        # 一旦、全データからハッシュを計算して、ハッシュツリーを作成する仕様にする
        for i in range(2 ** self.mac_tree_height):
            self.dma_read(fsm, self.data_ram, 0, i * DATA_BLOCK_BYTE_SIZE, 1)
            data = self.data_ram.read(fsm, 0)
            self.hmac_sha256.input_data(fsm, data, with_key=True, is_last=True)
            self.hmac_sha256.wait(fsm, self.hash_calc_reg)
            self.dma_write(fsm, self.mac_ram0, 0, self.root_addr + i * HASH_BYTE_SIZE, 1)
        
        # ハッシュツリーの更新
        for i in range(self.mac_tree_height, 0, -1):
            hidx = 2 ** i - 1
            for j in range(2 ** (i - 1)):
                self.dma_read(fsm, self.mac_ram0, 0, self.root_addr + hidx * HASH_BYTE_SIZE, 1)
                hash0 = self.mac_ram0.read(fsm, 0)
                self.dma_read(fsm, self.mac_ram1, 0, self.root_addr + (hidx + 1) * HASH_BYTE_SIZE, 1)
                hash1 = self.mac_ram1.read(fsm, 0)
                self.hmac_sha256.input_data(fsm, hash0, with_key=False, is_last=False)
                self.hmac_sha256.input_data(fsm, hash1, with_key=False, is_last=True)
                self.hmac_sha256.wait(fsm, self.hash_calc_reg)
                self.mac_ram0.write(fsm, 0, self.hash_calc_reg)
                self.dma_write(fsm, self.mac_ram0, 0, self.root_addr + (hidx // 2) * HASH_BYTE_SIZE, 1)
                hidx += 2
        
        # rootの更新
        fsm().add(self.root(self.hash_calc_reg))
        fsm.goto_next()
        
    def read_to_tmp(self, fsm, global_addr, local_size):
        begin_data_addr = _align_block_floor(global_addr, DATA_BLOCK_BYTE_SIZE)
        begin_data_idx = begin_data_addr // DATA_BLOCK_BYTE_SIZE
        end_data_addr = _align_block_floor(global_addr + (self.datawidth * local_size) // 8 - 1, DATA_BLOCK_BYTE_SIZE)
        end_data_idx = end_data_addr // DATA_BLOCK_BYTE_SIZE
        data_block_size = end_data_idx - begin_data_idx + 1
        self.dma_read(fsm, self.tmp_ram, 0, begin_data_addr, data_block_size)
        
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
