`timescale 1ps/1ps
module ALU (rst, clk, cnt, in0, in1, out);

   //�K�؂ɐ錾��ǉ����Ȃ���
   input rst, clk;
   input [1:0] cnt;
   input [15:0] in0, in1;
   output [15:0] out;

    reg [15:0] out;


        always @ (negedge rst or posedge clk ) begin

            if(!rst) out <= #1 16'h0000;

            else

            case( cnt )

              2'b00: out <= #1 in0 + in1;

              2'b01: out <= #1 in0 - in1;

              2'b10: out <= #1 in0 & in1;

              2'b11: out <= #1 in0 | in1;

              default: out <= 16'hxxxx;

            endcase

        end
endmodule
