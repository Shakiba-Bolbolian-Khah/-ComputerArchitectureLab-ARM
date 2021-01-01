`timescale 1ns/1ns
module TB();
  reg clk = 0, rst = 0, mode = 1;
  ARM Pipeline(clk, rst, mode);
  initial begin
    repeat(600) #10 clk = ~clk;
  end
  initial begin
    rst = 1;
    #5
    rst = 0;
  end
endmodule