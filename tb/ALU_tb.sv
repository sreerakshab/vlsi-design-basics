`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2025 10:26:30
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    logic [3:0] A,B; logic Z,C;
    logic [7:0]Q; 
    logic [2:0] control;
    ALU uut(A,B,control,Z,C,Q);
    initial
        begin
            A = 4'b010;
            B = 4'b010;
            
            control = 4'b000;#10;
            control = 4'b001;#10;
            control = 4'b010;#10;
            control = 4'b011;#10;
            control = 4'b100;#10;
            control = 4'b101;#10;
            control = 4'b110;#10;
            control = 4'b111;#10;
            $finish;
            end
    


endmodule