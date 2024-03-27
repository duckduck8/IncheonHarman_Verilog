`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/26 15:21:18
// Design Name: 
// Module Name: my_7segment
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


module my_7segment(
    input [1:0] SW,  //입력 0, 1
    output CA,       //왼쪽 켜기 또는 오른쪽 켜기
    output reg [7:0] A
    );
    
    assign CA=1'b1;  //오른쪽 켜기
    
    always @(SW)
    begin
    
    case (SW)
    2'b00: A=8'b11111100;
    2'b01: A=8'b00001100;
    2'b10: A=8'b11011010;
    2'b11: A=8'b11110010;
    default A=8'b11111100;
    endcase
    end
endmodule
