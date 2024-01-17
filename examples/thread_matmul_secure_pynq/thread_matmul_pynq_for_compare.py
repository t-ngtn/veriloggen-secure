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

matrix_size = 8
print("matrix_size = ", matrix_size)
matrix_data_byte_size = matrix_size * matrix_size * (datawidth // 8)
a_offset = 0
b_offset = matrix_data_byte_size
c_offset = matrix_data_byte_size * 2


def mkMatmul():
    m = Module('matmul')
    clk = m.Input('CLK')
    rst = m.Input('RST')

    addrwidth = 8
    ram_a = vthread.RAM(m, 'ram_a', clk, rst, datawidth, addrwidth)
    ram_b = vthread.RAM(m, 'ram_b', clk, rst, datawidth, addrwidth)
    ram_c = vthread.RAM(m, 'ram_c', clk, rst, datawidth, addrwidth)

    # maxi = vthread.AXIMSecure(m, 'maxi', clk, rst, datawidth, global_max_addr= matrix_data_byte_size * 3 - 1, max_ram_byte_size=matrix_size * datawidth // 8, sk=0x597208cf39e5664c)
    maxi = vthread.AXIM(m, 'maxi', clk, rst, datawidth)
    saxi = vthread.AXISLiteRegister(m, 'saxi', clk, rst, 32)

    def matmul():
        while True:
            saxi.wait_flag(0, value=1, resetvalue=0)
            saxi.write(1, 1)  # set busy

            initiate(matrix_size, a_offset, b_offset, c_offset)

            saxi.write(1, 0)  # unset busy
            
            saxi.wait_flag(0, value=1, resetvalue=0)
            saxi.write(1, 1)  # set busy

            comp(matrix_size, a_offset, b_offset, c_offset)

            saxi.write(1, 0)  # unset busy
    
    def initiate(matrix_size, a_offset, b_offset, c_offset):
        a_addr, b_addr = a_offset, b_offset
        value = 1
        for i in range(matrix_size):
            for j in range(matrix_size):
                if i == j:
                    ram_a.write(j, value)
                    value = value + 1
                    ram_b.write(j, 2)
                else:
                    ram_a.write(j, 0)
                    ram_b.write(j, 0)
            maxi.dma_write(ram_a, 0, a_addr, matrix_size)
            maxi.dma_write(ram_b, 0, b_addr, matrix_size)
            a_addr += matrix_size * (datawidth // 8)
            b_addr += matrix_size * (datawidth // 8)

    def comp(matrix_size, a_offset, b_offset, c_offset):
        a_addr, c_addr = a_offset, c_offset

        for i in range(matrix_size):
            maxi.dma_read(ram_a, 0, a_addr, matrix_size)

            b_addr = b_offset
            for j in range(matrix_size):
                maxi.dma_read(ram_b, 0, b_addr, matrix_size)

                sum = 0
                for k in range(matrix_size):
                    x = ram_a.read(k)
                    y = ram_b.read(k)
                    sum += x * y
                ram_c.write(j, sum)

                b_addr += matrix_size * (datawidth // 8)

            maxi.dma_write(ram_c, 0, c_addr, matrix_size)
            a_addr += matrix_size * (datawidth // 8)
            c_addr += matrix_size * (datawidth // 8)

    th = vthread.Thread(m, 'th_matmul', clk, rst, matmul)
    fsm = th.start()

    return m

def run(filename='tmp.v', simtype='iverilog', outputfile=None):

    mod = mkMatmul()
    
    code = mod.to_verilog(filename)
    
    return code


if __name__ == '__main__':
    rslt = run(filename='tmp.v')
