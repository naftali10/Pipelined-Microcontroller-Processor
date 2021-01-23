module stimulus_for_controller;
  controller controller_DUT(.clock(clock),
              				.reset(reset),
              				.opcode(opcode),
              				.instv(instv),
              				.src1(src1),
              				.src2(src2),
              				.internal_reset(internal_reset),
              				.ALUsrc1(ALUsrc1),
              				.ALUsrc2(ALUsrc2),
              				.ALUop(ALUop),
              				.wr_en(wr_en),
              				.dataoutv(dataoutv),
              				.stalled(stalled)
             				);
  import definitions::*;
  logic clock;
  logic reset;
  t_opcode opcode;
  logic instv;
  t_reg_name src1;
  t_reg_name src2;
  logic internal_reset;
  t_ALUsrc_ctrl ALUsrc1;
  t_ALUsrc_ctrl ALUsrc2;
  t_opcode ALUop;
  logic wr_en;
  logic dataoutv;
  logic stalled;
  
  always #1 clock = ~clock;
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars(1);
    
    clock = 0;
	$display ("-------------------------------------------");
    $display("-----------initial reset-----------");
    reset = 1;
    instv = 0;
    opcode = LD;
    src1 = R0;
    src2 = R1;
    display_status();
    $display("-----------instruction not valid-----------");
    #1
    reset = 0;
    instv = 0;
    opcode = LD;
    src1 = R0;
    src2 = R1;
    display_status();
    $display("-----------loading without immediate-----------");
    #1
    reset = 0;
    instv = 1;
    opcode = LD;
    src1 = R0;
    src2 = R1;
    display_status();
    $display("-----------proper LD instruction-----------");
    #1
    reset = 0;
    instv = 1;
    opcode = LD;
    src1 = IMM;
    src2 = R1;
    display_status();
    $display("-----------wait 3 cycles-----------");
    #6
    $display("-----------proper OUT instruction-----------");
    reset = 0;
    instv = 1;
    opcode = OUT;
    src1 = R2;
    src2 = R1;
    display_status();
    $display("-----------wait only 2 cycles-----------");
    #4
    $display("-----------proper SHFL instruction-----------");
    reset = 0;
    instv = 1;
    opcode = SHFL;
    src1 = R2;
    src2 = R1;
    display_status();
    $display("-----------invalid ADD instruction-----------");
    #1
    reset = 0;
    instv = 0;
    opcode = SHFL;
    src1 = R2;
    src2 = R1;
    display_status();
    $display("-----------proper NAND instruction-----------");
    #1
    reset = 0;
    instv = 1;
    opcode = NAND;
    src1 = R2;
    src2 = R1;
    display_status();
    
  end
  
  task display_status;
    $display("reset=%b ",reset,
            "instv=%b ",instv,
            "opcode=%b ",opcode,
            "src1=%b ",src1,
            "src2=%b ",src2);
    #1
    $display("internal_reset=%b ",internal_reset,
    		 "ALUsrc1=%b ",ALUsrc1,
             "ALUsrc2=%b ",ALUsrc2,
             "ALUop=%b ",ALUop,
             "wr_en=%b ",wr_en,
             "dataoutv=%b ",dataoutv,
             "stalled=%b ",stalled);
  endtask
endmodule
