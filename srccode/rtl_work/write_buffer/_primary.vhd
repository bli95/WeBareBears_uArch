library verilog;
use verilog.vl_types.all;
entity write_buffer is
    port(
        clk             : in     vl_logic;
        w_data_in       : in     vl_logic_vector(127 downto 0);
        w_addr_in       : in     vl_logic_vector(11 downto 0);
        mem_ack         : in     vl_logic;
        L2_req          : in     vl_logic;
        w_data_out      : out    vl_logic_vector(127 downto 0);
        w_addr_out      : out    vl_logic_vector(11 downto 0);
        EWB_ack         : out    vl_logic;
        EWB_req         : out    vl_logic
    );
end write_buffer;
