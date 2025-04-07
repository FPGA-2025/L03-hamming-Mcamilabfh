module corrige_hamming_djl (
  input [14:0] entrada,
  output [10:0] saida
);

  wire [3:0] syndrome;
  wire [14:0] corrigida;

  // Paridades recalculadas
  wire p1 = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  wire p2 = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  wire p4 = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  wire p8 = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  assign syndrome = {p8, p4, p2, p1};

  genvar i;
  generate
    for (i = 0; i < 15; i = i + 1) begin : bit_corrigido
      assign corrigida[i] = (syndrome == (i + 1)) ? ~entrada[i] : entrada[i];
    end
  endgenerate

  assign saida[0]  = corrigida[2];
  assign saida[1]  = corrigida[4];
  assign saida[2]  = corrigida[5];
  assign saida[3]  = corrigida[6];
  assign saida[4]  = corrigida[8];
  assign saida[5]  = corrigida[9];
  assign saida[6]  = corrigida[10];
  assign saida[7]  = corrigida[11];
  assign saida[8]  = corrigida[12];
  assign saida[9]  = corrigida[13];
  assign saida[10] = corrigida[14];

endmodule


