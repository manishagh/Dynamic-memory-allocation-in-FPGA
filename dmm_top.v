module dmm_top(input clk,
              input reset,
               input malloc, 
			   input free,
			   output reg mack,
			   output reg frack,
			   input [5:0] requestedmemsize, input [2:0] regmips);
   reg  [1:0] state, nextstate;
   wire upready;
   reg enable;
   wire [5:0] rd0,rd1,rd2,rd3,rd4,rd5,wd,updatedalloc,remainingsize;
   reg we,wer,wes;
   wire [7:0] wds,rds, wdr,rdr;
   wire [5:0] onehot;
   wire [2:0] pr_addr;
   parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b10;
   parameter S3=2'b11;
   
   
// state register
   always @ (posedge clk, posedge reset)
      if (reset) state <= S0;
      else       state <= nextstate;
 // next state logic
   always @ (*)
      case (state)
         S0: begin    if(malloc|free) begin nextstate <= S1; enable=1'b1; end else nextstate<=S0;  end
         S1: begin      if(upready) begin nextstate <= S2; we<=1'b1; wer=1'b1; end else  nextstate<=S1;end
         S2: begin     enable =1'b0; nextstate <= S3; we<=1'b0; mack =1'b1;wer=1'b0; wes=1'b1; end
		 S3: begin nextstate <= S0; mack=1'b0; wes=1'b0; end
         default: nextstate = S0;
      endcase
   
assign wdr=rds;//update the starting address
assign wds=rds+requestedmemsize;

allocationstatusregister al1(clk, we,reset,
            pr_addr, 
			updatedalloc,
            rd0,rd1,rd2,rd3,rd4,rd5);
startingaddress s1(clk, wes,reset,
            pr_addr, 
			rds,
			wds
            );
reg2address ra1(clk, regmips, reset, 
                   wer,wdr, rdr);
				   
mux_sub ms1(requestedmemsize, remainingsize, pr_addr);
comparator cmp1(remainingsize, updatedalloc,rd0,rd1,rd2,rd3,rd4,rd5,upready);
priorityencoder pe1(pr_addr , onehot , rd0,rd1,rd2,rd3,rd4,rd5);
addressgenerator ad1(requestedmemsize, onehot,enable,clk,reset);
endmodule
