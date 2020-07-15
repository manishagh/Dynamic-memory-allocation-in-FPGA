module clock_divide(clk_in, clk);
input clk_in;
output reg clk;
 reg[27:0] counter = 28'd0;
 parameter divisor =28'd50000000;
 
always @ (posedge clk_in)
begin
  counter <= counter + 28'd1;
  if(counter>=(divisor-1))
    counter<= 28'd0;
  clk<=(counter<divisor/2)?1'b0:1'b1;
end



endmodule
