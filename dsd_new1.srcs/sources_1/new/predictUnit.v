`timescale 1ns / 1ps

module predictUnit(
  input wire [7:0] A, B, C,  // 8-bit inputs
  output wire [8:0] PredictedOutput,  // 9-bit output
  output wire flag
);

  wire [8:0] AdderOutput;
  wire [8:0] SubtractorOutput;
  // instantiate regAdderP
  regAdderP uut_adder (
    .A(A),
    .B(B),
    .Sum(AdderOutput)
  );

  // instantiate regSubP
  regSubP uut_sub (
    .A(AdderOutput),
    .B(C),
    .Difference(SubtractorOutput),
    .flag(flag)
  );

  assign PredictedOutput = SubtractorOutput;

endmodule
