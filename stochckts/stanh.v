module stanh#(parameter S=32, lgS=5)(y, x, clk, rst);
  input x, clk, rst;
  output reg y;
  
  wire [(S-1):0] states;
  reg [(lgS-1):0] ps;

  integer i;
  
  initial
    ps = 5'b0;
    
  assign 
    states = {16'h0000, 16'h1111};
  
  always@(rst)
    ps = 5'b0;
    
  always@(posedge clk) begin
    if(x==1'b0 && ps>5'b1) ps = ps - 1;
    else if(x==1'b1 && ps<=5'h1f) ps = ps + 1;
    else ps=ps;    
    y = states[ps];
  end
    
endmodule