## AES ##

The queried property is a specific assignment to the state variables
(in wrapper.v:208)

An invariant that can lead to the property is 

`~(m1.aes_reg_state != 0) || (m1.uaes_ctr == m1.aes_reg_ctr_i.reg_out + m1.block_counter)`

Z3 could not terminate on this example,
probably because of the bitwidth and the addition here.
(`m1.uaes_ctr` and `m1.aes_reg_ctr_i.reg_out` are both 128 bits,
if Z3 does bit-blast, the bit-vector addition will be a very complex expression)


