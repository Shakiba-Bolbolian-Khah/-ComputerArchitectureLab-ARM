library verilog;
use verilog.vl_types.all;
entity FORWARDING_UNIT is
    port(
        mode            : in     vl_logic;
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        Mem_Dest        : in     vl_logic_vector(3 downto 0);
        WB_Dest         : in     vl_logic_vector(3 downto 0);
        Mem_WB_EN       : in     vl_logic;
        WB_WB_EN        : in     vl_logic;
        Sel_src1        : out    vl_logic_vector(1 downto 0);
        Sel_src2        : out    vl_logic_vector(1 downto 0)
    );
end FORWARDING_UNIT;
