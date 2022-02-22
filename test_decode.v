`timescale 1ps/1ps
`include "decode.v"
module test_decode;
     reg         rst,clk, wer;
     reg [15:0]  inst, s2;
     reg [3:0]   rdestrr;
     wire        selc_b, we;
     wire [1:0]  aluc;
     wire [15:0] s0,rdo1,imme;
     wire [3:0]  rdestr;

  decode i0 (.s2(s2),.rdestrr(rdestrr),.wer(wer),.rst(rst),.clk(clk),.inst(inst),
             .rdo1(rdo1),.s0(s0),.imme(imme),.aluc(aluc),.selc_b(selc_b),.we(we),.rdestr(rdestr));

  initial begin
        rst=0;
        #10 rst=1; clk=0; wer=1; inst=16'h0000; s2=16'hAAAA; rdestrr=4'h0;  //write AAAA to R0
        #10 clk=1;
        #10 clk=0; s2=16'hBBBB; rdestrr=4'h1;                                  //write BBBB to R1
        #10 clk=1;
        #10 clk=0; wer=0; inst=16'h1010; // ADD R0 R1���Ӗ����閽�߂Ńe�X�g
        #10 clk=1;
        #10 clk=0; inst=16'hC188; // LDI R1 #88���Ӗ�����E�E�E
        #10 clk=1;
        #10 clk=0; inst=16'hA148; // SUBI R1 #48���Ӗ�����E�E�E
        #10 clk=1;
        #10
        $finish(2);
  end
  initial begin
 
 $monitor($time, ,"s0= %h rdo1= %h imme=%h aluc=%b selc_b=%b we=%b rdestr=%h",
 	  s0,rdo1,imme,aluc,selc_b,we,rdestr);
      $dumpfile("decode.vcd");  /* �o�̓t�@�C�����̎w��C�C�ӂŗǂ� */
$dumpvars(0,test_decode);
 end
endmodule
