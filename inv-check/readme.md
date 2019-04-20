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

For Z3:  1 and 3 work, 2 and 4 failed (out-of-memory)
I'm not sure which encoding will work best for freqhorn, and whether 1 takes longer than 3. The best case is that the guessed properties are inductive but this is not guaranteed.

I think that for FreqHorn, 1 and 3 will lose the state variable information because all the variables are conjuncted.
However, 2 and 4 does not work well with Z3 (Spacer). So I'm not how this should be handled.

The invariants are listed below: the 16 lines needs to be conjuncted.


They are in the shape of:
  ( bv == ? ) -> ( ( bv == ?  and/or  bv ==/!=  ? ) and ( bv == ?  and/or  bv ==/!=  ? ) )
  

(m1.reg_0_w_stage == 2'b00 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd0) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd0) ) )
(m1.reg_1_w_stage == 2'b00 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd1) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd1) ) )
(m1.reg_2_w_stage == 2'b00 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd2) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd2) ) )
(m1.reg_3_w_stage == 2'b00 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd3) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd3) ) )
(m1.reg_0_w_stage == 2'b10 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd0) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd0) ) )
(m1.reg_1_w_stage == 2'b10 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd1) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd1) ) )
(m1.reg_2_w_stage == 2'b10 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd2) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd2) ) )
(m1.reg_3_w_stage == 2'b10 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd3) ) && ( (m1.ex_wb_reg_wen == 0) || (m1.ex_wb_rd != 2'd3) ) )
(m1.reg_0_w_stage == 2'b11 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd0) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd0) ) )
(m1.reg_1_w_stage == 2'b11 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd1) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd1) ) )
(m1.reg_2_w_stage == 2'b11 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd2) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd2) ) )
(m1.reg_3_w_stage == 2'b11 ) ->  ( ( (m1.id_ex_reg_wen == 1) && (m1.id_ex_rd == 2'd3) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd3) ) )
(m1.reg_0_w_stage == 2'b01 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd0) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd0) ) )
(m1.reg_1_w_stage == 2'b01 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd1) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd1) ) )
(m1.reg_2_w_stage == 2'b01 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd2) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd2) ) )
(m1.reg_3_w_stage == 2'b01 ) ->  ( ( (m1.id_ex_reg_wen == 0) || (m1.id_ex_rd != 2'd3) ) && ( (m1.ex_wb_reg_wen == 1) && (m1.ex_wb_rd == 2'd3) ) )