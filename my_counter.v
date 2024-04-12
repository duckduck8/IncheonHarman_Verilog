


module my_counter(
    input RST, CLK, DIR,
    output [2:0] LED
    );
    
reg [31:0] cnt;
assign LED=cnt[31:29];
    
always@(posedge CLK)
begin
    
if(RST==1'b1)
    cnt<=32'd0;
    
else begin
    if(DIR==1'b1)
        cnt<=cnt+1;
    else
        cnt<=cnt-1;
    end
end
        
    
endmodule
