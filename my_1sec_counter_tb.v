`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 15:12:38
// Design Name: 
// Module Name: my_1sec_counter_tb
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


module my_1sec_counter_tb();
parameter clk_period=10;

reg RST, CLK;
wire LED;

my_1sec_counter #(.clk_freq(10)) uut(  //시뮬레이션을 위해 clk 주기를 10나노로 설정
    .RST (RST),
    .CLK (CLK),
    .LED (LED)
    );

initial begin
    RST=1'b1;
    #(clk_period*10);
    RST=1'b0;
end

initial CLK=1'b0;
always #(clk_period/2) CLK=~CLK;  //5나노마다 clk 반전


endmodule
