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
//    // 첫 번째 LED (상위 2비트로 제어)
//    case(color[3:2])
//        2'b00: {red1, blue1} = 2'b00; // 블랙
//        2'b01: {red1, blue1} = 2'b10; // 레드
//        2'b10: {red1, blue1} = 2'b01; // 블루
//        2'b11: {red1, blue1} = 2'b11; // 레드+블루
//        default: {red1, blue1} = 2'b00; // 기본값으로 블랙 설정
//    endcase
    
//    // 두 번째 LED (하위 2비트로 제어)
//    case(color[1:0])
//        2'b00: {red2, blue2} = 2'b00; // 블랙
//        2'b01: {red2, blue2} = 2'b10; // 레드
//        2'b10: {red2, blue2} = 2'b01; // 블루
//        2'b11: {red2, blue2} = 2'b11; // 레드+블루
//        default: {red2, blue2} = 2'b00; // 기본값으로 블랙 설정
//    endcase
//end

//endmodule

module my_stopwatch(
    input clk, // 125MHz 클럭 입력
    input rst, // 리셋 신호
    output reg [3:0] color, // 'color' 값은 외부에서 입력받는 것이 아니라 내부적으로 관리
    output reg red1, blue1,
    output reg red2, blue2
);

// 125MHz 클럭에서 60초를 세기 위한 카운터 값
localparam ONE_SECOND_COUNT = 125_000_000; // 1초
localparam SIXTY_SECONDS_COUNT = 60 * ONE_SECOND_COUNT; // 60초

// 카운터 변수
reg [31:0] counter = 0; // 충분히 큰 카운터

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // 리셋 시 모든 값 초기화
        counter <= 0;
        color <= 0;
    end else begin
        if (counter < SIXTY_SECONDS_COUNT-1) begin
            counter <= counter + 1;
        end else begin
            counter <= 0; // 카운터 리셋
            if(color==15) begin
                color<=0;
            end else begin
                color <= color + 1; // 'color' 값을 1 증가
            end
        end
    end
end

// LED 제어 로직
always @(posedge color) begin
    // 첫 번째 LED (상위 2비트로 제어)
    case(color[3:2])
        2'b00: {red1, blue1} = 2'b00;
        2'b01: {red1, blue1} = 2'b10;
        2'b10: {red1, blue1} = 2'b01;
        2'b11: {red1, blue1} = 2'b11;
        default: {red1, blue1} = 2'b00;
    endcase
    
    // 두 번째 LED (하위 2비트로 제어)
    case(color[1:0])
        2'b00: {red2, blue2} = 2'b00;
        2'b01: {red2, blue2} = 2'b10;
        2'b10: {red2, blue2} = 2'b01;
        2'b11: {red2, blue2} = 2'b11;
        default: {red2, blue2} = 2'b00;
    endcase
end

endmodule