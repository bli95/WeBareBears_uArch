library verilog;
use verilog.vl_types.all;
library work;
entity cpu_control is
    port(
        clk             : in     vl_logic;
        opcode          : in     work.lc3b_types.lc3b_opcode;
        branch_enable   : in     vl_logic;
        immOrA_bit      : in     vl_logic;
        jsr_bit         : in     vl_logic;
        D_bit           : in     vl_logic;
        write_hb        : in     vl_logic;
        load_pc         : out    vl_logic;
        load_ir         : out    vl_logic;
        load_regfile    : out    vl_logic;
        load_mar        : out    vl_logic;
        load_mdr        : out    vl_logic;
        load_cc         : out    vl_logic;
        pcmux_sel       : out    vl_logic_vector(1 downto 0);
        adjmux_sel      : out    vl_logic;
        storemux_sel    : out    vl_logic;
        destmux_sel     : out    vl_logic;
        alumux1_sel     : out    vl_logic;
        alumux2_sel     : out    vl_logic_vector(2 downto 0);
        regfilemux_sel  : out    vl_logic_vector(1 downto 0);
        marmux_sel      : out    vl_logic_vector(1 downto 0);
        mdrmux_sel      : out    vl_logic_vector(1 downto 0);
        aluop           : out    work.lc3b_types.lc3b_aluop;
        mem_resp        : in     vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem_byte_enable : out    vl_logic_vector(1 downto 0)
    );
end cpu_control;
