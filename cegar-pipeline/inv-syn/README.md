This is an example of the input file
for querying whether a counterexample
is reachable or not. The reachability
property is specified in `wrapper.v`
line 87.

The input for Z3 can be
  1. with `declare-datatype` (`wrapper-datatype.smt2`), or
  2. without it (`wrapper.smt2`)

Interestingly, Z3 could conclude and
give out an invariant for (1) in a very
short time, but go out-of-memory (on
a machine with 32GB memory) for (2).

