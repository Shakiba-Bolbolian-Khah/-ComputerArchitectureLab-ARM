`timescale 1ns/1ns

module REGISTER_FILE (
  input clk, rst,
  input [3:0] src1, src2, Dest_wb,
  input [31:0] Result_WB,
  input writeBackEn,
  output [31:0] reg1, reg2
  );
  reg [31:0] Register[0:14];
  always@(negedge clk, negedge rst) begin
    if(rst) begin
      Register[0] <= 32'b00000000000000000000000000000000;
      Register[1] <= 32'b00000000000000000000000000000001;
      Register[2] <= 32'b00000000000000000000000000000010;
      Register[3] <= 32'b00000000000000000000000000000011;
      Register[4] <= 32'b00000000000000000000000000000100;
      Register[5] <= 32'b00000000000000000000000000000101;
      Register[6] <= 32'b00000000000000000000000000000110;
      Register[7] <= 32'b00000000000000000000000000000111;
      Register[8] <= 32'b00000000000000000000000000001000;
      Register[9] <= 32'b00000000000000000000000000001001;
      Register[10] <= 32'b00000000000000000000000000001010;
      Register[11] <= 32'b00000000000000000000000000001011;
      Register[12] <= 32'b00000000000000000000000000001100;
      Register[13] <= 32'b00000000000000000000000000001101;
      Register[14] <= 32'b00000000000000000000000000001110;
    end
    if(writeBackEn == 1) begin
      Register[Dest_wb] <= Result_WB;
    end
  end
  assign reg1 = Register[src1];
  assign reg2 = Register[src2];
endmodule
