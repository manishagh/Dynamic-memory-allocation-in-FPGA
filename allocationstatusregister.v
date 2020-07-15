module allocationstatusregister(
input  clk, we,reset,
            input  [2:0] a, 
			input [5:0] wd,
            output [5:0] rd0,rd1,rd2,rd3,rd4,rd5);

  reg  [5:0] register[5:0];

  assign rd0 = register[0]; // word aligned
assign rd1 = register[1];
assign rd2 = register[2];
assign rd3 = register[3];
assign rd4 = register[4];
assign rd5 = register[5];
  always @(posedge clk)
  begin
  if(reset)
  begin 
  register[0]<=6'b111110; //space free for request of 2 only
  register[1]<=6'b111100; //space free for request of 2 and 4
  register[2]<=6'b111000; //space free for request of 2 , 4 and 8
  register[3]<=6'b110000; //space free for request of 2 , 4, 8 and 16
  register[4]<=6'b100000; //space free for request of 2 , 4, 8, 16 and 32
  register[5]<=6'b000000; //space free for request of 2 , 4, 8, 16, 32 and 64
  end
    if (we)
      register[a] <= wd;
	  end
endmodule


module startingaddress(
input  clk, we,reset,
            input  [2:0] a, 
			output [7:0] rd,
			input [7:0] wd
            );
reg  [7:0] register[5:0];	
	  always @(posedge clk)
	  begin
  if(reset)
  begin 
  register[0]<=8'b00000000; 
  register[1]<=8'b00000010; 
  register[2]<=8'b00000110; 
  register[3]<=8'b00001110; 
  register[4]<=8'b00011110; 
  register[5]<=8'b00111110; 
   end
   if (we)
   register[a] <= wd;
 end
assign rd=register[a]; 
			
endmodule

module reg2address(input clk, input [2:0] regmips, input reset 
                   ,input we, input [7:0] wd, output [7:0] rd);
reg  [7:0] register[7:0];	
	  always @(posedge clk)
	  begin
  /*if(reset)
  begin 
  register[0]<=8'b00000000; 
  register[1]<=8'b00000000; 
  register[2]<=8'b00000000; 
  register[3]<=8'b00000000; 
  register[4]<=8'b00000000; 
  register[5]<=8'b00000000; 
  register[6]<=8'b00000000;
  register[7]<=8'b00000000;
   end*/
   if (we)
      register[regmips] <= wd;
 end
assign rd=register[regmips]; 				   
				   
endmodule
/*module onehotregister(//read only
input  clk,reset
            input  [2:0] a, 
			
            output [5:0] rd);

  reg  [5:0] register[5:0];

  assign rd = register[a[5:0]]; // word aligned

  always @(posedge clk)
  if(reset)
  begin 
  register[0]<=6'b000001; 
  register[1]<=6'b000010; 
  register[2]<=6'b000100; 
  register[3]<=6'b001000; 
  register[4]<=6'b010000; 
  register[5]<=6'b100000; 
  end
    
endmodule*/