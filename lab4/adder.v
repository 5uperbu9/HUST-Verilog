`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 20:56:26
// Design Name: 
// Module Name: adder
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


module adder#(parameter DATA_WIDTH = 8)(q1,q2,ans);
    input [DATA_WIDTH-1:0]q1;
    input [DATA_WIDTH-1:0]q2;
    output reg [DATA_WIDTH-1:0]ans;
    
    initial
    begin
        ans=0;
    end
    
    always@(q1 or q2)
    begin
        ans<=q1+q2;
    end
endmodule
