module bit1_alu(carry_out, result, a, b, less, carry_in, ALUop);

input a, b, less, carry_in;
input [3:0] ALUop;
output carry_out, result;
wire xor_0, or_0, or_1, or_3, and_0, and_1, and_2, and_3, and_4, not_0, not_1, not_2, not_3;
wire m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14;
wire [15:0] regMux;

xor xor0(xor_0, b, ALUop[2]);
or or0(or_0, a, xor_0);
and and0(and_0, a, xor_0);
not not0(not_0, and_0);
and and1(and_1, not_0, or_0);
and and2(and_2, and_1, carry_in);
or or1(or_1, and_1, carry_in);
or or2(carry_out, and_0, and_2);
not not1(not_1, and_2);
and and3(and_3, not_1, or_1);
and and4(and_4, a, b);
or or3(or_3, a, b);
not not2(not_2, or_3);
not not3(not_3, and_4);

assign regMux[0] = and_4;	// A and B
assign regMux[1] = or_3;	// A or B
assign regMux[2] = and_3;	// A + B
assign regMux[3] = 0;		// EmptySlot
assign regMux[4] = not_3;	// A nand B
assign regMux[5] = not_2;	// A nor B
assign regMux[6] = and_3;	// A - B
assign regMux[7] = less;	// SLT
assign regMux[8] = 1;		// SLL
assign regMux[9] = 1;		// SRL
assign regMux[10] = and_3;	// A + B unsigned
assign regMux[11] = 0;		// EmptySlot
assign regMux[12] = 0;		// EmptySlot
assign regMux[13] = 0;		// EmptySlot
assign regMux[14] = and_3;	// A - B unsigned
assign regMux[15] = less;	// SLTU

bit1_2to1_mux mx1(m1, 	ALUop[0], regMux[0],  regMux[1]); 	// Selects: A and B 	 <> A or B 
bit1_2to1_mux mx2(m2, 	ALUop[0], regMux[2],  regMux[3]); 	// Selects: A + B 	 <> EmptySlot
bit1_2to1_mux mx3(m3, 	ALUop[0], regMux[4],  regMux[5]); 	// Selects: A nand B  <> A nor B
bit1_2to1_mux mx4(m4, 	ALUop[0], regMux[6],  regMux[7]); 	// Selects: A - B		 <> SLT
bit1_2to1_mux mx8(m8, 	ALUop[0], regMux[8],  regMux[9]); 	// Selects: SLL		 <> SRL
bit1_2to1_mux mx9(m9, 	ALUop[0], regMux[10], regMux[11]); 	// Selects: A + B un	 <> EmptySlot
bit1_2to1_mux mx10(m10, ALUop[0], regMux[12], regMux[13]); 	// Selects: EmptySlot <> EmptySlot
bit1_2to1_mux mx11(m11, ALUop[0], regMux[14], regMux[15]); 	// Selects: A - B un	 <> SLTU
bit1_2to1_mux mx5(m5, 	ALUop[1], m1, m2);
bit1_2to1_mux mx6(m6, 	ALUop[1], m3, m4);
bit1_2to1_mux mx12(m12, ALUop[1], m8, m9);
bit1_2to1_mux mx13(m13, ALUop[1], m10, m11);
bit1_2to1_mux mx7(m7, 	ALUop[2], m5, m6);
bit1_2to1_mux mx14(m14, ALUop[2], m12, m13);
bit1_2to1_mux mx15(result, ALUop[3], m7, m14);

endmodule