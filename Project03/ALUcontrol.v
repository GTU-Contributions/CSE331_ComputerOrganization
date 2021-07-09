module ALUcontrol(ALUctrl, funct, ALUop);

input [5:0] funct;
input [2:0] ALUop;
output [3:0] ALUctrl;

assign ALUctrl = (ALUop == 3'b000) ? 4'b0110 : // SUB
					  (ALUop == 3'b001) ? 4'b0010 : // ADD
					  (ALUop == 3'b010) ? 4'b0111 : // SLT
					  (ALUop == 3'b011) ? 4'b0000 : // AND
					  (ALUop == 3'b100) ? 4'b0001 : // OR
					  (ALUop == 3'b101) ? 4'b1010 : // ADDU
					  (ALUop == 3'b110) ? 4'b1111 : // SLTU
					  (ALUop == 3'b111 && funct == 6'b000000) ? 4'b1000 : // SLL
					  (ALUop == 3'b111 && funct == 6'b000010) ? 4'b1001 : // SRL
					  (ALUop == 3'b111 && funct == 6'b100000) ? 4'b0010 : // ADD
					  (ALUop == 3'b111 && funct == 6'b100001) ? 4'b1010 : // ADDU
					  (ALUop == 3'b111 && funct == 6'b100010) ? 4'b0110 : // SUB
					  (ALUop == 3'b111 && funct == 6'b100011) ? 4'b1110 : // SUBU
					  (ALUop == 3'b111 && funct == 6'b100100) ? 4'b0000 : // AND
					  (ALUop == 3'b111 && funct == 6'b100101) ? 4'b0001 : // OR
					  (ALUop == 3'b111 && funct == 6'b100111) ? 4'b0101 : // NOR
					  (ALUop == 3'b111 && funct == 6'b101010) ? 4'b0111 : // SLT
					  (ALUop == 3'b111 && funct == 6'b101011) ? 4'b1111 : // SLTU				  
																			  4'b0000 ; // DEFAULT ALUctrl is AND


endmodule
