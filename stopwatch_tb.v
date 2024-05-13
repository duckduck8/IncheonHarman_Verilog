`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 13:48:02
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb();
reg RST, CLK, start;
wire [3:0] NUM_1s;  //0~9
wire [2:0] NUM_10s;

stopwatch  #(.CLK_FREQ(5)) uut (
    .RST(RST), 
    .CLK(CLK), 
    .start(start),  
    .NUM_1s(NUM_1s), 
    .NUM_10s(NUM_10s)
);



initial CLK=1'b0;
always #100 CLK=~CLK;  

initial begin
    
 RST=1'b1;
 start=1'b0;
 #400;
 
 RST=1'b0;
 #200;
 
 start=1'b1;
 #10000;
 
 start=1'b0;
 #10000;
 

 start=1'b1;
 #10000;
 RST=1'b1;
 #400;
 
 RST=1'b0;
 
 
    
$finish;
end

endmodule
