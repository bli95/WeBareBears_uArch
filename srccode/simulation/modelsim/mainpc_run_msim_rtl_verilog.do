transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/inserter.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cache_control.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/comparator.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/wishbone.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/mux4.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/mux8.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/mux2.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/array.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/register.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/lc3b_types.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/plus2.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cache_datapath.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/adj_add_pc.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/ext.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/lc3mask.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cpu_control.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cccomp.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/alu.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/adj.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/gencc.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/ir.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/regfile.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cpu_datapath.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cache.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/cpu.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/mainpc.sv}

vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/mainpc_tb.sv}
vlog -sv -work work +incdir+/home/cli91/ece411/mainpc {/home/cli91/ece411/mainpc/physical_memory.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L stratixiii_ver -L rtl_work -L work -voptargs="+acc"  mainpc_tb

add wave *
view structure
view signals
run 200 ns
