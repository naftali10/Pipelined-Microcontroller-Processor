// Module name: Write Back Stage
// Duty: Instruction Execution stage of the pipeline.
//		 Writes results to the register file.
//		 Also prepares results for output.
//		 Includes a reset mux.

module WriteBack (input logic internal_reset,
                  input logic stalled,
                  reg_EXtoWB,
                  reg_out,
                  ifc_WB);
  assign reg_out.stalled = stalled;
  assign reg_out.dataoutvx2 = internal_reset?0:reg_EXtoWB.dataoutvx2;
  assign reg_out.dataoutx2 = reg_EXtoWB.dataoutx2;
  
  assign ifc_WB.wr_enx2 = internal_reset?0:reg_EXtoWB.wr_enx2;
  assign ifc_WB.dstx2 = reg_EXtoWB.dstx2;
  assign ifc_WB.dataoutx2 = reg_EXtoWB.dataoutx2;
endmodule
