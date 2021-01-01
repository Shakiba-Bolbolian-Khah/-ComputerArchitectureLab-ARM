`timescale 1ns/1ns

module CONDITION_CHECK (
  input [3:0] cond, status_reg,
  output condOut
  );
  //3:N | 2:Z | 1:C | 0:V
  reg out;
	always@(cond, status_reg) begin
	  out = 1'b0;
		case(cond)
      4'b0000: begin //EQ
		    if( status_reg[2] == 1'b1) begin
				  out = 1'b1;
				end
			end
			4'b0001: begin //NE
			  if( status_reg[2] == 1'b0) begin
			    out = 1'b1;
			  end
			end
			4'b0010: begin //CS/HS
			  if( status_reg[1] == 1'b1) begin
			    out = 1'b1;
			  end
			end
			4'b0011: begin //CC/LO
			  if( status_reg[1] == 1'b0) begin
			    out = 1'b1;
			  end
			end
			4'b0100: begin //MI
			  if( status_reg[3] == 1'b1) begin
			    out = 1'b1;
			  end
			end
			4'b0101: begin //PL
			  if( status_reg[3] == 1'b0) begin
			    out = 1'b1;
			  end
			end
			4'b0110: begin //VS
			  if( status_reg[0] == 1'b1) begin
			    out = 1'b1;
			  end
			end	
			4'b0111: begin //VC
			  if( status_reg[0] == 1'b0) begin
			    out = 1'b1;
			  end
			end	
			4'b1000: begin //HI
			  if( (status_reg[2] == 1'b0) && (status_reg[1] == 1'b1)) begin
			    out = 1'b1;
			  end
			end	
			4'b1001: begin //LS
			  if( (status_reg[2] == 1'b1) && (status_reg[1] == 1'b0)) begin
			    out = 1'b1;
			  end
			end	
			4'b1010: begin //GE
			  if( status_reg[3] == status_reg[0]) begin
			    out = 1'b1;
			  end
			end	
			4'b1011: begin //LT
			  if( status_reg[3] != status_reg[0]) begin
			    out = 1'b1;
			  end
			end	
			4'b1100: begin //GT
			  if( (status_reg[2] == 1'b0) && (status_reg[3] == status_reg[0])) begin
			    out = 1'b1;
			  end
			end	
			4'b1101: begin //LE
			  if( (status_reg[2] == 1'b1) || (status_reg[3] != status_reg[0])) begin
			    out = 1'b1;
			  end
			end	
			4'b1110: begin //AL-NOP
			  out = 1'b1;
			end	
		  default: begin
		    out = 1'b0;
	    end
		endcase
  end
  assign condOut = out;
endmodule