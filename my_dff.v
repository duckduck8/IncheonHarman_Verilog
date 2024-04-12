`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/26 11:33:45
// Design Name: 
// Module Name: my_dff
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


module my_dff(
    input A, B, CLK, RST,
    output reg R,Q
    );
    
always @(A,B)
        R=A&B;
    
always @(posedge CLK, posedge RST)
if (RST==1'b1)
    Q <= 1'b0;
else
    Q <= A&B;
        
    
endmodule
