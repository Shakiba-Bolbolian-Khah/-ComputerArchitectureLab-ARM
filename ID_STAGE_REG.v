`timescale 1ns/1ns

module ID_STAGE_REG (
  input clk, rst, flush,
  input WB_EN_IN, MEM_R_EN_IN, MEM_W_EN_IN,
	input B_IN, S_IN,
	input [3:0] EXE_CMD_IN,
	input [31:0] PC_IN,
	input [31:0] Val_Rn_IN, Val_Rm_IN,
	input imm_IN,
	input [11:0] Shift_operand_IN,
	input [23:0] Signed_imm_24_IN,
	input [3:0] Dest_IN, SR_IN,
	input [3:0] src1_IN, src2_IN,
	
	output reg WB_EN, MEM_R_EN, MEM_W_EN, B, S,
	output reg [3:0] EXE_CMD,
	output reg [31:0] PC,
	output reg [31:0] Val_Rn, Val_Rm,
	output reg imm,
	output reg [11:0] Shift_operand,
	output reg [23:0] Signed_imm_24,
	output reg [3:0] Dest, SR,
	output reg [3:0] src1, src2
  );

	always @(posedge clk, posedge rst) begin
    if (rst) begin
			{WB_EN, MEM_R_EN, MEM_W_EN, B, S, imm} <= 6'b0;
			EXE_CMD <= 4'b0;
      PC <= 32'b0;
      Val_Rn <= 32'b0;
			Val_Rm <= 32'b0;
			Shift_operand <= 12'b0;
			Signed_imm_24 <= 24'b0;
			Dest <= 4'b0;
			SR <= 4'b0;
			src1 <= 4'b0;
			src2 <= 4'b0;
    end
    else begin
      if (flush) begin
        {WB_EN, MEM_R_EN, MEM_W_EN, B, S, imm} <= 6'b0;
				EXE_CMD <= 4'b0;
    	  PC <= 32'b0;
  	    Val_Rn <= 32'b0;
				Val_Rm <= 32'b0;
				Shift_operand <= 12'b0;
				Signed_imm_24 <= 24'b0;
				Dest <= 4'b0;
				SR <= 4'b0;
				src1 <= 4'b0;
				src2 <= 4'b0;
      end
      else begin
        WB_EN <= WB_EN_IN;
				MEM_R_EN <= MEM_R_EN_IN;
				MEM_W_EN <= MEM_W_EN_IN;
				B <= B_IN;
				S <= S_IN;
			 	imm <= imm_IN;
				EXE_CMD <= EXE_CMD_IN;
    	  PC <= PC_IN;
  	    Val_Rn <= Val_Rn_IN;
				Val_Rm <= Val_Rm_IN;
				Shift_operand <= Shift_operand_IN;
				Signed_imm_24 <= Signed_imm_24_IN;
				Dest <= Dest_IN;
				SR <= SR_IN;
				src1 <= src1_IN;
				src2 <= src2_IN;
      end
    end
  end
endmodule