`timescale 1ns / 1ps

module regAdderP_tb;

  // Inputs
  reg [7:0] A, B;
  
  // Outputs
  wire [8:0] Sum;

  // Instantiate the adder4bit module
  regAdderP uut (
    .A(A),
    .B(B),
    .Sum(Sum)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    A = 4'b0001;
    B = 4'b0010;

    // Apply stimulus
    repeat (10) begin
      #10 A = A + 1;
      #10 B = B + 1;
    end

    // Display results
    $display("Time\tA\tB\tSum");
    $monitor("%0t\t%b\t%b\t%b", $time, A, B, Sum);

    // Finish simulation
    #10 $finish;
  end

endmodule
