library verilog;
use verilog.vl_types.all;
entity sel_bytes is
    port(
        mem_address     : in     vl_logic_vector(15 downto 0);
        mem_byte_enable : in     vl_logic_vector(1 downto 0);
        sel_mask        : out    vl_logic_vector(15 downto 0)
    );
end sel_bytes;
