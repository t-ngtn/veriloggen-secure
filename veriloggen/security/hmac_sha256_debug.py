from __future__ import absolute_import
from __future__ import print_function
import os
import sys

from veriloggen.core.module import Module, StubModule
from veriloggen.fsm.fsm import FSM

class HmacSha256Debug(object):

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
        self.mode = 1
        self.reg1 = self.m.Reg('reg1', 256, initval=0)
        self.reg2 = self.m.Reg('reg2', 256, initval=0)

    def input_data(self, fsm: FSM, data, with_key, is_last):
        if not is_last:
            fsm(
                self.reg1(data),
            )
        else:
            fsm(self.reg2(data))
        fsm.goto_next()


    def wait(self, fsm: FSM, digest):
        fsm(
            digest(self.reg1 + self.reg2),
            self.reg1(0),
            self.reg2(0),
            )
        fsm.goto_next()
