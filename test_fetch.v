`timescale 1ps/1ps
`include "fetch.v"

module test_fetch;
  reg         rst, clk;
  wire [15:0]         inst;

  fetch i0 (.rst(rst), .clk(clk), .inst(inst));

  initial begin
    rst=0;
    #10  rst=1; clk=0;
    #10  clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
    #10  clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
    #10  clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
    #10  clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
    #10  clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;
    #10

    $finish(2);


end
initial begin
$monitor($time, ,"rst=%b clk=%b inst= %h", rst, clk, inst);
$dumpfile("fetch.vcd");  /* �o�̓t�@�C�����̎w��C�C�ӂŗǂ� */
$dumpvars(0,test_fetch); 
/* gtkwave�ｿｽﾅ鯉ｿｽ�ｿｽﾊゑｿｽ\�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽ驍ｽ�ｿｽﾟには，�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽﾉ適�ｿｽﾘな包ｿｽ�ｿｽ�ｿｽ}�ｿｽ�ｿｽ�ｿｽ�ｿｽ�ｿｽ驍ｱ�ｿｽ�ｿｽ */

end
endmodule
