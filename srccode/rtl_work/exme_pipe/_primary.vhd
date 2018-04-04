library verilog;
use verilog.vl_types.all;
library work;
entity exme_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        idex_next_pc    : in     vl_logic_vector(15 downto 0);
        marmux_out      : in     vl_logic_vector(15 downto 0);
        stb_datmod_out  : in     vl_logic_vector(15 downto 0);
        stb_datmod_sel  : in     vl_logic_vector(1 downto 0);
        idex_dest       : in     vl_logic_vector(2 downto 0);
        idex_src1       : in     vl_logic_vector(2 downto 0);
        idex_src2       : in     vl_logic_vector(2 downto 0);
        idex_ctrl_word  : in     work.lc3b_types.lc3b_control_word;
        exme_next_pc    : out    vl_logic_vector(15 downto 0);
        exme_mar        : out    vl_logic_vector(15 downto 0);
        exme_mdr        : out    vl_logic_vector(15 downto 0);
        exme_sel        : out    vl_logic_vector(1 downto 0);
        exme_dest       : out    vl_logic_vector(2 downto 0);
        exme_src1       : out    vl_logic_vector(2 downto 0);
        exme_src2       : out    vl_logic_vector(2 downto 0);
        exme_ctrl_word  : out    work.lc3b_types.lc3b_control_word
    );
end exme_pipe;
