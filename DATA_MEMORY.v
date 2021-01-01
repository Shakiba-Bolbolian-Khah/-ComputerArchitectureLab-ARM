`timescale 1ns/1ns

module DATA_MEMORY(
  input clk,
  input Mem_R_EN, Mem_W_EN,
  input[31:0] ALU_Res, Val_RM,
  output[31:0] Data
	);
  
  wire [5:0] address;
  wire [31:0] real_add;
  reg [31:0] daTa;
  reg [31:0] memoryData[0:63];
  
  assign real_add = ALU_Res - 32'd1024;
  assign address = (real_add[7:0]>>2);

  initial begin
    memoryData[0] = 32'd9;
    memoryData[10] = 32'd10;
    memoryData[11] = 32'd12;
    memoryData[12] = 32'd9;
    memoryData[13] = 32'd15;
    memoryData[14] = 32'd20;
    memoryData[15] = 32'd14;
    memoryData[16] = 32'd17;
    memoryData[17] = 32'd99;
    memoryData[18] = 32'd152;
    memoryData[19] = 32'd30;
  end
 
  always@(posedge clk)begin    
    if(Mem_W_EN)
      memoryData[address[5:0]] = Val_RM;
  end
  always@(Mem_R_EN, ALU_Res, Val_RM)begin
    if(Mem_R_EN)
      daTa = memoryData[address[5:0]];    
  end
  
  assign Data = daTa;
endmodule