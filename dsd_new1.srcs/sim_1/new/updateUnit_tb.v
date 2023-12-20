`timescale 1ns / 1ps

module updateUnit_tb;

  // Inputs
  reg [8:0] A, B;
  reg [7:0] C;
  reg negA, negB;

  // Outputs
  wire negResult;
  wire [10:0] updatedOutput;

  // Instantiate the updateUnit module
  updateUnit uut (
    .A(A),
    .B(B),
    .C(C),
    .negA(negA),
    .negB(negB),
    .negResult(negResult),
    .updatedOutput(updatedOutput)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    A = 9'b101010101;
    B = 9'b010101010;
    C = 8'b11001100;
    negA = 0;
    negB = 1;

    // Display initial state

    // Apply stimulus
    #10 A = 9'b111100000;
    #10 B = 9'b000011111;
    #10 C = 8'b00110011;
    #10 negA = 1;
    #10 negB = 0;

    // Extend simulation time
    #100 $finish;
  end

endmodule
