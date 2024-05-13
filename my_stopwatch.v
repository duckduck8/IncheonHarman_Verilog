`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/18 10:48:12
// Design Name: 
// Module Name: my_stopwatch
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


//module my_stopwatch(
//    input signal,
//    output reg [1:0] LED
//    );
    
//module my_stopwatch(
//    input [3:0] color,
//    output reg red1, blue1,
//    output reg red2, blue2
//);



//always @(color) begin
//    // ù ��° LED (���� 2��Ʈ�� ����)
//    case(color[3:2])
//        2'b00: {red1, blue1} = 2'b00; // ��
//        2'b01: {red1, blue1} = 2'b10; // ����
//        2'b10: {red1, blue1} = 2'b01; // ���
//        2'b11: {red1, blue1} = 2'b11; // ����+���
//        default: {red1, blue1} = 2'b00; // �⺻������ �� ����
//    endcase
    
//    // �� ��° LED (���� 2��Ʈ�� ����)
//    case(color[1:0])
//        2'b00: {red2, blue2} = 2'b00; // ��
//        2'b01: {red2, blue2} = 2'b10; // ����
//        2'b10: {red2, blue2} = 2'b01; // ���
//        2'b11: {red2, blue2} = 2'b11; // ����+���
//        default: {red2, blue2} = 2'b00; // �⺻������ �� ����
//    endcase
//end

//endmodule

module my_stopwatch(
    input clk, // 125MHz Ŭ�� �Է�
    input rst, // ���� ��ȣ
    output reg [3:0] color, // 'color' ���� �ܺο��� �Է¹޴� ���� �ƴ϶� ���������� ����
    output reg red1, blue1,
    output reg red2, blue2
);

// 125MHz Ŭ������ 60�ʸ� ���� ���� ī���� ��
localparam ONE_SECOND_COUNT = 125_000_000; // 1��
localparam SIXTY_SECONDS_COUNT = 60 * ONE_SECOND_COUNT; // 60��

// ī���� ����
reg [31:0] counter = 0; // ����� ū ī����

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // ���� �� ��� �� �ʱ�ȭ
        counter <= 0;
        color <= 0;
    end else begin
        if (counter < SIXTY_SECONDS_COUNT-1) begin
            counter <= counter + 1;
        end else begin
            counter <= 0; // ī���� ����
            if(color==15) begin
                color<=0;
            end else begin
                color <= color + 1; // 'color' ���� 1 ����
            end
        end
    end
end

// LED ���� ����
always @(posedge color) begin
    // ù ��° LED (���� 2��Ʈ�� ����)
    case(color[3:2])
        2'b00: {red1, blue1} = 2'b00;
        2'b01: {red1, blue1} = 2'b10;
        2'b10: {red1, blue1} = 2'b01;
        2'b11: {red1, blue1} = 2'b11;
        default: {red1, blue1} = 2'b00;
    endcase
    
    // �� ��° LED (���� 2��Ʈ�� ����)
    case(color[1:0])
        2'b00: {red2, blue2} = 2'b00;
        2'b01: {red2, blue2} = 2'b10;
        2'b10: {red2, blue2} = 2'b01;
        2'b11: {red2, blue2} = 2'b11;
        default: {red2, blue2} = 2'b00;
    endcase
end

endmodule