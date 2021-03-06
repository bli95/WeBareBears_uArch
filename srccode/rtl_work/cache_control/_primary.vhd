library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        mem_resp        : in     vl_logic;
        cache_read      : in     vl_logic;
        cache_write     : in     vl_logic;
        read_hit        : in     vl_logic;
        write_hit       : in     vl_logic;
        way1_hit        : in     vl_logic;
        way2_hit        : in     vl_logic;
        LRU_out         : in     vl_logic;
        dirty_out       : in     vl_logic;
        cache_resp      : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_done        : out    vl_logic;
        R_W             : out    vl_logic;
        load_data_1     : out    vl_logic;
        load_data_2     : out    vl_logic;
        dirty_bit       : out    vl_logic;
        load_dirty_1    : out    vl_logic;
        load_dirty_2    : out    vl_logic;
        load_LRU        : out    vl_logic;
        LRU_in          : out    vl_logic;
        got_hit_likah_bih: out    vl_logic;
        miss_me_wifdat_bs: out    vl_logic
    );
end cache_control;
