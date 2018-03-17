module mainpc(
	wishbone.master ibus,
	wishbone.master dbus
);

wishbone cpu_dcache(dbus.CLK);
wishbone cpu_icache(ibus.CLK);

cpu main_cpu(
	.icache(cpu_icache),
	.dcache(cpu_dcache)
);

cache icache
(
	.sb(cpu_icache),
	.wb(ibus)
);

cache dcache(
	.sb(cpu_dcache),
	.wb(dbus)
);

//cache l2cache
//(
//);

//comment out the above and connect cpu directly to memory
//to test if your CPU adheres to Wishbone spec
//(not a rigorous test, but will catch some obvious errors)
//cpu cpu(mem);

endmodule : mainpc