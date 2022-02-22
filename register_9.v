`timescale 1ps/1ps

module register_9 (rst, clk, in1, out1);

 input clk, rst;

 input [8:0]  in1;

 output [8:0] out1;

 reg [8:0] out1;

 always @ (negedge rst or posedge clk) begin

    if(!rst)  out1 <= #1 9'b0000;

    else  out1 <= #1 in1;

 end

endmodule
