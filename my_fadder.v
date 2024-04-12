`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/19 15:18:46
// Design Name: 
// Module Name: my_fadder
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


module my_fadder(
    input A, B, Ci,
    output S,
    output Co
    );

wire ab_xor;
wire ab_and;
wire ci_and;
    
assign S=ab_xor ^ Ci;
assign Co=ci_and | ab_and;

assign ab_xor=A^B;
assign ab_and=A&B;
assign ci_and=Ci&ab_xor;

endmodule
