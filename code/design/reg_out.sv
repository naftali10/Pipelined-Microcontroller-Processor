// Interface name: Outputs Register
// Duty: Preparing signals for exiting the macine.
//		 Shifting signal's clock.

interface reg_out (input logic clock);
  logic stalled, stalledx3;
  logic dataoutvx2, dataoutvx3;
  t_data dataoutx2, dataoutx3;
  
  always_ff @(posedge clock) begin
    stalledx3 <= stalled;
    dataoutvx3 <= dataoutvx2;
    dataoutx3 <= dataoutx2;
  end
  
  modport driver (output stalled,
                  output dataoutvx2,
                  output dataoutx2);
  modport receiver (input stalledx3,
                    input dataoutvx3,
                    input dataoutx3);  
endinterface
