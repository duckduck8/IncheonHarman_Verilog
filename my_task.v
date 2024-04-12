`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 16:01:18
// Design Name: 
// Module Name: my_task
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


module my_task(
    input [3:0] DIN,
    input [3:0] DOUT
    );
    
task comp_2(input[3:0] in_bus, output reg[3:0] comp2_bus);
reg [3:0] bus_i;
begin
    bus_i=~in_bus;
    comp2_bus=bus_i+1;
end
endtask

reg [3:0] com2_data;

assign DOUT=com2_data;
always @(DIN)
    comp_2(DIN, com2_data);    
endmodule
