library verilog;
use verilog.vl_types.all;
entity ADDER32bit is
    port(
        In1             : in     vl_logic_vector(31 downto 0);
        In2             : in     vl_logic_vector(31 downto 0);
        Sum             : out    vl_logic_vector(31 downto 0)
    );
end ADDER32bit;
