module bincmp#(parameter n=4)(E,G,L,a,b);

  input [(n-1):0] a,b;
  output E,G,L;
  reg E,G,L;

  always@(a or b) begin
    if (a<b) begin
      E = 0; G = 0; L = 1;
    end else if (a==b) begin
      E = 1; G = 0; L = 0;
    end else begin
      E = 0; G = 1; L = 0;
    end
  end
   
endmodule