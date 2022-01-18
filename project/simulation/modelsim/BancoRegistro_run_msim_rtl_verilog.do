transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/bjuan/Downloads/githubs/lab_01/lab04-2021-2-grupo08-2021-2/src {C:/Users/bjuan/Downloads/githubs/lab_01/lab04-2021-2-grupo08-2021-2/src/BancoRegistro.v}

