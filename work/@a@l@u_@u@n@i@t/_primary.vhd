library verilog;
use verilog.vl_types.all;
entity ALU_UNIT is
    port(
        Val1            : in     vl_logic_vector(31 downto 0);
        Val2            : in     vl_logic_vector(31 downto 0);
        EXE_CMD         : in     vl_logic_vector(3 downto 0);
        SR_in           : in     vl_logic_vector(3 downto 0);
        ALU_Res         : out    vl_logic_vector(31 downto 0);
        SR              : out    vl_logic_vector(3 downto 0)
    );
end ALU_UNIT;
