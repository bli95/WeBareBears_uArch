library verilog;
use verilog.vl_types.all;
entity extend_128 is
    port(
        data_old_128    : in     vl_logic_vector(127 downto 0);
        sel_mask        : in     vl_logic_vector(15 downto 0);
        data_16         : in     vl_logic_vector(15 downto 0);
        data_new_128    : out    vl_logic_vector(127 downto 0)
    );
end extend_128;
