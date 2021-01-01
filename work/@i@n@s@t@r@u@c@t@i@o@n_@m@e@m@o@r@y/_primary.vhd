library verilog;
use verilog.vl_types.all;
entity INSTRUCTION_MEMORY is
    port(
        PC              : in     vl_logic_vector(31 downto 0);
        Instruction     : out    vl_logic_vector(31 downto 0)
    );
end INSTRUCTION_MEMORY;
