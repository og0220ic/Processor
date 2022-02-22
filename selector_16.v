`timescale 1ps/1ps

module selector_16 (in0, in1, sel, out);
    input sel;
    input [15:0] in0, in1;
    output [15:0] out;
    reg [15:0] out;

    always @ (in0 or in1 or sel) begin
      if (sel) begin
        out <= #1 in1;
      end else begin
        out <= #1 in0;
      end
    end
endmodule