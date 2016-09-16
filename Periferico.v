module Perif(send, data, clk, rst, ack);
	 input send;
	 input clk;
	 input rst;
  	 input data;
	 
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
          	2'b00:
            	ack = 0;
			2'b01:
              begin
				ack = 0;
                $display(data);
              end
          	2'b10:
              begin
                ack = 1;
                $display(data);
              end
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
              	if (send == 0)
					NS = 2'b00;	
				else
					NS = 2'b10;
			default:
				NS = 2'b00;
		endcase
	 end
endmodule