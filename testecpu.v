// Code your testbench here
// or browse Examples
module testaCPU;

	// Inputs
	reg sack;
	reg clk;
	reg rst;

	// Outputs
  wire send;

  // Instantiate the Unit Under Test (UUT)
	CPU_async uut (
      .ack(sack), 
      	.send(send), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
      $dumpfile("foo.vcd");
      $dumpvars(1, testaCPU);
      
      // Initialize Inputs
		sack = 0;
		clk = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
      
      $display("asdas");
        
		// Add stimulus here
		sack = 0;
		#50;
		sack = 0;
		#50;
		sack = 1;
		#50;
		sack = 0;
	$finish;
	end
   always  #5  clk =  ! clk;
endmodule


