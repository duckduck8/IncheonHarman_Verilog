`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/12 10:55:19
// Design Name: 
// Module Name: parity_function
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


module parity_function #(parameter width=32)(
    input [width-1:0] d_word,
    output [width:0] data_frame
    );
    
function parity;
input [width-1:0] bv;
reg par;
integer i;
    begin  //function
        par=1'b0;
        for(i=0; i<width; i=i+1)
            par=par^bv[i];
        parity=par;
    end
endfunction 

assign data_frame={d_word, parity(d_word)};    
endmodule
