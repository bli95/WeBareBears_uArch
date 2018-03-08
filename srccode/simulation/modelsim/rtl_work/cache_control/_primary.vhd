library verilog;
use verilog.vl_types.all;
entity cache_control is
    port(
        clk             : in     vl_logic;
        cpu_req         : in     vl_logic;
        cpu_r0w1        : in     vl_logic;
        mem_resp        : in     vl_logic;
        hit0            : in     vl_logic;
        hit1            : in     vl_logic;
        lru_out         : in     vl_logic;
        dir0_out        : in     vl_logic;
        dir1_out        : in     vl_logic;
        cache_resp      : out    vl_logic;
        mem_req         : out    vl_logic;
        mem_r0w1        : out    vl_logic;
        indata_muxsel   : out    vl_logic;
        outdata_muxsel  : out    vl_logic;
        memaddr_muxsel  : out    vl_logic_vector(1 downto 0);
        lru_we          : out    vl_logic;
        lru_in          : out    vl_logic;
        val_in          : out    vl_logic;
        dir_in          : out    vl_logic;
        write0          : out    vl_logic;
        write1          : out    vl_logic
    );
end cache_control;
