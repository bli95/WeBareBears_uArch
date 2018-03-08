library verilog;
use verilog.vl_types.all;
entity inserter is
    port(
        \in\            : in     vl_logic_vector(127 downto 0);
        wdata           : in     vl_logic_vector(127 downto 0);
        insel           : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(127 downto 0)
    );
end inserter;
