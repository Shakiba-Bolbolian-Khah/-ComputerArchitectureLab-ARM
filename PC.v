`timescale 1ns/1ns

module PC(
  input[31:0] PC_in,
  input clk, rst, freeze,
  output reg[31:0] PC);
	always@(posedge clk, posedge rst)begin
		if(rst) PC <= 32'b0;
		else
		begin
			if( ~freeze ) PC <= PC_in;
			else PC <= PC;
		end
	end
endmodule
