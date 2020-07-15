module heapmemory(input         clk, we,
            input  [7:0] a, 
			input [31:0] wd,
            output [31:0] rd);
reg  [31:0] RAM[255:0];

  assign rd = RAM[a[31:0]]; // word aligned

  always @(posedge clk)
    if (we)
      RAM[a[31:0]] <= wd;		
			
endmodule
