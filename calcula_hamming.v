module calcula_hamming (
  input [10:0] entrada,
  output [14:0] saida
);

wire [10:0] v;
wire [14:0] c;

assign v = entrada;

// Bits de dados e alocação de posições
assign c[2]  = v[0];  // d1
assign c[4]  = v[1];  // d2
assign c[5]  = v[2];  // d3
assign c[6]  = v[3];  // d4
assign c[8]  = v[4];  // d5
assign c[9]  = v[5];  // d6
assign c[10] = v[6];  // d7
assign c[11] = v[7];  // d8
assign c[12] = v[8];  // d9
assign c[13] = v[9];  // d10
assign c[14] = v[10]; // d11

// Bits de paridade
assign c[0] = v[0] ^ v[1] ^ v[3] ^ v[4] ^ v[6] ^ v[8] ^ v[10]; // p1
assign c[1] = v[0] ^ v[2] ^ v[3] ^ v[5] ^ v[6] ^ v[9] ^ v[10]; // p2
assign c[3] = v[1] ^ v[2] ^ v[3] ^ v[7] ^ v[8] ^ v[9] ^ v[10]; // p4
assign c[7] = v[4] ^ v[5] ^ v[6] ^ v[7] ^ v[8] ^ v[9] ^ v[10]; // p8

assign saida = c;

endmodule

