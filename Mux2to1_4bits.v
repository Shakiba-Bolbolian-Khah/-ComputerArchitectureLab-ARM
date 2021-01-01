`timescale 1ns/1ns

module Mux2to1_4bits(
  input Select, 
  input [3:0] In1, In2,
  output [3:0] MuxOut);
  assign MuxOut = Select ? In2 : In1; //input 0 goes first
endmodule
