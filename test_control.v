`timescale 1ns/1ns
`include "control.v"

module test_control;
	reg rst, clk;
	reg [3:0] opcd;
	wire [1:0] aluc;
	wire selc_a, selc_b, we;

    control i0 (.rst(rst),.clk(clk),.opcd(opcd),.selc_a(selc_a),.aluc(aluc),.selc_b(selc_b),.we(we));

    initial begin
           rst = 1'b0; clk = 1'b0;
      #10 rst = 1'b1; opcd = 4'b0000;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b0001;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b0010;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b0011;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b0100;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b1001;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b1010;
      #10 clk = 1'b1;
      #10 clk = 1'b0; opcd = 4'b1100;
      #10 clk = 1'b1;
      #10
      $finish(2);
    end

    initial begin
      $monitor($time, ,"rst=%b clk=%b opcd=%b selc_a=%b aluc=%b selc_b=%b we=%b",
               rst, clk, opcd, selc_a, aluc, selc_b, we);
    end

endmodule
