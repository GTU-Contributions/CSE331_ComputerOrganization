module mux5bit_testbench();
	reg select;
	reg  [4:0]a;
	reg  [4:0]b;
	wire [4:0]r;
	
	mux5bit test(r, select, a, b);

initial begin
select = 0; 
a = 5'b01010; 
b = 5'b10101;
#50;

select = 1; 
a = 5'b01010; 
b = 5'b10101;
#50;

select = 0; 
a = 5'b00000; 
b = 5'b11111;
#50;

select = 1; 
a = 5'b00000; 
b = 5'b11111;
#50;

end
 
initial
begin
$monitor("select=%1b,\n a=%5b,\n b=%5b,\n r=%5b,\n", select, a, b, r);
end


endmodule