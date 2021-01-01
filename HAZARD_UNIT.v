`timescale 1ns/1ns

module HAZARD_UNIT (
	input mode, Exe_MEM_R_EN, 
  input [3:0] src1, src2, Exe_Dest, Mem_Dest,
  input Exe_WB_EN, Mem_WB_EN, two_src,
  output hazard_detected
  );
  reg is_hazard;
  always@(*) begin
		if (mode == 1'b0) begin
    	is_hazard = 1'b0;
    	if((src1 == Exe_Dest) && (Exe_WB_EN == 1'b1))
      	is_hazard = 1'b1;
	    if((src1 == Mem_Dest) && (Mem_WB_EN == 1'b1))
  	    is_hazard = 1'b1;
 	   if((src2 == Exe_Dest) && (Exe_WB_EN == 1'b1) && (two_src))
  	    is_hazard = 1'b1;
    	if((src2 == Mem_Dest) && (Mem_WB_EN == 1'b1) && (two_src))
      	is_hazard = 1'b1;
		end
		else begin
			is_hazard = 1'b0;
			if( (Exe_MEM_R_EN == 1'b1) && ((src1 == Exe_Dest) || ((src2 == Exe_Dest) && (two_src))) )
				is_hazard = 1'b1;
		end
  end
  assign hazard_detected = is_hazard;
endmodule