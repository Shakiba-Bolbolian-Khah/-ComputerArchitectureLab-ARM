`timescale 1ns/1ns

module ID_STAGE (
  input clk, rst,
	//from IF Reg
  input [31:0] Instruction,
	//from WB stage
  input [31:0] WB_Value,
	input WB_WB_EN,
	input [3:0] WB_Dest,
	//from hazard detect module
	input hazard,
	//from status Register
	input [3:0] SR,
	//to next stage
	output WB_EN, MEM_R_EN, MEM_W_EN, B, S,
	output [3:0] EXE_CMD,
	output [31:0] Val_Rn, Val_Rm,
	output imm,
	output [11:0] Shift_operand,
	output [23:0] Signed_imm_24,
	output [3:0] Dest,
	//to hazard detect module
	output [3:0] src1, src2,
	output Two_src
  );
  
  //Instruction: [31:28] Cond. [27:26] Mode [25] I [24:21] OP-Code
  //[20] S [19:16] Rn [15:12] Rd [11:0] shifter operand(offset_12) (( Instruction[3:0] == Rm ))
	
	//Signed_imm_24: Instruction[23:0]

	//control_cond_MuxOut: out[8:5] Execution Command | out[4] mem_read | out[3] mem_write 
 	//out[2] WB_Enable | out[1] B | out[0] status register
  
	wire cond_out;
	wire [8:0] control_out, control_cond_MuxOut;
	wire [3:0] reg_file_src2;

	CONDITION_CHECK condition_check(Instruction[31:28], SR, cond_out);

	CONTROL_UNIT control_unit(Instruction[27:26], Instruction[20], Instruction[24:21], control_out); 

	Mux2to1_9bits control_cond_mux((~cond_out) || hazard, control_out, 9'b0, control_cond_MuxOut);

	Mux2to1_4bits id_mux(control_cond_MuxOut[3], Instruction[3:0], Instruction[15:12], reg_file_src2);

	REGISTER_FILE reg_file(clk, rst, Instruction[19:16], reg_file_src2, WB_Dest, WB_Value, WB_WB_EN, Val_Rn, Val_Rm);
	
	assign EXE_CMD = control_cond_MuxOut[8:5];
	assign MEM_R_EN = control_cond_MuxOut[4];
	assign MEM_W_EN = control_cond_MuxOut[3];
	assign WB_EN = control_cond_MuxOut[2];
	assign B = control_cond_MuxOut[1];
	assign S = control_cond_MuxOut[0];
	assign Shift_operand = Instruction[11:0];
	assign Signed_imm_24 = Instruction[23:0];
	assign Dest = Instruction[15:12];
	assign src1 = Instruction[19:16];
	assign src2 = reg_file_src2;
	assign imm = Instruction[25];
	assign Two_src = (~Instruction[25]) || control_cond_MuxOut[3];

endmodule