module injetor(

  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output [14:0] saida
);

  genvar i;
  generate
    for (i = 0; i < 15; i = i + 1) begin : injecao
      assign saida[i] = (erro && (n == i)) ? ~entrada[i] : entrada[i];
  endgenerate
endmodule
