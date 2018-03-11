library verilog;
use verilog.vl_types.all;
entity exme_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(83 downto 0);
        exme_next_pc    : out    vl_logic_vector(15 downto 0);
        exme_mar        : out    vl_logic_vector(15 downto 0);
        exme_mdr        : out    vl_logic_vector(15 downto 0);
        exme_sel        : out    vl_logic_vector(1 downto 0);
        exme_dest       : out    vl_logic_vector(2 downto 0);
        exme_src1       : out    vl_logic_vector(2 downto 0);
        exme_src2       : out    vl_logic_vector(2 downto 0);
        exme_ctrl_word  : out    vl_logic_vector(24 downto 0)
    );
end exme_pipe;
