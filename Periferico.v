module Perif(send, ack, clk, rst);
	 input send;
	 input clk;
	 input rst;
	 
	 output reg ack;
	 
	 reg [1:0] S;
	 reg [1:0] NS;
	 
	 always @ (posedge clk)
	 begin
		if (rst == 1)
			S <= 2'b00;
		else
			S <= NS;
	 end
	 
	 always @ (*)
	 begin
		case (S)
			2'b10:
				ack = 1;
			default:
				ack = 0;
		endcase
	 end
	 
	 always @ (*)
	 begin
		case (S)
			2'b00:
				if (send == 1)
					NS = 2'b01;
				else
					NS = 2'b00;
			2'b01:
				NS = 2'b10;
			2'b10:
				if (send == 1)
					NS = 2'b10;
				else
					NS = 2'b00;
			default:
				NS = 2'b00;
		endcase
	 end
endmodule