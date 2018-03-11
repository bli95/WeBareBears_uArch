library verilog;
use verilog.vl_types.all;
entity mewb_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(49 downto 0);
        mewb_wbdata     : out    vl_logic_vector(15 downto 0);
        mewb_dest       : out    vl_logic_vector(2 downto 0);
        mewb_src1       : out    vl_logic_vector(2 downto 0);
        mewb_src2       : out    vl_logic_vector(2 downto 0);
        mewb_ctrl_word  : out    vl_logic_vector(24 downto 0)
    );
end mewb_pipe;
