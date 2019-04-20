This folder contains the checking of the properties that CHC solver will need to handle. This is different from those with `cegar` in their name, where CHC solver is used to block a given counterexample.

This assumes that we are able to come up with these properties by some way of guessing.

The property may or may not be inductive.

There is no need to get a proof here, we only need to known if the property holds or not.

For the sub-folders:

pipeline
  1. -original: property not inductive, state encoded as long bitvector
  2. -bv: property not inductive, state encoded as individual bitvectors
  3. -ind: property itself is inductive, state encoded as long bitvector
  4. -ind-bv: property itself is inductive, state encoded as individual bitvectors

For Z3:  1 and 2 work, 3 and 4 failed (out-of-memory)
I'm not sure which encoding will work best for freqhorn, and whether 1 takes longer than 3. The best case is that the guessed properties are inductive but this is not guaranteed.

