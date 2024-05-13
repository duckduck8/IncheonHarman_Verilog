`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 12:23:11
// Design Name: 
// Module Name: stopwatch
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


//module stopwatch(
//    input rst,
//    input clk,
//    input start,
//    output reg [3:0] num_1s,  //0~9
//    output reg [2:0] num_10s  //0~5
//    );
    
//   parameter clk_freq=125_000_000;
//   reg [32:0] tick_1s;
   
//always @(posedge clk)
//begin
//    if(start) begin
//        tick_1s<=32'd0;
//    end
//    else begin
//        if(tick_1s==(clk_freq-1)) begin  //cnt가 124.99999되면 enable 1로
//        tick_1s<=32'd0;
//        end
//        else begin
//        tick_1s<=tick_1s+1;  
//        end
//    end
//end
   

//always @(posedge tick_1s)
//begin
//    if (rst) begin
//        num_1s<=0;
//        num_10s<=0;
//    end else begin
//        if (num_1s==9) begin
//            num_1s<=0;
//            num_10s<=num_10s+1;
//            end
//        else begin
//            num_1s<=num_1s+1;
//            end
//        if(num_10s==5) begin
//            num_10s<=0;
//            end
      
//    end
//end
 
 
//내가 한거 근데 안됨
// module stopwatch(
//    input RST,
//    input CLK,
//    input start,
//    output reg [3:0] NUM_1S,
//    output reg [2:0] NUM_10S
//);

//parameter CLK_FREQ = 125_000_000;
//reg [26:0] cnt = 0;
//wire tick_1s;

//assign tick_1s = (cnt == (CLK_FREQ - 1));

//always @(posedge CLK or posedge RST) begin
//    if (RST) begin
//        cnt <= 0;
//        NUM_1S <= 0;
//        NUM_10S <= 0;
//    end else begin
//        if (start) begin
//            if (tick_1s) begin
//                cnt <= 0;
//                if (NUM_1S == 9) begin
//                    NUM_1S <= 0;                   
//                    if (NUM_10S == 5) begin
//                        NUM_10S <= 0;
//                    end else begin
//                        NUM_10S <= NUM_10S + 1;
//                    end
//                end else begin
//                    NUM_1S <= NUM_1S + 1;
//                end
//            end else begin
//                cnt <= cnt + 1;
//            end
//        end
//    end
//end

//endmodule



//교수님이 한거 
module stopwatch(
    input RST,
    input CLK,
    input START,
    output reg [3:0] NUM_1S,
    output reg [2:0] NUM_10S
    );
parameter CLK_FREQ = 125_000_000;

reg [26:0]  cnt;
wire        tick_1s;

always @(posedge CLK)
begin
    if(RST || ~START)
        cnt <= 27'd0;
    else if(cnt == (CLK_FREQ - 1))
        cnt <= 27'd0;
    else
        cnt <= cnt + 1;
end

assign tick_1s = cnt == (CLK_FREQ - 1);

always @(posedge CLK)
begin
    if (RST)
        NUM_1S <= 4'd0;
    else if(tick_1s) begin
        if(NUM_1S == 4'd9)
            NUM_1S <= 4'd0;
        else
            NUM_1S <= NUM_1S + 1;
    end                                            
end     //slways

always @(posedge CLK)
begin
    if (RST)
        NUM_10S <= 3'd0;
    else if(tick_1s && (NUM_1S == 4'd9)) begin
        if(NUM_10S == 3'd5)
            NUM_10S <= 3'd0;
        else
            NUM_10S <= NUM_10S + 1;
    end                                            
end     //slways
    
endmodule






