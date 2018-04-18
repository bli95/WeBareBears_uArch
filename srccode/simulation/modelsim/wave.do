onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /full_mainpc_tb/clk
add wave -noupdate /full_mainpc_tb/clk
add wave -noupdate -expand -group Metadata -label PC -radix hexadecimal /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data
add wave -noupdate -expand -group Metadata -label IF_ID_opcode -radix hexadecimal /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/opcode
add wave -noupdate -expand -group Metadata -label ID_EX_opcode -radix hexadecimal /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/ifid_ctrl_word.opcode
add wave -noupdate -expand -group Metadata -label EX_ME_opcode -radix hexadecimal /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/EX_ME/idex_int_ctrl_word.opcode
add wave -noupdate -expand -group Metadata -label ME_WB_opcode -radix hexadecimal /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ME_WB/mewb_ctrl_word.opcode
add wave -noupdate -expand -group Registers -label Reg_0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[0]}
add wave -noupdate -expand -group Registers -label Reg_1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[1]}
add wave -noupdate -expand -group Registers -label Reg_2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[2]}
add wave -noupdate -expand -group Registers -label Reg_3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[3]}
add wave -noupdate -expand -group Registers -label Reg_4 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[4]}
add wave -noupdate -expand -group Registers -label Reg_5 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[5]}
add wave -noupdate -expand -group Registers -label Reg_6 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[6]}
add wave -noupdate -expand -group Registers -label Reg_7 -radix hexadecimal {/full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[7]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[0]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[1]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[2]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[3]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line4 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[4]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line5 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[5]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line6 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[6]}
add wave -noupdate -expand -group L1_dcache_way0 -label way0_line7 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[7]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[0]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[1]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[2]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[3]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line4 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[4]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line5 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[5]}
add wave -noupdate -expand -group L1_dcache_way1 -label way1_line7 -radix hexadecimal {/full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[7]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[0]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[1]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[2]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[3]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line4 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[4]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line5 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[5]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line6 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[6]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line7 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[7]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[0]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[1]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[2]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[3]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line4 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[4]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line5 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[5]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line6 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[6]}
add wave -noupdate -expand -group L2cache_way1 -label way1_line7 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[7]}
add wave -noupdate -label L2cache_state -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CC/state
add wave -noupdate -expand -group EWB -label EWB_valid /full_mainpc_tb/WeBareBears/EWB/EWB_VALID_1/data
add wave -noupdate -expand -group EWB -label EWB_address -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/EWB_ADDR_1/data
add wave -noupdate -expand -group EWB -label EWB_data -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/EWB_DATA_1/data
add wave -noupdate -expand -group EWB -label EWB_state -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/state
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/DAT_M -radix hexadecimal /full_mainpc_tb/EWB_mem/DAT_M
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/DAT_S -radix hexadecimal /full_mainpc_tb/EWB_mem/DAT_S
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/ACK -radix hexadecimal /full_mainpc_tb/EWB_mem/ACK
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/ADR -radix hexadecimal /full_mainpc_tb/EWB_mem/ADR
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/STB -radix hexadecimal /full_mainpc_tb/EWB_mem/STB
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/WE -radix hexadecimal /full_mainpc_tb/EWB_mem/WE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5877817 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 138
configure wave -valuecolwidth 221
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
WaveRestoreZoom {25265576 ps} {34289014 ps}
