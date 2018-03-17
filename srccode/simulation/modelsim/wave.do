onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_phys_mainpc_tb/clk
add wave -noupdate /dcache_phys_mainpc_tb/clk
add wave -noupdate /dcache_phys_mainpc_tb/clk
add wave -noupdate /dcache_phys_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/clk
add wave -noupdate -label reg_0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[0]}
add wave -noupdate -label reg_1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[1]}
add wave -noupdate -label reg_2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[2]}
add wave -noupdate -label reg_3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[3]}
add wave -noupdate -label reg_4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[4]}
add wave -noupdate -label reg_5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[5]}
add wave -noupdate -label reg_6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[6]}
add wave -noupdate -label reg_7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[7]}
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/br_en
add wave -noupdate -label idex_opcode /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.opcode
add wave -noupdate -label PC -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/stall1
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/stall2
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/a
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/b
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/c
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/d
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/true
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/DAT_M
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/DAT_S
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/ACK
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/STB
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/WE
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/ADR
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_dcache/SEL
add wave -noupdate -label dcache_way0_line0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[0]}
add wave -noupdate -label exme_opcode -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/EX_ME/exme_ctrl_word.opcode
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/instruction_int
add wave -noupdate -label dcache_way0_line1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[1]}
add wave -noupdate -label dcache_way0_line2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[2]}
add wave -noupdate -label dcache_way0_line3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[3]}
add wave -noupdate -label dcache_way0_line4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[4]}
add wave -noupdate -label dcache_way0_line5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[5]}
add wave -noupdate -label dcache_way0_line6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[6]}
add wave -noupdate -label dcache_way0_line7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data[7]}
add wave -noupdate -label dcache_way1_line0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[0]}
add wave -noupdate -label dcache_way1_line1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[1]}
add wave -noupdate -label dcache_way1_line2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[2]}
add wave -noupdate -label dcache_way1_line3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[3]}
add wave -noupdate -label dcache_way1_line4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[4]}
add wave -noupdate -label dcache_way1_line5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[5]}
add wave -noupdate -label dcache_way1_line6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[6]}
add wave -noupdate -label dcache_way1_line7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data[7]}
add wave -noupdate -label icache_way0_line0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[0]}
add wave -noupdate -label icache_way0_line1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[1]}
add wave -noupdate -label icache_way0_line2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[2]}
add wave -noupdate -label icache_way0_line3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[3]}
add wave -noupdate -label icache_way0_line4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[4]}
add wave -noupdate -label icache_way0_line5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[5]}
add wave -noupdate -label icache_way0_line6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[6]}
add wave -noupdate -label icache_way0_line7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_1/data[7]}
add wave -noupdate -label icache_way1_line0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[0]}
add wave -noupdate -label icache_way1_line1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[1]}
add wave -noupdate -label icache_way1_line2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[2]}
add wave -noupdate -label icache_way1_line3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[3]}
add wave -noupdate -label icache_way1_line4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[4]}
add wave -noupdate -label icache_way1_line5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[5]}
add wave -noupdate -label icache_way1_line6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[6]}
add wave -noupdate -label icache_way1_line7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/icache/CD/DATA_2/data[7]}
add wave -noupdate -label ifid_opcode -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/opcode
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ME_WB/mewb_ctrl_word.opcode
add wave -noupdate -label instruction -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/instruction
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/DAT_M
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/DAT_S
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/ACK
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/STB
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/WE
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/ADR
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/cpu_icache/SEL
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/icache/cache_rdata
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/icache/CD/data_out
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/icache/CD/sel_mask
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/instruction
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/instruction
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pcmux/c
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pcmux/z
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rst1
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rst2
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/load
add wave -noupdate -radix hexadecimal /dcache_phys_mainpc_tb/clk
add wave -noupdate /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/EX_ME/exme_ctrl_word.opcode
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2140782 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 419
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
WaveRestoreZoom {2025745 ps} {2411906 ps}
