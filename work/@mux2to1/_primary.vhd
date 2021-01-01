library verilog;
use verilog.vl_types.all;
entity Mux2to1 is
    port(
        \Select\        : in     vl_logic;
        In1             : in     vl_logic_vector(31 downto 0);
        In2             : in     vl_logic_vector(31 downto 0);
        MuxOut          : out    vl_logic_vector(31 downto 0)
    );
end Mux2to1;
