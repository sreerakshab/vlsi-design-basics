`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2025 19:43:14
// Design Name: 
// Module Name: moore_seq101
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


module mooreseq (
    input  logic clk,
    input  logic reset,
    input  logic in_seq,
    output logic out_detect
);

    typedef enum logic [1:0] {s0, s1, s2, s3} state_t;
    state_t state, n_state;

    always_ff @(posedge clk or posedge reset) begin
        if(reset)
            state <= s0;
        else
            state <= n_state;
    end

    always_comb begin
        n_state = s0;
        case(state)
            s0: n_state = (in_seq) ? s1 : s0;
            s1: n_state = (in_seq) ? s1 : s2;
            s2: n_state = (in_seq) ? s3 : s0;
            s3: n_state = (in_seq) ? s1 : s2;
            default: n_state = s0;
        endcase
    end

    always_comb begin
        out_detect = (state == s3);
    end

endmodule