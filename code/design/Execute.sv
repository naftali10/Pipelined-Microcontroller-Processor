// Module name: Execution Stage
// Duty: Instruction Execution stage of the pipeline.
//		 Performes desired calculations.
//		 Includes the ALU.

module Execute (input logic internal_reset,
                reg_IDtoEX,
                reg_EXtoWB);
  t_data A, B;
  assign A = reg_IDtoEX.ALUsrc1x1===takeGPR?reg_IDtoEX.dat1x1:reg_IDtoEX.immx1;
  assign B = reg_IDtoEX.ALUsrc2x1===takeGPR?reg_IDtoEX.dat2x1:reg_IDtoEX.immx1;
  ALU ALU_inst (.A(A),
                .B(B),
                .op(reg_IDtoEX.ALUopx1),
                .result(reg_EXtoWB.dataoutx1));
  
  assign reg_EXtoWB.wr_enx1 = internal_reset?0:reg_IDtoEX.wr_enx1;
  assign reg_EXtoWB.dataoutvx1 = internal_reset?0:reg_IDtoEX.dataoutvx1;
  assign reg_EXtoWB.dstx1 = reg_IDtoEX.dstx1;
endmodule
