`timescale 1ps/1ps

module execution(rst, clk, rdo1, s0, aluc, imme, selc_b, we, rdestr, s2, wer, rdestrr);
    input rst, clk, selc_b, we;
    input [15:0] rdo1, s0, imme;
    input [3:0] rdestr;
    input [1:0] aluc;
    output [15:0] s2;
    output [3:0] rdestrr;
    output wer;

    wire [15:0] aluo, immer;
    wire selc_br;

    ALU i0 (.rst(rst), .clk(clk), .in0(rdo1), .in1(s0), .cnt(aluc), .out(aluo));
    register_16 i1 (.rst(rst), .clk(clk), .in1(imme), .out1(immer));
    register_1 i2 (.rst(rst), .clk(clk), .in1(selc_b), .out1(selc_br));
    register_1 i3 (.rst(rst), .clk(clk), .in1(we), .out1(wer));
    register_4 i4 (.rst(rst), .clk(clk), .in1(rdestr), .out1(rdestrr));
    selector_16 i5 (.in0(aluo), .in1(immer), .sel(selc_br), .out(s2));
endmodule