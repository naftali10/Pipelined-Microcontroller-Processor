module stimulus_for_reg_EXtoWB;
  
  reg_EXtoWB reg_EXtoWB_DUT (.clock(clock));
  
  logic clock;
  logic wr_enx1, wr_enx2;
  t_RFadrs dstx1, dstx2;
  t_data dataoutx1, dataoutx2;
  
  assign reg_EXtoWB_DUT.wr_enx1 = wr_enx1;
  assign reg_EXtoWB_DUT.dstx1 = dstx1;
  assign reg_EXtoWB_DUT.dataoutx1 = dataoutx1;
    
  assign wr_enx2 = reg_EXtoWB_DUT.wr_enx2;
  assign dstx2 = reg_EXtoWB_DUT.dstx2;
  assign dataoutx2 = reg_EXtoWB_DUT.dataoutx2;
  
  always #1 clock = ~clock;
  
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars(1);
    clock=0;
    wr_enx1 = 0;
    dstx1 = 0;
    dataoutx1 = 0;
  end
  
endmodule
