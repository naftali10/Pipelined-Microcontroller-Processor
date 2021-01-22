// Module name: ALU
// Duty: Executing for two input buses
//		 (A and B) the following operations (encoding in backets):
//		 (2) A+B, (3) A-B, (4) bitwise NAND, (5) bitwise NOR,
//		 (6) bitwise XOR, and (7) SHFL A by the index of the least 
//		 significant '1' on B (starting at index 1 on the right).
//		 Encodings (0) and (1) simply yield A.

module ALU #(
  parameter data_bus_size = 8				// Size of data inputs
  )(
  input logic [data_bus_size-1:0] A,B,			// Data buses
  input logic [$clog2(`ALU_OP_AMT)-1:0] op,		// Encoded operation
  output logic [data_bus_size-1:0] result		// Result of operation
  );
  logic [data_bus_size-1:0] results [`ALU_OP_AMT-1:0];
  genvar i,j;
  //----- simple operations -----
  assign results [0] = A;
  assign results [1] = A;
  assign results [2] = A+B;
  assign results [3] = A-B;
  assign results [4] = ~(A&B);
  assign results [5] = ~(A|B);
  assign results [6] = A^B;
  
  //----- shift left operation -----
  SHFL #(.bus_size(data_bus_size)) SHFL_inst(.A(A),
                                             .B(B),
                                             .result(results [7]));
  
  //----- output muxes -----
  generate for (i=0; i<data_bus_size; i++) begin : for_every_bit
    logic [`ALU_OP_AMT-1:0] mux_inputs;
    for (j=0; j<`ALU_OP_AMT; j++) begin: for_every_operation
	  	assign mux_inputs[j] = results[j][i]; // All results, single bit
    end: for_every_operation
    mux #(.size(`ALU_OP_AMT)) output_mux (.data(mux_inputs),
                                          .sel(op),
                                          .out(result[i]));
  end: for_every_bit
  endgenerate
endmodule
