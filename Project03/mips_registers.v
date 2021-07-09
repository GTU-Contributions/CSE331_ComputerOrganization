module mips_registers
(
	output reg [31:0] read_data_1, read_data_2,
	input [31:0] write_data,
	input [4:0] read_reg_1, read_reg_2, write_reg,
	input signal_reg_write, clk
);
	reg [31:0] registers [0:31];
	
	initial begin
		$readmemb("C:\\Users\\Administrator\\Desktop\\project03\\registers.mem", registers);
	end

	always @ (negedge clk)
	begin
			read_data_1 = registers[read_reg_1];
			read_data_2 = registers[read_reg_2];
	end
	
	always @ (posedge clk)
	begin
		if(signal_reg_write)
			begin
				registers[write_reg] <= write_data;
			end
	end

endmodule