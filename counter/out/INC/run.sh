#!/bin/bash
# you can run the following to generate SMT (assume you have yosys installed)
yosys __gen_smt_script.ys 
# you can run the following to invoke Z3 CHC solver
z3 wrapper.smt2

