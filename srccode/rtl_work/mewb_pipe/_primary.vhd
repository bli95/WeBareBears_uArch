library verilog;
use verilog.vl_types.all;
library work;
entity mewb_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        wbdatamux_out   : in     vl_logic_vector(15 downto 0);
        exme_dest       : in     vl_logic_vector(2 downto 0);
        exme_src1       : in     vl_logic_vector(2 downto 0);
        exme_src2       : in     vl_logic_vector(2 downto 0);
        exme_ctrl_word  : in     work.lc3b_types.lc3b_control_word;
        mewb_wbdata     : out    vl_logic_vector(15 downto 0);
        mewb_dest       : out    vl_logic_vector(2 downto 0);
        mewb_src1       : out    vl_logic_vector(2 downto 0);
        mewb_src2       : out    vl_logic_vector(2 downto 0);
        mewb_ctrl_word  : out    work.lc3b_types.lc3b_control_word
    );
end mewb_pipe;
