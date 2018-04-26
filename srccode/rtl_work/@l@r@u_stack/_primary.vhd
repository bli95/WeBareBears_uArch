library verilog;
use verilog.vl_types.all;
entity LRU_stack is
    port(
        old_LRU         : in     vl_logic_vector(7 downto 0);
        way             : in     vl_logic_vector(1 downto 0);
        new_LRU         : out    vl_logic_vector(7 downto 0)
    );
end LRU_stack;
