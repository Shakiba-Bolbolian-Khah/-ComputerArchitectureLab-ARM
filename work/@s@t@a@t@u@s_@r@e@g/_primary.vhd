library verilog;
use verilog.vl_types.all;
entity STATUS_REG is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        S               : in     vl_logic;
        status_in       : in     vl_logic_vector(3 downto 0);
        status          : out    vl_logic_vector(3 downto 0)
    );
end STATUS_REG;
