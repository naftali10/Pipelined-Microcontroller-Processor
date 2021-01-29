//Testbench

module stimulus;

  ifc_inputs global_inputs();
  ifc_outputs global_outputs();
  Processor processor (.global_inputs(global_inputs),
                       .global_outputs(global_outputs));
  
  always #1 global_inputs.clock = ~global_inputs.clock;
  
  initial begin
    $display ("-------------------------------------------");
    $dumpfile("dump.vcd");
    $dumpvars(1);
    $dumpvars(1,processor.decoder.controller_inst.state);
    global_inputs.clock = 0;
    global_inputs.reset = 1;
    //-----------LD 5 to R3-----------
    #1
    global_inputs.instv = 1;
    global_inputs.opcode = LD;
    global_inputs.imm = 5;
    global_inputs.src1 = IMM;
    global_inputs.src2 = R1;
    global_inputs.dst = R3;
    #1
    global_inputs.reset = 0;
    // -----------wait 3 cycles-----------
    #6
    //-----------OUT R3-----------
    global_inputs.opcode = OUT;
    global_inputs.src1 = R3;
    //-----------wait 3 cycles-----------
    #6
    /************Check value************/
    $display ("Expected R3 value is 5. In reality: %d",
             global_outputs.dataoutx3);
    $display ("Is result valid? %b",
              global_outputs.dataoutvx3);
    $display ("-------------------------------------------");
    //-----------LD 43 to R2-----------
    global_inputs.opcode = LD;
    global_inputs.imm = 43;
    global_inputs.src1 = IMM;
    global_inputs.dst = R2;
    // -----------wait 3 cycles-----------
    #6
    //-----------OUT R3-----------
    global_inputs.opcode = OUT;
    global_inputs.src1 = R3;
    // -----------wait 3 cycles-----------
    #6
    /************Check value************/
    $display ("Expected R3 value is 5. In reality: %d",
             global_outputs.dataoutx3);
    $display ("Is result valid? %b",
              global_outputs.dataoutvx3);
    $display ("-------------------------------------------");
    
  end
endmodule
