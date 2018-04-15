library verilog;
use verilog.vl_types.all;
entity performance_counters is
    port(
        clk             : in     vl_logic;
        data_addr       : in     vl_logic_vector(15 downto 0);
        sti_zero_cntr   : in     vl_logic;
        br_in_exstage   : in     vl_logic;
        br_en_in_exstage: in     vl_logic;
        global_stall    : in     vl_logic;
        icache_hit      : in     vl_logic;
        icache_miss     : in     vl_logic;
        dcache_hit      : in     vl_logic;
        dcache_miss     : in     vl_logic;
        l2cache_hit     : in     vl_logic;
        l2cache_miss    : in     vl_logic;
        counter_val_out : out    vl_logic_vector(15 downto 0)
    );
end performance_counters;
