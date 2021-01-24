// Module name: RF - Register File
// Duty: Storing architectural registers.
//		 One write port, and two read ports.

module RF (
  input logic clock,										// write clock
  input t_RFadrs src [`READ_PORTS-1:0],	// read addresses
  input t_RFadrs dst [`WRITE_PORTS-1:0],	// write addresses
  input t_data datain [`WRITE_PORTS-1:0],	// write data
  input logic wr_en [`WRITE_PORTS-1:0],						// '1' for wr_en
  output t_data dataout [`READ_PORTS-1:0]	// read data
);
  t_data mem [`REG_AMT-1:0];
  genvar i;
  generate
    for (i=0; i<`WRITE_PORTS; i++)
      always_ff @(posedge clock) begin
        mem[dst[i]] <= (wr_en[i]===1'b1)?datain[i]:mem[dst[i]];
      end
    for (i=0; i<`READ_PORTS; i++)
      always_comb
        dataout[i] <= mem[src[i]];
  endgenerate
endmodule
