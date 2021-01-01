library verilog;
use verilog.vl_types.all;
entity VAL2_GEN is
    port(
        isMEM           : in     vl_logic;
        Val_Rm          : in     vl_logic_vector(31 downto 0);
        imm             : in     vl_logic;
        Shift_operand   : in     vl_logic_vector(11 downto 0);
        Val2            : out    vl_logic_vector(31 downto 0)
    );
end VAL2_GEN;
