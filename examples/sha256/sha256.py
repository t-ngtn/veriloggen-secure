from __future__ import absolute_import
from __future__ import print_function
import sys
import os

# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
from veriloggen import *


INPUT_VALUE = 1000


def mkSHA256():
    m = Module('sha256_top')

    clk = m.Input('CLK')
    rst = m.Input('RST')
    s_tdata_i = m.Reg('s_tdata_i', 512)
    s_tlast_i = m.Reg('s_tlast_i')
    s_tvalid_i = m.Reg('s_tvalid_i')
    s_tready_o = m.Wire('s_tready_o')
    digest_o = m.Wire('digest_o', 256)
    digest_valid_o = m.Wire('digest_valid_o')
    
    sha256_stream = SHA256Stream(m, clk, rst, s_tdata_i, s_tlast_i, s_tvalid_i, s_tready_o, digest_o, digest_valid_o)
    
    fsm = FSM(m, 'fsm', clk, rst)
    result = m.Reg('result', 256, initval=0)
    
    # state1
    fsm(
        s_tdata_i(INPUT_VALUE),
        s_tlast_i(1),
        s_tvalid_i(1),
    )
    fsm.goto_next()
    
    # state2
    fsm()
    
    seq = Seq(m, 'seq', clk, rst)
    
    seq.If(s_tvalid_i & s_tready_o)(
        s_tvalid_i(0),
    )
    
    seq.If(digest_valid_o)(
        result(digest_o),
        Systask('display', "================================= digest ================================="),
        Systask('display', "digest = %h", digest_o),
        Systask('display', "=========================================================================="),
        Systask('finish'),
    )

    return m


def mkTest():
    m = Module('test')

    # target instance
    sha256 = mkSHA256()

    uut = Submodule(m, sha256, name='uut')
    clk = uut['CLK']
    rst = uut['RST']

    vcd_name = os.path.splitext(os.path.basename(__file__))[0] + '.vcd'
    simulation.setup_waveform(m, uut, m.get_vars(), dumpfile=vcd_name)
    simulation.setup_clock(m, clk, hperiod=5)
    init = simulation.setup_reset(m, rst, m.make_reset(), period=100)

    init.add(
        Delay(1000),
        Systask('finish'),
    )

    return m


if __name__ == '__main__':
    test = mkTest()
    verilog = test.to_verilog(filename='tmp.v')

    print(verilog)

    sim = simulation.Simulator(test)
    rslt = sim.run()
    print(rslt)

    # sim.view_waveform()
