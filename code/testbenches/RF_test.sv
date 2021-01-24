module stimulus_for_RF;
  RF RF_DUT (.clock(clock),
             .src(src),
             .dst(dst),
             .datain(datain),
             .wr_en(wr_en),
             .dataout(dataout));
  logic clock;
  t_data datain [`WRITE_PORTS-1:0];
  t_data dataout [`READ_PORTS-1:0];
  t_RFadrs src [`READ_PORTS-1:0];	// read addresses
  t_RFadrs dst [`WRITE_PORTS-1:0];	// write addresses
  logic wr_en [`WRITE_PORTS-1:0];	// '1' is enableling writing
  
  assign src[0] = 1;
  assign src[1] = 3;
  
  always #1 clock = ~clock;
  initial begin
    $display ("-------------------------------------------");
    $dumpfile("dump.vcd");
  	$dumpvars(1);
    clock=0;
    wr_en[0] = 1;
	datain[0] = 47;
  	dst[0] = 3;
    $display ($time,dataout);
    #3 wr_en[0] = 0;
    $display ($time,dataout);
  end
endmodule
