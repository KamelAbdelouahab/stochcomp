module stanh_tb();
  parameter 
    n=10;
    
  reg clk, rst;  
  reg [(n-1):0] x;
  wire X,Y;
  wire [(n-1):0] a;
  
  sng #(n) sng1(X, x, clk, rst);
  stanh stanh1(Y, X, clk, rst);
  dru #(n) dru1(a, Y, clk, rst);
  
  initial begin
    rst = 0; clk = 0;
    x = 10'h200;      // x=0.5
    $monitor($time, , ,"clk=%b",clk,,"rst=%b",rst,,"a=%d",a);
    #5 rst = 1;
    #5 rst = 0;
  end
  
  always
    #5 clk=~clk;    // clk period, T=10
    
endmodule