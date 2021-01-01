`timescale 1ns/1ns

module FORWARDING_UNIT (
	input mode,
  input [3:0] src1, src2, Mem_Dest, WB_Dest,
  input Mem_WB_EN, WB_WB_EN,
  
	output [1:0] Sel_src1, Sel_src2
  );

	reg [1:0] select_1, select_2;
	always@(*) begin
		if (mode == 1'b1) begin  	
    	if((src1 == Mem_Dest) && (Mem_WB_EN == 1'b1))
      	select_1 = 2'b01;
	    else begin
				if((src1 == WB_Dest) && (WB_WB_EN == 1'b1))
  	    	select_1 = 2'b10;
				else
					select_1 = 2'b00;
			end
			
    	if((src2 == Mem_Dest) && (Mem_WB_EN == 1'b1))
      	select_2 = 2'b01;
	    else begin 
				if((src2 == WB_Dest) && (WB_WB_EN == 1'b1))
  	    	select_2 = 2'b10;
				else
					select_2 = 2'b00;
			end
		end
		else begin
			select_1 = 2'b00;
			select_2 = 2'b00;
		end
  end
  
	assign Sel_src1 = select_1;
	assign Sel_src2 = select_2;
endmodule