module bincmp#(parameter n=4)(E,G,L,a,b);
  input [(n-1):0] a,b;
  output E,G,L;

  assign
    E = (a==b),
    G = (a>b),
    L = (a<b);
   
endmodule
