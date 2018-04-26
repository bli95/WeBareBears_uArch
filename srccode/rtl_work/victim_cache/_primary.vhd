library verilog;
use verilog.vl_types.all;
entity victim_cache is
    port(
        clk             : in     vl_logic;
        L2_data         : in     vl_logic_vector(127 downto 0);
        L2_address      : in     vl_logic_vector(11 downto 0);
        mem_ack         : in     vl_logic;
        L2_read         : in     vl_logic;
        L2_write        : in     vl_logic;
        L2toPmem_busy   : in     vl_logic;
        L2_dirty_bit    : in     vl_logic;
        wb_data         : out    vl_logic_vector(127 downto 0);
        rb_data         : out    vl_logic_vector(127 downto 0);
        wb_address      : out    vl_logic_vector(11 downto 0);
        VC_ack          : out    vl_logic;
        VC_write        : out    vl_logic;
        foh             : out    vl_logic
    );
end victim_cache;
