`timescale 1ns / 1ps

module regAdderU2_tb;

  reg [8:0] A;
  reg [7:0] B;
  reg negA;
  wire [10:0] result;
  wire negRes;

  // Instantiate the regAdderU2 module
  regAdderU2 uut(
    .A(A),
    .B(B),
    .negA(negA),
    .result(result),
    .negRes(negRes)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    // Test case 1: A is greater than B, and negA is true
    A = 9'b110010010;
    B = 8'b10111000;
    negA = 1;
    #10;

    // Test case 2: B is greater than A, and negA is true
    A = 9'b010010010;
    B = 8'b10111000;
    negA = 1;
    #10;

    // Test case 3: A is greater than B, and negA is false
    A = 9'b110010010;
    B = 8'b00111000;
    negA = 0;
    #10;

    // Test case 4: B is greater than A, and negA is false
    A = 9'b010010010;
    B = 8'b10111000;
    negA = 0;
    #10;

    // Add more test cases as needed

    $stop; // Stop simulation
  end

endmodule
