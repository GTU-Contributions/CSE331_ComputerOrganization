module mux32bit(output32bit, select, input_1, input_2);

input [31:0] input_1, input_2;
input select;
output [31:0] output32bit;

bit1_2to1_mux select_bit0(output32bit[0], select, input_1[0], input_2[0]);
bit1_2to1_mux select_bit1(output32bit[1], select, input_1[1], input_2[1]);
bit1_2to1_mux select_bit2(output32bit[2], select, input_1[2], input_2[2]);
bit1_2to1_mux select_bit3(output32bit[3], select, input_1[3], input_2[3]);
bit1_2to1_mux select_bit4(output32bit[4], select, input_1[4], input_2[4]);
bit1_2to1_mux select_bit5(output32bit[5], select, input_1[5], input_2[5]);
bit1_2to1_mux select_bit6(output32bit[6], select, input_1[6], input_2[6]);
bit1_2to1_mux select_bit7(output32bit[7], select, input_1[7], input_2[7]);
bit1_2to1_mux select_bit8(output32bit[8], select, input_1[8], input_2[8]);
bit1_2to1_mux select_bit9(output32bit[9], select, input_1[9], input_2[9]);
bit1_2to1_mux select_bit10(output32bit[10], select, input_1[10], input_2[10]);
bit1_2to1_mux select_bit11(output32bit[11], select, input_1[11], input_2[11]);
bit1_2to1_mux select_bit12(output32bit[12], select, input_1[12], input_2[12]);
bit1_2to1_mux select_bit13(output32bit[13], select, input_1[13], input_2[13]);
bit1_2to1_mux select_bit14(output32bit[14], select, input_1[14], input_2[14]);
bit1_2to1_mux select_bit15(output32bit[15], select, input_1[15], input_2[15]);
bit1_2to1_mux select_bit16(output32bit[16], select, input_1[16], input_2[16]);
bit1_2to1_mux select_bit17(output32bit[17], select, input_1[17], input_2[17]);
bit1_2to1_mux select_bit18(output32bit[18], select, input_1[18], input_2[18]);
bit1_2to1_mux select_bit19(output32bit[19], select, input_1[19], input_2[19]);
bit1_2to1_mux select_bit20(output32bit[20], select, input_1[20], input_2[20]);
bit1_2to1_mux select_bit21(output32bit[21], select, input_1[21], input_2[21]);
bit1_2to1_mux select_bit22(output32bit[22], select, input_1[22], input_2[22]);
bit1_2to1_mux select_bit23(output32bit[23], select, input_1[23], input_2[23]);
bit1_2to1_mux select_bit24(output32bit[24], select, input_1[24], input_2[24]);
bit1_2to1_mux select_bit25(output32bit[25], select, input_1[25], input_2[25]);
bit1_2to1_mux select_bit26(output32bit[26], select, input_1[26], input_2[26]);
bit1_2to1_mux select_bit27(output32bit[27], select, input_1[27], input_2[27]);
bit1_2to1_mux select_bit28(output32bit[28], select, input_1[28], input_2[28]);
bit1_2to1_mux select_bit29(output32bit[29], select, input_1[29], input_2[29]);
bit1_2to1_mux select_bit30(output32bit[30], select, input_1[30], input_2[30]);
bit1_2to1_mux select_bit31(output32bit[31], select, input_1[31], input_2[31]);

endmodule