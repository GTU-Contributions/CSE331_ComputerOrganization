library verilog;
use verilog.vl_types.all;
entity bit1_alu is
    port(
        carry_out       : out    vl_logic;
        result          : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        less            : in     vl_logic;
        carry_in        : in     vl_logic;
        ALUop           : in     vl_logic_vector(3 downto 0)
    );
end bit1_alu;
