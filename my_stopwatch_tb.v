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

//// led_controller 인스턴스 생성
//my_stopwatch uut (
//    .color(color), 
//    .red1(red1), 
//    .blue1(blue1),
//    .red2(red2), 
//    .blue2(blue2)
//);

//initial begin
//    // 초기값 설정
//    color = 4'b0000;
//    #100; // 100ns 대기
    
//    // color 값을 4'b1111로 변경
//    color = 4'b1101;
//    #100; // 시뮬레이션을 위해 추가 대기
//end
    
//endmodule

module my_stopwatch_tb();

reg clk;
reg rst;
wire [3:0] color;
wire red1, blue1, red2, blue2;


// 125MHz 클럭 주파수에 해당하는 클럭 주기 계산 (8ns)
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

// 클럭 생성
always #(CLOCK_PERIOD/2) clk = ~clk;

initial begin
    // 초기화
    clk = 0;
    rst = 1;
    
    // 리셋 해제
    #(CLOCK_PERIOD*10) rst = 0;
    
    // 시뮬레이션을 일정 시간 동안 실행
    // 125MHz 클럭이므로, 60초를 시뮬레이션하기 위해서는
    // 매우 많은 클럭 사이클이 필요합니다.
    // 예를 들어, 1ms 시뮬레이션을 위해서는 125,000 클럭 사이클이 필요합니다.
    // 이 예제에서는 짧은 시뮬레이션 시간을 사용하며,
    // 실제로 60초 동안 시뮬레이션을 실행하려면 시뮬레이션 시간을 늘려야 합니다.
    
    // 1ms 동안 시뮬레이션을 실행하려면 아래와 같이 설정합니다.
    #(CLOCK_PERIOD*125000);
    
    // 시뮬레이션 종료
    $finish;
end

endmodule

