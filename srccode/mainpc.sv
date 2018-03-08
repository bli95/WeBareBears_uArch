module mainpc(
	wishbone.master ibus,
	wishbone.master dbus
);

//wishbone cpu_cache(mem.CLK);

cpu main_cpu(
	.icache_if(ibus),
	.dcache_if(dbus)
);

//cache icache
//(
//	.cpu(cpu_cache),
//	.mem
//);
//
//cache dcache
//(
//	
//);

//cache l2cache
//(
//);

//comment out the above and connect cpu directly to memory
//to test if your CPU adheres to Wishbone spec
//(not a rigorous test, but will catch some obvious errors)
//cpu cpu(mem);

endmodule : mainpc