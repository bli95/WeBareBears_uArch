onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_phys_mainpc_tb/clk
add wave -noupdate -expand -group Metadata -label pc -radix hexadecimal -childformat {{{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[15]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[14]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[13]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[12]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[11]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[10]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[9]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[8]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[7]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[6]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[5]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[4]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[3]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[2]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[1]} -radix hexadecimal} {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[0]} -radix hexadecimal}} -subitemconfig {{/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[15]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[14]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[13]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[12]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[11]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[10]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[9]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[8]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[7]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[6]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[5]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[4]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[3]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[2]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[1]} {-height 15 -radix hexadecimal} {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data[0]} {-height 15 -radix hexadecimal}} /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data
add wave -noupdate -expand -group Metadata -label ifid_opcode /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/opcode
add wave -noupdate -expand -group Metadata -label idex_opcode /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/idex_int_ctrl_word.opcode
add wave -noupdate -expand -group Metadata -label exme_opcode /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/EX_ME/idex_int_ctrl_word.opcode
add wave -noupdate -expand -group Metadata -label mewb_opcode /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ME_WB/exme_int_ctrl_word.opcode
add wave -noupdate -expand -group regfile -label 0 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[0]}
add wave -noupdate -expand -group regfile -label 1 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[1]}
add wave -noupdate -expand -group regfile -label 2 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[2]}
add wave -noupdate -expand -group regfile -label 3 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[3]}
add wave -noupdate -expand -group regfile -label 4 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[4]}
add wave -noupdate -expand -group regfile -label 5 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[5]}
add wave -noupdate -expand -group regfile -label 6 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[6]}
add wave -noupdate -expand -group regfile -label 7 -radix hexadecimal {/dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data[7]}
add wave -noupdate -expand -group fwd -label exme_dest -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/exme_dest
add wave -noupdate -expand -group fwd -label destmux_out -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/destmux_out
add wave -noupdate -expand -group fwd -label idex_src1 -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/idex_src1
add wave -noupdate -expand -group fwd -label idex_src2 -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/idex_src2
add wave -noupdate -expand -group fwd -label exme_ld_dest -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/exme_ld_dest
add wave -noupdate -expand -group fwd -label mewb_ld_dest -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/mewb_ld_dest
add wave -noupdate -expand -group fwd -label fwdAmux_sel -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/fwdAmux_sel
add wave -noupdate -expand -group fwd -label fwdBmux_sel -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwd/fwdBmux_sel
add wave -noupdate -expand -group fwd -label A_in_a -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdAmux/a
add wave -noupdate -expand -group fwd -label A_in_b -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdAmux/b
add wave -noupdate -expand -group fwd -label A_in_c -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdAmux/c
add wave -noupdate -expand -group fwd -label A_out -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdAmux/z
add wave -noupdate -expand -group fwd -label B_in_a -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdBmux/a
add wave -noupdate -expand -group fwd -label B_in_b -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdBmux/b
add wave -noupdate -expand -group fwd -label B_in_c -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdBmux/c
add wave -noupdate -expand -group fwd -label B_out -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/fwdBmux/z
add wave -noupdate -label aluA_in -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/alu/a
add wave -noupdate -label aluB_in -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/alu/b
add wave -noupdate -label alu_out -radix hexadecimal /dcache_phys_mainpc_tb/WeBareBears/main_cpu/pl_datpath/alu/f
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8970913 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 158
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
WaveRestoreZoom {8444395 ps} {9496427 ps}
