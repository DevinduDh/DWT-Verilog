`timescale 1ns / 1ps

module regAdderU1_tb;

  reg [8:0] A;
  reg [8:0] B;
  reg negA;
  reg negB;
  wire [9:0] result;
  wire negResult;

  // Instantiate the regAdderU1 module
  regAdderU1 uut(
    .A(A),
    .B(B),
    .negA(negA),
    .negB(negB),
    .result(result),
    .negResult(negResult)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    // Test case 1: Both numbers are negative
    A = 9'b110010010;
    B = 9'b101110001;
    negA = 1;
    negB = 1;
    #10;

    // Test case 2: Only A is negative
    A = 9'b110010010;
    B = 9'b001110001;
    negA = 1;
    negB = 0;
    #10;

    // Test case 3: Only B is negative
    A = 9'b010010010;
    B = 9'b101110001;
    negA = 0;
    negB = 1;
    #10;

    // Test case 4: Both numbers are non-negative
    A = 9'b010010010;
    B = 9'b001110001;
    negA = 0;
    negB = 0;
    #10;

    // Add more test cases as needed

    $stop; // Stop simulation
  end

endmodule
