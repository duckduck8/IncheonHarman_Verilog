`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 10:58:48
// Design Name: 
// Module Name: stopwatch_top
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
//module stopwatch_top(
//    input RST,
//    input CLK,
//    input KEY,
//    output sel,
//    output [6:0] A
//    );
    
//wire    [3:0]   NUM_1S;
//wire    [2:0]   NUM_10S;
//wire        start_stop;

//my_startstop startstop_inst (
//    .RST        (RST),
//    .CLK        (CLK),
//    .KEY        (KEY),
//    .startstop    (start_stop) //start : 1, stop :0
//    );
    
//stopwatch stopwatch_inst (
//    .RST        (RST),
//    .CLK        (CLK),
//    .start      (start_stop),
//    .NUM_1S     (NUM_1S),
//    .NUM_10S    (NUM_10S)
//    );

//display display_inst(
//    .RST            (RST),
//    .CLK            (CLK),      // 125 Mhz
//    .NUM_1S         (NUM_1S),
//    .NUM_10S        (NUM_10S),
//    .sel             (sel),
//    .A             (A)
//    );        

//endmodule



// 교수님이 한거
module stopwatch_top(
    input RST,
    input CLK,
    input KEY,
    output CA,
    output [6:0] AN
    );
wire    [3:0]   num_1s;
wire    [2:0]   num_10s;
wire        start_stop;

key_proc key_inst (
    .RST        (RST),
    .CLK        (CLK),
    .KEY        (KEY),
    .STR_STP    (start_stop) //start : 1, stop :0
    );
    
stopwatch stopwatch_inst (
    .RST        (RST),
    .CLK        (CLK),
    .START      (start_stop),
    .NUM_1S     (num_1s),
    .NUM_10S    (num_10s)
    );

display_inf display_inst(
    .RST            (RST),
    .CLK            (CLK),      // 125 Mhz
    .NUM_1S         (num_1s),
    .NUM_10S        (num_10s),
    .CA             (CA),
    .AN             (AN)
    );        

endmodule


