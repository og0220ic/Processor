`timescale 1ps/1ps
module regfile (rst, clk, wer, rdo1, aluo, memo);

    input         rst, clk, wer;

    input [15:0]  rdo1, aluo;

    output [15:0] memo;

    reg [15:0]    core[0:15];

    integer i;

         always @ (posedge clk or negedge rst) begin

           if(!rst) begin

               for(i=0;i<16;i=i+1) begin

                  core[i] <= 16'h0000;

               end

           end else if(wer) begin

               core[aluo] <= #1 wdo1;
           end
         end

         assign #1 memo = core[aluo];

endmodule