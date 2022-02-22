`timescale 1ps/1ps

module register_1 (rst, clk, in1, out1);

 input clk, rst;

 input in1;

 output out1;

 reg out1;

 always @ (negedge rst or posedge clk) begin

    if(!rst)  out1 <= #1 0;

    else  out1 <= #1 in1;

 end

endmodule
