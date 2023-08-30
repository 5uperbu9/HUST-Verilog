`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/09 19:29:35
// Design Name: 
// Module Name: divider
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


module divider(clk, clk_N, SW);
    input clk;
    input [2:0]SW;
    output reg clk_N;               
    integer N= 100_000_000;
    reg [31:0] counter;
           
    always @(posedge clk) begin 
        case(SW[1]) 
            1'b1: N = 1_000;
            default: N = 100_000_000;
        endcase
            counter<=counter+1;                   
            if(counter>=(N/2)-1) begin
                clk_N<=~clk_N;
                counter<=0;
        end
    end                           
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/07 17:11:45
// Design Name: 
// Module Name: tb
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


module tb;
    reg clk,start,rst,go;
    wire clk_N;
    wire [7:0]SEG,AN;
    test t(clk,start,rst,go,clk_N,SEG);
    initial begin
        clk=0;
        start=1;
        rst=0;
        go=0;
        #5 forever
        #1 clk=~clk;
    end

endmodule

