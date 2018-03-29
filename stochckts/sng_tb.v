module sng_tb#(parameter n=4);  
  reg clk, rst;
  reg [(n-1):0] A;
  wire Y;
  wire [(n-1):0] a;
  
  sng #(n) sng1(Y, A, clk, rst);
  dru #(n) dru1(a, Y, clk, rst);
  
  initial begin
    rst = 0; clk = 0;
    A = 4'd5; 
    $monitor($time, , ,"clk=%b",clk,,"Y=%b",Y,,"rst=%b",rst,,"a=%d",a);
    #5 rst = 1;
    #5 rst = 0;
  end
  
  always
  #5 clk=~clk;
  
  //initial
//  #150 $finish;
  
endmodule