`timescale 1ps/1ps
module extend_4_9s (rst, clk, in, out);

    input rst, clk;
    input [3:0] in;
    output [8:0] out;
    reg [8:0] out;

        always @ (negedge rst or posedge clk) begin
          if(!rst) begin
                out <= #1 9'b000000000;
          end else if(in[3])
                out <= #1 in + 9'b000000000;
          else
                out <= #1 in;
         end
endmodule
