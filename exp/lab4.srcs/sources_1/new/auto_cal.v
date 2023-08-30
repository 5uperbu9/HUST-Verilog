`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:39:06
// Design Name: 
// Module Name: auto_cal
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


module auto_cal#(parameter DATA_WIDTH = 8)(start,rst,clk,done,sum_out);
    input start,rst,clk;
    output wire done;
    output wire [DATA_WIDTH-1:0]sum_out;
    wire next_zero,ld_sum,ld_next,sum_sel,next_sel,a_sel;
    
    FSM fsm(clk,rst,start,next_zero,ld_sum,ld_next,sum_sel,next_sel,a_sel,done);
    data_path #(DATA_WIDTH)dp(clk,rst,next_zero,ld_sum,ld_next,sum_sel,next_sel,a_sel,sum_out);
endmodule

