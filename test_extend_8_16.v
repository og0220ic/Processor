`timescale 1ps/1ps
`include "extend_8_16.v"
module test_extend_8_16;
    reg        rst, clk;
    reg [7:0]  in1;
    wire [15:0] out1;
    extend_8_16 i0 (.rst(rst), .clk(clk), .in1(in1), .out1(out1));

    initial begin
             rst = 1'b0; clk = 1'b0;
      #10   rst = 1'b1; in1 = 8'h80;
      #10   clk = 1'b1;
      #10   clk = 1'b0; in1 = 8'h7F;
      #10   clk = 1'b1;
      #10;
      $finish(2);
    end
    initial begin
      $monitor($time, ,"rst=%b clk=%b in1= %b out1= %b", rst, clk, in1, out1);
    end
endmodule
