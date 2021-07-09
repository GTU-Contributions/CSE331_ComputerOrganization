library verilog;
use verilog.vl_types.all;
entity bit1_2to1_mux is
    port(
        output_bit      : out    vl_logic;
        \select\        : in     vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end bit1_2to1_mux;
