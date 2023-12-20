`timescale 1ns / 1ps
module regAdderP(
input wire [7:0] A, B,
output wire [8:0] Sum 
    );
    
    reg [8:0] sum_reg;
    reg [7:0] shifted_sum_reg;
always @(*) 
             begin
            // Add A and B, and store the result in sum_reg
            sum_reg <= A + B;
            shifted_sum_reg <= sum_reg >> 1;
    end
    
    // Output assignment
    assign Sum = shifted_sum_reg;

endmodule