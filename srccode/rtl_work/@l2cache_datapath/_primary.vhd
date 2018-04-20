library verilog;
use verilog.vl_types.all;
entity L2cache_datapath is
    port(
        clk             : in     vl_logic;
        R_W             : in     vl_logic;
        load_data_1     : in     vl_logic;
        load_data_2     : in     vl_logic;
        load_data_3     : in     vl_logic;
        load_data_4     : in     vl_logic;
        dirty_bit       : in     vl_logic;
        load_dirty_1    : in     vl_logic;
        load_dirty_2    : in     vl_logic;
        load_dirty_3    : in     vl_logic;
        load_dirty_4    : in     vl_logic;
        load_LRU        : in     vl_logic;
        LRU_way         : in     vl_logic_vector(1 downto 0);
        way1_hit        : out    vl_logic;
        way2_hit        : out    vl_logic;
        way3_hit        : out    vl_logic;
        way4_hit        : out    vl_logic;
        read_hit        : out    vl_logic;
        write_hit       : out    vl_logic;
        LRU_out         : out    vl_logic_vector(7 downto 0);
        dirty_out       : out    vl_logic;
        data_out        : out    vl_logic_vector(127 downto 0);
        mem_rdata       : in     vl_logic_vector(127 downto 0);
        mem_address     : out    vl_logic_vector(15 downto 0);
        mem_wdata       : out    vl_logic_vector(127 downto 0);
        mem_byte_enable : out    vl_logic_vector(1 downto 0);
        cache_read      : in     vl_logic;
        cache_write     : in     vl_logic;
        cache_byte_enable: in     vl_logic_vector(1 downto 0);
        cache_address   : in     vl_logic_vector(15 downto 0);
        cache_wdata     : in     vl_logic_vector(127 downto 0);
        cache_rdata     : out    vl_logic_vector(15 downto 0)
    );
end L2cache_datapath;
