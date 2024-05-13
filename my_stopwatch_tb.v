`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/18 14:10:52
// Design Name: 
// Module Name: my_stopwatch_tb
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


//module my_stopwatch_tb();

//reg [3:0] color;
//wire red1, blue1, red2, blue2;

//// led_controller �ν��Ͻ� ����
//my_stopwatch uut (
//    .color(color), 
//    .red1(red1), 
//    .blue1(blue1),
//    .red2(red2), 
//    .blue2(blue2)
//);

//initial begin
//    // �ʱⰪ ����
//    color = 4'b0000;
//    #100; // 100ns ���
    
//    // color ���� 4'b1111�� ����
//    color = 4'b1101;
//    #100; // �ùķ��̼��� ���� �߰� ���
//end
    
//endmodule

module my_stopwatch_tb();

reg clk;
reg rst;
wire [3:0] color;
wire red1, blue1, red2, blue2;


// 125MHz Ŭ�� ���ļ��� �ش��ϴ� Ŭ�� �ֱ� ��� (8ns)
localparam CLOCK_PERIOD = 8;

my_stopwatch uut (
    .clk(clk),
    .rst(rst),
    .color(color),
    .red1(red1),
    .blue1(blue1),
    .red2(red2),
    .blue2(blue2)
);

// Ŭ�� ����
always #(CLOCK_PERIOD/2) clk = ~clk;

initial begin
    // �ʱ�ȭ
    clk = 0;
    rst = 1;
    
    // ���� ����
    #(CLOCK_PERIOD*10) rst = 0;
    
    // �ùķ��̼��� ���� �ð� ���� ����
    // 125MHz Ŭ���̹Ƿ�, 60�ʸ� �ùķ��̼��ϱ� ���ؼ���
    // �ſ� ���� Ŭ�� ����Ŭ�� �ʿ��մϴ�.
    // ���� ���, 1ms �ùķ��̼��� ���ؼ��� 125,000 Ŭ�� ����Ŭ�� �ʿ��մϴ�.
    // �� ���������� ª�� �ùķ��̼� �ð��� ����ϸ�,
    // ������ 60�� ���� �ùķ��̼��� �����Ϸ��� �ùķ��̼� �ð��� �÷��� �մϴ�.
    
    // 1ms ���� �ùķ��̼��� �����Ϸ��� �Ʒ��� ���� �����մϴ�.
    #(CLOCK_PERIOD*125000);
    
    // �ùķ��̼� ����
    $finish;
end

endmodule

