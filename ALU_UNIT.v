`timescale 1ns/1ns

module ALU_UNIT (
  input [31:0] Val1, Val2,
  input [3:0] EXE_CMD, SR_in,
  
	output [31:0] ALU_Res,
	output [3:0] SR //3:N | 2:Z | 1:C | 0:V
  );
  
	reg [31:0] result;
	reg N, Z, C, V;

	always@(*) begin
	  result = 32'b0;
		N = 0;
		Z = 0;
		C = 0;
		V = 0;

		case(EXE_CMD)
      4'b0001: begin //MOV
		    result = Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				C = 0;
				V = 0;
			end

			4'b1001: begin //MVN
		    result = ~Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				C = 0;
				V = 0;
			end

			4'b0010: begin //ADD
		    {C, result} = Val1 + Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				V = (Val1[31] & Val2[31] & !result[31]) || (!Val1[31] & !Val2[31] & result[31]);
			end

			4'b0011: begin //ADC
		    {C, result} = Val1 + Val2 + SR_in[1];
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				V = (Val1[31] & Val2[31] & !result[31]) || (!Val1[31] & !Val2[31] & result[31]);
			end

			4'b0100: begin //SUB
		    {C, result} = Val1 - Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				V = (!Val1[31] & Val2[31] & result[31]) || (Val1[31] & !Val2[31] & !result[31]);
			end

			4'b0101: begin //SBC
		    {C, result} = Val1 - Val2 - SR_in[1];
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				V = (!Val1[31] & Val2[31] & result[31]) || (Val1[31] & !Val2[31] & !result[31]);
			end

			4'b0110: begin //AND
		    result = Val1 & Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				C = 0;
				V = 0;
			end

			4'b0111: begin //ORR
		    result = Val1 | Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				C = 0;
				V = 0;
			end

			4'b1000: begin //EOR
		    result = Val1 ^ Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				C = 0;
				V = 0;
			end

			4'b0010: begin //LDR, STR
		    {C, result} = Val1 + Val2;
				N = result[31];
				if (result == 32'b0)
					Z = 1'b1;
				V = (Val1[31] & Val2[31] & !result[31]) || (!Val1[31] & !Val2[31] & result[31]);
			end

		  default: begin //B, others
		    result = 32'b0;
				N = 0;
				Z = 0;
				C = 0;
				V = 0;
	    end
		endcase
  end

  assign ALU_Res = result;
	assign SR = {N, Z, C, V};
endmodule