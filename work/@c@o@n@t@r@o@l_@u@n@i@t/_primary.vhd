library verilog;
use verilog.vl_types.all;
entity CONTROL_UNIT is
    port(
        mode            : in     vl_logic_vector(1 downto 0);
        S               : in     vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(8 downto 0)
    );
end CONTROL_UNIT;
