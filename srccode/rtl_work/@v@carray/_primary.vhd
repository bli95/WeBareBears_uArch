library verilog;
use verilog.vl_types.all;
entity VCarray is
    generic(
        width           : integer := 128
    );
    port(
        clk             : in     vl_logic;
        write           : in     vl_logic;
        read_index      : in     vl_logic_vector(2 downto 0);
        write_index     : in     vl_logic_vector(2 downto 0);
        wb_index_out    : in     vl_logic_vector(2 downto 0);
        datain          : in     vl_logic_vector;
        dataout1        : out    vl_logic_vector;
        dataout2        : out    vl_logic_vector;
        dataout3        : out    vl_logic_vector;
        dataout4        : out    vl_logic_vector;
        dataout5        : out    vl_logic_vector;
        dataout6        : out    vl_logic_vector;
        dataout7        : out    vl_logic_vector;
        dataout8        : out    vl_logic_vector;
        rdataout        : out    vl_logic_vector;
        wdataout        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end VCarray;
