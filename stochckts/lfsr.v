module lfsr#(parameter n=4)(out, clk, rst);

  output reg [(n-1):0] out;
  input clk, rst;

  wire feedback;

  assign feedback = (out[(n-1)] ^ out[(n-2)]);

  always@(posedge clk or posedge rst)
  begin
    if (rst)
      out = (1 << (n-1)); // 4'h0200
    else
      out = {out[(n-2):0],feedback};
  end
endmodule