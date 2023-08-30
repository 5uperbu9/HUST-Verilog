`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/09 20:12:21
// Design Name: 
// Module Name: divide_and_count
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

module divide_and_count(clk,out);
    input clk;
    output reg [2:0] out;
    wire clk_N;
        divider d(clk,clk_N);
        counter c(clk_N,out);
endmodule
