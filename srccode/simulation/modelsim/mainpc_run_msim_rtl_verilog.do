transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/lc3b_types.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/wishbone.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/mux4.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/mux2.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/register.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/plus.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/special_db_comps.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/pcmux_ctrlr.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/pipeline.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/gencc.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/adj_add_pc.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/ext.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/alu.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/adj.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/regfile.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/control_rom.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/cpu_rwmod.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/dcache_ctrlr.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/cpu_datapath.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/cpu.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/mainpc.sv}

vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode/../testbenches {/home/hmodhe2/ECE411/webarebears/srccode/../testbenches/mainpc_tb.sv}
vlog -sv -work work +incdir+/home/hmodhe2/ECE411/webarebears/srccode {/home/hmodhe2/ECE411/webarebears/srccode/magic_memory_dual_port.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  mainpc_tb

add wave *
view structure
view signals
run 200 ns
