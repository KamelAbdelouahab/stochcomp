module sng_tb();  
  parameter
    n=10;
    
  reg clk, rst;
  reg [(n-1):0] A, seed;
  wire Y;
  wire [(n-1):0] a;
  
  initial begin
    #0 rst <= 1;
    #0 clk <= 0;
    case(n)
      04: begin A <= 4'd12;   seed <= 4'h4;    end
      10: begin A <= 10'd575; seed <= 10'h008; end
    endcase
    
    $monitor($time,"\tclk=%b",clk,,"Y=%b",Y,,"rst=%b",rst,,"A=%d\t",A,"a=%d",a);
    
    #2 rst = 0;
    #2 rst = 1;
  end
  
  sng #(n) sng1(Y, A, seed, clk, rst);
  dru #(n) dru1(a, Y, clk, rst);
  
  always
    #5 clk = ~clk;
  
endmodule