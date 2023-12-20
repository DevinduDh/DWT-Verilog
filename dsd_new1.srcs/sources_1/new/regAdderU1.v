`timescale 1ns / 1ps
module regAdderU1(
    input [8:0] A,
    input [8:0] B,
    input negA,
    input negB,
    output reg [9:0] result,
    output reg negResult
    );
    
    always @(*)
      begin
        if (negA && negB) // Both numbers are negative
        begin
          result <= (A + B) >> 2; 
          negResult <= 1;
        end
        else if (negA) // Only A is negative
        begin
          if (A >= B)
          begin
            result <= (A - B) >> 2; // Right shift after subtraction
            negResult <= 1;
          end
          else
          begin
            result <= (B - A) >> 2; // Right shift after subtraction
            negResult <= 0;
          end
        end
        else if (negB) // Only B is negative
        begin
          if (A >= B)
          begin
            result <= (A - B) >> 2; // Right shift after subtraction
            negResult <= 0;
          end
          else
          begin
            result <= (B - A) >> 2; // Right shift after subtraction
            negResult <= 1;
          end
        end
        else // Both numbers are non-negative
        begin
          result <= (A + B) >> 2; // Right shift after addition
          negResult <= 0;
        end
      end
    
endmodule
