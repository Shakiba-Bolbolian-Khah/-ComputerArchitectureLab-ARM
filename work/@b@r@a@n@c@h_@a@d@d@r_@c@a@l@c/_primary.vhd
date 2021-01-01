library verilog;
use verilog.vl_types.all;
entity BRANCH_ADDR_CALC is
    port(
        PC              : in     vl_logic_vector(31 downto 0);
        Signed_EX_imm24 : in     vl_logic_vector(23 downto 0);
        newPC           : out    vl_logic_vector(31 downto 0)
    );
end BRANCH_ADDR_CALC;
