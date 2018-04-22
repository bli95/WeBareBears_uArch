library verilog;
use verilog.vl_types.all;
entity L2cache is
    port(
        got_hit_likah_bih: out    vl_logic;
        miss_me_wifdat_bs: out    vl_logic;
        L2_dirty_bit    : out    vl_logic
    );
end L2cache;
