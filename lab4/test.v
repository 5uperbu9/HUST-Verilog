`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/23 19:55:53
// Design Name: 
// Module Name: test
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


module test(clk,start,rst,done,SEG,AN);
    parameter DATA_WIDTH = 32;
    input clk,start,rst;
    output done;
    output [7:0]SEG;
    output reg [7:0]AN; 
    reg [3:0]seg;
    reg count;
    wire clk_N;
    wire clk_P;
    wire [DATA_WIDTH-1:0]sum_out;
    
    divider d1(clk,clk_N);
    divider #(1000000)d2(clk,clk_P);
    auto_cal #(DATA_WIDTH)cal(start,rst,clk_N,done,sum_out);
    pattern p(seg,SEG);
    
    initial begin
        seg=0;
        count=0;
    end
    
    always@(posedge clk_P) begin
        if (count%2==0) begin
            AN[7:0]=8'b11111110;
            seg<=sum_out%10;
            count<=count+1;
        end
        else begin
            AN[7:0]=8'b11111101;
            seg<=sum_out/10;
            count<=count+1;
        end
    end
endmodule

module pattern(code, patt);
    input [3:0] code;       // 16进制数字的4位二进制编码
    output reg [7:0] patt;       // 7段数码管驱动，低电平有效
    always@(code) begin
        case (code[3:0])
            4'b0000: patt = 8'b11000000;
            4'b0001: patt = 8'b11111001;
            4'b0010: patt = 8'b10100100;
            4'b0011: patt = 8'b10110000;
            4'b0100: patt = 8'b10011001;
            4'b0101: patt = 8'b10010010;
            4'b0110: patt = 8'b10000010;
            4'b0111: patt = 8'b11111000;
            4'b1000: patt = 8'b10000000;
            4'b1001: patt = 8'b10011000;
            4'b1010: patt = 8'b10001000;
            4'b1011: patt = 8'b10000011;
            4'b1100: patt = 8'b11000110;
            4'b1101: patt = 8'b10100001;
            4'b1110: patt = 8'b10000110;
            4'b1111: patt = 8'b10001110;
        endcase
    end
endmodule