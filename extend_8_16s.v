`timescale 1ps/1ps
module extend_8_16s (rst, clk, in, out);

    input rst, clk;
    input [7:0] in;
    output [15:0] out;
    reg [15:0] out;

        always @ (negedge rst or posedge clk) begin
          if(!rst) begin
                out <= #1 16'h0000;
          end else if(in[7])
                out <= #1 in + 16'hFF00;
          else
                out <= #1 in;
         end
endmodule
