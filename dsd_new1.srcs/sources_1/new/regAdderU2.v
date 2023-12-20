`timescale 1ns / 1ps
module regAdderU2(
input wire [8:0] A,
input wire [7:0] B,
input wire negA,
    output wire [10:0] result,
output wire negRes
    );
reg [8:0] reg_A; 
    reg [7:0] reg_B;reg [10:0]reg_result;
    reg reg_negRes;
    
    // Always block for clocked logic
    always @(*) 
            if (negA) begin
                if (A > B) begin
                    reg_result <= A - B;
                    reg_negRes <= 1'b1;
                end else begin
                    reg_result <= B - A;
                    reg_negRes <= 1'b0;
                end
            end else begin
                reg_result <= A + B;
                reg_negRes <= 1'b0;
            end

    
    // Output assignments
    assign result = reg_result;
    assign negRes = reg_negRes;
    
endmodule
