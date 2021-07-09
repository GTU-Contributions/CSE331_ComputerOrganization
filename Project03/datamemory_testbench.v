module datamemory_testbench();

wire [31:0] read_data;
reg [31:0] mem_address, write_data;
reg signal_mem_read, signal_mem_write;

mips_data_mem memory(read_data, mem_address, write_data, signal_mem_read, signal_mem_write);

initial begin
mem_address = 32'b00000000000000000000000000000100; write_data = 32'b10111100000111110000111110000011; signal_mem_read = 1; signal_mem_write = 0;
#20
mem_address = 32'b00000000000000000000000000000100; write_data = 32'b11110011001100110011001110110011; signal_mem_read = 0; signal_mem_write = 1;
#20
mem_address = 32'b00000000000000000000000000000100; write_data = 32'b10111100000111110000111110000011; signal_mem_read = 1; signal_mem_write = 0;

$writememb("C:\\Users\\Administrator\\Desktop\\project03\\_mainMemoryContent.txt", memory.data_mem);
end

initial begin
	$monitor("ReadData:%32b\n", read_data);
end
endmodule