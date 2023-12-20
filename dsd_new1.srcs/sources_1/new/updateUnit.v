`timescale 1ns / 1ps
module updateUnit(
input wire [8:0] A,B,  // 9-bit input
input wire [7:0] C,
input wire negA,
input wire negB,
output wire negResult,
output wire [10:0] updatedOutput 
    );
    
  wire [9:0] Adder1Output;
  wire [10:0] Adder2Output;
  wire reg_negResult1;
  wire reg_negResult2;
  
    // Instantiate regAdder module
  regAdderU1 adderU_inst (
    .A(A),
    .B(B),
    .negA(negA),
    .negB(negB),
    .result(Adder1Output),
    .negResult(reg_negResult1)
  );

  // Instantiate regSub module
  regAdderU2 adder2_inst (
    .A(Adder1Output),
    .B(C),
    .negA(reg_negResult1),
    .result(Adder2Output),
    .negRes(reg_negResult2)
  );

  // Output assignment
  assign updatedOutput = Adder2Output;
  assign negResult = reg_negResult2;
endmodule
