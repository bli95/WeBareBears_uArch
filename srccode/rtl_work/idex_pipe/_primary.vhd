library verilog;
use verilog.vl_types.all;
library work;
entity idex_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        ifid_next_pc    : in     vl_logic_vector(15 downto 0);
        adjmux_out      : in     vl_logic_vector(15 downto 0);
        regAmux_out     : in     vl_logic_vector(15 downto 0);
        reg2_out        : in     vl_logic_vector(15 downto 0);
        immvalmux_out   : in     vl_logic_vector(15 downto 0);
        ifid_dest       : in     vl_logic_vector(2 downto 0);
        ifid_src1       : in     vl_logic_vector(2 downto 0);
        ifid_src2       : in     vl_logic_vector(2 downto 0);
        ifid_ctrl_word  : in     work.lc3b_types.lc3b_control_word;
        idex_next_pc    : out    vl_logic_vector(15 downto 0);
        idex_pc_offset  : out    vl_logic_vector(15 downto 0);
        idex_dest       : out    vl_logic_vector(2 downto 0);
        idex_src1       : out    vl_logic_vector(2 downto 0);
        idex_src2       : out    vl_logic_vector(2 downto 0);
        idex_regA       : out    vl_logic_vector(15 downto 0);
        idex_regB       : out    vl_logic_vector(15 downto 0);
        idex_imm_val    : out    vl_logic_vector(15 downto 0);
        idex_ctrl_word  : out    work.lc3b_types.lc3b_control_word
    );
end idex_pipe;
