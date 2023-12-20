`timescale 1ns / 1ps

module D_ff8_tb;

  reg [7:0] d;
  reg clk;
  reg rstn;
  wire [7:0] q;

  // Instantiate the D_ff8 module
  D_ff8 uut(
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
    d = 8'b10101010;
    rstn = 0;
    #10;
    rstn = 1;
    #10;

    // Test case 2: Clock toggles with data input
    d = 8'b11001100;
    #5;
    d = 8'b00110011;
    #10;

    // Add more test cases as needed

    $stop; // Stop simulation
  end

endmodule
