/* PREHEADER */

`define true  1'b1

`define false 1'b0

/* END OF PREHEADER */
module wrapper(
__ILA_I_en,
clk,
rst,
__ILA_SO_v,
__all_assert_wire__,
cex_nonreachable_assert__p0__,
m1__DOT__imp,
m1__DOT__v,
out
);
input            __ILA_I_en;
input            clk;
input            rst;
output      [3:0] __ILA_SO_v;
output            __all_assert_wire__;
output            cex_nonreachable_assert__p0__;
output      [3:0] m1__DOT__imp;
output      [3:0] m1__DOT__v;
output      [3:0] out;
(* keep *) wire            __ILA_I_en;
(* keep *) wire      [3:0] __ILA_SO_v;
(* keep *) wire            __all_assert_wire__;
(* keep *) wire            cex_nonreachable_assert__p0__;
wire            clk;
(* keep *) wire      [3:0] m1__DOT__imp;
(* keep *) wire      [3:0] m1__DOT__v;
(* keep *) wire      [3:0] out;
wire            rst;
assign cex_nonreachable_assert__p0__ = ~((1'b1 == 1'b1)&& (m1__DOT__imp[3:0] == 4'b0010)&& (m1__DOT__v[3:0] == 4'b0010)) ;

opposite m1(
    .clk(clk),
    .en(__ILA_I_en),
    .m1__DOT__imp(m1__DOT__imp),
    .m1__DOT__v(m1__DOT__v),
    .out(out),
    .rst(rst)
);
assert property (cex_nonreachable_assert__p0__); //cex_nonreachable_assert

assign __all_assert_wire__ = ( cex_nonreachable_assert__p0__ )  ;
endmodule
module opposite(input clk, input rst, input en, output [3:0] out, output wire [3:0] m1__DOT__imp, output wire [3:0] m1__DOT__v);

reg [3:0] v; // explicit state variable (modeled in ILA)
reg [3:0] imp; // implicit (micro-arch, not modeled, but need constraints on it)
// the constraint we want is
// p : v == 4'hf - imp

always @(posedge clk) begin
  if (rst)
    v <= 0;
  else if(en)
    v <= v + 1;
end

always @(posedge clk) begin
  if (rst)
    imp <= 4'hf;
  else if(en)
    imp <= imp - 1;
end

assign out = v & ( 4'hf - imp ) ; 
// 4'hf - imp == v
// so, `out` should be the same as `v`

 assign m1__DOT__v = v;
 assign m1__DOT__imp = imp;
endmodule
