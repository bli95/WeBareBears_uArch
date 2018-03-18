library verilog;
use verilog.vl_types.all;
entity extract_16 is
    port(
        data_128        : in     vl_logic_vector(127 downto 0);
        sel_mask        : in     vl_logic_vector(15 downto 0);
        data_16         : out    vl_logic_vector(15 downto 0)
    );
end extract_16;
