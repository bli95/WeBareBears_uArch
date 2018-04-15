library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        width           : integer := 16
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        increment       : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end counter;
