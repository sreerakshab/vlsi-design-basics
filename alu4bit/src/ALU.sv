`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2025 10:25:32
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 4)
    (input logic[(n-1):0] A,B,
     input logic [2:0] control, output logic Z, C,
     output logic [((2*n)-1):0]Q);
     
     logic [(n-1):0] invb; logic [n:0] sum;

        assign invb = control[0] ? ~B:B; 
        
        assign sum = A + invb + control[0];
        
        always_comb begin
            case(control)
                4'b000: Q = sum[n-1:0];
                4'b001: Q = sum[n-1:0];
                4'b010: Q = A * B;
                4'b011: Q = A / B;
                4'b100: Q = A << 1;
                4'b101: Q = A >> 1;
                4'b110: Q = A & B;
                4'b111: Q =(A | B);
                default: Q = 0;
                endcase
        end
        
        assign Z = (Q == 0);
        assign C = sum[n];
 endmodule
