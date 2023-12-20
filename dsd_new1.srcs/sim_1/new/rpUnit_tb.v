`timescale 1ns / 1ps

module rpUnit_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [7:0] X1, X2, X3, X4;

  // Outputs
  wire [9:0] Y1, Y3;
  wire [8:0] Y2, Y4;
  wire FL1, FL2, R1, R2;

  // Instantiate the rpUnit module
  rpUnit uut (
    .clk(clk),
    .reset(reset),
    .X1(X1),
    .X2(X2),
    .X3(X3),
    .X4(X4),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .FL1(FL1),
    .FL2(FL2),
    .R1(R1),
    .R2(R2)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;
    X1 = 8'b11001100;
    X2 = 8'b10101010;
    X3 = 8'b01010101;
    X4 = 8'b11110000;

    // De-assert reset
    #5 reset = 0;

    // Display initial state
    $display("Time\tX1\tX2\tX3\tX4\tY1\tY2\tY3\tY4\tFL1\tFL2\tR1\tR2");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",
             $time, X1, X2, X3, X4, Y1, Y2, Y3, Y4, FL1, FL2, R1, R2);

    // Apply stimulus
    #20 X1 = 8'b00110011;
    #20 X2 = 8'b01010101;
    #20 X3 = 8'b11001100;
    #20 X4 = 8'b00001111;

    // Extend simulation time
    #100 $finish;
  end

endmodule
