onerror {resume}
quietly WaveActivateNextPane {} 0
radix -hex
add wave -noupdate -label pc_reg -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data
add wave -noupdate -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/instruction
add wave -noupdate -expand -group Regfile -radix hexadecimal -childformat {{{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[7]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[6]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[5]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[4]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[3]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[2]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[1]} -radix hexadecimal} {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[0]} -radix hexadecimal}} -expand -subitemconfig {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[7]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[6]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[5]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[4]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[3]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[2]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[1]} {-height 15 -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[0]} {-height 15 -radix hexadecimal}} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data
add wave -noupdate /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/a
add wave -noupdate /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/b
add wave -noupdate /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/c
add wave -noupdate /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/d
add wave -noupdate /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/brcomp/true
add wave -noupdate -expand -group {IF/ID ctrl} -radix hexadecimal -childformat {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.opcode -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.adjmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.sr1mux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.sr2mux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.immmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.regAmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.aluBmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.aluop -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.jsrmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.marmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.wbdatamux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.load_cc -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.dstmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.load_dst -radix hexadecimal}} -expand -subitemconfig {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.opcode {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.adjmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.sr1mux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.sr2mux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.immmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.regAmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.aluBmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.aluop {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.jsrmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.marmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.wbdatamux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.load_cc {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.dstmux_sel {-height 15 -radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl.load_dst {-height 15 -radix hexadecimal}} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/load
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/reset
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_next_pc
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_pc_offset
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_dest
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_src1
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_src2
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_regA
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_regB
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_imm_val
add wave -noupdate -expand -group {ID/EX ctrl} -radix hexadecimal -childformat {{/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.opcode -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.adjmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.sr1mux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.sr2mux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.immmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.regAmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.aluBmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.aluop -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.jsrmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.marmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.wbdatamux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.load_cc -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.dstmux_sel -radix hexadecimal} {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.load_dst -radix hexadecimal}} -expand -subitemconfig {/magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.opcode {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.adjmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.sr1mux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.sr2mux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.immmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.regAmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.aluBmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.aluop {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.jsrmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.marmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.wbdatamux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.load_cc {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.dstmux_sel {-radix hexadecimal} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word.load_dst {-radix hexadecimal}} /magicmem_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_ctrl_word
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/DAT_M
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/DAT_S
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/ACK
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/CYC
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/STB
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/RTY
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/WE
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/ADR
add wave -noupdate -expand -group I-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_icache/SEL
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/DAT_M
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/DAT_S
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/ACK
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/CYC
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/STB
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/RTY
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/WE
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/ADR
add wave -noupdate -expand -group D-Cache -radix hexadecimal /magicmem_mainpc_tb/cpu_dcache/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1061605 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 346
configure wave -valuecolwidth 100
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
WaveRestoreZoom {947904 ps} {1203865 ps}