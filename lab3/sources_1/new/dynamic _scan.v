`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/09 20:32:57
// Design Name: 
// Module Name: dynamic _scan
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

module dynamic_scan(SW, clk, SEG, AN);
    input [2:0] SW;
    input clk;              // 系统时钟
    output [7:0] SEG;       // 分别对应CA、CB、CC、CD、CE、CF、CG和DP
    output [7:0] AN;        // 8位数码管片选信号
    wire clk_n;
    wire [2:0]count;
    wire [7:0]code;
    divider(.clk(clk), .clk_N(clk_n), .SW(SW));
    counter(.clk(clk_n), .out(count[2:0]), .SW(SW));
    decoder3_8(.num(count[2:0]), .sel(AN[7:0]));
    rom8x4(.addr(count[2:0]), .data(code[3:0]));
    pattern p(code[3:0], SEG[7:0]);
endmodule

module pattern(code, patt);
    input [3:0] code;       // 16进制数字的4位二进制编码
    output reg [7:0] patt;       // 7段数码管驱动，低电平有效
    always@(code) begin
        case (code[3:0])
            4'b0000: patt[7:0] = 8'b11000000;
            4'b0010: patt[7:0] = 8'b10100100;
            4'b0100: patt[7:0] = 8'b10011001;
            4'b0110: patt[7:0] = 8'b10000010;
            4'b1000: patt[7:0] = 8'b10000000;
            4'b1010: patt[7:0] = 8'b10001000;
            4'b1100: patt[7:0] = 8'b11000110;
            default: patt[7:0] = 8'b10000110;
        endcase
    end
endmodule

