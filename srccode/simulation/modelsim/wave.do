onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_phys_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/clk
add wave -noupdate -label pc -radix hexadecimal -childformat {{{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[15]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[14]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[13]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[12]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[11]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[10]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[9]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[8]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[7]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[6]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[5]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[4]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[3]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[2]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[1]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[0]} -radix hexadecimal}} -subitemconfig {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[15]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[14]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[13]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[12]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[11]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[10]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[9]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[8]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[7]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[6]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[5]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[4]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[3]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[2]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[1]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[0]} {-height 15 -radix hexadecimal}} /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data
add wave -noupdate -label ifid_opcode -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/opcode
add wave -noupdate -label idex_opcode -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_int_ctrl_word.opcode
add wave -noupdate -label exme_opcode -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/EX_ME/idex_int_ctrl_word.opcode
add wave -noupdate -label mewb_opcode -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ME_WB/exme_int_ctrl_word.opcode
add wave -noupdate -label 0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[0]}
add wave -noupdate -label 1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[1]}
add wave -noupdate -label 2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[2]}
add wave -noupdate -label 3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[3]}
add wave -noupdate -label 4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[4]}
add wave -noupdate -label 5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[5]}
add wave -noupdate -label 6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[6]}
add wave -noupdate -label 7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[7]}
add wave -noupdate -expand -group arbiter_L2cache -label arbiter_L2cache/DAT_M -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/arbiter_L2cache/DAT_M
add wave -noupdate -expand -group arbiter_L2cache -label arbiter_L2cache/DAT_S -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/arbiter_L2cache/DAT_S
add wave -noupdate -expand -group arbiter_L2cache -label arbiter_L2cache/ACK -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/arbiter_L2cache/ACK
add wave -noupdate -expand -group arbiter_L2cache -label arbiter_L2cache/STB -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/arbiter_L2cache/STB
add wave -noupdate -expand -group arbiter_L2cache -label arbiter_L2cache/WE -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/arbiter_L2cache/WE
add wave -noupdate -expand -group arbiter_L2cache -label arbiter_L2cache/ADR -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/arbiter_L2cache/ADR
add wave -noupdate -expand -group L2cache_ewb -label L2cache_ewb/DAT_M -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2cache_ewb/DAT_M
add wave -noupdate -expand -group L2cache_ewb -label L2cache_ewb/DAT_S -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2cache_ewb/DAT_S
add wave -noupdate -expand -group L2cache_ewb -label L2cache_ewb/ACK -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2cache_ewb/ACK
add wave -noupdate -expand -group L2cache_ewb -label L2cache_ewb/STB -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2cache_ewb/STB
add wave -noupdate -expand -group L2cache_ewb -label L2cache_ewb/WE -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2cache_ewb/WE
add wave -noupdate -expand -group L2cache_ewb -label L2cache_ewb/ADR -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2cache_ewb/ADR
add wave -noupdate -expand -group L2cache_ewb -label L2_cache/CC/state -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2_cache/CC/state
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/L2_cache/load_data_1
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/L2_cache/load_data_2
add wave -noupdate -expand -group EWB -label EWB/L2_req -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/L2_req
add wave -noupdate -expand -group EWB -label EWB/EWB_ack -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/EWB_ack
add wave -noupdate -expand -group EWB -label EWB/load_d -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/load_d
add wave -noupdate -expand -group EWB -label EWB/L2_hit /dcache_phys_mainpc_tb/WeBareBears/EWB/L2_hit
add wave -noupdate -expand -group EWB -label EWB_DATA_1/data -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/EWB_DATA_1/data
add wave -noupdate -expand -group EWB -label EWB_VALID_1/data -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/EWB_VALID_1/data
add wave -noupdate -expand -group EWB -label EWB_ADDR_1/data -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/EWB_ADDR_1/data
add wave -noupdate -label EWB/state -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/state
add wave -noupdate -expand -group EWB_mem -label EWB_mem/DAT_M -radix hexadecimal /dcache_phys_mainpc_tb/EWB_mem/DAT_M
add wave -noupdate -expand -group EWB_mem -label EWB_mem/DAT_S -radix hexadecimal /dcache_phys_mainpc_tb/EWB_mem/DAT_S
add wave -noupdate -expand -group EWB_mem -label EWB_mem/ACK -radix hexadecimal /dcache_phys_mainpc_tb/EWB_mem/ACK
add wave -noupdate -expand -group EWB_mem -label EWB_mem/STB -radix hexadecimal /dcache_phys_mainpc_tb/EWB_mem/STB
add wave -noupdate -expand -group EWB_mem -label EWB_mem/WE -radix hexadecimal /dcache_phys_mainpc_tb/EWB_mem/WE
add wave -noupdate -expand -group EWB_mem -label EWB_mem/ADR -radix hexadecimal /dcache_phys_mainpc_tb/EWB_mem/ADR
add wave -noupdate -expand -group L2cache -label way0_line0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[0]}
add wave -noupdate -expand -group L2cache -label way0_line1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[1]}
add wave -noupdate -expand -group L2cache -label way0_line2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[2]}
add wave -noupdate -expand -group L2cache -label way0_line3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[3]}
add wave -noupdate -expand -group L2cache -label way0_line4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[4]}
add wave -noupdate -expand -group L2cache -label way0_line5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[5]}
add wave -noupdate -expand -group L2cache -label way0_line6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[6]}
add wave -noupdate -expand -group L2cache -label way0_line7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[7]}
add wave -noupdate -expand -group L2cache -label way1_line0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[0]}
add wave -noupdate -expand -group L2cache -label way1_line1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[1]}
add wave -noupdate -expand -group L2cache -label way1_line2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[2]}
add wave -noupdate -expand -group L2cache -label way1_line3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[3]}
add wave -noupdate -expand -group L2cache -label way1_line4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[4]}
add wave -noupdate -expand -group L2cache -label way1_line5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[5]}
add wave -noupdate -expand -group L2cache -label way1_line6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[6]}
add wave -noupdate -label way1_line7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[7]}
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/EWB/load_v
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/data_in
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/L2_cache/cache_read
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/L2_cache/cache_write
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/L2_cache/CD/MEM_ADDRESS/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1341807 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 397
configure wave -valuecolwidth 232
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
WaveRestoreZoom {1104884 ps} {1456860 ps}
