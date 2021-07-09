transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/mips_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/ALUcontrol.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/bit1_2to1_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/bit1_alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/bit1_aluMSB.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/bit32_alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/MainControl.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/mux5bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/mux32bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/mips_registers.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/mips_instr_mem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/project03 {C:/Users/Administrator/Desktop/project03/mips_data_mem.v}

