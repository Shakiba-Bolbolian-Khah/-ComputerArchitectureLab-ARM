`timescale 1ns/1ns

module IF_STAGE (
  input clk, rst, freeze, Branch_taken,
  input [31:0] BranchAddr,
  output [31:0] PC, Instruction
  );
  wire [31:0] PC_to_MUX, PC_in, PC_out;
  assign PC = PC_to_MUX;
  
  Mux2to1 PCMux(Branch_taken, PC_to_MUX, BranchAddr, PC_in);
  
  PC pc(PC_in, clk, rst, freeze, PC_out);
  
  ADDER32bit pcAdder(32'd4, PC_out, PC_to_MUX);

  INSTRUCTION_MEMORY InstructionMem(PC_out, Instruction);
  
endmodule