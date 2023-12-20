`timescale 1ns / 1ps
module D_ff8(
 input wire [7:0] d,
 input clk,rstn,
output reg [7:0] q
    );
    
   always @(posedge clk or posedge rstn) begin
    if (rstn) begin
     q <= 8'b0;
   end else begin
     q <= d;
   end
 end
    
endmodule
