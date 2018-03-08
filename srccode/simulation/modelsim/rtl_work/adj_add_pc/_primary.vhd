library verilog;
use verilog.vl_types.all;
entity adj_add_pc is
    port(
        pc_in           : in     vl_logic_vector(15 downto 0);
        adj_in          : in     vl_logic_vector(15 downto 0);
        add_out         : out    vl_logic_vector(15 downto 0)
    );
end adj_add_pc;
