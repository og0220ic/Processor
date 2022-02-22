`timescale 1ps/1ps

`include "fetch2.v"
`include "decode2.v"
`include "execution2.v"
`include "adder8.v"
`include "ALU.v"
`include "control.v"
`include "extend_8_16.v"
`include "i_rom.v"
`include "regfile.v"
`include "register_16.v"
`include "register_4.v"
`include "register_1.v"
`include "selector_16.v"

module cpu_iverilog(rst,clk, inst,s2);
    input rst,clk;

    output [15:0] inst, s2;
    
     wire selc_b,we,wer;
     wire [1:0] aluc;
     wire [3:0] rdestr,rdestrr;
     wire [15:0] rdo1,s0,imme;

    fetch i0 (.rst(rst), .clk(clk), .inst(inst));

    decode i1 (.s2(s2),.rdestrr(rdestrr),.wer(wer),.rst(rst),.clk(clk),.inst(inst),
             .rdo1(rdo1),.s0(s0),.imme(imme),.aluc(aluc),.selc_b(selc_b),.we(we),.rdestr(rdestr));

    execution i2 (.rst(rst),.clk(clk),.rdo1(rdo1),.s0(s0),.aluc(aluc),.imme(imme), .selc_b(selc_b),.we(we),.rdestr(rdestr),
                  .s2(s2),.wer(wer),.rdestrr(rdestrr));
endmodule
