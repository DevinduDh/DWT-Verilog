`timescale 1ns / 1ps

module predictUnit_tb;

  // Inputs
  reg [7:0] A, B, C;

  // Outputs
  wire [8:0] PredictedOutput;
  wire flag;

  // Instantiate the predictUnit module
  predictUnit uut (
    .A(A),
    .B(B),
    .C(C),
    .PredictedOutput(PredictedOutput),
    .flag(flag)
  );

  // Clock generation
  reg clk = 1;
  always #10 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    A = 8'b10101010;
    B = 8'b01010101;
    C = 8'b11001100;


    // Apply stimulus
    #10 A = 8'b11110000;
    #15 B = 8'b00001111;
    #20 C = 8'b00000001;

    // Extend simulation time
    #100 $finish;
  end

endmodule
