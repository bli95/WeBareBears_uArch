library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        icache_hit      : in     vl_logic;
        icache_miss     : in     vl_logic;
        dcache_hit      : in     vl_logic;
        dcache_miss     : in     vl_logic;
        l2cache_hit     : in     vl_logic;
        l2cache_miss    : in     vl_logic
    );
end cpu;
