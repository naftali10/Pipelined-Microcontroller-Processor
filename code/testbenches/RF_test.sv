`define BUS_SIZE 8
`define ENTRIES 4
`define READ_PORTS 2
`define WRITE_PORTS 1

module stimulus;
  RF #(.entries(`ENTRIES),
       .data_bus_size(`BUS_SIZE),
       .read_ports(`READ_PORTS),
       .write_ports(`WRITE_PORTS)
      ) RF_DUT (.clock(clock),
                .src(src),
                .dst(dst),
                .datain(datain),
                .wr_en(wr_en),
                .dataout(dataout));
  logic clock;
  logic [`BUS_SIZE-1:0] datain [`WRITE_PORTS-1:0];
  logic [`BUS_SIZE-1:0] dataout [`READ_PORTS-1:0];
  logic [$clog2(`ENTRIES)-1:0] src [`READ_PORTS-1:0];
  logic [$clog2(`ENTRIES)-1:0] dst [`WRITE_PORTS-1:0];
  logic wr_en [`WRITE_PORTS-1:0];
  
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
