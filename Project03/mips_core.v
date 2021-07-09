module mips_core(clock);

input clock;
// Current instruction from the Instruction_memory
wire [31:0] instruction;
// Divide the instruction into these
wire [5:0] OpCode, funct;
wire [4:0] Rs, Rt, Rd, shamt;
wire [15:0] immediate;
wire [25:0] jumpAddress;
// Extended versions
wire [31:0] extendedImm;
wire [31:0] extendedJump;
// Signals from Control to other units
wire RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Jump, Branch, BranchNotEqual;
// Op from Control to ALU_control
wire [2:0] ALUop; 
// Control from ALU_control to ALU
wire [3:0] ALUctrl; 
// Register units
wire [4:0] read_reg_1, read_reg_2, write_reg;
wire [31:0] read_data_reg1, read_data_reg2;
wire [31:0] write_data_reg;
// ALU units
wire isZero, overflow, carry;
wire [31:0] ALU_result;
// Memory units
wire [31:0] read_data_mem, write_data_mem, mem_address;

// Start the program counter from zero
reg [31:0] program_counter;
initial program_counter = 32'b00000000000000000000000000000000;
wire [31:0] pc_increment_amount = 32'b00000000000000000000000000000001;

// Get the instruction at the current program_counter
mips_instr_mem Instruction_memory(instruction, program_counter);

// Divide the current instruction
assign OpCode = instruction[31:26];
assign Rs = instruction[25:21];
assign Rt = instruction[20:16];
assign Rd = instruction[15:11];
assign shamt = instruction[10:6];
assign funct = instruction[5:0];
assign immediate = instruction[15:0];
assign jumpAddress = instruction[25:0];

// Sign extend immediate
assign extendedImm = {{16{immediate[15]}}, immediate[15:0]};
// Extend jump address
assign extendedJump = {{6{1'b0}}, jumpAddress[25:0]};

// Input: Opcode - 6bit
// Output: All requiret signals and ALUop - op needed from ALU_control
MainControl Control(ALUop, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Jump, Branch, BranchNotEqual, OpCode);

// Input: ALUop, function field of the instruction - 3bit
// Output: ALUctrl - control needed from ALU - 4bit
ALUcontrol  ALU_control(ALUctrl, funct, ALUop);

assign read_reg_1 = Rs;
assign read_reg_2 = Rt;

// Choose the destination register
// RegDst == 0 -> Rt
// RegDst == 1 -> Rd
// Output: write_reg, the register where the result will be written
mux5bit muxRegDst(write_reg, RegDst, Rt, Rd);

// Input: read_reg_1: Rs register - 5bit
//			 read_reg_2: Rt register - 5bit
//			  write_reg: Rt or Rd register - 5bit
//				RegWrite: 1 for write, 0 for blocking write
//		write_data_reg: 32-bit data which will be written in the write_reg Register
//
// Output: read_data_reg1: The content of the Rs register
// 		  read_data_reg2: The content of the Rt register
mips_registers Registers(read_data_reg1, read_data_reg2, write_data_reg, read_reg_1, read_reg_2, write_reg, RegWrite, clock);

wire [31:0] ALUsecondIn;
// Choose the second input for ALU
// ALUsrc == 0 -> read_data_reg2
// ALUsrc == 1 -> extendedImm
// Output: ALUsecondIn, the second 32-bit input
mux32bit muxALUsrc(ALUsecondIn, ALUSrc, read_data_reg2, extendedImm);

// Input:  		ALUctrl: The operation which will be performed by ALU - 4bit
// 	  read_data_reg1: First 32-bit input
// 	  	  ALUsecondIn: Second 32-bit input -> read_data_reg2 or extendedImm
// 
// Output: ALU_result: The result from the ALUctrl operation - 32bit
//			  		 carry: Carry bit - 1bit
//				 overflow: Overflow indication - 1bit
//					isZero: 1 for equal inputs, 0 otherwise 
bit32_alu   ALU(isZero, overflow, carry, ALU_result, read_data_reg1, ALUsecondIn, ALUctrl);
								  
								  
wire [31:0] muxBranchResult, PC_normal_increment, PC_final_increment;
wire [31:0] branchAddress;

// Calculate normal program counter incremenet
assign PC_normal_increment = program_counter + pc_increment_amount;
// Calculate the 32 bit branchAddress 
assign branchAddress = program_counter + pc_increment_amount + $signed(extendedImm);

// To choose between branches: beq and bne
wire AND_RESULT, XOR_RESULT;
xor xor_0(XOR_RESULT, isZero, BranchNotEqual);
and and_0(AND_RESULT, XOR_RESULT, Branch);

// To choose between PC_normal_increment and branch
mux32bit muxBranch(muxBranchResult, AND_RESULT, PC_normal_increment, branchAddress);

// To choose between PC_normal_increment, branch and jump
mux32bit muxJumpOrBranch(PC_final_increment, Jump, muxBranchResult, extendedJump);

assign write_data_mem = read_data_reg2;
assign mem_address = ALU_result << 2;
mips_data_mem Data_memory(read_data_mem, mem_address, write_data_mem, MemRead, MemWrite);

wire [31:0] final_ALU_result;

assign final_ALU_result = (OpCode == 6'b000000 && funct == 6'b000000) ? Rt << shamt : // sll instruction
								  (OpCode == 6'b000000 && funct == 6'b000010) ? Rt >> shamt : // srl instruction
								  (OpCode == 6'b001111) ? {immediate, 16'b0} :					  // lui instruction
								   ALU_result; // Other instructions

// Choose the write_data_reg
// MemtoReg == 0 -> ALU_result
// MemtoReg == 1 -> read_data_mem
// Output: The data which will be written in write_reg Register
mux32bit muxMemtoReg(write_data_reg, MemtoReg, final_ALU_result, read_data_mem);

// Increase the program_counter the positive edge of the clock
always @ (posedge clock)
	begin
		program_counter = PC_final_increment;
	end
         

always @(posedge clock) 
begin
	$display("Clock:%1b, PC:%32b\nInst:%32b", clock, program_counter, instruction);
	$display("JumpAddres:%32b\nBranchAddress:%32b\n", extendedJump, branchAddress);
	$display("Signals for OpCode:%6b\nALUop:%3b, ALUctrl:%4b, RD:%1b, ALUSrc:%1b, MtoR:%1b, RW:%1b, MR:%1b, MW:%1b, J:%1b, B:%1b", OpCode, ALUop, ALUctrl, RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Jump, Branch);	
	$display("ExtendedIm:%32b\nRs_content:%32b[%d]\nRt_content:%32b[%d]\nALU_input1:%32b[%d]\nALU_input2:%32b[%d]\nALU_Result:%32b[%d]\n", extendedImm, read_data_reg1, $signed(read_data_reg1), read_data_reg2, $signed(read_data_reg2), read_data_reg1, $signed(read_data_reg1), ALUsecondIn, $signed(ALUsecondIn), ALU_result, $signed(ALU_result));
	//$display("rd_data_mem:%32b\nwr_data_mem:%32b\nmem_address:%32b\n", read_data_mem, write_data_reg, mem_address);
end

endmodule