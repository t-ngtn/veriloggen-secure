from __future__ import absolute_import
from __future__ import print_function
import os
import sys

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

class HmacSha256(object):
    
    __intrinsics__ = ('input_data', 'wait')
    
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
    
    def input_data(self, fsm: FSM, data, with_key, is_last):
        '''
        data: 512 bits
        sk: max 128bits
        '''
        if with_key:
            # Add meta data to the beginning of the data
            fsm(
                self.s_tvalid_i(1),
                self.s_tlast_i(0),
                self.s_tdata_i(self.sk),
            )
            fsm.goto_next(self.s_tvalid_i & self.s_tready_o)

            fsm(
                self.s_tvalid_i(1),
                self.s_tlast_i(is_last),
                self.s_tdata_i(data),    
            )
            fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
            
        else:
            fsm(
                self.s_tvalid_i(1),
                self.s_tlast_i(is_last),
                self.s_tdata_i(data),
            )
            fsm.goto_next(self.s_tvalid_i & self.s_tready_o)
        
        fsm(
            self.s_tvalid_i(0),
        )
        fsm.goto_next()
        
    def wait(self, fsm: FSM, digest):
        fsm.If(self.digest_valid_o)(
            digest(self.digest_o),
        )
        fsm.goto_next(self.digest_valid_o)
        
        
        
        
    
