module bit1_2to1_mux(output_bit, select, a, b);

input a, b, select;
output output_bit;
wire and0_wire, and1_wire, selectNot;

not not0_func(selectNot, select);
and and0_func(and0_wire, a, selectNot);
and and1_func(and1_wire, b, select);
or  or1_func(output_bit, and0_wire, and1_wire);

endmodule