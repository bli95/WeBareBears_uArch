library verilog;
use verilog.vl_types.all;
entity VC_control is
    port(
        clk             : in     vl_logic;
        mem_ack         : in     vl_logic;
        L2_read         : in     vl_logic;
        L2_write        : in     vl_logic;
        L2toPmem_busy   : in     vl_logic;
        VC_hit          : in     vl_logic;
        L2_dirty_bit    : in     vl_logic;
        VC_hit_dirty    : in     vl_logic;
        VC_LRU_dirty    : in     vl_logic;
        hit_way         : in     vl_logic_vector(2 downto 0);
        LRU_out         : in     vl_logic_vector(23 downto 0);
        dirty_bits      : in     vl_logic_vector(7 downto 0);
        wb_index_out    : in     vl_logic_vector(2 downto 0);
        load_LRU        : out    vl_logic;
        load_VC         : out    vl_logic;
        load_VC_dirty   : out    vl_logic;
        VC_dirty_bit    : out    vl_logic;
        load_index      : out    vl_logic;
        VC_ack          : out    vl_logic;
        VC_write        : out    vl_logic;
        foh             : out    vl_logic;
        read_index      : out    vl_logic_vector(2 downto 0);
        write_index     : out    vl_logic_vector(2 downto 0);
        wb_index_in     : out    vl_logic_vector(2 downto 0)
    );
end VC_control;
