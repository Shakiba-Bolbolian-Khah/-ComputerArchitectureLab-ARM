library verilog;
use verilog.vl_types.all;
entity MUX3to1_32bits is
    port(
        \Select\        : in     vl_logic_vector(1 downto 0);
        In1             : in     vl_logic_vector(31 downto 0);
        In2             : in     vl_logic_vector(31 downto 0);
        In3             : in     vl_logic_vector(31 downto 0);
        MuxOut          : out    vl_logic_vector(31 downto 0)
    );
end MUX3to1_32bits;
