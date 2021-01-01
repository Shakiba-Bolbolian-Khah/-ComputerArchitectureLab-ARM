`timescale 1ns/1ns

module ARM(input clk, rst, mode);
	wire Hazard, Flush, WB_WB_EN, ID_WB_EN, ID_MEM_R_EN, ID_MEM_W_EN, ID_B, ID_S, ID_imm, Two_src;
	wire EXE_WB_EN, EXE_MEM_R_EN, EXE_MEM_W_EN, EXE_S, EXE_imm;
	wire Memo_WB_EN, Memo_MEM_R_EN, Memo_MEM_W_EN, WBack_MEM_R_EN;
	wire [31:0] BranchAddr, IF_PC, IF_Instruction, ID_PC, ID_Instruction, WB_Value, ID_Val_Rn, ID_Val_Rm;
	wire [31:0] EXE_PC, EXE_Val_Rn, EXE_Val_Rm, EXE_ALU_result, Memo_ALU_result, Memo_Val_Rm, Memo_memoryData, EXE_ST_Val;
	wire [31:0] WBack_ALU_result, WBack_memData;
	wire [3:0] Memo_Dest, WB_Dest, SR_out, ID_EXE_CMD, ID_Dest, haz_src1, haz_src2, EXE_src1, EXE_src2;
	wire [3:0] EXE_EXE_CMD, EXE_Dest, EXE_SR_toALU, ALU_toSR;
	wire [11:0] ID_Shift_operand, EXE_Shift_operand;
	wire [23:0] ID_Signed_imm_24, EXE_Signed_imm_24;
	wire [1:0] Sel_src1, Sel_src2;
  
	IF_STAGE if_stage(clk, rst, Hazard, Flush, BranchAddr, IF_PC, IF_Instruction);

	IF_STAGE_REG if_stage_reg(clk, rst, Hazard, Flush, IF_PC, IF_Instruction, ID_PC, ID_Instruction);

	ID_STAGE id_stage(
  clk, rst,
	//from IF Reg
  ID_Instruction,
	//from WB stage
  WB_Value,
	WB_WB_EN,
	WB_Dest,
	//from hazard detect module
	Hazard,
	//from status Register
	SR_out,
	//to next stage
	ID_WB_EN, ID_MEM_R_EN, ID_MEM_W_EN, ID_B, ID_S,
	ID_EXE_CMD,
	ID_Val_Rn, ID_Val_Rm,
	ID_imm,
	ID_Shift_operand,
	ID_Signed_imm_24,
	ID_Dest,
	//to hazard detect module
	haz_src1, haz_src2,
	Two_src
  );

	ID_STAGE_REG id_stage_reg(
  clk, rst, Flush,
	ID_WB_EN, ID_MEM_R_EN, ID_MEM_W_EN, ID_B, ID_S,
  ID_EXE_CMD,
	ID_PC,
	ID_Val_Rn, ID_Val_Rm,
	ID_imm,
	ID_Shift_operand,
	ID_Signed_imm_24,
	ID_Dest, SR_out,
	haz_src1, haz_src2,
	
	EXE_WB_EN, EXE_MEM_R_EN, EXE_MEM_W_EN, Flush, EXE_S,
	EXE_EXE_CMD,
	EXE_PC,
	EXE_Val_Rn, EXE_Val_Rm,
	EXE_imm,
	EXE_Shift_operand,
	EXE_Signed_imm_24,
	EXE_Dest, EXE_SR_toALU,
	EXE_src1, EXE_src2
  );

	HAZARD_UNIT hazard_unit(
	mode, EXE_MEM_R_EN,
  haz_src1, haz_src2, EXE_Dest, Memo_Dest,
  EXE_WB_EN, Memo_WB_EN, Two_src,
  Hazard
  );

	EXE_STAGE exe_stage(
  clk,
	EXE_EXE_CMD,
	EXE_MEM_R_EN, EXE_MEM_W_EN,
  EXE_PC,
	EXE_Val_Rn, EXE_Val_Rm,
	EXE_imm,
	EXE_Shift_operand,
	EXE_Signed_imm_24,
	EXE_SR_toALU,
	Memo_ALU_result, WB_Value,
	Sel_src1, Sel_src2,
	
	EXE_ALU_result, BranchAddr, EXE_ST_Val,
	ALU_toSR
  );

	STATUS_REG sr(clk, rst, EXE_S,	ALU_toSR, SR_out);

	EXE_STAGE_REG exe_stage_reg(
  clk, rst, EXE_WB_EN, EXE_MEM_R_EN, EXE_MEM_W_EN,
  EXE_ALU_result, EXE_ST_Val,
	EXE_Dest,
  
	Memo_WB_EN, Memo_MEM_R_EN, Memo_MEM_W_EN,
	Memo_ALU_result, Memo_Val_Rm,
	Memo_Dest
  );

	FORWARDING_UNIT forward_unit(
	mode,
  EXE_src1, EXE_src2, Memo_Dest, WB_Dest,
  Memo_WB_EN, WB_WB_EN,
  
	Sel_src1, Sel_src2
  );

	DATA_MEMORY memory(clk, Memo_MEM_R_EN, Memo_MEM_W_EN, Memo_ALU_result, Memo_Val_Rm, Memo_memoryData);

	MEM_STAGE_REG mem_stage_reg(
  clk, rst, Memo_WB_EN, Memo_MEM_R_EN,
	Memo_ALU_result, Memo_memoryData,
  Memo_Dest,

	WB_WB_EN, WBack_MEM_R_EN,
	WBack_ALU_result, WBack_memData,
	WB_Dest
  );

	WB_STAGE wb_stage(
  WBack_ALU_result, WBack_memData,
	WBack_MEM_R_EN,
  
	WB_Value
  );	
endmodule