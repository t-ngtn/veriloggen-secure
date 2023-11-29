from __future__ import absolute_import
from __future__ import print_function
import sys
import os
import numpy as np

# the next line can be removed after installation
sys.path.insert(0, os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))

from veriloggen import *
import veriloggen.thread as vthread
import veriloggen.types.axi as axi

axi_datawidth = 512
datawidth = 32

a_offset = 0

def mkLed():
    m = Module('blinkled')
    clk = m.Input('CLK')
    rst = m.Input('RST')

    addrwidth = 4
    ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth, addrwidth)

    maxi = vthread.AXIMSecure(m, 'maxi', clk, rst, datawidth, global_max_addr= 64)

    def count():
        a_addr = a_offset
        for i in range(16):
            ram_a.write(i, i)
            maxi.dma_write(ram_a, i, a_addr, 1)
            a_addr += 4

        a_addr = a_offset
        sum = 0
        for i in range(16):
            maxi.dma_read(ram_a, i, a_addr, 1)
            sum = sum + ram_a.read(i)
            a_addr += 4
        
        ram_a.write(0, sum)
        maxi.dma_write(ram_a, 0, 64, 1)

    th = vthread.Thread(m, 'th_count', clk, rst, count)
    fsm = th.start()

    return m


def mkTest():

    led = mkLed()

    m = Module('test')
    params = m.copy_params(led)
    ports = m.copy_sim_ports(led)
    clk = ports['CLK']
    rst = ports['RST']

    memory = axi.AxiMemoryModel(m, 'memory', clk, rst,
                                mem_datawidth=axi_datawidth)

    memory.connect(ports, 'maxi')

    uut = m.Instance(led, 'uut',
                     params=m.connect_params(led),
                     ports=m.connect_ports(led))

    vcd_name = os.path.splitext(os.path.basename(__file__))[0] + '.vcd'
    simulation.setup_waveform(m, uut, dumpfile=vcd_name)
    simulation.setup_clock(m, clk, hperiod=5)
    init = simulation.setup_reset(m, rst, m.make_reset(), period=100)
    
    init.add(
        Delay(1000000),
        Systask('writememh', os.path.splitext(os.path.basename(__file__))[0] + '_memory.out', memory.mem),
        Systask('finish'),
    )

    return m


def run(filename='tmp.v', simtype='iverilog', outputfile=None):

    test = mkTest()

    if filename is not None:
        test.to_verilog(filename)

    sim = simulation.Simulator(test, sim=simtype)
    rslt = sim.run(outputfile=outputfile)

    return rslt


if __name__ == '__main__':
    rslt = run(filename='tmp.v')
    #print(rslt)
