library verilog;
use verilog.vl_types.all;
library work;
entity pcmux_ctrlr is
    port(
        exme_opcode     : in     work.lc3b_types.lc3b_opcode;
        idex_opcode     : in     work.lc3b_types.lc3b_opcode;
        br_en           : in     vl_logic;
        pcmux_sel       : out    vl_logic_vector(1 downto 0)
    );
end pcmux_ctrlr;
