`timescale 1ns/1ns

module IF_STAGE_REG (
  input clk, rst, freeze, flush,
  input [31:0] PC_in, Instruction_in,
  output reg [31:0] PC, Instruction
  );
  
  always @(posedge clk, posedge rst) begin
    if (rst) begin
      PC <= 32'b0;
      Instruction <= 32'b0;
    end
    else begin
      if (flush) begin
        Instruction <= 32'b0;
        PC <= 32'b0;
      end
      else begin
        if( ~freeze ) begin
          Instruction <= Instruction_in;
          PC <= PC_in;
        end
        else begin
          Instruction <= Instruction;
          PC <= PC;
        end
      end
    end
  end
endmodule