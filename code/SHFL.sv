// Module name: SHFL
// Duty: Shift left input bus A by the index of the least 
//		 significant '1' on input bus B 
//		 (starting at index 1 on the right).

module SHFL #(
  parameter bus_size = 8		// size of data buses
  )(
  input logic [bus_size-1:0] A,		// bus to be shifted
  input logic [bus_size-1:0] B,		// shift amount bus
  output logic [bus_size-1:0] result	// data output
  );
  
  int shamt=0;
  
  always @* begin
    while (B[shamt]==0)
  	  shamt++;
    if (B==0)
      result = A;
  	else
      result = A<<(shamt+1);
  end
  
endmodule
