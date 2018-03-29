module sng#(parameter n=4)(Y, A, clk, rst);
  input clk, rst;
  input [(n-1):0] A;
  output Y;
  reg Y;
  
  wire [(n-1):0] lfsr_out;
  wire E, G, L;
  
  lfsr #(n) lfsr1(lfsr_out, clk, rst);

  bincmp #(n) cmp1(E, G, L, A, lfsr_out);
  
  always@(posedge clk)
  begin
    if(L==1)
      Y = 0;
    else
      Y = 1;      
  end  
endmodule