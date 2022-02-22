`timescale 1ps/1ps
`include "register_4.v"

module test_register_4;

    reg [3:0]  in1;
    reg        clk, rst;
    wire [3:0] out1;

    register_4 i0 (.rst(rst), .clk(clk), .in1(in1), .out1(out1));

    initial begin
           rst=0; clk=0;
      #10 rst=1; in1=4'b1111;
      #10 clk=1;
      #10 clk=0; in1=4'b0000;
      #10 clk=1;
      #10
      $finish(2);
    end

    initial begin
      $monitor($time, ,"rst= %b clk=%b in1=%b out1=%b",rst,clk,in1,out1);
    end

endmodule
