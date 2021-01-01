`timescale 1ns/1ns

module BRANCH_ADDR_CALC(
  input [31:0] PC,
	input [23:0] Signed_EX_imm24,
  output [31:0] newPC);

  assign newPC = PC + ( {{8{Signed_EX_imm24[23]}}, Signed_EX_imm24} << 2 );
endmodule