library verilog;
use verilog.vl_types.all;
entity eq_and_neq_comp is
    generic(
        eqwidth         : integer := 3;
        neqwidth        : integer := 4
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        c               : in     vl_logic_vector;
        d               : in     vl_logic_vector;
        true            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of eqwidth : constant is 1;
    attribute mti_svvh_generic_type of neqwidth : constant is 1;
end eq_and_neq_comp;
