## Counter ##

The design has two counters: m1.imp and m1.v
The two are the opposite of each other:

m1.imp == ~ m1.v

The property queries if both could be #b0010,
which should be impossible.

The result of running `z3 wrapper.smt2` is saved
as `z3_result.txt`.

In order to force Z3 to use SPACER, the beginning
of `wrapper.smt2` has a line: `(set-option :fp.engine spacer)`
which you might want to remove.

The result from Z3 is a bit confusing:
INV is defined to have 7 arguments, but in the result it only contains
2 arguments.


