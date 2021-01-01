`timescale 1ns/1ns

module ADDER32bit(
  input [31:0] In1,In2,
  output [31:0] Sum);
  assign Sum = In1 + In2;
endmodule