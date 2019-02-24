/* PREHEADER */

`define true  1'b1

`define false 1'b0

/* END OF PREHEADER */
module wrapper(
__ILA_I_en,
__VLG_I_ui,
clk,
dummy_reset,
rst,
__ILA_SO_v,
__m1__,
__m3__,
issue_decode__m5__,
issue_valid__m6__,
m1__DOT__out,
noreset__m0__,
out,
variable_map_assert__p4__,
variable_map_assume__m2__,
__CYCLE_CNT__,
__START__,
__STARTED__,
__ENDED__,
__RESETED__
);
input            __ILA_I_en;
input      [3:0] __VLG_I_ui;
input            clk;
input            dummy_reset;
input            rst;
output      [3:0] __ILA_SO_v;
output            __m1__;
output            __m3__;
output            issue_decode__m5__;
output            issue_valid__m6__;
output      [3:0] m1__DOT__out;
output            noreset__m0__;
output      [3:0] out;
output            variable_map_assert__p4__;
output            variable_map_assume__m2__;
output reg      [3:0] __CYCLE_CNT__;
output reg            __START__;
output reg            __STARTED__;
output reg            __ENDED__;
output reg            __RESETED__;
(* keep *) wire            __IEND__;
(* keep *) wire            __ILA_I_en;
(* keep *) wire      [3:0] __ILA_SO_v;
(* keep *) wire            __ILA_counter_decode_of_INC__;
(* keep *) wire            __ILA_counter_valid__;
(* keep *) wire            __ISSUE__;
(* keep *) wire      [3:0] __VLG_I_ui;
(* keep *) wire            __m1__;
(* keep *) wire            __m3__;
wire            clk;
(* keep *) wire            dummy_reset;
(* keep *) wire            issue_decode__m5__;
(* keep *) wire            issue_valid__m6__;
(* keep *) wire      [3:0] m1__DOT__out;
(* keep *) wire            noreset__m0__;
(* keep *) wire      [3:0] out;
wire            rst;
(* keep *) wire            variable_map_assert__p4__;
(* keep *) wire            variable_map_assume__m2__;
assign noreset__m0__ =  (~__RESETED__) || (dummy_reset == 0)  ;
always @(posedge clk) begin
if (rst) __CYCLE_CNT__ <= 0;
else if ( ( __START__ || __STARTED__ ) &&  __CYCLE_CNT__ < 6) __CYCLE_CNT__ <= __CYCLE_CNT__ + 1;
end
always @(posedge clk) begin
if (rst) __START__ <= 0;
else if (__START__ || __STARTED__) __START__ <= 0;
else if (__ISSUE__) __START__ <= 1;
end
always @(posedge clk) begin
if (rst) __STARTED__ <= 0;
else if (__START__) __STARTED__ <= 1;
end
always @(posedge clk) begin
if (rst) __ENDED__ <= 0;
else if (__IEND__) __ENDED__ <= 1;
end
always @(posedge clk) begin
if (rst) __RESETED__ <= 1;
end
assign __m1__ = m1__DOT__out == __ILA_SO_v ;
assign variable_map_assume__m2__ = __m1__ ;
assign __m3__ = m1__DOT__out == __ILA_SO_v ;
assign variable_map_assert__p4__ = (~ __IEND__) || (__m3__) ;
assign __IEND__ = (`false|| ( __CYCLE_CNT__ == 4'd1)) && __STARTED__ && (~ __ENDED__) ;
assign issue_decode__m5__ = (~ __START__) || (__ILA_counter_decode_of_INC__) ;
assign issue_valid__m6__ = (~ __START__) || (__ILA_counter_valid__) ;
assign __ISSUE__ = 1 ;

counter__DOT__INC m0 (
   .__START__(__START__),
   .clk(clk),
   .en(__ILA_I_en),
   .rst(rst),
   .__ILA_counter_decode_of_INC__(__ILA_counter_decode_of_INC__),
   .__ILA_counter_valid__(__ILA_counter_valid__),
   .v(__ILA_SO_v)
);
opposite m1(
    .clk(clk),
    .en(__ILA_I_en),
    .m1__DOT__out(m1__DOT__out),
    .out(out),
    .rst(dummy_reset),
    .ui(__VLG_I_ui)
);
endmodule
module counter__DOT__INC(
__START__,
clk,
en,
rst,
__ILA_counter_decode_of_INC__,
__ILA_counter_valid__,
v
);
input            __START__;
input            clk;
input            en;
input            rst;
output            __ILA_counter_decode_of_INC__;
output            __ILA_counter_valid__;
output reg      [3:0] v;
wire            __ILA_counter_decode_of_INC__;
wire            __ILA_counter_valid__;
wire            __START__;
wire            clk;
wire            en;
wire            n0;
wire      [3:0] n2;
wire            rst;
(* keep *) wire      [3:0] v_randinit;
assign __ILA_counter_valid__ = 1'b1 ;
assign n0 =  ( en ) == ( 1'd1 )  ;
assign __ILA_counter_decode_of_INC__ = n0 ;
assign n2 =  ( v ) + ( 4'd1 )  ;
always @(posedge clk) begin
   if(rst) begin
       v <= v_randinit ;
   end
   else if(__START__ && __ILA_counter_valid__) begin
       if (__ILA_counter_decode_of_INC__) begin
           v <= n2 ;
       end
   end
end
endmodule
module opposite(input clk, input rst, input [3:0] ui, input en, output [3:0] out, output wire [3:0] m1__DOT__out);

reg [3:0] v; // explicit state variable (modeled in ILA)
reg [3:0] imp; // implicit (micro-arch, not modeled, but need constraints on it)
// the constraint we want is
// p : v == 4'hf - imp

always @(posedge clk) begin
  if (rst)
    v <= ui;
  else if(en)
    v <= v + 1;
end

always @(posedge clk) begin
  if (rst)
    imp <= ~ui;
  else if(en)
    imp <= imp - 1;
end

assign out = v & ( 4'hf - imp ) ; // should be the same as v

 assign m1__DOT__out = out;
endmodule
