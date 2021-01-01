`timescale 1ns/1ns

module STATUS_REG(
  input clk, rst, S,
	input[3:0] status_in,
  output reg[3:0] status
	);
	always@(negedge clk, negedge rst)begin
		if(rst) status <= 4'b0;
		else
		begin
			if(S) status <= status_in;
			else status <= status;
		end
	end
endmodule