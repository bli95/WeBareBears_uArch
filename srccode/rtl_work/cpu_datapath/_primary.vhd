library verilog;
use verilog.vl_types.all;
entity cpu_datapath is
    port(
        clk             : in     vl_logic;
        isel_mask       : in     vl_logic_vector(15 downto 0);
        dsel_mask       : in     vl_logic_vector(15 downto 0);
        icache_resp     : in     vl_logic;
        icache_rdata    : in     vl_logic_vector(127 downto 0);
        dcache_resp     : in     vl_logic;
        dcache_rdata    : in     vl_logic_vector(127 downto 0);
        stb_datmod_sel  : out    vl_logic_vector(1 downto 0);
        icache_addr     : out    vl_logic_vector(15 downto 0);
        icache_read     : out    vl_logic;
        dcache_addr     : out    vl_logic_vector(15 downto 0);
        dcache_wdata    : out    vl_logic_vector(127 downto 0);
        dcache_we_on_req: out    vl_logic;
        dcache_byte_en  : out    vl_logic_vector(15 downto 0);
        dcache_mem_req  : out    vl_logic
    );
end cpu_datapath;
