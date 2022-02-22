`timescale 1ps/1ps
`include "ALU.v"

module test_ALU;
    reg         rst, clk;
    reg [15:0]  in0, in1;
    reg [1:0]   cnt;
    wire [15:0] out;

    ALU i0 (.rst(rst), .clk(clk), .cnt(cnt), .in0(in0), .in1(in1), .out(out));

    initial begin
           rst = 0; clk = 0;
      #10 rst = 1; cnt = 2'b00; in0 = 16'h7777; in1 = 16'h5555;
      #10 clk = 1;
      #10 clk = 0; cnt = 2'b01;
      #10 clk = 1;
      #10 clk = 0; cnt = 2'b10;
      #10 clk = 1;
      #10 clk = 0; cnt = 2'b11;
      #10 clk = 1;
     #10
      $finish(2);
    end

    initial begin
      $monitor($time, ,"rst=%b clk=%b cnt= %b in0= %h in1=%h out=%h ", rst, clk, cnt, in0, in1, out);
    end

endmodule
