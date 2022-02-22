`timescale 1ps/1ps
module Q18012_reg_file (we, wad, rad1, rad2, in, out1, out2);

	input         we;
	input [2:0]   wad, rad1, rad2;
	input [15:0]  in;
    output [15:0] out1, out2;

	reg [15:0]    mem[7:0], out1, out2;

		always @ (in or wad or we) begin
		if(we) begin
			mem[wad] <= #1 in;
			assign #1 out1 = mem[rad1];
			assign #1 out2 = mem[rad2];
		end
	end
endmodule
