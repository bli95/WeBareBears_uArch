library verilog;
use verilog.vl_types.all;
entity L2cache_control is
    port(
        clk             : in     vl_logic;
        mem_resp        : in     vl_logic;
        cache_read      : in     vl_logic;
        cache_write     : in     vl_logic;
        read_hit        : in     vl_logic;
        write_hit       : in     vl_logic;
        way1_hit        : in     vl_logic;
        way2_hit        : in     vl_logic;
        way3_hit        : in     vl_logic;
        way4_hit        : in     vl_logic;
        dirty_out       : in     vl_logic;
        LRU_out         : in     vl_logic_vector(7 downto 0);
        cache_resp      : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        R_W             : out    vl_logic;
        load_data_1     : out    vl_logic;
        load_data_2     : out    vl_logic;
        load_data_3     : out    vl_logic;
        load_data_4     : out    vl_logic;
        dirty_bit       : out    vl_logic;
        load_dirty_1    : out    vl_logic;
        load_dirty_2    : out    vl_logic;
        load_dirty_3    : out    vl_logic;
        load_dirty_4    : out    vl_logic;
        load_LRU        : out    vl_logic;
        LRU_way         : out    vl_logic_vector(1 downto 0);
        got_hit_likah_bih: out    vl_logic;
        miss_me_wifdat_bs: out    vl_logic
    );
end L2cache_control;
