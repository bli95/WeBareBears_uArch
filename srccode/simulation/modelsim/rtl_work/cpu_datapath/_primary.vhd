library verilog;
use verilog.vl_types.all;
library work;
entity cpu_datapath is
    port(
        clk             : in     vl_logic;
        load_pc         : in     vl_logic;
        load_ir         : in     vl_logic;
        load_regfile    : in     vl_logic;
        load_mar        : in     vl_logic;
        load_mdr        : in     vl_logic;
        load_cc         : in     vl_logic;
        pcmux_sel       : in     vl_logic_vector(1 downto 0);
        adjmux_sel      : in     vl_logic;
        storemux_sel    : in     vl_logic;
        destmux_sel     : in     vl_logic;
        alumux1_sel     : in     vl_logic;
        alumux2_sel     : in     vl_logic_vector(2 downto 0);
        regfilemux_sel  : in     vl_logic_vector(1 downto 0);
        marmux_sel      : in     vl_logic_vector(1 downto 0);
        mdrmux_sel      : in     vl_logic_vector(1 downto 0);
        aluop           : in     work.lc3b_types.lc3b_aluop;
        mem_rdata       : in     vl_logic_vector(127 downto 0);
        mem_address     : out    vl_logic_vector(15 downto 0);
        mem_wdata       : out    vl_logic_vector(127 downto 0);
        opcode          : out    work.lc3b_types.lc3b_opcode;
        branch_enable   : out    vl_logic;
        immOrA_bit      : out    vl_logic;
        jsr_bit         : out    vl_logic;
        D_bit           : out    vl_logic;
        write_hb        : out    vl_logic
    );
end cpu_datapath;
