`timescale 1ps/1ps
`include "regfile.v"
`include "extend_8_16s.v"
`include "extend_8_16u.v"
`include "extend_4_9s.v"
`include "control.v"
`include "selector_16.v"
`include "register_4.v"
`include "register_9.v"

module decode ( rst, clk, W, WD, WR, inst, PC, rd1, rd2, imm, disp, ALU, sel, jump, w, wr, pc);

   input rst, clk, W;
   input [15:0] inst, WD;
   input [8:0] PC;
   input [3:0] WR;
   output [15:0] rd1, rd2, imm;
   output [8:0] disp, pc;
   output [3:0] wr;
   output [1:0] ALU, jump;
   output sel, w;
   wire [15:0] wire1, wire2, wire3;
   wire sel1, sel2;

   regfile i0 (.rst(rst), .clk(clk), .RA1(inst[11:8]), .RA2(inst[7:4]), .W(W), .WR(WR), .WD(WD), .rd1(rd1), .rd2(wire1));

   control i1 (.rst(rst), .clk(clk), .opcd(inst[15:12]), .sel1(sel1), .sel2(sel2), .sel(sel), .ALU(ALU), .jump(jump), .w(w));

   extend_8_16s i2 ( .rst(rst), .clk(clk), .in(inst[7:0]), .out(wire2));
   
   extend_8_16u i3 ( .rst(rst), .clk(clk), .in(inst[7:0]), .out(wire3));
   
   extend_4_9s i4 ( .rst(rst), .clk(clk), .in(inst[3:0]), .out(disp));

   selector_16 i5 ( .in0(wire2), .in1(wire3), .sel(sel1), .out(imm));
   
   selector_16 i6 ( .in0(wire1), .in1(imm), .sel(sel2), .out(rd2));
   
   register_4 i7 (.rst(rst), .clk(clk), .in1(inst[11:8]), .out1(wr));
   
   register_9 i8 (.rst(rst), .clk(clk), .in1(PC), .out1(pc));

endmodule
