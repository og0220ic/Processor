`timescale 1ns/1ns
`include "regfile.v"

module test_regfile;

    reg         rst, clk, we;
    reg [3:0]   ra1, ra2, wa1;
    reg [15:0]  wd1;
    wire [15:0] rd1, rd2;

    regfile i0 (.rst(rst),.clk(clk),.we(we),.ra1(ra1), .ra2(ra2), .wa1(wa1), .wd1(wd1), .rd1(rd1), .rd2(rd2));

    initial begin
      rst=0; 
      #10 rst=1;we=1; clk=0; ra1=4'h0; ra2=4'h1; wa1=4'h0; wd1=16'hAAAA;
      #10 clk=1;
      #10 clk=0; wa1=4'h1; wd1=16'hBBBB;
      #10 clk=1;
      #10 clk=0; ra1=4'h1; ra2=4'h2; wa1=4'h2; wd1=16'hCCCC;
      #10 clk=1;
      #10 clk=0; wa1=4'h3; wd1=16'hDDDD;
      #10 clk=1;
      #10 clk=0; wa1=4'h4; wd1=16'hEEEE;
      #10 clk=1;
      #10 clk=0; we=0; ra1=4'h3; ra2=4'h4;
      #10 clk=1;
      #10 clk=0; ra1=4'h1; ra2=4'h2;
      #10 clk=1;
      #10 clk=0; ra1=4'h2; ra2=4'h3;
      #10 clk=1;
      #10 clk=0; ra1=4'h3; ra2=4'h4;
      #10 clk=1;
      #10
      $finish(2);
    end

    initial begin
      $monitor($time, ,"rst=%b clk=%b we=%b ra1=%h ra2=%h wa1=%h wd1=%h rd1=%h rd2=%h",
                        rst, clk, we, ra1, ra2, wa1, wd1, rd1, rd2);

      $dumpfile("regfile.vcd");
      $dumpvars(0,test_regfile);
    end
endmodule
