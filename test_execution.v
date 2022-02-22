`timescale 1ps/1ps

`include "execution.v"

module test_execution; 
  //�K�؂Ȑ錾����}�� 
    reg rst, clk, selc_b, we;
    reg [15:0] rdo1, s0, imme;
    reg [3:0] rdestr;
    reg [1:0] aluc;
    wire [15:0] s2;
    wire [3:0] rdestrr;
    wire wer;

  execution i0 (.rst(rst),.clk(clk),.rdo1(rdo1),.s0(s0),.aluc(aluc),.imme(imme), .selc_b(selc_b),.we(we),.rdestr(rdestr),
                  .s2(s2),.wer(wer),.rdestrr(rdestrr)); 


 initial begin
      clk=0; rst=0; 
  #10 rst=1; rdo1=16'h7777; s0=16'h5555; imme=16'h1111; aluc=2'b00;
      selc_b=0; we=1; rdestr=4'b1010 ;
  #10 clk=1; 
  #10 clk=0; aluc=2'b01; #10 clk=1; 
  #10 clk=0; aluc=2'b10; #10 clk=1; 
  #10 clk=0; aluc=2'b11; #10 clk=1;
  #10 clk=0; selc_b=1;   #10 clk=1; 
  #10
 $finish(2); 
 end

 initial begin
    $monitor($time, ,"rst=%b clk=%b s2=%h rdestrr=%b wer=%b",rst,clk,s2,rdestrr,wer);
    $dumpfile("execution.vcd");  /* �o�̓t�@�C�����̎w��C�C�ӂŗǂ� */
$dumpvars(0,test_execution);
 end
endmodule
