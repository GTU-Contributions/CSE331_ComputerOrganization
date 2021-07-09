module bit32_alu(Z, V, carry_out_MSB, r, a, b, ALUctrl);

input [31:0] a, b;
input [3:0] ALUctrl;
output [31:0] r;
output carry_out_MSB, Z, V;
wire [30:0] carry_out;
wire set, setZ;
//wire [31:0] sll, srl, res;
//wire [4:0] shmat;

assign setZ = 1'b0;
//assign shmat = a[10:6];
//assign sll = b << shmat; 
//assign srl = b >> shmat;

bit1_alu bit1_alu_0(carry_out[0], r[0], a[0], b[0], set, ALUctrl[2], ALUctrl);
bit1_alu bit1_alu_1(carry_out[1], r[1], a[1], b[1], setZ, carry_out[0], ALUctrl); // carry_out[0] is actually carry_in[1]
bit1_alu bit1_alu_2(carry_out[2], r[2], a[2], b[2], setZ, carry_out[1], ALUctrl); // carry_out[1] is actually carry_in[2]
bit1_alu bit1_alu_3(carry_out[3], r[3], a[3], b[3], setZ, carry_out[2], ALUctrl); // carry_out[2] is actually carry_in[3]
bit1_alu bit1_alu_4(carry_out[4], r[4], a[4], b[4], setZ, carry_out[3], ALUctrl); // carry_out[3] is actually carry_in[4]
bit1_alu bit1_alu_5(carry_out[5], r[5], a[5], b[5], setZ, carry_out[4], ALUctrl); // carry_out[4] is actually carry_in[5]
bit1_alu bit1_alu_6(carry_out[6], r[6], a[6], b[6], setZ, carry_out[5], ALUctrl); // carry_out[5] is actually carry_in[6]
bit1_alu bit1_alu_7(carry_out[7], r[7], a[7], b[7], setZ, carry_out[6], ALUctrl); // carry_out[6] is actually carry_in[7]
bit1_alu bit1_alu_8(carry_out[8], r[8], a[8], b[8], setZ, carry_out[7], ALUctrl); // carry_out[7] is actually carry_in[8]
bit1_alu bit1_alu_9(carry_out[9], r[9], a[9], b[9], setZ, carry_out[8], ALUctrl); // carry_out[8] is actually carry_in[9]
bit1_alu bit1_alu_10(carry_out[10], r[10], a[10], b[10], setZ, carry_out[9], ALUctrl); // carry_out[9] is actually carry_in[10]
bit1_alu bit1_alu_11(carry_out[11], r[11], a[11], b[11], setZ, carry_out[10], ALUctrl); // carry_out[10] is actually carry_in[11]
bit1_alu bit1_alu_12(carry_out[12], r[12], a[12], b[12], setZ, carry_out[11], ALUctrl); // carry_out[11] is actually carry_in[12]
bit1_alu bit1_alu_13(carry_out[13], r[13], a[13], b[13], setZ, carry_out[12], ALUctrl); // carry_out[12] is actually carry_in[13]
bit1_alu bit1_alu_14(carry_out[14], r[14], a[14], b[14], setZ, carry_out[13], ALUctrl); // carry_out[13] is actually carry_in[14]
bit1_alu bit1_alu_15(carry_out[15], r[15], a[15], b[15], setZ, carry_out[14], ALUctrl); // carry_out[14] is actually carry_in[15]
bit1_alu bit1_alu_16(carry_out[16], r[16], a[16], b[16], setZ, carry_out[15], ALUctrl); // carry_out[15] is actually carry_in[16]
bit1_alu bit1_alu_17(carry_out[17], r[17], a[17], b[17], setZ, carry_out[16], ALUctrl); // carry_out[16] is actually carry_in[17]
bit1_alu bit1_alu_18(carry_out[18], r[18], a[18], b[18], setZ, carry_out[17], ALUctrl); // carry_out[17] is actually carry_in[18]
bit1_alu bit1_alu_19(carry_out[19], r[19], a[19], b[19], setZ, carry_out[18], ALUctrl); // carry_out[18] is actually carry_in[19]
bit1_alu bit1_alu_20(carry_out[20], r[20], a[20], b[20], setZ, carry_out[19], ALUctrl); // carry_out[19] is actually carry_in[20]
bit1_alu bit1_alu_21(carry_out[21], r[21], a[21], b[21], setZ, carry_out[20], ALUctrl); // carry_out[20] is actually carry_in[21]
bit1_alu bit1_alu_22(carry_out[22], r[22], a[22], b[22], setZ, carry_out[21], ALUctrl); // carry_out[21] is actually carry_in[22]
bit1_alu bit1_alu_23(carry_out[23], r[23], a[23], b[23], setZ, carry_out[22], ALUctrl); // carry_out[22] is actually carry_in[23]
bit1_alu bit1_alu_24(carry_out[24], r[24], a[24], b[24], setZ, carry_out[23], ALUctrl); // carry_out[23] is actually carry_in[24]
bit1_alu bit1_alu_25(carry_out[25], r[25], a[25], b[25], setZ, carry_out[24], ALUctrl); // carry_out[24] is actually carry_in[25]
bit1_alu bit1_alu_26(carry_out[26], r[26], a[26], b[26], setZ, carry_out[25], ALUctrl); // carry_out[25] is actually carry_in[26]
bit1_alu bit1_alu_27(carry_out[27], r[27], a[27], b[27], setZ, carry_out[26], ALUctrl); // carry_out[26] is actually carry_in[27]
bit1_alu bit1_alu_28(carry_out[28], r[28], a[28], b[28], setZ, carry_out[27], ALUctrl); // carry_out[27] is actually carry_in[28]
bit1_alu bit1_alu_29(carry_out[29], r[29], a[29], b[29], setZ, carry_out[28], ALUctrl); // carry_out[28] is actually carry_in[29]
bit1_alu bit1_alu_30(carry_out[30], r[30], a[30], b[30], setZ, carry_out[29], ALUctrl); // carry_out[29] is actually carry_in[30]
bit1_aluMSB bit1_aluMSB(carry_out_MSB, r[31], V, set, a[31], b[31], setZ, carry_out[30], ALUctrl);

// -------------------------------- GET Z --------------------------- //
wire or_1, or_2, or_3, or_4, not_0;
or or1(or_1, r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7]);
or or2(or_2, r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]);
or or3(or_3, r[16], r[17], r[18], r[19], r[20], r[21], r[22], r[23]);
or or4(or_4, r[24], r[25], r[26], r[27], r[28], r[29], r[30], r[31]);
or or5(not_0, or_1, or_2, or_3, or_4);
not not0(Z, not_0);
// ------------------------------------------------------------------ //

/* If the instruction is SLL or SRL
assign res = (ALUctrl == 4'b1000) ? sll :
				 (ALUctrl == 4'b1001) ? srl : r; */


endmodule