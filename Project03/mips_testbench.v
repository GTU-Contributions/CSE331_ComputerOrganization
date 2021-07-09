module mips_testbench();
	reg clock;
	integer i;

	mips_core cpu(clock);
	
initial begin

	// TESTS HERE FOR:
	// sw, lw, addi, add, andi, slt, slti, j, sltu, bne, sll, srl, and, nor, lui
	// Other instructions are similar
	
	// sw - M[Rs[...00000] + ...00001] = Rt[11101]; // 32-bit content
	// Rt[11101] = Content -> 32'b[...011101]
	// Writes Rt[11101] to M[...000001]
	// M[...000001] = Old content -> 32'b[...000001]
	// M[...000001] = New content -> 32'b[...011101]
	cpu.Instruction_memory.instr_mem[0] = 32'b10101100000111010000000000000001;
	// lw - Rt[11101] = M[Rs[...00100] + ...01000]; // 32-bit content
	// M[...001100] = Content -> 32'b[...001100]
	// Writes M[...001100] to Rt[11101]
	// Rt[11101] = Old content -> 32'b[...011101]
	// Rt[11101] = New content -> 32'b[...001100]
	cpu.Instruction_memory.instr_mem[1] = 32'b10001100100111010000000000001000;
	// addi - Rt[00100] = Rs[00011] + 32'b[...1100000]
	// Rs[00011] = Content -> 32'b[...00011]
	// Rt[00100] = Old content -> 32'b[...0100]
	// Rt[00100] = New content -> 32'b[...1100011] because Rs + ...1100000
	cpu.Instruction_memory.instr_mem[2] = 32'b00100000011001000000000001100000;
	// add - Rd[00101] = Rs[00010] + Rt[00011]
	// Rs[00010] = Content -> 32'b[...00010]
	// Rt[01001] = Content -> 32'b[...01001]
	// Rd[00101] = Old content -> 32'b[...0101]
	// Rd[00101] = New content -> 32'b[...1011] because Rs + Rt
	cpu.Instruction_memory.instr_mem[3] = 32'b00000000010010010010100000100000;
	// andi - Rt[00111] = Rs[00011] & 32'b[...1100011]
	// Rs[00011] = Content -> 32'b[...00011]
	// Rt[00111] = Old content -> 32'b[...0111]
	// Rt[00111] = New content -> 32'b[...0000011]
	cpu.Instruction_memory.instr_mem[4] = 32'b00110000011001110000000001100011;
	// slt - Rd[01001] = (Rs[00111] < Rt[01000]) ? 1 : 0
	// Rs[00111] = Content -> 32'b[...00111]
	// Rt[01000] = Content -> 32'b[...01000]
	// Rd[01001] = Old Content -> 32'b[...01001]
	// Rd[01001] = New Content -> 32'b[...00001] because Rs < Rt
	cpu.Instruction_memory.instr_mem[5] = 32'b00000000111010000100100000101010;
	// slti - Rt[01010] = (Rs[00111] < 32'b[0...00011]) ? 1 : 0
	// Rs[00111] = Content -> 32'b[...00111]
	// Rt[01010] = Old Content -> 32'b[...01010]
	// Rt[01010] = New Content -> 32'b[...00000] because Rs > Rt
	cpu.Instruction_memory.instr_mem[6] = 32'b00101000111010100000000000000011;
	
	// Jump to instr_mem[9] without executing instr_mem[8]
	cpu.Instruction_memory.instr_mem[7] = 32'b00001000000000000000000000001001;
	
	// add - Rd[00000] = Rs[00010] + Rt[00011]
	// Rs[00010] = Content -> 32'b[...00010]
	// Rt[00011] = Content -> 32'b[...00011]
	// Rd[00000] = Old content -> 32'b[...0000]
	// Rd[00000] = New content -> 32'b[...0101] because Rs + Rt
	// THIS INSTRUCTION IS NOT EXECUTED BECAUSE OF JUMP (instr_mem[7])
	// SO THE Rd[00000] CONTENT IS THE OLD CONTENT -> 32'b[...0000]
	cpu.Instruction_memory.instr_mem[8] = 32'b00000000010000110000100000100000;
	
	// sltu - Rd[01100] = (Rs[11110] < Rt[11111]) ? 1 : 0
	// Rs[11110] = Content -> 32'b[1..11110]
	// Rt[11111] = Content -> 32'b[...01100]
	// Rd[01100] = Old Content -> 32'b[...01100]
	// Rd[01100] = New Content -> 32'b[...00000] because Rs > Rt => Rs's MSB is 1 but the number is unsigned
	cpu.Instruction_memory.instr_mem[9] = 32'b00000011110111110110000000101011;
	
	// add - Rd[00001] = Rs[00001] + Rt[00001]
	// Rs[00001] = Content -> 32'b[...00001]
	// Rt[00001] = Content -> 32'b[...00001]
	// Rd[00001] = Old content -> 32'b[...0001]
	// Rd[00001] = New content -> 32'b[...0010] because Rs + Rt
	// This is actually Rd = Rd + Rd // increase the Rd content by 1
	cpu.Instruction_memory.instr_mem[10] = 32'b00000000010000010000100000100000;
	
	// bne - if(Rs[00001] != Rt[00011]) PC = PC + 1 + BranchAddress
	// Rs[00001] = Content -> 32'b[...00010]
	// Rt[00011] = Content -> 32'b[...00011]
	// Go back to instr_mem[10] since Rs != Rt
	// and increase the value of Rs by 1 to make Rs == Rt and go to instr_mem[12]
	cpu.Instruction_memory.instr_mem[11] = 32'b00010100001000110000000000001010;
	
	// add - Rd[10001] = Rs[10000] + Rt[01111]
	// Rs[10000] = Content -> 32'b[...10000]
	// Rt[01111] = Content -> 32'b[...01111]
	// Rd[10001] = Old content -> 32'b[...10001]
	// Rd[10001] = New content -> 32'b[...11111] because Rs + Rt
	cpu.Instruction_memory.instr_mem[12] = 32'b00000010000011111000100000100000;
	
	// sll - Rd[10010] = Rt[10010] << shamt -> shamt == 3
	// Rt[10010] = Content -> 32'b[...10010]
	// Rd[10010] = Old Content -> 32'b[...00010010]
	// Rd[10010] = New content -> 32'b[...10010000]
	// Actually Rd is Rt, so we are shifting the same register by 3
	cpu.Instruction_memory.instr_mem[13] = 32'b00000000000100101001000011000000;
	
	// srl - Rd[10011] = Rt[10011] >> shamt -> shamt == 3
	// Rt[10011] = Content -> 32'b[...10011]
	// Rd[10011] = Old Content -> 32'b[...00010011]
	// Rd[10011] = New content -> 32'b[...00000010]
	// Actually Rd is Rt, so we are shifting the same register by 3
	cpu.Instruction_memory.instr_mem[14] = 32'b00000000000100111001100011000010;
	
	// and - Rd[10101] = Rs[00000] & Rt[10101]
	// Rs[00000] = Content -> 32'b[...000000]
	// Rt[10101] = Content -> 32'b[...010101]
	// Rd[10101] = Old Content -> 32'b[...010101]
	// Rd[10101] = New Content -> 32'b[...000000]
	// Actuallry Rd is Rt, so Rd = Rs & Rd which is 0 cuz Rs's content is zero
	cpu.Instruction_memory.instr_mem[15] = 32'b00000000000101011010100000100100;
	
	// nor - Rd[10110] = ~(Rs[00000] | Rt[10110])
	// Rs[00000] = Content -> 32'b[...000000]
	// Rt[10110] = Content -> 32'b[...010101]
	// Rd[10110] = Old Content -> 32'b[0000...010110]
	// Rd[10110] = New Content -> 32'b[1111...101001]
	// Actuallry Rd is Rt, so Rd = ~(Rs | Rd)
	cpu.Instruction_memory.instr_mem[16] = 32'b00000000000101101011000000100111;
	
	// lui - Rt[11000] = {Imm, 16'b0}
	// Rt[11000] = Old Content -> 32'b[0...011000]
	// Rt[11000] = New Content -> 32'b[0000111100001111...00000]
	cpu.Instruction_memory.instr_mem[17] = 32'b00111100000110000000111100001111;
	
	
	//cpu.Instruction_memory.instr_mem[0] = 32'b000100_RS_RT_Imm;
	
	for(i=0; i<17; i = i+1)
	begin
		clock = 0;
		#100
		clock = 1;
		#100
		clock = 0;
	end

	$writememb("C:\\Users\\Administrator\\Desktop\\project03\\_registerContent.txt", cpu.Registers.registers);
	$writememb("C:\\Users\\Administrator\\Desktop\\project03\\_mainMemoryContent.txt", cpu.Data_memory.data_mem);
end

/*
initial begin
	$monitor("C:%d\nR:%32b\nI:%32b\nP:%32b\nD1:%32b\nD2:%32b\n", clock, result, inst, program_counter, data1, data2);
end
*/

endmodule