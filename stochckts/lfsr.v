module lfsr#(parameter n=4)(Q, seed, clk, rst);
  input [(n-1):0] seed;
  input clk, rst;
  output [(n-1):0] Q;
  
  reg [(n-1):0] Q;

  initial
    Q = seed;
  
  always@(negedge rst)
    Q = seed;
  
  always@(posedge clk)
    case(n)
      4:  Q = {Q[2:0], (Q[2] ^ Q[3])};
      10: Q = {Q[8:0], (Q[6] ^ Q[9])};
    endcase
  
endmodule