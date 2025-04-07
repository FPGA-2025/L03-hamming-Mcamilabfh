module corrige_hamming (
  input [14:0] entrada, // palavra recebida com paridade + dados
  output reg [10:0] saida
);

  reg [14:0] corrigida;
  wire [3:0] syndrome;

  // Recalcular as paridades com base na entrada
  wire p1 = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
  wire p2 = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
  wire p4 = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
  wire p8 = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

  // O syndrome indica a posição do bit com erro (se houver)
  assign syndrome = {p8, p4, p2, p1}; // binário → posição do erro

  always @(*) begin
    corrigida = entrada;

    // Corrige o bit com erro (somente se syndrome != 0)
    if (syndrome != 4'b0000) begin
      corrigida[syndrome - 1] = ~entrada[syndrome - 1]; // flip bit
    end

    // Extrai os bits de dados da palavra corrigida (sem as paridades)
    saida[0]  = corrigida[2];   // d1
    saida[1]  = corrigida[4];   // d2
    saida[2]  = corrigida[5];   // d3
    saida[3]  = corrigida[6];   // d4
    saida[4]  = corrigida[8];   // d5
    saida[5]  = corrigida[9];   // d6
    saida[6]  = corrigida[10];  // d7
    saida[7]  = corrigida[11];  // d8
    saida[8]  = corrigida[12];  // d9
    saida[9]  = corrigida[13];  // d10
    saida[10] = corrigida[14];  // d11
  end

endmodule
