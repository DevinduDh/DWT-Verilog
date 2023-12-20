`timescale 1ns / 1ps

module regSubP_tb;

  // Inputs
  reg [8:0] A;
  reg [7:0] B;

  // Outputs
  wire [8:0] Difference;
  wire flag;

  // Instantiate the regSubP module
  regSubP uut (
    .A(A),
    .B(B),
    .Difference(Difference),
    .flag(flag)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Initialize inputs
    A = 9'b101010101;
    B = 8'b11011011;

    // Apply stimulus
    #10 A = 9'b110011001;
    #10 B = 8'b01011010;
    #10 A = 9'b111111111;
    #10 B = 8'b00000001;

    // Display results
    $display("Time\tA\tB\tDifference\tFlag");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, A, B, Difference, flag);

    // Finish simulation
    #10 $finish;
  end

endmodule
