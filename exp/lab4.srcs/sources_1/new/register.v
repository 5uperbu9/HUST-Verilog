`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:05:20
// Design Name: 
// Module Name: register
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


module register#(parameter DATA_WIDTH = 8)(D,Q,clk,load,rst);
    input [DATA_WIDTH-1:0] D;
    output [DATA_WIDTH-1:0] Q;
    input clk,load,rst;
    reg [DATA_WIDTH-1:0] t;
    
    initial
    begin
        t=0;
    end
 
    always@(posedge clk)
    begin
        if (rst == 1) begin
            t<=0;
        end
        else begin
            if (load) begin
                t<=D;
            end
            else begin
                t<=t;
            end
        end
    end
    assign Q=t;
endmodule
