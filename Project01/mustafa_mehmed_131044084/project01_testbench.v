module project01_testbench();
	reg [4:0]a; 
	reg [4:0]b;
	wire [1:0]r;

	project01 deneme(r, a, b);

initial begin
a = 5'b00000; b = 5'b00000;
#20;
a = 5'b00010; b = 5'b00001;
#20;
a = 5'b00001; b = 5'b00010;
#20;
a = 5'b01011; b = 5'b01011;
#20;
a = 5'b00000; b = 5'b00000;
#20;
a = 5'b00110; b = 5'b00011;
#20;
a = 5'b00111; b = 5'b01010;
#20;
a = 5'b01110; b = 5'b01110;
#20;
end
 

initial
begin
$monitor("time = %2d, a =%4b, b=%4b, r=%2b", $time, a, b, r);
end
 
endmodule