module stimulus_for_out_reg;
  
  out_reg out_reg_DUT (.clock(clock));
  
  logic clock;
  logic stalled, stalledx3;
  logic dataoutvx2, dataoutvx3;
  t_data dataoutx2, dataoutx3;
  
  assign out_reg_DUT.stalled = stalled;
  assign out_reg_DUT.dataoutvx2 = dataoutvx2;
  assign out_reg_DUT.dataoutx2 = dataoutx2;
    
  assign stalledx3 = out_reg_DUT.stalledx3;
  assign dataoutvx3 = out_reg_DUT.dataoutvx3;
  assign dataoutx3 = out_reg_DUT.dataoutx3;
  
  always #1 clock = ~clock;
  
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars(1);
    clock=0;
    stalled = 0;
    dataoutvx2 = 0;
    dataoutx2 = 0;
  end
  
endmodule
