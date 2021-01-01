library verilog;
use verilog.vl_types.all;
entity DATA_MEMORY is
    port(
        clk             : in     vl_logic;
        Mem_R_EN        : in     vl_logic;
        Mem_W_EN        : in     vl_logic;
        ALU_Res         : in     vl_logic_vector(31 downto 0);
        Val_RM          : in     vl_logic_vector(31 downto 0);
        Data            : out    vl_logic_vector(31 downto 0)
    );
end DATA_MEMORY;
