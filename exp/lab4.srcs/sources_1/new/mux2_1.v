`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:00:35
// Design Name: 
// Module Name: mux2_1
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


module mux2_1#(parameter DATA_WIDTH = 8)(q1,q2,sel,out);
    input [DATA_WIDTH-1:0]q1;
    input [DATA_WIDTH-1:0]q2;
    input sel; 
    output reg [DATA_WIDTH-1:0]out;
    
    initial
    begin
        out=0;
    end
    
    always@(sel or q1 or q2)
    begin
        if (sel == 1) begin
            out<=q1;
        end
        else begin
            out<=q2;
        end
    end
endmodule

