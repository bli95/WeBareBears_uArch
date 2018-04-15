library verilog;
use verilog.vl_types.all;
entity cache is
    port(
        level           : in     vl_logic;
        got_hit_likah_bih: out    vl_logic;
        miss_me_wifdat_bs: out    vl_logic
    );
end cache;
