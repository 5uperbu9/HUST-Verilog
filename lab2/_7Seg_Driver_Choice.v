`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/25 19:59:20
// Design Name: 
// Module Name: _7Seg_Driver_Choice
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


module _7Seg_Driver_Choice(SW, SEG, AN, LED);
    input [15:0] SW;        // 16位拨动开关
    output reg [7:0] SEG;  // 7段数码管驱动，低电平有效
    output reg [7:0] AN;   // 7段数码管片选信号，低电平有效
    output [15:0] LED;      // 16位LED显示
    
	always@(SW[3:0]) begin
        case(SW[3:0])
            4'b0000 : SEG[7:0] = 8'b11000000;
            4'b0001 : SEG[7:0] = 8'b11111001;
            4'b0010 : SEG[7:0] = 8'b10100100;
            4'b0011 : SEG[7:0] = 8'b10110000;
            4'b0100 : SEG[7:0] = 8'b10011001;
            4'b0101 : SEG[7:0] = 8'b10010010;
            4'b0110 : SEG[7:0] = 8'b10010010;
            4'b0111 : SEG[7:0] = 8'b11111000;
            4'b1000 : SEG[7:0] = 8'b10000000;
            4'b1001 : SEG[7:0] = 8'b10011000;
            4'b1010 : SEG[7:0] = 8'b10001000;
            4'b1011 : SEG[7:0] = 8'b10000011;
            4'b1100 : SEG[7:0] = 8'b11000110;
            4'b1101 : SEG[7:0] = 8'b10100001;
            4'b1110 : SEG[7:0] = 8'b10000110;
            4'b1111 : SEG[7:0] = 8'b10001110;
        endcase
    end
    
    always@(SW[15:13]) begin
        case(SW[15:13])  
            3'b000 : AN[7:0] = 8'b11111110;
            3'b001 : AN[7:0] = 8'b11111101;
            3'b010 : AN[7:0] = 8'b11111011;
            3'b011 : AN[7:0] = 8'b11110111;
            3'b100 : AN[7:0] = 8'b11101111;
            3'b101 : AN[7:0] = 8'b11011111;
            3'b110 : AN[7:0] = 8'b10111111;
            3'b111 : AN[7:0] = 8'b01111111;
        endcase
    end
    
    assign LED[15:0] = SW[15:0];
    
endmodule
