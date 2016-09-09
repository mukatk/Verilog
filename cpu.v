// Code your design here
module CPU_async(ack,send,clk,rst);
  output reg send;

  input ack;
  input clk;
  input rst;

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
      case ({S})
        2'b00://estado 00
          NS = 2'b01;
        2'b01://estado 01
          	if(ack == 0)
            	NS = 2'b01;
        	else
          	    NS = 2'b10;
        2'b10://estado 10
          if(ack == 0)
            NS = 2'b00;
          else
            NS = 2'b10;
        default:// estado 11
            NS = 2'b00;
      endcase
    end
  
  always @ (*)
    begin
      case ({S})
        2'b00://estado 00
          send = 1;
        2'b01://estado 01
          send = 1;
        2'b10://estado 10
          send = 0;
        default:// estado 11
          send = 0;
      endcase
    end
endmodule
