## Description ##

### The Implementation ###

The Verilog design (implementation) `verilog/opposite.v` is a module with two counters. 
The two counters `v` and `imp` are the negation (opposite) of each other.

( `v == 0xf - imp` , or in other words, `v == ~ imp` )

When its input `en` is high (1), the counter `v` will increase by 1,
and `imp` will decrease by 1.  So, the above relation still holds.

The output `out` of the module is actually equal to `v`.


### The ILA Model ###

Because the output of the module is equal to `v`, the ILA only models this 
counter, with one instruction `INC`. When `en` is high (1), it is regarded
as the module receives this `INC` instruction, and it will increase the modeled
counter `v` by 1.

### The Equivalence Checking ###

The two modules are put together in a wrapper module (`out/INC/wrapper.v`)
for equivalence checking. This wrapper module instantiates (invokes) the
ILA and implementation with the same input on `en`. It adds several other signals
to help write assumptions and assertions.


  * `__START__` : marks the beginning of the equation of two modules
  * `__CYCLE_CNT__` : counts the number of cycles (used to know when the implementation completes)
  * `__IEND__` : marks the end (completion/temination) of the implementation execution
  * signals like `variable_map_assume_??__` : the refinement relation in the beginning
  * signals like `variable_map_assert_??__` : the refinement relation in the end
  
### The SMT and Horn Clauses ### 

The conversion from `wrapper.v` to `__design_smt.smt2` is done by Yosys (using Yosys flow described in `__gen_smt_script.ys`). 

In the SMT output, the function `|wrapper_t|` is the state transition of the top module (it also invokes the submodules transition functions) and function `|wrapper_h|` needs to be asserted to be true on to connect signals from the top module's with (assert to be equal to) the submodules, (it also invokes the submodules `|*_h|` functions)

These two functions (`|*_t|` and `|*_h|`) are also created on the two submodules as well, but we only use the one on the implementation module.

The complete CHC can be found in `wrapper.smt2`.
The first 266 lines are the same as `__design_smt.smt2`,
followed by the 5 rules.

Some notes:
  *  The initial state is expressed a bit different from the slides. In Verilog, reset state is achieved by asserting a reset signal (`rst`) and give a clock pulse. When this is expressed in Horn Clause, there is an extra "before-init" state where I assert `rst` signal is true there.
  * `INV1` is the constraint `C` in the slides and `INV2` corresponds to `I`
  * Because in the `wrapper` module, the implementation module's reset signal is connect to a dummy reset signal, asserting `rst` in the `wrapper` does not necessary mean to reset the implementation state. The `rst` in `wrapper` is used to reset the extra state used for bookkeeping.


### The Z3 Result ### 

I tested Z3 (Z3 version 4.8.5 - 64 bit) on `wrapper.smt2` and its output is saved in `z3result.txt`. It is a bit hard to understand because the signal names are not there, so I manually map the SMT names to the Verilog names and replace the `bit2bool` function with `[]` for selecting a bit. The `I` and `C` are saved as `I.lisp` and `C.lisp`.

The simplest solution to `C` should be the solution in the beginning, but it seems that
Z3 breaks this into bits and try to find the relation over the bits.

What it found for C can be intepreted here:
`( imp[0] | v[0] ) & ( ~imp[0] | ~v[0] )`  means one and only one of the two is 1
and it is similar over the 4 bits of the two counters. 


