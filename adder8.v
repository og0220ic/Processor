`timescale 1ps/1ps

module adder8 (in0, in1, rst, clk, out);

    input        rst, clk;

    input [7:0]  in0, in1;

    output [7:0] out;

    reg [7:0]    out;

        always @ (negedge rst or posedge clk) begin

            if(!rst) out <= 0;

            else  out <= #1 in0 + in1;
        end
endmodule