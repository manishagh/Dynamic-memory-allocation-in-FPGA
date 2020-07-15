

module priorityencoder (
output reg [2:0] pr_addr , 
input [5:0] onehot , 
input [5:0] rd0,rd1,rd2,rd3,rd4,rd5
      
);

wire [5:0] checkifzero;

assign checkifzero[0]=((rd0 & onehot) ==0)?1:0;
assign checkifzero[1]=((rd1 & onehot) ==0)?1:0;
assign checkifzero[2]=((rd2 & onehot) ==0)?1:0;
assign checkifzero[3]=((rd3 & onehot) ==0)?1:0;
assign checkifzero[4]=((rd4 & onehot) ==0)?1:0;
assign checkifzero[5]=((rd5 & onehot) ==0)?1:0;

      
always @ (*)
begin
  
 
   if (checkifzero[0] == 1) begin
    pr_addr = 0; 
   end else if (checkifzero[1] == 1) begin 
    pr_addr = 1; 
   end else if (checkifzero[2] == 1) begin 
    pr_addr = 2; 
   end else if (checkifzero[3] == 1) begin 
    pr_addr = 3; 
   end else if (checkifzero[4] == 1) begin 
    pr_addr = 4; 
	end else if (checkifzero[5] == 1) begin 
    pr_addr = 5; 
   end
  end


endmodule  
