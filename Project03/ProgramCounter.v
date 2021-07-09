/*
module ProgramCounter(PCout, clock);
	reg [7:0] program_counter;
	input clock;
	output reg [7:0] PCout;
	
	initial program_counter = 8'b00000000;
	
	always @ (posedge clock)
		begin
			PCout = program_counter;
		end
	
	always @ (negedge clock)
		begin
			PCout = program_counter + 8'b00000001;
		end
	
endmodule
*/