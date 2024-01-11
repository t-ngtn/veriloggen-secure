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

axi_datawidth = 256
datawidth = 256
databyte = datawidth // 8

num = 3

a_addr = 0

def mkIntegrityCheck():
    m = Module('integrity_check')
    clk = m.Input('CLK')
    rst = m.Input('RST')

    addrwidth = 4
    ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth, addrwidth)
    ram_b = vthread.RAM(m, 'ram_b', clk, rst, datawidth, addrwidth)

    maxi = vthread.AXIMSecure(m, 'maxi', clk, rst, datawidth, global_max_addr=databyte * num - 1, max_ram_byte_size=databyte * num, sk=0x597208cf39e5664c) 

    def count():
        maxi.init()
        
        ram_a.write(0, 16)
        maxi.dma_write_secure(ram_a, 0, 0, 1)
        
        ram_a.write(1, 32)
        maxi.dma_write_secure(ram_a, 1, 32, 1)
        
        ram_a.write(2, 64)
        maxi.dma_write_secure(ram_a, 2, 64, 1)
        
        sum = 0
        maxi.dma_read_secure(ram_b, 0, 0, 1)
        sum += ram_b.read(0)
        maxi.dma_read_secure(ram_b, 1, 32, 1)
        sum += ram_b.read(1)
        maxi.dma_read_secure(ram_b, 2, 64, 1)
        sum += ram_b.read(2)
        
        ram_b.write(0, sum)
        maxi.dma_write_secure(ram_b, 0, 0, 1)
        
        # attack
        ram_b.write(0, 0)
        maxi.dma_write(ram_b, 0, 0, 1)
        
        # integrity verification (is_secure = False)
        maxi.dma_read_secure(ram_b, 0, 0, 1)
        

    th = vthread.Thread(m, 'th_count', clk, rst, count)
    fsm = th.start()

    return m


def mkTest():

    led = mkIntegrityCheck()

    m = Module('test')
    params = m.copy_params(led)
    ports = m.copy_sim_ports(led)
    clk = ports['CLK']
    rst = ports['RST']

    memory = axi.AxiMemoryModel(m, 'memory', clk, rst, datawidth=datawidth,
                                mem_datawidth=axi_datawidth, memimg_name="mem_start.out")

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
