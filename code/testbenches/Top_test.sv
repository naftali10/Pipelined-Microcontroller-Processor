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
    //-----------ADD R1 = R2 + R3-----------
    global_inputs.opcode = ADD;
    global_inputs.src1 = R3;
    global_inputs.src2 = R2;
    global_inputs.dst = R1;
    // -----------wait 3 cycles-----------
    #6
    //-----------OUT R1-----------
    global_inputs.opcode = OUT;
    global_inputs.src1 = R1;
    // -----------wait 3 cycles-----------
    #6
    /************Check value************/
    $display ("Expected R1 value is 48. In reality: %d",
             global_outputs.dataoutx3);
    $display ("Is result valid? %b",
              global_outputs.dataoutvx3);
    $display ("-------------------------------------------");
    //-----------SUB R0 = R2 - R3-----------
    global_inputs.opcode = SUB;
    global_inputs.src1 = R2;
    global_inputs.src2 = R3;
    global_inputs.dst = R0;
    // -----------wait only 2.5 cycles-----------
    #5
    //-----------OUT R0-----------
    global_inputs.opcode = OUT;
    global_inputs.src1 = R0;
    // -----------wait 3 cycles-----------
    #6
    /************Check value************/
    $display ("Expected R0 value is INVALID 38. In reality: %d",
             global_outputs.dataoutx3);
    $display ("Is result valid? %b",
              global_outputs.dataoutvx3);
    $display ("-------------------------------------------");
    // -----------wait 0.5 cycles-----------
    #1
    /************Check value************/
    $display ("Expected R0 value is 38. In reality: %d",
             global_outputs.dataoutx3);
    $display ("Is result valid? %b",
              global_outputs.dataoutvx3);
    $display ("-------------------------------------------");
    //-----------LD R0 = 23-----------
    global_inputs.opcode = LD;
    global_inputs.src1 = IMM;
    global_inputs.imm = 23;
    global_inputs.dst = R0;
    // -----------wait 1.5 cycles-----------
    #3
    //-----------Reset pipeline-----------
    global_inputs.reset = 1;
    // -----------wait 1 cycle-----------
    #2
    //-----------OUT R0-----------
    global_inputs.opcode = OUT;
    global_inputs.src1 = R0;
    #1
    global_inputs.reset = 0;
    // -----------wait 3 cycles-----------
    #6
    /************Check value************/
    $display ("Expected R0 value is 38. In reality: %d",
             global_outputs.dataoutx3);
    $display ("Is result valid? %b",
              global_outputs.dataoutvx3);
  end
endmodule
