library verilog;
use verilog.vl_types.all;
entity cpu_rwmod is
    port(
        \in\            : in     vl_logic_vector(15 downto 0);
        opcode          : in     vl_logic_vector(3 downto 0);
        lsb             : in     vl_logic;
        wrsel           : out    vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(15 downto 0)
    );
end cpu_rwmod;
