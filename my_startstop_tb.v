`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/19 11:16:19
// Design Name: 
// Module Name: my_startstop_tb
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


module my_startstop_tb();


reg rst, clk, key;
wire startstop;

my_startstop uut (
        .RST(rst), 
        .CLK(clk), 
        .KEY(key), 
        .startstop(startstop)
    );


initial begin
    rst=1'b1;
    #20;
    rst=1'b0;
end

initial clk=1'b0;
always #10 clk=~clk;  //10나노마다 clk 반전


initial begin
    key=1'b0;
    #20
    key=1'b1;
    #20;
    key=1'b0;
    #20
    key=1'b1;
    #20;
    key=1'b0;
    #20
    key=1'b1;
    #20;
    key=1'b0;
    #20
    key=1'b1;
    
    $finish;
    end


endmodule
