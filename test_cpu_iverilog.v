`timescale 1ns/1ns
`include "cpu_iverilog.v"

module test_cpu_iverilog;
	reg rst, clk;
	wire [15:0] inst, s2;
        
    cpu_iverilog i0 (.rst(rst),.clk(clk),.inst(inst),.s2(s2));

     initial begin
	rst=0;
	#10	rst=1; clk=0; 
	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
	#10	clk=1;#10 clk=0; // #10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
//	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
//	#10	clk=1;#10 clk=0;#10 clk=1;#10 clk=0;#10 clk=1;#10 clk=0;
	#10
       $finish(2);
    end
    initial begin
        $monitor($time, ,"rst=%b clk=%b inst= %h s2= %h",rst,clk,inst,s2);
		$dumpfile("cpu_iverilog.vcd");  /* �o�̓t�@�C�����̎w��C�C�ӂŗǂ� */
		$dumpvars(0,test_cpu_iverilog);
    end
    
endmodule 

