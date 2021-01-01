`timescale 1ns/1ns

module WB_STAGE (
  input [31:0] ALU_result, MEM_result,
	input MEM_R_en,
  output [31:0] out
  );

	Mux2to1 WB_Mux(MEM_R_en, ALU_result, MEM_result, out);

endmodule