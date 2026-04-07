`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2025 19:48:34
// Design Name: 
// Module Name: moore_seq101_tb
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


module mooreseq_tb;
    reg reset;
    reg clk;
    reg in_seq;
    wire out_detect;

    mooreseq dut(
        .reset(reset),
        .clk(clk),
        .in_seq(in_seq),
        .out_detect(out_detect)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time\t reset in_seq out_detect");
        $monitor("%0t\t %b    %b      %b", $time, reset, in_seq, out_detect);

        clk = 0;
        reset = 1;
        in_seq = 1;
        #10;         
        reset = 0;

        #10 in_seq = 0;
        #10 in_seq = 1;
        #10 in_seq = 0;
        #10 in_seq = 0;
        #10 in_seq = 1;
        #10 in_seq = 0;
        #10 in_seq = 1;
        #10 in_seq = 0;

        #20 $finish;
    end
endmodule