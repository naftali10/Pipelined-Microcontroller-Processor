module stimulus_for_reg_IDtoEX;
  
  reg_IDtoEX reg_IDtoEX_DUT (.clock(clock));
  
  logic clock;
  logic wr_enx0, wr_enx1;
  t_ALUsrc_ctrl ALUsrc1x0, ALUsrc2x0, ALUsrc1x1, ALUsrc2x1;
  t_opcode ALUopx0, ALUopx1;
  t_data immx0, immx1, dat1x0, dat1x1, dat2x0, dat2x1;
  t_RFadrs dstx0, dstx1;
  
  assign reg_IDtoEX_DUT.wr_enx0 = wr_enx0;
  assign reg_IDtoEX_DUT.ALUsrc1x0 = ALUsrc1x0;
  assign reg_IDtoEX_DUT.ALUsrc2x0 = ALUsrc2x0;
  assign reg_IDtoEX_DUT.ALUopx0 = ALUopx0;
  assign reg_IDtoEX_DUT.immx0 = immx0;
  assign reg_IDtoEX_DUT.dat1x0 = dat1x0;
  assign reg_IDtoEX_DUT.dat2x0 = dat2x0;
  assign reg_IDtoEX_DUT.dstx0 = dstx0;  
    
  assign wr_enx1 = reg_IDtoEX_DUT.wr_enx1;
  assign ALUsrc1x1 = reg_IDtoEX_DUT.ALUsrc1x1;
  assign ALUsrc2x1 = reg_IDtoEX_DUT.ALUsrc2x1;
  assign ALUopx1 = reg_IDtoEX_DUT.ALUopx1;
  assign immx1 = reg_IDtoEX_DUT.immx1;
  assign dat1x1 = reg_IDtoEX_DUT.dat1x1;
  assign dat2x1 = reg_IDtoEX_DUT.dat2x1;
  assign dstx1 = reg_IDtoEX_DUT.dstx1;
  
  always #1 clock = ~clock;
  
  initial begin
    $dumpfile("dump.vcd");
  	$dumpvars(1);
    clock=0;
    wr_enx0 = 0;
    ALUsrc1x0 = takeGPR;
    ALUsrc2x0 = takeGPR;
    ALUopx0 = LD;
    immx0 = 0;
    dat1x0 = 0;
    dat2x0 = 0;
    dstx0 = 0;
  end
  
endmodule
