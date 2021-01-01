`timescale 1ns/1ns

module EXE_STAGE_REG (
  input clk, rst, WB_en_in, MEM_R_EN_in, MEM_W_EN_in,
  input [31:0] ALU_result_in, ST_val_in,
	input [3:0] Dest_in,
  
	output reg WB_en, MEM_R_EN, MEM_W_EN,
	output reg [31:0] ALU_result, ST_val,
	output reg [3:0] Dest
  );

	always @(posedge clk, posedge rst) begin
    if (rst) begin
			WB_en <= 0;
			MEM_R_EN <= 0;
			MEM_W_EN <= 0;
      ALU_result <= 32'b0;
      ST_val <= 32'b0;
			Dest <= 4'b0;
    end
    else begin
      WB_en <= WB_en_in;
			MEM_R_EN <= MEM_R_EN_in;
			MEM_W_EN <= MEM_W_EN_in;
      ALU_result <= ALU_result_in;
      ST_val <= ST_val_in;
			Dest <= Dest_in;
    end
  end
endmodule