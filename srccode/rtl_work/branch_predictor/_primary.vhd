library verilog;
use verilog.vl_types.all;
entity branch_predictor is
    port(
        clk             : in     vl_logic;
        load_BR         : in     vl_logic;
        BR_taken        : in     vl_logic;
        target_offset   : in     vl_logic_vector(8 downto 0);
        current_PC      : in     vl_logic_vector(15 downto 0);
        idex_PC         : in     vl_logic_vector(15 downto 0);
        prediction      : out    vl_logic;
        target_address  : out    vl_logic_vector(15 downto 0)
    );
end branch_predictor;
