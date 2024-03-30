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
import veriloggen.types.ipxact as ipxact

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

    saxi = vthread.AXISLiteRegister(m, 'saxi', clk, rst, 32)

    def count():
        while True:
            saxi.wait_flag(0, value=1, resetvalue=0)
            saxi.write(1, 1)  # set busy

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

            saxi.write(1, 0)  # unset busy
            saxi.write(2, maxi.is_secure)  # set is_secure = 0 (FALSE)


    th = vthread.Thread(m, 'th_count', clk, rst, count)
    fsm = th.start()

    return m

def run(filename='tmp.v', simtype='iverilog', outputfile=None):

    test = mkIntegrityCheck()

    code = test.to_verilog(filename)

    return code


if __name__ == '__main__':
    rslt = run(filename='tmp.v')

