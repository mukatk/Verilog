module testbench;
  
  reg clk;
  reg clkCPU;
  reg rst;
  reg control;
  
  wire data;
  wire ack;
  wire send;
  
  
  CPU_async hugh (
    .ack(ack),
    .send(send),
    .control(control),
    .data(data),
    .clk(clkCPU),
    .rst(rst)
  );
  
  Perif uut (
    .send(send),
    .data(data),
    .clk(clk),
    .rst(rst),
    .ack(ack)
  );
  
  initial begin
    $dumpfile("foo.vcd");
    $dumpvars(1, testbench);
      
    clk = 0;
    clkCPU = 0;
    rst = 0;
    control = 1;
    
    #400
        
    $finish;
  end
  always  #10  clk =  ! clk;
  always  #5  clkCPU =  ! clkCPU;
endmodule