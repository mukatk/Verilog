module CPU_async(ack,send, control, data,clk,rst);
  output reg send;
  output reg data;

  input control;
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
          if(ack == 0 && control == 1)
            	NS = 2'b01;
        	else
          	    NS = 2'b00;
        2'b01://estado 01
          if (ack == 0)
          	NS = 2'b01;
          else
          	NS = 2'b10;
        2'b10://estado 10
          if(ack == 1)
            NS = 2'b10;
          else
            NS = 2'b00;
        default:// estado 11
            NS = 2'b00;
      endcase
    end
  
  always @ (*)
    begin
      case ({S})
        2'b00://estado 00
          begin
          	send = 0;
            data = 0;
          end
        2'b01://estado 01
          begin
          	send = 1;
            data = 1;
          end
        2'b10://estado 10
          begin
          	send = 0;
            data = 0;
          end
        default:// estado 11
          begin
          	send = 0;
            data = 0;
          end
      endcase
    end
endmodule