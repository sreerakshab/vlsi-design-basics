`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 17:07:52
// Design Name: 
// Module Name: alu8wflags
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu8wflags(
    input  logic [7:0] a, b,
    input  logic [2:0] sel,
    output logic [7:0] res,
    output logic carry,
    output logic overflow,
    output logic zero,
    output logic negative
);

    logic [8:0] temp; // 9-bit to handle carry/borrow

    always_comb begin
        // Default assignments
        temp = 9'b0;
        res = 8'b0;
        carry = 1'b0;
        overflow = 1'b0;

        case(sel)
            3'b000: begin // ADD
                temp = {1'b0, a} + {1'b0, b};
                res = temp[7:0];
                carry = temp[8];
                overflow = (a[7] == b[7]) && (res[7] != a[7]);
            end
            3'b001: begin // SUB
                temp = {1'b0, a} + {1'b0, ~b} + 1;
                res = temp[7:0];
                carry = temp[8]; 
                overflow = (a[7] ^ b[7]) & (a[7] ^ res[7]);
            end
            3'b010: res = a & b; // AND
            3'b011: res = a | b; // OR
            3'b100: res = a ^ b; // XOR
            3'b101: res = ~a;    // NOT A
            3'b110: res = b;     // PASS B
            3'b111: res = a;     // PASS A
            default: res = 8'b0;
        endcase
    end

    // Flags assigned outside the case for clarity
    always_comb begin
        zero = (res == 8'b0);
        negative = res[7];
    end

endmodule