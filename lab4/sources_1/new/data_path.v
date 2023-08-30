`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:12:29
// Design Name: 
// Module Name: data_path
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


module data_path#(parameter DATA_WIDTH = 8)(clk,rst,next_zero,ld_sum,ld_next,sum_sel,next_sel,a_sel,sum_out);
    input clk,rst,ld_sum,ld_next,sum_sel,next_sel,a_sel;
    output next_zero,sum_out; 
    wire [DATA_WIDTH-1:0]sum_out;
    wire [DATA_WIDTH-1:0]data;
    wire [DATA_WIDTH-1:0]adder1_out;
    wire [DATA_WIDTH-1:0]sum_addr;
    wire [DATA_WIDTH-1:0]next_addr;
    wire [DATA_WIDTH-1:0]next_ans;
    wire [DATA_WIDTH-1:0]cur_data_addr;
    wire [DATA_WIDTH-1:0]addr;
    
    adder #(DATA_WIDTH)adder1(sum_out,data,adder1_out);
    mux2_1 #(DATA_WIDTH)sum_sel(adder1_out,0,sum_sel,sum_addr);
    register #(DATA_WIDTH)sum(sum_addr,sum_out,clk,ld_sum,rst);
    
    mux2_1 #(DATA_WIDTH)next_sel(data,0,next_sel,next_addr);
    register #(DATA_WIDTH)next(next_addr,next_out,clk,ld_next,rst);
    adder #(DATA_WIDTH)adder2(1,next_out,cur_data_addr);
    
    mux2_1 #(DATA_WIDTH)a_sel(cur_data_addr,next_out,a_sel,addr);
    memory #(DATA_WIDTH)memory(addr,data);
    compare #(DATA_WIDTH)cmp(next_addr,0, ,next_zero,);
endmodule
