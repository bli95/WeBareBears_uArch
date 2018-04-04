library verilog;
use verilog.vl_types.all;
library work;
entity fwd_unit is
    port(
        exme_dest       : in     vl_logic_vector(2 downto 0);
        destmux_out     : in     vl_logic_vector(2 downto 0);
        idex_src1       : in     vl_logic_vector(2 downto 0);
        idex_src2       : in     vl_logic_vector(2 downto 0);
        idex_dest       : in     vl_logic_vector(2 downto 0);
        idex_opcode     : in     work.lc3b_types.lc3b_opcode;
        hold_reg_out    : in     vl_logic_vector(19 downto 0);
        exme_ld_dest    : in     vl_logic;
        mewb_ld_dest    : in     vl_logic;
        bit_5           : in     vl_logic;
        bit_11          : in     vl_logic;
        stall1          : in     vl_logic;
        fwdAmux_sel     : out    vl_logic_vector(2 downto 0);
        fwdBmux_sel     : out    vl_logic_vector(2 downto 0);
        fwdCmux_sel     : out    vl_logic_vector(1 downto 0)
    );
end fwd_unit;
