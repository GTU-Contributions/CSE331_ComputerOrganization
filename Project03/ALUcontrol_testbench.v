module ALUcontrol_testbench();	
	
	reg [5:0] funct;
	reg [2:0] ALUop;
	wire [3:0] ALUctrl;
	
	ALUcontrol test(ALUctrl, funct, ALUop);

initial begin

ALUop = 3'b000;		// ALU action SUB
funct = 6'b000010;	// Don't care since ALUop is not 111 -> R-type
// Expected = 0110
#50;

ALUop = 3'b010;		// ALU action SLT
funct = 6'b000010;	// Don't care since ALUop is not 111 -> R-type
// Expected = 0111
#50;

ALUop = 3'b111;		// ALU action ADDU
funct = 6'b100001;	// Don't care since ALUop is not 111 -> R-type
// Expected = 1010
#50;

ALUop = 3'b111;		// ALU action SLT
funct = 6'b101010;	// Don't care since ALUop is not 111 -> R-type
// Expected = 0111
#50;

ALUop = 3'b111;		// ALU action OR
funct = 6'b100101;	// Don't care since ALUop is not 111 -> R-type
// Expected = 0001
#50;

end
 
initial
begin
$monitor("ALUop=%3b,\n funct=%6b,\n ALUctrl=%4b,\n", ALUop, funct, ALUctrl);
end
 
endmodule