module stanh#(parameter S=32, lgS=5)(Y, X, clk, rst);
  input X, clk, rst;
  output reg Y;
  
  wire [(S-1):0] states;
  reg [(lgS-1):0] ps;
  
  initial
    ps = 5'b0;
    
  assign
    states = {16'hffff, 16'h0000};
  
  always@(negedge rst)
    ps = 5'b0;
    
  always@(posedge clk) begin
    if(X==1'b0 && ps>5'b0) ps = ps - 1;
    else if(X==1'b1 && ps<5'h1f) ps = ps + 1;
    else ps = ps;
    Y = states[ps];
  end
  
endmodule