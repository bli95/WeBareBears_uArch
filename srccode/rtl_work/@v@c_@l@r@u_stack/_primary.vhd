library verilog;
use verilog.vl_types.all;
entity VC_LRU_stack is
    port(
        old_LRU         : in     vl_logic_vector(23 downto 0);
        way             : in     vl_logic_vector(2 downto 0);
        new_LRU         : out    vl_logic_vector(23 downto 0)
    );
end VC_LRU_stack;
