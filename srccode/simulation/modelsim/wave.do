onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /full_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /full_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /full_mainpc_tb/clk
add wave -noupdate -radix hexadecimal /full_mainpc_tb/clk
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
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[0]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[1]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[2]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[3]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[4]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[5]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[6]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[7]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[8]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[9]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[10]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[11]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[12]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[13]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[14]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[15]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[16]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[17]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[18]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[19]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[20]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[21]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[22]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[23]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[24]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[25]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[26]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[27]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[28]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[29]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[30]}
add wave -noupdate -expand -group L2cache_way0 -radix hexadecimal {/full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_1/data[31]}
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
add wave -noupdate -expand -group EWB -label EWB_valid -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/EWB_VALID_1/data
add wave -noupdate -expand -group EWB -label EWB_address -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/EWB_ADDR_1/data
add wave -noupdate -expand -group EWB -label EWB_data -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/EWB_DATA_1/data
add wave -noupdate -expand -group EWB -label EWB_state -radix hexadecimal /full_mainpc_tb/WeBareBears/EWB/state
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/DAT_M -radix hexadecimal /full_mainpc_tb/EWB_mem/DAT_M
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/DAT_S -radix hexadecimal /full_mainpc_tb/EWB_mem/DAT_S
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/ACK -radix hexadecimal /full_mainpc_tb/EWB_mem/ACK
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/ADR -radix hexadecimal /full_mainpc_tb/EWB_mem/ADR
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/STB -radix hexadecimal /full_mainpc_tb/EWB_mem/STB
add wave -noupdate -expand -group {Physical Memory Signals} -label EWB_mem/WE -radix hexadecimal /full_mainpc_tb/EWB_mem/WE
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/load_dirty_1
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/load_dirty_2
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/load_dirty_3
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/load_dirty_4
add wave -noupdate -radix binary /full_mainpc_tb/WeBareBears/L2_cache/LRU_out
add wave -noupdate -radix binary {/full_mainpc_tb/WeBareBears/L2_cache/CD/LRU/data[7]}
add wave -noupdate -radix binary /full_mainpc_tb/WeBareBears/L2_cache/CD/TRUE_LRU/new_LRU
add wave -noupdate -radix binary /full_mainpc_tb/WeBareBears/L2_cache/CD/TRUE_LRU/old_LRU
add wave -noupdate -radix binary /full_mainpc_tb/WeBareBears/L2_cache/CD/TRUE_LRU/way
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/way1_hit
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/way2_hit
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/way3_hit
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/way4_hit
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/wdata_out
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_WRITE/a
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_WRITE/b
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_WRITE/c
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_WRITE/d
add wave -noupdate -radix hexadecimal /full_mainpc_tb/WeBareBears/L2_cache/CD/DATA_WRITE/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {288617 ps} 0} {{Cursor 2} {870915000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 350
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
WaveRestoreZoom {870345832 ps} {871371224 ps}
