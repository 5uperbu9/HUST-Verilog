`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:08:24
// Design Name: 
// Module Name: memory
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


module memory#(parameter DATA_WIDTH = 8,parameter ADDR_LENTH = 16)(addr,data);
	input [DATA_WIDTH-1:0] addr;
    output reg[DATA_WIDTH-1:0] data;
    reg [DATA_WIDTH-1:0] list[ADDR_LENTH-1:0];

    initial
    begin
        data=0;
        list[0]=8'h00000003;
        list[1]=8'h00000002;
        list[2]=8'h00000000;
        list[3]=8'h00000007;
        list[4]=8'h00000004;
        list[5]=8'h00000000;
        list[6]=8'h00000000;
        list[7]=8'h0000000b;
        list[8]=8'h00000006;
        list[9]=8'h00000000;
        list[10]=8'h00000000;
        list[11]=8'h00000000;
        list[12]=8'h00000008;
        list[13]=8'h00000000;
        list[14]=8'h00000000;
        list[15]=8'h00000000;
    end
    
    always@(addr) begin
        data<=list[addr];
    end
endmodule
