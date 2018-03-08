onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label cpu_clk -radix hexadecimal /mainpc_tb/dut/cpu/clk
add wave -noupdate -label cpu_address -radix hexadecimal /mainpc_tb/dut/cpu/mem_address
add wave -noupdate -label cpu_read -radix hexadecimal /mainpc_tb/dut/cpu/mem_read
add wave -noupdate -label cpu_rdata -radix hexadecimal /mainpc_tb/dut/cpu/mem_rdata
add wave -noupdate -label cpu_write -radix hexadecimal /mainpc_tb/dut/cpu/mem_write
add wave -noupdate -label cpu_wdata -radix hexadecimal /mainpc_tb/dut/cpu/mem_wdata
add wave -noupdate -label registers -radix hexadecimal -childformat {{{/mainpc_tb/dut/cpu/dp/rf/data[7]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[6]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[5]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[4]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[3]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[2]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[1]} -radix hexadecimal} {{/mainpc_tb/dut/cpu/dp/rf/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mainpc_tb/dut/cpu/dp/rf/data[7]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[6]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[5]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[4]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[3]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[2]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[1]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cpu/dp/rf/data[0]} {-height 15 -radix hexadecimal}} /mainpc_tb/dut/cpu/dp/rf/data
add wave -noupdate -label opcode -radix hexadecimal /mainpc_tb/dut/cpu/dp/opcode
add wave -noupdate -label state -radix hexadecimal /mainpc_tb/dut/cpu/ctr/state
add wave -noupdate -label wr0 -radix hexadecimal /mainpc_tb/dut/cache/dp/write0
add wave -noupdate -label wr1 -radix hexadecimal /mainpc_tb/dut/cache/dp/write1
add wave -noupdate -label hit0 /mainpc_tb/dut/cache/hit0
add wave -noupdate -label hit1 /mainpc_tb/dut/cache/hit1
add wave -noupdate -label cache_state /mainpc_tb/dut/cache/ctr/state
add wave -noupdate -label mem_adr -radix hexadecimal /mainpc_tb/wb/ADR
add wave -noupdate -label mem_rdata -radix hexadecimal /mainpc_tb/wb/DAT_S
add wave -noupdate -label mem_wdata -radix hexadecimal /mainpc_tb/wb/DAT_M
add wave -noupdate -label data0 -radix hexadecimal -childformat {{{/mainpc_tb/dut/cache/dp/data0/data[7]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[6]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[5]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[4]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[3]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[2]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[1]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data0/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mainpc_tb/dut/cache/dp/data0/data[7]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[6]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[5]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[4]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[3]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[2]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[1]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data0/data[0]} {-height 15 -radix hexadecimal}} /mainpc_tb/dut/cache/dp/data0/data
add wave -noupdate -label data1 -radix hexadecimal -childformat {{{/mainpc_tb/dut/cache/dp/data1/data[7]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[6]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[5]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[4]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[3]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[2]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[1]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/data1/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/mainpc_tb/dut/cache/dp/data1/data[7]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[6]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[5]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[4]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[3]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[2]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[1]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/data1/data[0]} {-height 15 -radix hexadecimal}} /mainpc_tb/dut/cache/dp/data1/data
add wave -noupdate -label lru /mainpc_tb/dut/cache/dp/lru/data
add wave -noupdate -label dirty0 /mainpc_tb/dut/cache/dp/dirty0/data
add wave -noupdate -label dirty1 /mainpc_tb/dut/cache/dp/dirty1/data
add wave -noupdate -label tag0 -radix hexadecimal -childformat {{{/mainpc_tb/dut/cache/dp/tag0/data[7]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[6]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[5]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[4]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[3]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[2]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[1]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag0/data[0]} -radix hexadecimal}} -subitemconfig {{/mainpc_tb/dut/cache/dp/tag0/data[7]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[6]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[5]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[4]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[3]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[2]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[1]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag0/data[0]} {-height 15 -radix hexadecimal}} /mainpc_tb/dut/cache/dp/tag0/data
add wave -noupdate -label tag1 -radix hexadecimal -childformat {{{/mainpc_tb/dut/cache/dp/tag1/data[7]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[6]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[5]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[4]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[3]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[2]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[1]} -radix hexadecimal} {{/mainpc_tb/dut/cache/dp/tag1/data[0]} -radix hexadecimal}} -subitemconfig {{/mainpc_tb/dut/cache/dp/tag1/data[7]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[6]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[5]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[4]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[3]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[2]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[1]} {-height 15 -radix hexadecimal} {/mainpc_tb/dut/cache/dp/tag1/data[0]} {-height 15 -radix hexadecimal}} /mainpc_tb/dut/cache/dp/tag1/data
add wave -noupdate -label pc_out -radix hexadecimal /mainpc_tb/dut/cpu/dp/pc_out
add wave -noupdate -label cpu_cache.CLK -radix hexadecimal /mainpc_tb/dut/cpu_cache/CLK
add wave -noupdate -label cpu_cache.DAT_M -radix hexadecimal /mainpc_tb/dut/cpu_cache/DAT_M
add wave -noupdate -label cpu_cache.DAT_S -radix hexadecimal /mainpc_tb/dut/cpu_cache/DAT_S
add wave -noupdate -label cpu_cache.ACK -radix hexadecimal /mainpc_tb/dut/cpu_cache/ACK
add wave -noupdate -label cpu_cache.CYC -radix hexadecimal /mainpc_tb/dut/cpu_cache/CYC
add wave -noupdate -label cpu_cache.STB -radix hexadecimal /mainpc_tb/dut/cpu_cache/STB
add wave -noupdate -label cpu_cache.RTY -radix hexadecimal /mainpc_tb/dut/cpu_cache/RTY
add wave -noupdate -label cpu_cache.WE -radix hexadecimal /mainpc_tb/dut/cpu_cache/WE
add wave -noupdate -label cpu_cache.ADR -radix hexadecimal /mainpc_tb/dut/cpu_cache/ADR
add wave -noupdate -label cpu_cache.SEL -radix hexadecimal /mainpc_tb/dut/cpu_cache/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3129266 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 131
configure wave -valuecolwidth 204
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {3564843 ps} {4526528 ps}
