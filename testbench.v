module testbench();

  reg         clk;
  reg         reset;
reg malloc,free;
wire mack,frack;
reg [5:0] requestedmemsize;
reg [2:0] regmips;
  
						
  // instantiate device to be tested
  dmm_top dut(clk, reset, malloc, 
			   free,
			   mack,
			   frack,
			  requestedmemsize, regmips);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check results
  initial
   begin
   #25;
   malloc=1;
   #10;
   malloc=0;
   requestedmemsize=5;
   regmips=2;
   end
endmodule
