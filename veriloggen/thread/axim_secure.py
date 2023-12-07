from __future__ import absolute_import
from __future__ import print_function

import math

from veriloggen import *
import veriloggen.types.axi as axi
from veriloggen.thread.axi import AXIM
from veriloggen.security.hmac_sha256 import HmacSha256
from .ram import RAM


TREE_BLOCK_BYTE = 32


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
                 global_max_addr=65535, sk=None,
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
        
        self.global_max_addr = global_max_addr
        self.sk = sk
        self.hight = _calc_height(self.global_max_addr + 4)  # global_max_addr is 0-indexed
        self.tree_start_addr = TREE_BLOCK_BYTE *  4 ** (self.hight)
        
        self.root = self.m.Reg('root', 256)
        self.hmac_sha256 = HmacSha256(m, "hmac_sha256", self.clk, self.rst, self.sk)
        
        self.data_ram = RAM(self.m, 'data_ram', self.clk, self.rst, 512, 2)  # four blocks
        self.hash_ram = RAM(self.m, 'hash_ram', self.clk, self.rst, 256, 1)
        self.hash_calc_reg = self.m.Reg('hash_calc_reg', 256)
        self.input_data0 = self.m.Reg('input_data0', 256)
        self.input_data1 = self.m.Reg('input_data1', 256)
        self.is_secure = self.m.Reg('is_secure', initval=1)
        
        
    def dma_read_secure(self, fsm, ram, local_addr, global_addr, local_size,
                        local_stride=1, port=0):
        self._verify(fsm, ram, local_addr, global_addr, local_size)
        
        local_blocksize = 1
        self._dma_read(fsm, ram, local_addr, global_addr, local_size,
                       local_stride, local_blocksize, port)

        self.dma_wait_read(fsm)
        
    def dma_write_secure(self, fsm, ram, local_addr, global_addr, local_size,
                         local_stride=1, port=0):
        self._update(fsm, ram, local_addr, global_addr)
        
        local_blocksize = 1
        self._dma_write(fsm, ram, local_addr, global_addr, local_size,
                        local_stride, local_blocksize, port)

        self.dma_wait_write(fsm)
    
    def _verify(self, fsm: FSM, ram, local_addr, global_addr, local_size):        
        # read data block, limit ram.datawidth = 32 and local_size = 1
        self.dma_read(fsm, self.data_ram, 0, (global_addr // 128) * 128, 2)
        data1 = self.data_ram.read(fsm, 0)
        data2 = self.data_ram.read(fsm, 1)

        # hash calculation
        self.hmac_sha256.input_data(fsm, data1, is_first=True, is_last=False)
        self.hmac_sha256.input_data(fsm, data2, is_first=False, is_last=True)
        self.hmac_sha256.wait(fsm, self.hash_calc_reg)
        
        # read hash block
        self.dma_read(fsm, self.hash_ram, 0, self.tree_start_addr + (global_addr // 128) * TREE_BLOCK_BYTE, 1)
        hash = self.hash_ram.read(fsm, 0)
        hash.__dict__['signed'] = False
        
        # hash verification
        fsm.If(not equals(self.hash_calc_reg.value, hash.value))(
            self.is_secure(0)
        )
        fsm.goto_next()
        
    
    def _update(self, fsm: FSM, ram: RAM, local_addr, global_addr):
        # limit ram.datawidth = 32 and local_size = 1
        data = ram.read(fsm, local_addr)
        zero_or_one = (global_addr % (TREE_BLOCK_BYTE * 4)) // (TREE_BLOCK_BYTE * 2)
        block_idx = ((global_addr % (TREE_BLOCK_BYTE * 4)) // TREE_BLOCK_BYTE) % 2
        inner_idx = (global_addr % 32) // 4 
        
        
        # read data block
        self.dma_read(fsm, self.data_ram, 0, (global_addr // 128) * 128, 2)
        data0 = self.data_ram.read(fsm, 0) 
        data1 = self.data_ram.read(fsm, 1)
        
        fsm.If(zero_or_one == 0)(
            self.input_data0((data0 & ((0x00000000 << (7 - inner_idx)) | data << (7 - inner_idx))) << (1 - block_idx)),
            self.input_data1(data1)
        ).Else(
            self.input_data0(data0),
            self.input_data1((data1 & ((0x00000000 << (7 - inner_idx)) | data << (7 - inner_idx))) << (1 - block_idx))
        )
        fsm.goto_next()

        # hash calculation
        self.hmac_sha256.input_data(fsm, self.input_data0, is_first=True, is_last=False)
        self.hmac_sha256.input_data(fsm, self.input_data1, is_first=False, is_last=True)
        self.hmac_sha256.wait(fsm, self.hash_calc_reg)
        
        # write hash block
        self.hash_ram.write(fsm, 0, self.hash_calc_reg)
        self.dma_write(fsm, self.hash_ram, 0, self.tree_start_addr + (global_addr // 128) * TREE_BLOCK_BYTE, 1)

def _calc_height(n):
    if n % TREE_BLOCK_BYTE == 0:
        return math.ceil(math.ceil(math.log(n // TREE_BLOCK_BYTE, 4)))
    else:
        return math.ceil(math.ceil(math.log(n // TREE_BLOCK_BYTE + 1, 4)))