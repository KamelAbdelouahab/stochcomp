module sng#(parameter n=4)(Y, A, seed, clk, rst);
  input clk, rst;
  input [(n-1):0] A, seed;
  output Y;
  
  wire [(n-1):0] lfsr_out;
  wire E, G, L;
  
  lfsr #(n) lfsr1(lfsr_out, seed, clk, rst);
  bincmp #(n) cmp1(E, G, L, A, lfsr_out);
  
  assign
    Y = ~L;
    
endmodule
