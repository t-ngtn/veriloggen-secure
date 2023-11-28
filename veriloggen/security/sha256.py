from __future__ import absolute_import
from __future__ import print_function
import os
import sys

from veriloggen import *

# 今のディレクトリを表示
print(os.getcwd())

# sha256_stream.v
with open("../../veriloggen/security/verilog/sha256/src/interfaces/stream/rtl/sha256_stream.v", "r") as f:
    sha256_stream_v = f.read()
    
# sha256.v
with open("../../veriloggen/security/verilog/sha256/src/rtl/sha256.v", "r") as f:
    sha256_v = f.read()

# sha256_core.v
with open("../../veriloggen/security/verilog/sha256/src/rtl/sha256_core.v", "r") as f:
    sha256_core_v = f.read()
    
# sha256_k_constants.v
with open("../../veriloggen/security/verilog/sha256/src/rtl/sha256_k_constants.v", "r") as f:
    sha256_k_constants_v = f.read()

# sha256_w_mem.v
with open("../../veriloggen/security/verilog/sha256/src/rtl/sha256_w_mem.v", "r") as f:
    sha256_w_mem_v = f.read()


class SHA256Stream():
    
    def __init__(self, m: Module, clk, rst, s_tdata_i, s_tlast_i, s_tvalid_i, s_tready_o, digest_o, digest_valid_o, mode=1,):

        ports = [
            ('clk', clk),
            ('rst', rst),
            ('s_tdata_i', s_tdata_i),
            ('s_tlast_i', s_tlast_i),
            ('s_tvalid_i', s_tvalid_i),
            ('s_tready_o', s_tready_o),
            ('digest_o', digest_o),
            ('digest_valid_o', digest_valid_o),
            ('mode', mode),
        ]
        sha256_stream = StubModule('sha256_stream', sha256_stream_v)
        m.Instance(sha256_stream, 'sha256_stream', [], ports=ports)
        
        _sha256_core = StubModule('sha256_core', sha256_core_v)
        m.Instance(_sha256_core, 'inst_sha256_core', [], ports=[])
        _sha256_k_constants = StubModule('sha256_k_constants', sha256_k_constants_v)
        m.Instance(_sha256_k_constants, 'inst_sha256_k_constants', [], ports=[])
        _sha256_w_mem = StubModule('sha256_w_mem', sha256_w_mem_v)
        m.Instance(_sha256_w_mem, 'inst_sha256_w_mem', [], ports=[])
        
        
        
        
    
