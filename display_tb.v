`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 10:12:29
// Design Name: 
// Module Name: display_tb
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


module disp_tb();
parameter CLK_PD = 10.0;
reg RST, CLK;
reg [3:0] NUM_1S;
reg [2:0] NUM_10S;
wire    [7:0] A;
wire        sel;

display #(.CLK_FREQ(5))
    uut (
    .RST        (RST),
    .CLK        (CLK),      // 125 Mhz
    .NUM_1S     (NUM_1S),
    .NUM_10S    (NUM_10S),
    .sel         (sel),
    .A         (A)
    );
initial begin
    RST = 1;
    #(CLK_PD*20);
    RST = 0;
end

initial CLK = 0;
always #(CLK_PD/2) CLK = ~CLK;

initial begin
    NUM_1S = 0;
    NUM_10S = 0;
    wait (RST == 1'b0);
    #(CLK_PD*20);
    NUM_1S = 1;
    NUM_10S = 3;
    #(CLK_PD*20);
    NUM_1S = 2;
    NUM_10S = 4;
    #(CLK_PD*20);
    $finish;
end        
                        
    


endmodule
