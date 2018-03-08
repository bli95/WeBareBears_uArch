onerror {resume}
add list -hex -notrig -width 19 -label mem_address /mainpc_tb/mem_address
add list -width 19 -label mem_write /mainpc_tb/mem_write
add list -hex -notrig -width 19 -label mem_byte_enable /mainpc_tb/mem_byte_enable
add list -hex -notrig -width 19 -label mem_wdata /mainpc_tb/mem_wdata
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
