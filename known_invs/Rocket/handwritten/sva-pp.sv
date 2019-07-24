// NOTE: these are part of ths system verilog assertions to check the invariants
// which were manually provided

// 1. It creates extra variables (monitors) to catch the temporal logic
// 2. every variable starts with "IMPL_" is an RTL signal
// 3. Among these "IMPL_*", only "IMPL_ibuf_io_inst_0_bits_inst_bits_o" is a state variable
//    other "IMPL_*" are wires actually

   
  reg nondetStart;
  wire inst_begin_cond = ~inst_begin & nondetStart & ~inst_issued;

  reg inst_has_begun = 0;
  always @(posedge clock) begin
    if(reset)
      inst_has_begun <= 1'b0;
    else if(inst_begin_cond)
      inst_has_begun <= 1'b1;
  end

  always @(posedge clock) begin
    if(reset)
      inst_begin <= 1'b0;
    else if(inst_begin_cond ) //if( inst_begin_cond  )
      inst_begin <= 1'b1;
    else if( inst_begin & IMPL_ex_reg_valid_o)
      inst_begin <= 1'b0;
  end

  always @(posedge clock) begin
    if(reset)
      inst_issued <= 1'b0;
    else if( inst_begin & IMPL_ex_reg_valid_o )
      inst_issued <= 1'b1;
  end

  always @(posedge clock) begin
    if(reset) 
      ex_monitor <= 1'b0;
    else if(inst_begin & IMPL_ex_reg_valid_o & ~IMPL_ctrl_killx_o)
      ex_monitor <= 1'b1;
    else if(ex_monitor & IMPL_mem_reg_valid_o)
      ex_monitor <= 1'b0;
    else if(IMPL_ctrl_killx_o)
      ex_monitor <= 1'b0;
  end

  always @(posedge clock) begin
    if(reset)
      mem_monitor <= 1'b0;
    else if(ex_monitor & IMPL_mem_reg_valid_o & ~IMPL_ctrl_killm_o)
      mem_monitor <= 1'b1;
    else if(mem_monitor & IMPL_wb_valid_o)
      mem_monitor <= 1'b0;
    else if(IMPL_ctrl_killm_o)
      mem_monitor <= 1'b0;
  end

  always @(posedge clock) begin
    if(reset) begin 
      inst_finished <= 1'b0;
      inst_finished_delay <= 1'b0;
      inst_finished_delay2 <= 1'b0;
      inst_finished_delay3 <= 1'b0;
    end
    else begin
      inst_finished_delay <= inst_finished;
      inst_finished_delay2 <= inst_finished_delay;
      inst_finished_delay3 <= inst_finished_delay2;
      if(mem_monitor & IMPL_wb_valid_o)
        inst_finished <= 1'b1;
    end
  end


  wire before_next_inst_commited = this_inst_finished & (IMPL_wb_valid_o);
  always @(posedge clock) begin 
    if(reset)
      second_finished <= 1'b0;
    else if(before_next_inst_commited)
      second_finished <= 1'b1;
  end


   wire inst_gpr_assert_cond = mem_monitor & IMPL_wb_valid_o;

   reg[31:0] id_rs_0_reg;
   reg[4:0]  id_rs_0_field;
   reg[31:0] id_rs_1_reg;
   reg[4:0]  id_rs_1_field;

   reg       id_rs_0_in_use;
   reg       id_rs_1_in_use;

   always @(posedge clock) begin 
    if(reset) begin 
      id_rs_0_in_use <= 1'b0;
      id_rs_1_in_use <= 1'b0;
      id_rs_0_field  <= 5'd0;
      id_rs_1_field  <= 5'd0;
    end
    else begin 
      if(inst_begin_cond) begin 
        id_rs_0_in_use <= IMPL_id_rs_0_in_use;
        id_rs_1_in_use <= IMPL_id_rs_1_in_use;
        id_rs_0_field <= IMPL_ibuf_io_inst_0_bits_inst_bits_o[19:15];
        id_rs_1_field <= IMPL_ibuf_io_inst_0_bits_inst_bits_o[24:20];
      end
    end
   end

   always @(posedge clock) begin 
    if(inst_begin & IMPL_ex_reg_valid_o & ~IMPL_ctrl_killx_o ) begin 
      id_rs_0_reg <= IMPL_ex_rs_0_o;
      id_rs_1_reg <= IMPL_ex_rs_1_o;
    end
   end



   // @ inst_begin_cond load
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd0 ) || (IMPL_x0 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd1 ) || (IMPL_x1 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd2 ) || (IMPL_x2 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd3 ) || (IMPL_x3 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd4 ) || (IMPL_x4 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd5 ) || (IMPL_x5 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd6 ) || (IMPL_x6 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd7 ) || (IMPL_x7 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd8 ) || (IMPL_x8 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd9 ) || (IMPL_x9 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd10 ) || (IMPL_x10 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd11 ) || (IMPL_x11 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd12 ) || (IMPL_x12 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd13 ) || (IMPL_x13 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd14 ) || (IMPL_x14 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd15 ) || (IMPL_x15 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd16 ) || (IMPL_x16 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd17 ) || (IMPL_x17 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd18 ) || (IMPL_x18 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd19 ) || (IMPL_x19 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd20 ) || (IMPL_x20 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd21 ) || (IMPL_x21 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd22 ) || (IMPL_x22 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd23 ) || (IMPL_x23 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd24 ) || (IMPL_x24 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd25 ) || (IMPL_x25 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd26 ) || (IMPL_x26 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd27 ) || (IMPL_x27 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd28 ) || (IMPL_x28 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd29 ) || (IMPL_x29 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd30 ) || (IMPL_x30 == id_rs_0_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_0_in_use == 1'b1 && id_rs_0_field == 5'd31 ) || (IMPL_x31 == id_rs_0_reg ) ) );

     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd0  ) || (IMPL_x0  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd1  ) || (IMPL_x1  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd2  ) || (IMPL_x2  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd3  ) || (IMPL_x3  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd4  ) || (IMPL_x4  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd5  ) || (IMPL_x5  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd6  ) || (IMPL_x6  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd7  ) || (IMPL_x7  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd8  ) || (IMPL_x8  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd9  ) || (IMPL_x9  == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd10 ) || (IMPL_x10 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd11 ) || (IMPL_x11 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd12 ) || (IMPL_x12 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd13 ) || (IMPL_x13 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd14 ) || (IMPL_x14 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd15 ) || (IMPL_x15 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd16 ) || (IMPL_x16 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd17 ) || (IMPL_x17 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd18 ) || (IMPL_x18 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd19 ) || (IMPL_x19 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd20 ) || (IMPL_x20 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd21 ) || (IMPL_x21 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd22 ) || (IMPL_x22 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd23 ) || (IMPL_x23 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd24 ) || (IMPL_x24 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd25 ) || (IMPL_x25 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd26 ) || (IMPL_x26 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd27 ) || (IMPL_x27 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd28 ) || (IMPL_x28 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd29 ) || (IMPL_x29 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd30 ) || (IMPL_x30 == id_rs_1_reg ) ) );
     assert property (~inst_gpr_assert_cond || ( ~( id_rs_1_in_use == 1'b1 && id_rs_1_field == 5'd31 ) || (IMPL_x31 == id_rs_1_reg ) ) );

   // @ inst_gpr_assert_cond assume they are the same



