library verilog;
use verilog.vl_types.all;
entity BR_array is
    generic(
        width           : integer := 2
    );
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        read_index      : in     vl_logic_vector(5 downto 0);
        write_index     : in     vl_logic_vector(5 downto 0);
        datain          : in     vl_logic_vector;
        dataout         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end BR_array;
