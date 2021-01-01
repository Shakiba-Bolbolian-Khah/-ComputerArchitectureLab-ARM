`timescale 1ns/1ns

module VAL2_GEN (
	input isMEM,
  input [31:0] Val_Rm,
	input imm,
	input [11:0] Shift_operand,
  
	output reg [31:0] Val2
  );

	reg [63:0] temp_data;
	reg[31:0] data;
	reg [4:0] shift;
	always@(*) begin
		Val2 = 32'b0;
	  if (isMEM)
			Val2 = {{20{Shift_operand[11]}}, Shift_operand};
		else begin
			if (imm) begin
				shift = {Shift_operand[11:8], 1'b0};
				data = {24'b0, Shift_operand[7:0]};
				temp_data = {data, data} >> shift;
				Val2 = temp_data[31:0];
			end
			else begin
				if (Shift_operand[4] == 1'b0) begin
					case(Shift_operand[6:5])
      			2'b00: begin //LSL
		    			Val2 = Val_Rm << Shift_operand[11:7];
						end
	      		2'b01: begin //LSR
			    		Val2 = Val_Rm >> Shift_operand[11:7];
						end
	   	   		2'b10: begin //ASR
			    		Val2 = Val_Rm >>> Shift_operand[11:7];
						end
	      		2'b11: begin //ROR
			    		shift = Shift_operand[11:7];
							temp_data = {Val_Rm, Val_Rm} >> shift;
							Val2 = temp_data[31:0];
						end
		  			default: begin
		    			Val2 = 32'b0;
	    			end
					endcase
				end
			end
		end
	end

endmodule