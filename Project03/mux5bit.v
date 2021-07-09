module mux5bit(output5bit, select, input_1, input_2);

input [4:0] input_1, input_2;
input select;
output [4:0] output5bit;

bit1_2to1_mux select_bit0(output5bit[0], select, input_1[0], input_2[0]);
bit1_2to1_mux select_bit1(output5bit[1], select, input_1[1], input_2[1]);
bit1_2to1_mux select_bit2(output5bit[2], select, input_1[2], input_2[2]);
bit1_2to1_mux select_bit3(output5bit[3], select, input_1[3], input_2[3]);
bit1_2to1_mux select_bit4(output5bit[4], select, input_1[4], input_2[4]);

endmodule