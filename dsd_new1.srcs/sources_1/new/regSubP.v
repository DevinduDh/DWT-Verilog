`timescale 1ns / 1ps
module regSubP(
input wire [8:0] A,   // n-bit inputs
input wire [7:0]B,
output reg [8:0] Difference,  // (n+1)-bit output for difference
output reg flag
    );
    
always @(*) begin
    if (A>=B) begin
        Difference <= A - B;
        flag <= 1'b0;
    end
        else
    begin
        Difference <= B- A;
        flag <= 1'b1;
     end
end
endmodule
