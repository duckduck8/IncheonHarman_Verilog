`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 16:05:46
// Design Name: 
// Module Name: my_task_tb
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


module my_task_tb();
reg [3:0] data;
wire [3:0] twos_data;
integer i;

my_task uut( .DIN(data), .DOUT(twos_data));

initial begin
    data=0;
    for(i=0; i<256; i=i+1)
    begin
        #10;
        $display("input data:%b, Two's Complement: %b", data, twos_data);
        data=data+1;
    end
end

initial begin
    #(10+256)
    $finish;
end
endmodule
