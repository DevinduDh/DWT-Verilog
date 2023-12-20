`timescale 1ns / 1ps

module D_ff9_tb;

  reg [8:0] d;
  reg clk;
  reg rstn;
  wire [8:0] q;

  // Instantiate the D_ff9 module
  D_ff9 uut(
    .d(d),
    .clk(clk),
    .rstn(rstn),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Test case 1: Reset is asserted
    d = 9'b101010101;
    rstn = 0;
    #10;
    rstn = 1;
    #10;

    // Test case 2: Clock toggles with data input
    d = 9'b110011001;
    #5;
    d = 9'b001100110;
    #10;

    // Add more test cases as needed

    $stop; // Stop simulation
  end

endmodule
