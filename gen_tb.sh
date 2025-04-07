#!/bin/bash

QTD=$1
QTD_MINUS_ONE=$((QTD - 1))

cat > tb.v <<EOF
module tb();

reg [10:0] entrada;
wire [14:0] h15;
reg [3:0] n;
reg injeta_erro;
wire [14:0] alterado;
wire [10:0] saida;
reg [15:0] dados_arquivo [0:${QTD_MINUS_ONE}];

integer i;

integer quantidade;

initial begin
  quantidade = $QTD;



  \$readmemb("teste.txt", dados_arquivo);
  \$dumpfile("saida.vcd");
  \$dumpvars(0, tb);
  \$monitor("entrada=%b, saida=%b", entrada, saida);

  for (i = 0; i < quantidade; i = i + 1) begin
    entrada = dados_arquivo[i][15:5];
    n = dados_arquivo[i][4:1];
    injeta_erro = dados_arquivo[i][0];
    #1;
  end
end

calcula_hamming cah(
  .entrada(entrada),
  .saida(h15)
);

injetor inj(
  .entrada(h15),
  .n(n),
  .erro(injeta_erro),
  .saida(alterado)
);

corrige_hamming coh(
  .entrada(alterado),
  .saida(saida)
);

endmodule
EOF

