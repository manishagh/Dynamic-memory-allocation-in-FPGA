module displayCounter(SSD, SSD1,Q,clk);
input wire clk;
input wire [3:0] Q;
output reg [6:0] SSD, SSD1;



always @ (posedge clk)

case(Q)
     4'b0000:begin SSD =7'b 0000001; SSD1 =7'b1111111; end
	  4'b0001:begin SSD =7'b 1001111; SSD1 =7'b1111111; end
	  4'b0010:begin SSD =7'b 0010010; SSD1 =7'b1111111; end
	  4'b0011:begin SSD =7'b 0000110; SSD1 =7'b1111111; end
	  4'b0100:begin SSD =7'b 1001100; SSD1 =7'b1111111; end
	  4'b0101:begin SSD =7'b 0100100; SSD1 =7'b1111111; end
	  4'b0110:begin SSD =7'b 0100000; SSD1 =7'b1111111; end
	  4'b0111:begin SSD =7'b 0001111; SSD1 =7'b1111111; end
	  4'b1000:begin SSD =7'b 0000000; SSD1 =7'b1111111; end
	  4'b1001:begin SSD =7'b 0000100; SSD1 =7'b1111111; end
	  4'b1010:begin SSD =7'b 0000001; SSD1 =7'b1001111; end
	  4'b1011:begin SSD =7'b 1001111; SSD1 =7'b1001111; end
	  4'b1100:begin SSD =7'b 0010010; SSD1 =7'b1001111; end
	  4'b1101:begin SSD =7'b 0000110; SSD1 =7'b1001111; end
	  4'b1110:begin SSD =7'b 1001100; SSD1 =7'b1001111; end
	  4'b1111:begin SSD =7'b 0100100; SSD1 =7'b1001111; end
	  
endcase
endmodule

