// Module name: RF - Register File
// Duty: Storing architectural registers.
//		 One write port, and two read ports.

module RF #(
  parameter entries = 4,	// number of entries
  parameter data_bus_size = 8,	// size of data = width of an entry
  parameter read_ports = 2,	// number of read ports
  parameter write_ports = 1	// number of write ports
)(
  input logic clock,						// write clock
  input logic [$clog2(entries)-1:0] src [read_ports-1:0],	// read addresses
  input logic [$clog2(entries)-1:0] dst [write_ports-1:0],	// write addresses
  input logic [data_bus_size-1:0] datain [write_ports-1:0],	// write data
  input logic wr_en [write_ports-1:0],				// '1' for wr_en
  output logic [data_bus_size-1:0] dataout [read_ports-1:0]	// read data
);
  logic [data_bus_size-1:0] mem [entries-1:0];
  genvar i;
  generate
    for (i=0; i<write_ports; i++)
      always_ff @(posedge clock) begin
        mem[dst[i]] <= wr_en[i]?datain[i]:mem[dst[i]];
      end
    for (i=0; i<read_ports; i++)
      always_comb
        dataout[i] <= mem[src[i]];
  endgenerate
endmodule
