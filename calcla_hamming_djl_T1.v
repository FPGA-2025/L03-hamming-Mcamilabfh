module hamming_encoder (
    input  [10:0] v,
    output [14:0] c
);

    // Invertendo os índices: v[10] agora é o primeiro bit de dados (posição 3), v[0] o último (posição 15)
    assign c[2]  = v[10];  // d1
    assign c[4]  = v[9];   // d2
    assign c[5]  = v[8];   // d3
    assign c[6]  = v[7];   // d4
    assign c[8]  = v[6];   // d5
    assign c[9]  = v[5];   // d6
    assign c[10] = v[4];   // d7
    assign c[11] = v[3];   // d8
    assign c[12] = v[2];   // d9
    assign c[13] = v[1];   // d10
    assign c[14] = v[0];   // d11

    // Bits de paridade (ajustados para nova ordem)
    assign c[0] = v[10] ^ v[9] ^ v[7] ^ v[6] ^ v[4] ^ v[2] ^ v[0];  // p1
    assign c[1] = v[10] ^ v[8] ^ v[7] ^ v[5] ^ v[4] ^ v[1] ^ v[0];  // p2
    assign c[3] = v[9] ^ v[8] ^ v[7] ^ v[3] ^ v[2] ^ v[1] ^ v[0];   // p4
    assign c[7] = v[6] ^ v[5] ^ v[4] ^ v[3] ^ v[2] ^ v[1] ^ v[0];   // p8

endmodule



