`timescale 1ps/1ps
`include "selector_16.v"
module test_selector_16;
    reg        sel;
    reg [15:0]  in0, in1;
    wire [15:0] out;
    selector_16 i0 (.sel(sel),.in0(in0),.in1(in1),.out(out));

    initial begin
             sel = 0; in0=16'hAAAA; in1=16'hBBBB;
      #10   sel = 1;
      #10;
      $finish(2);
    end
    initial begin
      $monitor($time, ,"sel=%b in0= %h in1= %h out=%h", sel,in0,in1,out);
    end
endmodule
