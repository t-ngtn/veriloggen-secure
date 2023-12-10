from __future__ import absolute_import
from __future__ import print_function
import sys
import os

# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from veriloggen import *
import veriloggen.thread as vthread

INPUT_VALUE = 1000


def mkHmacSha256():
    m = Module('hmac_sha256')

    clk = m.Input('CLK')
    rst = m.Input('RST')
    
    hmac_sha256 = HmacSha256(m, "hmac_sha256", clk, rst)
    
    digest = m.Reg('digest', 256)
    
    def hash():
        hmac_sha256.input_data(data=INPUT_VALUE, address=1000, cnt=0,  with_key=True, is_last=True)
        hmac_sha256.wait(digest=digest)
    
    
    th = vthread.Thread(m, 'th_hash', clk, rst, hash)
    fsm = th.start()

    return m


def mkTest():
    m = Module('test')

    # target instance
    sha256 = mkHmacSha256()

    uut = Submodule(m, sha256, name='uut')
    clk = uut['CLK']
    rst = uut['RST']

    vcd_name = os.path.splitext(os.path.basename(__file__))[0] + '.vcd'
    simulation.setup_waveform(m, uut, m.get_vars(), dumpfile=vcd_name)
    simulation.setup_clock(m, clk, hperiod=5)
    init = simulation.setup_reset(m, rst, m.make_reset(), period=100)

    init.add(
        Delay(10000),
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
