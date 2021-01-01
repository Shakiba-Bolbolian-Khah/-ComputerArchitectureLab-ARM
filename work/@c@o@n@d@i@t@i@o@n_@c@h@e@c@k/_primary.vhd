library verilog;
use verilog.vl_types.all;
entity CONDITION_CHECK is
    port(
        cond            : in     vl_logic_vector(3 downto 0);
        status_reg      : in     vl_logic_vector(3 downto 0);
        condOut         : out    vl_logic
    );
end CONDITION_CHECK;
