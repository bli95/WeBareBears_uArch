library verilog;
use verilog.vl_types.all;
entity VC_LRU_array is
    generic(
        width           : integer := 24
    );
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end VC_LRU_array;
