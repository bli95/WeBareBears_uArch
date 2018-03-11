library verilog;
use verilog.vl_types.all;
entity idex_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(113 downto 0);
        idex_next_pc    : out    vl_logic_vector(15 downto 0);
        idex_pc_offset  : out    vl_logic_vector(15 downto 0);
        idex_dest       : out    vl_logic_vector(2 downto 0);
        idex_src1       : out    vl_logic_vector(2 downto 0);
        idex_src2       : out    vl_logic_vector(2 downto 0);
        idex_regA       : out    vl_logic_vector(15 downto 0);
        idex_regB       : out    vl_logic_vector(15 downto 0);
        idex_imm_val    : out    vl_logic_vector(15 downto 0);
        idex_ctrl_word  : out    vl_logic_vector(24 downto 0)
    );
end idex_pipe;
