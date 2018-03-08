library verilog;
use verilog.vl_types.all;
entity cache_datapath is
    port(
        clk             : in     vl_logic;
        cpu_address     : in     vl_logic_vector(11 downto 0);
        cpu_wb_sel      : in     vl_logic_vector(15 downto 0);
        cpu_wdata       : in     vl_logic_vector(127 downto 0);
        mem_rdata       : in     vl_logic_vector(127 downto 0);
        indata_muxsel   : in     vl_logic;
        outdata_muxsel  : in     vl_logic;
        memaddr_muxsel  : in     vl_logic_vector(1 downto 0);
        lru_we          : in     vl_logic;
        lru_in          : in     vl_logic;
        val_in          : in     vl_logic;
        dir_in          : in     vl_logic;
        write0          : in     vl_logic;
        write1          : in     vl_logic;
        mem_address     : out    vl_logic_vector(11 downto 0);
        mem_wdata       : out    vl_logic_vector(127 downto 0);
        cpu_rdata       : out    vl_logic_vector(127 downto 0);
        hit0            : out    vl_logic;
        hit1            : out    vl_logic;
        lru_out         : out    vl_logic;
        dir0_out        : out    vl_logic;
        dir1_out        : out    vl_logic
    );
end cache_datapath;
