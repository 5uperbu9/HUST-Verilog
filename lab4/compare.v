`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:03:45
// Design Name: 
// Module Name: compare
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


module compare#(parameter DATA_WIDTH = 8)(A,B,G,E,L);
    input [DATA_WIDTH-1:0]A;
    input [DATA_WIDTH-1:0]B;
    output reg G,E,L;

    initial 
    begin
        G=0;
        E=0;
        L=0;
    end
    
    always@(A or B)
    begin
        {G,E,L}=(A>B)?3'b100:(A==B)?3'b010:3'b001;
    end
endmodule
