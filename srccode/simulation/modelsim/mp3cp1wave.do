onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Regfile -radix hexadecimal /mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data
add wave -noupdate -expand -group {IF/ID ctrl} -radix hexadecimal /mainpc_tb/WeBareBears/main_cpu/pl_datpath/ctrl_rom/ctrl
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/DAT_M
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/DAT_S
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/ACK
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/CYC
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/STB
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/RTY
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/WE
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/ADR
add wave -noupdate -expand -group I-Cache -radix hexadecimal /mainpc_tb/cpu_icache/SEL
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/DAT_M
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/DAT_S
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/ACK
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/CYC
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/STB
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/RTY
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/WE
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/ADR
add wave -noupdate -expand -group D-Cache -radix hexadecimal /mainpc_tb/cpu_dcache/SEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199263 ps} 0}
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
WaveRestoreZoom {199050 ps} {199874 ps}
