`timescale 1ps/1ps
`include "adder8.v"

module test_addr8;
    reg         rst, clk;
    reg [7:0]  in0, in1;
    wire [7:0] out;

    adder8 i0 (.rst(rst), .clk(clk), .in0(in0), .in1(in1), .out(out));

    initial begin
           rst = 0; clk = 0;
      #10 rst = 1; in0 = 8'h00; in1 = 8'b01;
      #10 clk = 1;
      #10 clk = 0; in0 = 8'h09;
      #10 clk = 1;
      #10 clk = 0; in0 = 8'h1C;
      #10 clk = 1;
      #10 clk = 0; in0 = 8'hA3;
      #10 clk = 1;
     #10
      $finish(2);
    end

    initial begin
      $monitor($time, ,"rst=%b clk=%b in0= %h in1=%h out=%h ", rst, clk, in0, in1, out);
      $dumpfile("adder8.vcd");  /* 出力ファイル名の指定，任意で良い */
      $dumpvars(0,test_addr8);  /* このテストベンチのモジュール名を指定 */

    end

endmodule
