from __future__ import absolute_import
from __future__ import print_function
import os
import sys

from veriloggen import *
from veriloggen.core.module import Module, StubModule
from veriloggen.fsm.fsm import FSM

script_dir = os.path.dirname(os.path.abspath(__file__))

file_names = [
    "verilog/sha256/src/interfaces/stream/rtl/sha256_stream.v",
    "verilog/sha256/src/rtl/sha256.v",
    "verilog/sha256/src/rtl/sha256_core.v",
    "verilog/sha256/src/rtl/sha256_k_constants.v",
    "verilog/sha256/src/rtl/sha256_w_mem.v"
]

sha256_combined_v = ""
for file_name in file_names:
    file_path = os.path.join(script_dir, file_name)
    with open(file_path, "r") as f:
        sha256_combined_v += f.read() + "\n\n"
        
IPAD = 0x36363636363636363636363636363636
OPAD = 0x5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c

class HmacSha256(object):
    
    __intrinsics__ = ('input_one_data', 'input_two_data', 'wait')
    
    def __init__(self, m: Module, name, clk, rst, sk):
        self.m = m
        self.name = name
        self.clk = clk
        self.rst = rst
        self.sk = sk
        
        self.s_tdata_i = self.m.Reg('s_tdata_i', 512)
        self.s_tlast_i = self.m.Reg('s_tlast_i')
        self.s_tvalid_i = self.m.Reg('s_tvalid_i')
        self.s_tready_o = self.m.Wire('s_tready_o')
        self.digest_o = self.m.Wire('digest_o', 256)
        self.digest_valid_o = self.m.Wire('digest_valid_o')
        self.mode = self.m.Wire('mode', width=1, value=1)
        
        self.mac = self.m.Reg('mac', 256)
        self.ik = Int(self.sk, 128, 16) ^ Int(IPAD, 128, 16)
        self.ok = Int(self.sk, 128, 16) ^ Int(OPAD, 128, 16)

        ports = [
            ('clk', clk),
            ('rst', rst),
            ('s_tdata_i', self.s_tdata_i),
            ('s_tlast_i', self.s_tlast_i),
            ('s_tvalid_i', self.s_tvalid_i),
            ('s_tready_o', self.s_tready_o),
            ('digest_o', self.digest_o),
            ('digest_valid_o', self.digest_valid_o),
            ('mode', self.mode),
        ]
        sha256_stream = StubModule('sha256_stream', sha256_combined_v)
        self.m.Instance(sha256_stream, 'sha256_stream', [], ports=ports)
    
    def input_one_data(self, fsm: FSM, data):
        '''
        input:
            data: 512 bits
        '''

        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(0),
            self.s_tdata_i(self.ik),
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)

        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(1),
            self.s_tdata_i(data),    
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
            
        fsm(
            self.s_tvalid_i(0),
        )
        fsm.goto_next()
        
        fsm.If(self.digest_valid_o)(
            self.mac(self.digest_o),
        )
        fsm.goto_next(self.digest_valid_o)
        
        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(0),
            self.s_tdata_i(self.ok),
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
        
        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(1),
            self.s_tdata_i(self.mac),
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
    
    def input_two_data(self, fsm: FSM, data1, data2):
        '''
        input: 
            data1: 512 bits
            data2: 512 bits
        '''
        
        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(0),
            self.s_tdata_i(self.ik),
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)

        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(0),
            self.s_tdata_i(data1),    
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
        
        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(1),
            self.s_tdata_i(data2),    
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
            
        fsm(
            self.s_tvalid_i(0),
        )
        fsm.goto_next()
        
        fsm.If(self.digest_valid_o)(
            self.mac(self.digest_o),
        )
        fsm.goto_next(self.digest_valid_o)
        
        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(0),
            self.s_tdata_i(self.ok),
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
        
        fsm(
            self.s_tvalid_i(1),
            self.s_tlast_i(1),
            self.s_tdata_i(self.mac),
        )
        fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
        
        
    def wait(self, fsm: FSM, digest):
        fsm.If(self.digest_valid_o)(
            digest(self.digest_o),
        )
        fsm.goto_next(self.digest_valid_o)
        
        
        
        
    
