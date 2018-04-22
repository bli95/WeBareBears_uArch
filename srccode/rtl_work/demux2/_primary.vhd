library verilog;
use verilog.vl_types.all;
entity demux2 is
    generic(
        width           : integer := 128
    );
    port(
        sel             : in     vl_logic;
        a               : in     vl_logic_vector;
        y               : out    vl_logic_vector;
        z               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end demux2;
