library verilog;
use verilog.vl_types.all;
entity dcache_ctrlr is
    port(
        clk             : in     vl_logic;
        opcode          : in     vl_logic_vector(3 downto 0);
        rw_resp         : in     vl_logic;
        resp_data_addr  : in     vl_logic_vector(15 downto 0);
        stall1          : out    vl_logic;
        addrmux_sel     : out    vl_logic;
        req_rw          : out    vl_logic;
        wr_en           : out    vl_logic;
        phase2_addr     : out    vl_logic_vector(15 downto 0);
        rst2            : out    vl_logic
    );
end dcache_ctrlr;
