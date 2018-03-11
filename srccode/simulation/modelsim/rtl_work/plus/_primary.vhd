library verilog;
use verilog.vl_types.all;
entity plus is
    generic(
        width           : integer := 16;
        operand         : integer := 2
    );
    port(
        \in\            : in     vl_logic_vector;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of operand : constant is 1;
end plus;
