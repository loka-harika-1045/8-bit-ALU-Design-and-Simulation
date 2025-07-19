`timescale 1ns/1ps
module tb_alu8;
    reg [7:0] A, B;
    reg [3:0] sel;
    wire [7:0] Y;
    wire Z, C, N;

    alu8 dut (.A(A), .B(B), .sel(sel), .Y(Y), .Z(Z), .C(C), .N(N));

    integer i;
    initial begin
        // apply a few test combinations
        A = 8'h0F; B = 8'h03;
        for (i=0; i<16; i=i+1) begin
            sel = i;
            #10;
            $display("sel=%0d: A=%h B=%h => Y=%h Z=%b C=%b N=%b", sel, A, B, Y, Z, C, N);
        end
        // edge-case tests
        A = 8'hFF; B = 8'h01; sel = 0; #10; // ADD overflow
        A = 8'h00; B = 8'h01; sel = 1; #10; // SUB negative
        $finish;
    end
endmodule
