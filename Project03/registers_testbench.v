module registers_testbench();

wire [31:0] read_data_1, read_data_2;
reg [31:0] write_data;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg clk, signal_reg_write;

mips_registers regs(read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk);

initial begin
read_reg_1 = 5'b10000; read_reg_2 = 5'b10001; write_reg = 5'b10000; clk = 1; signal_reg_write = 1; write_data = 42;
#20
read_reg_1 = 5'b10000; read_reg_2 = 5'b10001; write_reg = 5'b10000; clk = 0; signal_reg_write = 1; write_data = 42;
#20
read_reg_1 = 5'b10000; read_reg_2 = 5'b10001; write_reg = 5'b10000; clk = 1; signal_reg_write = 1; write_data = 42;

end

initial begin
	$monitor("Clock:%d\nD1:%d, D2:%d\n", clk, read_data_1, read_data_2);
end
endmodule