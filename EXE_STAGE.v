`timescale 1ns/1ns

module EXE_STAGE (
  input clk,
	input [3:0] EXE_CMD,
	input MEM_R_EN, MEM_W_EN,
  input [31:0] PC,
	input [31:0] Val_Rn, Val_Rm,
	input imm,
	input [11:0] Shift_operand,
	input [23:0] Signed_imm_24,
	input [3:0] SR,
	input [31:0] MEM_ALU_Res, WB_Value,
	input [1:0] Sel_src1, Sel_src2,
	
	output [31:0] ALU_result, Br_addr, ST_Val,
	output [3:0] status
  );
	
	wire [31:0] ALU_Val2, MUX_1_out, MUX_2_out;	
	
	assign ST_Val = MUX_2_out;

	MUX3to1_32bits MUX_SRC_1(Sel_src1, Val_Rn, MEM_ALU_Res, WB_Value, MUX_1_out);

	MUX3to1_32bits MUX_SRC_2(Sel_src2, Val_Rm, MEM_ALU_Res, WB_Value, MUX_2_out);

	VAL2_GEN val2gen(MEM_R_EN || MEM_W_EN, MUX_2_out, imm, Shift_operand, ALU_Val2);

	ALU_UNIT alu(MUX_1_out, ALU_Val2, EXE_CMD, SR,	ALU_result,	status);

	BRANCH_ADDR_CALC branch_calc(PC, Signed_imm_24, Br_addr);

endmodule