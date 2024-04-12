`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/01 12:17:36
// Design Name: 
// Module Name: my_counter_tb
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


    module my_counter_tb();
    parameter clk_period=10;
    
    reg RST, CLK, DIR;
    wire [2:0] LED;
    
    my_counter uut(
        .RST (RST), 
        .CLK (CLK),
        .DIR (DIR),
        .LED (LED)
        );
        
    initial begin  //RST 1�� �ϰ� 200���� �ڿ� 0����
        RST=1'b1;
        //#200;
        #(clk_period*20);  
        RST=1'b0;
    end  //initial reset
    
    initial CLK=1'b0;  //CLK 0���� �ϰ� 10���븶�� �ݴ��
    //always #10 CLK=~CLK; 
    always #(clk_period) CLK=~CLK;
    
    initial begin   //DIR 0���� �ϰ� 'wait()���϶����� ����ϴٰ� ���Ǹ� ��������'?300���� �ڿ� 1��, 300���� �ڿ� 0����
        DIR=1'b0;
        wait(RST==1'b0);
        #300;
        DIR=1'b1;
        #300
        DIR=1'b0;
    end    
    
    endmodule
