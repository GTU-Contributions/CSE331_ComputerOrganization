module MainControl(ALUop, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Jump, Branch, BranchNotEqual, OpCode);

input [5:0] OpCode;
output [2:0] ALUop;
output RegDst, Jump, Branch, BranchNotEqual, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;

assign ALUop = (OpCode == 6'b000000) ? 							 	3'b111 : // R-Type Instruction
					(OpCode == 6'b000100 || OpCode == 6'b000101) ?	3'b000 : // SUB  - beq, bne
					(OpCode == 6'b001000 || OpCode == 6'b100011 ||
					 OpCode == 6'b100100 || OpCode == 6'b100101 ||
					 OpCode == 6'b101000 || OpCode == 6'b101001 ||
													OpCode == 6'b101011) ?	3'b001 : // ADD  - addi, lw, lbu, lhu, sb, sh, sw
					(OpCode == 6'b001001) ?									3'b101 : // ADDU - addiu
					(OpCode == 6'b001010) ?								   3'b010 : // SLT  - slti
					(OpCode == 6'b001011) ?								   3'b110 : // SLTU - sltiu
					(OpCode == 6'b001100) ?								   3'b011 : // AND  - andi
					(OpCode == 6'b001101) ?								   3'b100 : // OR   - ori
																					3'b011 ; // DEFAULT ALUop is AND

// 1 when the instruction is R-type
assign RegDst = (OpCode == 6'b000000) ? 1'b1 : 1'b0;

// 1 when the instruction is one of: addi, lw, lbu, lhu, sb, sh, sw, addiu, slti, sltiu, andi, ori, lui
assign ALUSrc = (OpCode == 6'b001000 || OpCode == 6'b100011 ||
					  OpCode == 6'b100100 || OpCode == 6'b100101 ||
					  OpCode == 6'b101000 || OpCode == 6'b101001 ||
					  OpCode == 6'b101011 || OpCode == 6'b001001 ||
					  OpCode == 6'b001010 || OpCode == 6'b001011 ||
					  OpCode == 6'b001100 || OpCode == 6'b001101 ||
					  OpCode == 6'b001111) ? 1'b1 : 1'b0; 

// 1 when the instruction is one of: lw, lbu, lhu
assign MemtoReg = (OpCode == 6'b100011 || OpCode == 6'b100100 || OpCode == 6'b100101) ? 1'b1 : 1'b0;

// 0 when the instruction is one of: sb, sh, sw, beq, bne, j
assign RegWrite = (OpCode == 6'b101000 || OpCode == 6'b101001 || OpCode == 6'b101011 ||
						 OpCode == 6'b000100 || OpCode == 6'b000101 || OpCode == 6'b000010) ? 1'b0 : 1'b1;

//	1 when the instruction is one of: lw, lbu, lhu
assign MemRead = (OpCode == 6'b100011 || OpCode == 6'b100100 || OpCode == 6'b100101) ? 1'b1 : 1'b0;

// 1 when the instruction is one of: sb, sh, sw
assign MemWrite = (OpCode == 6'b101000 || OpCode == 6'b101001 || OpCode == 6'b101011) ? 1'b1 : 1'b0;

// 1 when the instruction is one of: j, jal
assign Jump = (OpCode == 6'b000010 || OpCode == 6'b000011) ? 1'b1 : 1'b0;

// 1 when the instruction is one of: beq, bne	
assign Branch = (OpCode == 6'b000100 || OpCode == 6'b000101) ? 1'b1 : 1'b0;				 

// 1 when the instruction is bneq
assign BranchNotEqual = (OpCode == 6'b000101) ? 1'b1 : 1'b0;

endmodule