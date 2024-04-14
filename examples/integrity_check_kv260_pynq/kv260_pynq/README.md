Run on PYNQ
====================

Environment
--------------------

- Design tool: Vivado 2022.2
- FPGA board: Kria KV260 Vision AI Starter Kit
- Framework: PYNQ v3.0.1

To run
--------------------

Copy `run_on_pynq.ipynb`, `design_1.bit`, and `design_1.hwh` to the PYNQ environment via Jupyter notebook. Run then `run_on_pynq.ipynb`.


To synthesize
--------------------

Use `integrity_check.v`.

Note that the reset polarity of `RST` of `integrity_check.v` is recognized as `ACTIVE_LOW` when it is imported into the block design in Vivado.
Please change the the reset polarity to `ACTIVE_HIGH` in the block pin property setting.