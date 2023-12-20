`timescale 1ns / 1ps
module D_ff9(
 input wire [8:0] d,
 input clk,rstn,
output reg [8:0] q
    );
    
   always @(posedge clk or posedge rstn) begin
    if (rstn) begin
     q <= 9'b0;
   end else begin
     q <= d;
   end
 end
    
endmodule
