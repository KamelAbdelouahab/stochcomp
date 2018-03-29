module dru#(parameter n=4)(a, Y, clk, rst);
  input Y, clk, rst;
  output a;
  reg [(n-1):0] a;

  initial
    a = 0;
    
  always@(posedge clk or posedge rst) begin
    if(rst)
      a = 0;
    else
      if(Y==1'b1)
        a = a + 1;
      else
        a = a;
  end
endmodule