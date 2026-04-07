`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 17:12:15
// Design Name: 
// Module Name: alu8wflags_tb
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


module alu8wflags_tb;

    logic [7:0] a, b;
    logic [2:0] sel;
    logic [7:0] res;
    logic carry, overflow, zero, negative;

    alu8wflags uut(
        .a(a),
        .b(b),
        .sel(sel),
        .res(res),
        .carry(carry),
        .overflow(overflow),
        .zero(zero),
        .negative(negative)
    );

    initial begin
        a = 8'd5;
        b = 8'd3;

        $display("Time\tA\tB\tSel\tResult\tZ C V N");

        for (int i = 0; i < 8; i++) begin
            sel = i; #10;
            $display("%0t\t%0d\t%0d\t%b\t%0d\t%b %b %b %b", 
                     $time, a, b, sel, res, zero, carry, overflow, negative);
        end

        a = 8'd0; b = 8'd0; sel = 3'b000; #10;
        $display("%0t\t%0d\t%0d\t%b\t%0d\t%b %b %b %b", 
                 $time, a, b, sel, res, zero, carry, overflow, negative);

        a = 8'd200; b = 8'd100; sel = 3'b001; #10;
        $display("%0t\t%0d\t%0d\t%b\t%0d\t%b %b %b %b", 
                 $time, a, b, sel, res, zero, carry, overflow, negative);

        $finish;
    end

endmodule
