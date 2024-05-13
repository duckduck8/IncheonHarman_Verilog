`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 11:21:24
// Design Name: 
// Module Name: parity_function_tb
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


module parity_function_tb();

parameter width=8;

reg [width-1:0] data;
wire [width:0] dout;

parity_function # (.width(width)) uut(
    .d_word (data),
    .data_frame (dout)
    );
    
initial begin
    data=32'd0;
    repeat(256)
    begin
        #10;
        $display("data:%b  parity:%b", data, dout[0]);
        data=data+1;
    end
end

initial begin
    #(10*256);
    $finish;
end

endmodule
