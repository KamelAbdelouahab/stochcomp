module stanh_tb();
  parameter
    n=10;
    
  reg clk, rst;
  reg [(n-1):0] A, seed;
  wire X,Y;
  wire [(n-1):0] A1;
    
  initial begin
    rst <= 1;
    clk <= 0;
    case(n)
      04: begin A <= 4'd12;   seed <= 4'h4;    end
      10: begin A <= 10'd575; seed <= 10'h008; end
    endcase
    
    $monitor($time, , ,"clk=%b",clk,,"rst=%b",rst,,"A=%d",A,,"A1=%d",A1);
    
    #2 rst = 0;
    #2 rst = 1;
  end
  
  sng #(n) sng1(X, A, seed, clk, rst);
  stanh stanh1(Y, X, clk, rst);
  dru #(n) dru1(A1, Y, clk, rst);
  
  always
    #5 clk = ~clk;    // clk period, T=10
    
endmodule