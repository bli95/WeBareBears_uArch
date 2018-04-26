onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /full_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /full_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /full_mainpc_tb/clk
add wave -noupdate -label clk -radix hexadecimal /full_mainpc_tb/clk
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
add wave -noupdate -expand -group L2cache_way0 -label way0_line0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[0]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[1]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[2]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[3]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line4 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[4]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line5 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[5]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line6 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[6]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line7 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[7]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line8 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[8]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line9 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[9]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line10 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[10]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line11 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[11]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line12 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[12]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line13 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[13]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line14 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[14]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line15 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[15]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line16 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[16]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line17 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[17]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line18 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[18]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line19 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[19]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line20 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[20]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line21 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[21]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line22 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[22]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line23 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[23]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line24 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[24]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line25 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[25]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line26 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[26]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line27 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[27]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line28 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[28]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line29 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[29]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line30 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[30]}
add wave -noupdate -expand -group L2cache_way0 -label way0_line31 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[31]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[0]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[1]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[2]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[3]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[4]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[5]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[6]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[7]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[8]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[9]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[10]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[11]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[12]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[13]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[14]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[15]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[16]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[17]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[18]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[19]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[20]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[21]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[22]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[23]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[24]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[25]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[26]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[27]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[28]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[29]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[30]}
add wave -noupdate -expand -group L2cache_way1 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_2/data[31]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[0]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[1]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[2]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[3]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[4]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[5]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[6]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[7]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[8]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[9]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[10]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[11]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[12]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[13]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[14]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[15]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[16]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[17]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[18]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[19]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[20]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[21]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[22]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[23]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[24]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[25]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[26]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[27]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[28]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[29]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[30]}
add wave -noupdate -expand -group L2cache_way2 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_3/data[31]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[0]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[1]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[2]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[3]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[4]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[5]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[6]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[7]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[8]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[9]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[10]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[11]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[12]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[13]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[14]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[15]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[16]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[17]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[18]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[19]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[20]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[21]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[22]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[23]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[24]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[25]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[26]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[27]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[28]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[29]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[30]}
add wave -noupdate -expand -group L2cache_way3 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_4/data[31]}
add wave -noupdate -label L2cache_state -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CC/state
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/L2_address
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/L2_data
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/DAT_M -radix hexadecimal /full_mainpc_tb/EWB_mem/DAT_M
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/DAT_S -radix hexadecimal /full_mainpc_tb/EWB_mem/DAT_S
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/ACK -radix hexadecimal /full_mainpc_tb/EWB_mem/ACK
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/ADR -radix hexadecimal /full_mainpc_tb/EWB_mem/ADR
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/STB -radix hexadecimal /full_mainpc_tb/EWB_mem/STB
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/WE -radix hexadecimal /full_mainpc_tb/EWB_mem/WE
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/VCC/state
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/L2_read
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/L2_write
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/L2toPmem_busy
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/VC_ack
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/VC_hit
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/foh
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/mem_ack
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/l2_req_muxsel
add wave -noupdate -expand -group VC_data -label {VC_data[0]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[0]}
add wave -noupdate -expand -group VC_data -label {VC_data[1]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[1]}
add wave -noupdate -expand -group VC_data -label {VC_data[2]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[2]}
add wave -noupdate -expand -group VC_data -label {VC_data[3]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[3]}
add wave -noupdate -expand -group VC_data -label {VC_data[4]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[4]}
add wave -noupdate -expand -group VC_data -label {VC_data[5]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[5]}
add wave -noupdate -expand -group VC_data -label {VC_data[6]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[6]}
add wave -noupdate -expand -group VC_data -label {VC_data[7]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_DATA/data[7]}
add wave -noupdate -expand -group VC_address -label {VC_addr[0]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[0]}
add wave -noupdate -expand -group VC_address -label {VC_addr[1]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[1]}
add wave -noupdate -expand -group VC_address -label {VC_addr[2]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[2]}
add wave -noupdate -expand -group VC_address -label {VC_addr[3]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[3]}
add wave -noupdate -expand -group VC_address -label {VC_addr[4]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[4]}
add wave -noupdate -expand -group VC_address -label {VC_addr[5]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[5]}
add wave -noupdate -expand -group VC_address -label {VC_addr[6]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[6]}
add wave -noupdate -expand -group VC_address -label {VC_addr[7]} -radix hexadecimal {/full_mainpc_tb/WeBareBears/Victim_cache/VCD/VC_ADR/data[7]}
add wave -noupdate /full_mainpc_tb/WeBareBears/Victim_cache/VC_LRU_dirty
add wave -noupdate /full_mainpc_tb/WeBareBears/Victim_cache/VC_hit_dirty
add wave -noupdate /full_mainpc_tb/WeBareBears/Victim_cache/hit_way
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/wb_address
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/Victim_cache/wb_data
add wave -noupdate /full_mainpc_tb/WeBareBears/Victim_cache/load_VC
add wave -noupdate -radix hexadecimal {/full_mainpc_tb/mem/mem[46]}
add wave -noupdate /full_mainpc_tb/EWB_mem/CYC
add wave -noupdate /full_mainpc_tb/EWB_mem/SEL
add wave -noupdate /full_mainpc_tb/WeBareBears/L2_cache/dirty_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {341084746 ps} 0} {{Cursor 2} {946961342 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 397
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
WaveRestoreZoom {946656008 ps} {947058494 ps}
