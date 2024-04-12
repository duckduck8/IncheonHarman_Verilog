`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/03/25 14:05:50
// Design Name: 
// Module Name: my_2bitadder
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

//스위치가 4개라  2bit adder 만든거임
module my_2bitadder(
    input [1:0] A,
    input [1:0] B,
    output [1:0] S,
    output Co
    );
    

    wire [1:0] ca;
    //[1:0]ca 라는 가상의 이름을 정의  
    
    assign Co=ca[1];
    // ca[1]에 Co를 배정
    
    my_fadder2 fa0 (.A(A[0]), .B(B[0]), .Ci(1'b0), .S(S[0]), .Co(ca[0]));
    //Ci(1'b0): Ci에 1bit 바이너리(이진수)0을 이어라
    my_fadder2 fa1 (.A(A[1]), .B(B[1]), .Ci(ca[0]), .S(S[1]), .Co(ca[1]));
    
endmodule
