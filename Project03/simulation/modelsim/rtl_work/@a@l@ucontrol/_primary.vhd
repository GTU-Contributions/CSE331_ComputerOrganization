library verilog;
use verilog.vl_types.all;
entity ALUcontrol is
    port(
        ALUctrl         : out    vl_logic_vector(3 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        ALUop           : in     vl_logic_vector(2 downto 0)
    );
end ALUcontrol;
