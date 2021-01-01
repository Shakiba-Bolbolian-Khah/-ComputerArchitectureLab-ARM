`timescale 1ns/1ns

module Mux2to1_9bits(
  input Select, 
  input [8:0] In1, In2,
  output [8:0] MuxOut);
  assign MuxOut = Select ? In2 : In1; //input 0 goes first
endmodule
