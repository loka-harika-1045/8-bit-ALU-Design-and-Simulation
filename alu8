module alu8 (
    input  [7:0] A,
    input  [7:0] B,
    input  [3:0] sel,
    output reg [7:0] Y,
    output reg       Z,  // zero flag
    output reg       C,  // carry/borrow flag
    output reg       N   // negative flag
);
    always @(*) begin
        {C, Y} = 9'b0;
        case (sel)
            4'd0: {C, Y} = A + B;             // ADD
            4'd1: {C, Y} = A - B;             // SUB
            4'd2: Y = A + 1;                  // INC
            4'd3: Y = A - 1;                  // DEC
            4'd4: Y = A & B;                  // AND
            4'd5: Y = A | B;                  // OR
            4'd6: Y = A ^ B;                  // XOR
            4'd7: Y = ~A;                     // NOT
            4'd8: Y = A << 1;                 // SHL
            4'd9: Y = A >> 1;                 // SHR
            4'd10: Y = {A[6:0], A[7]};        // ROL
            4'd11: Y = {A[0], A[7:1]};        // ROR
            4'd12: Y = A + B + 1;             // ADC (add with carry)
            4'd13: Y = A - B - 1;             // SBC (sub with borrow)
          4'd14: Y = (A < B) ? 8'd1 : 8'd0; // CMP (set LSB to 1 if A<B)
            4'd15: Y = B;                     // PASS B
            default: Y = 8'd0;
        endcase
        Z = (Y == 8'd0);
        N = Y[7];
    end
endmodule
