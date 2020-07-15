module addressgenerator(input [5:0] requestedmemsize, output [5:0] onehot,input enable,clk,reset);

wire w10,w11,w12,w13; //or gate tree reverse
wire w01,w02, w03,w04; //or gate tree forward

reg [5:0] addr;
assign w10=requestedmemsize[5] | requestedmemsize[4];
assign w11=requestedmemsize[3] | w10;
assign w12=requestedmemsize[2] | w11;
assign w13=requestedmemsize[1] | w12;

assign w00=requestedmemsize[0] | requestedmemsize[1];
assign w01=requestedmemsize[2] | w00;
assign w02=requestedmemsize[3] | w01;
assign w03=requestedmemsize[4] | w02;

always @(posedge clk)
begin
/*if(reset)
begin
addr[0]<=1;
addr[1]<=1;
addr[2]<=1;
addr[3]<=1;
addr[4]<=1;
addr[5]<=1;
end*/
if(enable)
begin
addr[0]<=(~ w13 & requestedmemsize[0] )| (~requestedmemsize[0] & ~ w12 & requestedmemsize[1]);
addr[1]<=(~w12 & requestedmemsize[0] &requestedmemsize[1]) | (~ w11 & requestedmemsize[2] & ~w00);
addr[2]<=(~w11 & w00 & requestedmemsize[2]) | (~w10 & requestedmemsize[3] & ~w01);
addr[3]<=(~w10 & w01 & requestedmemsize[3]) | (~requestedmemsize[5] & requestedmemsize[4] & ~w02);
addr[4]<=(~requestedmemsize[5] & w02 & requestedmemsize[4]) | (requestedmemsize[5] & ~w03);
addr[5]<=(w03 & requestedmemsize[5]) ;
end
end
assign onehot=addr;

//encoder en1(addr, blockaddress);


endmodule

/*module encoder(input [5:0] addr, output reg [2:0] blockaddress,input en);
always @(*)
if(en)
case(addr)
1: blockaddress<=3'b000;
2: blockaddress<=3'b001;
4: blockaddress<=3'b010;
8: blockaddress<=3'b011;
16: blockaddress<=3'b100;
32: blockaddress<=3'b101;
default: blockaddress<=3'bzzz;
endcase
endmodule*/


