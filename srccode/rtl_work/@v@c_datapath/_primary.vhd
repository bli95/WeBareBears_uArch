library verilog;
use verilog.vl_types.all;
entity VC_datapath is
    port(
        clk             : in     vl_logic;
        read_index      : in     vl_logic_vector(2 downto 0);
        write_index     : in     vl_logic_vector(2 downto 0);
        wb_index_in     : in     vl_logic_vector(2 downto 0);
        L2_address      : in     vl_logic_vector(11 downto 0);
        L2_data         : in     vl_logic_vector(127 downto 0);
        load_VC         : in     vl_logic;
        load_VC_dirty   : in     vl_logic;
        load_LRU        : in     vl_logic;
        L2_read         : in     vl_logic;
        VC_dirty_bit    : in     vl_logic;
        VC_write        : in     vl_logic;
        load_index      : in     vl_logic;
        VC_hit          : out    vl_logic;
        VC_hit_dirty    : out    vl_logic;
        VC_LRU_dirty    : out    vl_logic;
        hit_way         : out    vl_logic_vector(2 downto 0);
        LRU_out         : out    vl_logic_vector(23 downto 0);
        wb_address      : out    vl_logic_vector(11 downto 0);
        wb_data         : out    vl_logic_vector(127 downto 0);
        rb_data         : out    vl_logic_vector(127 downto 0);
        wb_index_out    : out    vl_logic_vector(2 downto 0);
        dirty_bits      : out    vl_logic_vector(7 downto 0)
    );
end VC_datapath;
