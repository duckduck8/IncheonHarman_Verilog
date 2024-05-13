`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 16:07:42
// Design Name: 
// Module Name: display
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

//내가 한거 근데 안됨
//module display(
//    input RST,
//    input CLK,
//    input [3:0] NUM_1S,
//    input [2:0] NUM_10S,
//    output reg sel,
//    output reg [7:0] A
//    );
    
//    parameter CLK_FREQ=125_000_000;
//    parameter CNT_MAX=CLK_FREQ/1000_000; // 세그먼트 잔상효과를 위해 1/1000초로 해주는것
    
//    reg [26:0] clk_cnt;
//    wire enable;
    
//    always @(posedge CLK)
//    begin
//        if(RST)
//            clk_cnt<=27'd0;
//        else begin
//            if(clk_cnt==(CNT_MAX-1))
//                clk_cnt<=27'd0;
//            else
//                clk_cnt=clk_cnt+1;
//        end
//    end
    
//    assign enable=(clk_cnt==(CNT_MAX-1));
    
//    always @(posedge CLK)
//        if(RST) 
//            sel<=1'b0;
//        else if(enable)
//            sel<=~sel;
            
//    always @(sel, NUM_1S, NUM_10S)
//    begin   
//        if(sel) begin
//               case (NUM_10S)
//                   4'b0000: A=8'b11111100;  
//                   4'b0000: A=8'b00001100;
//                   4'b0000: A=8'b11011010;
//                   4'b0000: A=8'b11110010;
//                   4'b0000: A=8'b01100110;
//                   4'b0000: A=8'b10110110;
//                   default: A=8'b11111100;
//                endcase
//        end else begin
//                case (NUM_1S)
//                    4'b0000: A=8'b11111100;  
//                    4'b0000: A=8'b00001100;
//                    4'b0000: A=8'b11011010;
//                    4'b0000: A=8'b11110010;
//                    4'b0000: A=8'b01100110;
//                    4'b0000: A=8'b10110110;
//                    4'b0000: A=8'b10111110;
//                    4'b0000: A=8'b11100100;
//                    4'b0000: A=8'b11111110;
//                    4'b0000: A=8'b11110110;
//                    default: A=8'b11111100;
//                endcase
//            end
//        end       
//endmodule



//교수님이 한거
module display_inf(
    input           RST,
    input           CLK,      // 125 Mhz
    input [3:0]     NUM_1S,
    input [2:0]     NUM_10S,
    output reg     CA,
    output reg [6:0] AN
    );
parameter CLK_FREQ = 125_000_000;
parameter CNT_MAX = CLK_FREQ / 1000_000; 

reg [26:0] clk_cnt;
wire    enable;

always @(posedge CLK)
begin
    if(RST)
        clk_cnt <= 27'd0;
    else begin
        if( clk_cnt == (CNT_MAX -1))
            clk_cnt <= 27'd0;
        else
            clk_cnt <= clk_cnt + 1;
    end                                
end

assign enable = (clk_cnt == (CNT_MAX -1));

always @(posedge CLK)
    if(RST)
        CA <= 1'b0;
    else if (enable)
        CA <= ~CA;

always @(CA, NUM_1S, NUM_10S)
begin
    if (CA) begin
        case (NUM_10S)
            3'd0 : AN = 7'h7e;
            3'd1 : AN = 7'h30;
            3'd2 : AN = 7'h6d;
            3'd3 : AN = 7'h79;
            3'd4 : AN = 7'h33;
            3'd5 : AN = 7'h5b;
            default : AN = 7'h00;
        endcase  
    end else begin
        case (NUM_1S)
            4'd0 : AN = 8'h7e;
            4'd1 : AN = 8'h30;
            4'd2 : AN = 8'h6d;
            4'd3 : AN = 8'h79;
            4'd4 : AN = 7'h33;
            4'd5 : AN = 7'h5b;
            4'd6 : AN = 7'h5f;
            4'd7 : AN = 7'h70;
            4'd8 : AN = 7'h7f;
            4'd9 : AN = 7'h7b;                                    
            default : AN = 8'h00;
        endcase  
    end        
end        

endmodule


