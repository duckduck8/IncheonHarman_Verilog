`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 15:15:52
// Design Name: 
// Module Name: my_fsm_security
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

//내가 하다 만 코드
//module my_fsm_security(
//    input [1:0] keypad,
//    input front_door,
//    input rear_door,
//    input windows,
//    input rst,
//    input clk,
//    output reg [1:0] fsm_state,
//    output reg alarm_siren
//    );
    
//    localparam [1:0] disarmed=2'b00,
//                     armed=2'b01,
//                     wait_delay=2'b10,
//                     alarm=2'b11;
                 
//reg [1:0] curr_state, next_state;
//wire count_done;
//wire [2:0] sensors;

//always @(posedge clk)
//begin
//    if(rst)
//        curr_state<=disarmed;
//    else
//        curr_state<=next_state;
//end

//always @(curr_state, keypad, sensors, count_done)
//begin
//    case (curr_state)
//        disarmed: begin
//            if(keypad==4'b0011)
//                next_state=armed;
//            else
//                next_state=disarmed;
//                alarm_siren=1'b0;
//            end
        
//        armed: begin
//                if(sensors!=3'b000)
//                    next_state=wait_delay;
//                else if(keypad==4'b100 && sensors=3'b000)
//                    next_state=disarmed;
//                else
//                    next_state=armed;
//                    alarm_siren=1'b0;
//                end
                
//        wait_delay: begin
//                if (count_done==1'b1)
//                    next_state=alarm;
//                else if (keypad==4'b1100 && count_done==1'b0)
//                    next_state=disarmed;
//                else
//                    next_state=wait_delay;
//                    alarm_siren=1'b0;
//                end
//        alarm: begin
//                if(keypad==4'b1100)
//                    next_state=disarmed;
//                else
//                    next_state=alarm;
//                    alarm_siren=1'b1;
//                end
//        default : next_state=disarmed;
//    endcase
//end       
    
//endmodule


//교수님 코드
