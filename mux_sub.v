module mux_sub(input [5:0] requestedmemsize, output reg [5:0] remainingsize, input [2:0] pr_addr);
wire [5:0] s0,s1,s2,s3,s4,s5;
assign s0=2-requestedmemsize;
assign s1=4-requestedmemsize;
assign s2=8-requestedmemsize;
assign s3=16-requestedmemsize;
assign s4=32-requestedmemsize;
assign s5=64-requestedmemsize;

always @(*)
case(pr_addr)
0:remainingsize<=s0;
1:remainingsize<=s1;
2:remainingsize<=s2;
3:remainingsize<=s3;
4:remainingsize<=s4;
5:remainingsize<=s5;
endcase
endmodule

module comparator(input [5:0] remainingsize, output reg [5:0] updatedalloc,input [5:0] rd0,rd1,rd2,rd3,rd4,rd5,output upready);
wire [5:0] xor_value;
always @(*)
begin
if(remainingsize>=2)
updatedalloc[0]<=0;
else
updatedalloc[0]<=1;
if(remainingsize>=4)
updatedalloc[1]<=0;
else
updatedalloc[1]<=1;
if(remainingsize>=8)
updatedalloc[2]<=0;
else
updatedalloc[2]<=1;
if(remainingsize>=16)
updatedalloc[3]<=0;
else
updatedalloc[3]<=1;
if(remainingsize>=32)
updatedalloc[4]<=0;
else
updatedalloc[4]<=1;
if(remainingsize>=64)
updatedalloc[5]<=0;
else
updatedalloc[5]<=1;
end
assign xor_value=(updatedalloc^rd0) |(updatedalloc^rd1)|(updatedalloc^rd2)|(updatedalloc^rd3)
|(updatedalloc^rd4)|(updatedalloc^rd5);
assign upready=|xor_value;

endmodule