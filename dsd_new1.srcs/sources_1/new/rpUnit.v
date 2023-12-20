`timescale 1ns / 1ps
module rpUnit(
input clk,
input reset,
input [7:0]X1,X2,X3,X4, //x1 - even position,x2 - odd, x3 - even, x4 - odd
output [9:0]Y1,Y3, //y1-even, y2 - odd, y3 - even, y4 - odd
output [8:0]Y2,Y4,
output FL1,FL2,R1,R2
    );
    
    wire [7:0] W1,W5,W6,W8;
    wire [8:0] W2,W3,W9;
    wire [10:0] W4,W7;
    wire WF1,WF2,WR1,WR2;
    
    D_ff8 F1(
    .d(X1),
    .clk(clk),
    .rstn(reset),
    .q(W1)
    );  
     
    predictUnit p1(
    .A(X1),
    .B(X3),
    .C(X2),
    .PredictedOutput(W2),
    .flag(WF1)
    );
    
    D_ff9 F2(
     .d(W2),
    .clk(clk),
    .rstn(reset),
    .q(W3)
    );
    
    D_ff8 F4(
    .d(X3),
    .clk(clk),
    .rstn(reset),
    .q(W5)
    );
    
    D_ff8 F5(
    .d(X4),
   .clk(clk),
   .rstn(reset),
   .q(W8)
   );   
   
   predictUnit p2(
   .A(X1),
   .B(W5),
   .C(W8),
   .PredictedOutput(W9),
   .flag(WF2)
   );
   
   D_ff8 F3(
   .d(W5),
   .clk(clk),
   .rstn(reset),
   .q(W6)
   );  

   updateUnit U1(
   .A(W9),
   .B(W3),
   .C(W6),
   .negA(WF2),
   .negB(WF1),
   .negResult(WR2),
   .updatedOutput(W7)
   );
   
   updateUnit U2(
   .A(W9),
   .B(W2),
   .C(W1),
   .negA(WF2),
   .negB(WF1),
   .negResult(WR1),
   .updatedOutput(W4)
   );
   
  assign Y1 = W4;
  assign Y2 = W2;
  assign Y3 = W7;
  assign Y4 = W9;

   assign R1 = WR1; //Y3 flag
   assign R2 = WR2; // Y1 flag
   assign FL1 = WF1; //Y2 flag
   assign FL2 = WF2; //Y4 flag
endmodule
