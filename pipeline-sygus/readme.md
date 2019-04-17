If you run `cvc4 --lang=sygus wrapper.smt2`, CVC4 gives the `unknown` very fast.
On https://github.com/CVC4/CVC4/issues/1319 it says, 

> Often, an answer of "unknown" for SyGuS problems corresponds to CVC4 figuring out there are definitely no solutions.

However, there should be a solution, see `v.smt2`,
if you run `cvc4 --incremental v.smt2`, or 'z3 v.smt2'
it would be three unsat for `init => inv`, `inv /\ T => inv` and `inv => P`

You can diff the two files and see what's the difference.
The solution is a bit different in the syntax, but I assume that it should be able to convert to the CNF-like syntax in wrapper.smt2

