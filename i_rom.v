`timescale 1ps/1ps

module i_rom (clock, address, q);

  input        clock;
  input [7:0]   address;
  output [15:0]  q;

  reg [15:0]  core[0:255], q;

  always @(address) begin

case(address)

8'h00:core[0] <=16'hC30A;
8'h01:core[1] <=16'hC4F2;
8'h02:core[2] <=16'hC515;
8'h03:core[3] <=16'hC61C;
8'h04:core[4] <=16'hC740;
8'h05:core[5] <=16'hC830;
8'h06:core[6] <=16'hC964;
8'h07:core[7] <=16'hCA24;
8'h08:core[8] <=16'h2350;
8'h09:core[9] <=16'h3650;
8'h0A:core[10] <=16'h4780;
8'h0B:core[11] <=16'h1840;
8'h0C:core[12] <=16'h990F;
8'h0D:core[13] <=16'hAA18;
8'h16:core[14] <=16'h0000;
default:core[32]<=16'hxxxx;

endcase
    end
 
  always @ (posedge clock) begin

     q <= #1 core[address];

  end

endmodule
