module stimulus_for_ALU;
  
  import definitions::*;
  ALU ALU_DUT (.A(A),
               .B(B),
               .op(op),
               .result(result)
              );
  
  t_data A,B,result;
  t_opcode op;
  int i;
  
  initial begin
    
    $dumpfile("dump.vcd");
  	$dumpvars(1);
	
    //----------- put values for test here ------------
    A=16;
    B=15;
    //-------------------------------------------------
    
    op=op.first;
    for (i=0; i<`ALU_OP_AMT; i++) begin
      #1;
      $display("%s(%b,%b) = %b",op.name,A,B,result);
      op=op.next;
    end
  end
endmodule
