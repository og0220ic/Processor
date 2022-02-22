`timescale 1ps/1ps
module control (rst, clk, opcd, sel1, sel2, sel, ALU, jump, w); 

   input rst, clk;
   input [3:0] opcd;
   output sel1, sel2, sel, w;
   output [1:0] ALU, jump;

   reg sel1, sel2, sel, w;
   reg [1:0] ALU, jump;
   
   always @ ( negedge rst or posedge clk ) begin
   if(!rst) begin
       sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b00;
   end else

  case(opcd)

   4'b0000: begin    //NOP  
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b00; end   

   4'b0001: begin    //ADD  
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 1; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b0010: begin    //SUB
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 1; ALU <= #1 2'b01; jump <= 2'b00; end

   4'b0011: begin    //AND
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 1; ALU <= #1 2'b10; jump <= 2'b00; end

   4'b0100: begin    //OR
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 1; ALU <= #1 2'b11; jump <= 2'b00; end
   
   4'b0101: begin    //ADDI
     sel1 <= #1 0; sel2 <= #1 1; sel <= #1 0; w <= #1 1; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b0110: begin    //ADDIU
     sel1 <= #1 1; sel2 <= #1 1; sel <= #1 0; w <= #1 1; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b0111: begin    //SUBI
     sel1 <= #1 0; sel2 <= #1 1; sel <= #1 0; w <= #1 1; ALU <= #1 2'b01; jump <= 2'b00; end
   
   4'b1000: begin    //LI
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 1; w <= #1 1; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b1001: begin    //LUI
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 1; w <= #1 1; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b1010: begin    //LD
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 1; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b1011: begin    //ST
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b00; end
   
   4'b1100: begin    //BEQ
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b01; end
   
   4'b1101: begin    //BGT
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b10; end
   
   4'b1110: begin    //JUMP
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b11; end
   
   4'b1111: begin    //HALT
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b00; end

  default: begin     //Default
     sel1 <= #1 0; sel2 <= #1 0; sel <= #1 0; w <= #1 0; ALU <= #1 2'b00; jump <= 2'b00; end
  endcase
 end
endmodule
