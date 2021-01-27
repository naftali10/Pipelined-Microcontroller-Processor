module stimulus_for_reg_out;
  
  reg_out reg_out_DUT (.clock(clock));
  
  logic clock;
  logic stalled, stalledx3;
  logic dataoutvx2, dataoutvx3;
  t_data dataoutx2, dataoutx3;
  
  assign reg_out_DUT.stalled = stalled;
  assign reg_out_DUT.dataoutvx2 = dataoutvx2;
  assign reg_out_DUT.dataoutx2 = dataoutx2;
    
  assign stalledx3 = reg_out_DUT.stalledx3;
  assign dataoutvx3 = reg_out_DUT.dataoutvx3;
  assign dataoutx3 = reg_out_DUT.dataoutx3;
  
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
