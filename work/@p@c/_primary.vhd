library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        PC_in           : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        freeze          : in     vl_logic;
        PC              : out    vl_logic_vector(31 downto 0)
    );
end PC;
