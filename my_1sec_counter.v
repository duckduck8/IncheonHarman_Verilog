`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 14:27:47
// Design Name: 
// Module Name: my_1sec_counter
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


module my_1sec_counter(
    input RST,
    input CLK,
    output reg LED
    );
    
    parameter clk_freq=125_000_000;  //clk���ļ��� 125MHz�� ����
    reg enable;                        //1�ʿ� clk ���ֱⰡ 1��2õ5�鸸�� ����
    reg[31:0] cnt;
   
    
always @(posedge CLK)
begin
    if(RST) begin
        cnt<=32'd0;
        enable<=1'b0;
        end
    else begin
        if(cnt==(clk_freq-1)) begin  //cnt�� 124.99999�Ǹ� enable 1��
        cnt<=32'd0;
        enable<=1'b1;
        end
        else begin
        cnt<=cnt+1;  
        enable<=1'b0;
        end
    end
end

always@(posedge CLK)
begin
    if(RST)
        LED<=1'b0;
    else if(enable)  //enable 1�̸� led����
        LED<= ~LED;
end        
    
    
endmodule
