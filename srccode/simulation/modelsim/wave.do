onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /full_mainpc_tb/clk
add wave -noupdate -label PC /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/pc/data
add wave -noupdate /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/IF_ID/opcode
add wave -noupdate /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ID_EX/ifid_ctrl_word.opcode
add wave -noupdate /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/EX_ME/idex_int_ctrl_word.opcode
add wave -noupdate /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/ME_WB/mewb_ctrl_word.opcode
add wave -noupdate -label Registers -expand /full_mainpc_tb/WeBareBears/main_cpu/pl_datpath/rf/data
add wave -noupdate -expand /full_mainpc_tb/WeBareBears/dcache/CD/DATA_1/data
add wave -noupdate -expand /full_mainpc_tb/WeBareBears/dcache/CD/DATA_2/data
add wave -noupdate -expand /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data
add wave -noupdate -expand /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data
add wave -noupdate /full_mainpc_tb/WeBareBears/L2_cache/CC/state
add wave -noupdate /full_mainpc_tb/WeBareBears/EWB/state
add wave -noupdate /full_mainpc_tb/WeBareBears/EWB/EWB_VALID_1/data
add wave -noupdate /full_mainpc_tb/WeBareBears/EWB/EWB_DATA_1/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199096 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 365
configure wave -valuecolwidth 218
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
WaveRestoreZoom {0 ps} {794 ps}
