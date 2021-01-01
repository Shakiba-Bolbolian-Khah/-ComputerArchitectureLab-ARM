library verilog;
use verilog.vl_types.all;
entity HAZARD_UNIT is
    port(
        mode            : in     vl_logic;
        Exe_MEM_R_EN    : in     vl_logic;
        src1            : in     vl_logic_vector(3 downto 0);
        src2            : in     vl_logic_vector(3 downto 0);
        Exe_Dest        : in     vl_logic_vector(3 downto 0);
        Mem_Dest        : in     vl_logic_vector(3 downto 0);
        Exe_WB_EN       : in     vl_logic;
        Mem_WB_EN       : in     vl_logic;
        two_src         : in     vl_logic;
        hazard_detected : out    vl_logic
    );
end HAZARD_UNIT;
