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

//����ġ�� 4����  2bit adder �������
module my_2bitadder(
    input [1:0] A,
    input [1:0] B,
    output [1:0] S,
    output Co
    );
    

    wire [1:0] ca;
    //[1:0]ca ��� ������ �̸��� ����  
    
    assign Co=ca[1];
    // ca[1]�� Co�� ����
    
    my_fadder2 fa0 (.A(A[0]), .B(B[0]), .Ci(1'b0), .S(S[0]), .Co(ca[0]));
    //Ci(1'b0): Ci�� 1bit ���̳ʸ�(������)0�� �̾��
    my_fadder2 fa1 (.A(A[1]), .B(B[1]), .Ci(ca[0]), .S(S[1]), .Co(ca[1]));
    
endmodule
