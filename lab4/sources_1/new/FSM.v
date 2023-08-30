`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/16 21:18:03
// Design Name: 
// Module Name: FSM
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


module FSM(clk,rst,start,next_zero,ld_sum,ld_next,sum_sel,next_sel,a_sel,done);
    input clk,rst,start,next_zero;
    output reg ld_sum,ld_next,sum_sel,next_sel,a_sel,done;
    integer state,next_state;
    
    initial begin
        ld_sum=0;
        ld_next=0;
        sum_sel=0;
        next_sel=0;
        a_sel=0;
        done=0;
        state = 0;
    end
    
    always@(*)begin
        case(state)
            0:begin
                {ld_sum,ld_next,sum_sel,next_sel,a_sel,done}=6'b000000;
                if (start==1) begin
                    next_state<=1;
                end
                else begin
                    next_state<=0;
                end
            end
            1:begin
                {ld_sum,ld_next,sum_sel,next_sel,a_sel,done}=6'b101110;
                next_state<=2;
            end
            2:begin
                {ld_sum,ld_next,sum_sel,next_sel,a_sel,done}=6'b011100;
                if (next_zero) begin
                    next_state<=3;
                end
                else begin
                    next_state<=1;
                end
            end
            3:begin
                {ld_sum,ld_next,sum_sel,next_sel,a_sel,done}=6'b000001;
                if (start==1) begin
                    next_state<=3;
                end
                else begin
                    next_state<=0;
                end
            end
            default:next_state<=0;
        endcase
    end
    
    always@(posedge clk)
    begin
        if (rst == 1)
            state<=0;
        else 
            state<=next_state; 
    end
endmodule

