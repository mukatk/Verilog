module testbench;
  reg send;
  reg clk;
  reg rst;
  
  wire ack;
  
  Perif uut (
    .send(send),
    .clk(clk),
    .rst(rst),
    .ack(ack)
  );
  
  initial begin
    $dumpfile("foo.vcd");
    $dumpvars(1, testbench);
    
    send = 0;
    clk = 0;
    rst = 1;
    
    #10
    
    send = 1;
    #5
    send = 1;
    #5
    send = 0;
    $finish;
  end
  always #5 clk = !clk;
endmodule