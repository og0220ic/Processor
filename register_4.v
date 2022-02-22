`timescale 1ps/1ps

module register_4 (rst, clk, in1, out1);

 input clk, rst;

 input [3:0]  in1;

 output [3:0] out1;

 reg [3:0] out1;

 always @ (negedge rst or posedge clk) begin

    if(!rst)  out1 <= #1 4'b0000;

    else  out1 <= #1 in1;

 end

endmodule
