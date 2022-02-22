`timescale 1ps/1ps

module register_16 (rst, clk, in1, out1);

 input clk, rst;

 input [15:0]  in1;

 output [15:0] out1;

 reg [15:0] out1;

 always @ (negedge rst or posedge clk) begin

    if(!rst)  out1 <= #1 16'b0000;

    else  out1 <= #1 in1;

 end

endmodule
