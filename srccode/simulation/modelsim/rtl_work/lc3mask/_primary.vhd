library verilog;
use verilog.vl_types.all;
entity lc3mask is
    generic(
        outwidth        : integer := 8
    );
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        byte_select     : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of outwidth : constant is 1;
end lc3mask;
