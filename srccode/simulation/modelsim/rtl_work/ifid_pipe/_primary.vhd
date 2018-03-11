library verilog;
use verilog.vl_types.all;
library work;
entity ifid_pipe is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        reset           : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0);
        ifid_next_pc    : out    vl_logic_vector(15 downto 0);
        opcode          : out    work.lc3b_types.lc3b_opcode;
        bit_4           : out    vl_logic;
        bit_5           : out    vl_logic;
        bit_11          : out    vl_logic;
        ifid_dest       : out    vl_logic_vector(2 downto 0);
        ifid_src1       : out    vl_logic_vector(2 downto 0);
        ifid_src2       : out    vl_logic_vector(2 downto 0);
        ifid_imm4       : out    vl_logic_vector(3 downto 0);
        ifid_imm5       : out    vl_logic_vector(4 downto 0);
        ifid_offset6    : out    vl_logic_vector(5 downto 0);
        ifid_offset9    : out    vl_logic_vector(8 downto 0);
        ifid_offset11   : out    vl_logic_vector(10 downto 0);
        ifid_trapvect8  : out    vl_logic_vector(7 downto 0)
    );
end ifid_pipe;
