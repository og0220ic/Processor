`timescale 1ps/1ps

`include "adder8.v"
`include "i_rom.v"
`include "selector_16.v"

module fetch (rst,clk,sel,PC_disp,PC,inst);
    input         rst,clk,sel;
    input [8:0]   PC_disp;
    output [7:0]   PC;
    output [15:0] inst;
    wire [7:0]    add_out;

    adder8      i1 (.rst(rst), .clk(clk), .in0(PC), .in1(8'h01), .out(add_out));

    i_rom       i2 (.clock(clk), .address(PC), .q(inst));

    selector_16 i3 (.sel(sel),.in0(add_out),.in1(PC_disp),.out(PC));

endmodule
