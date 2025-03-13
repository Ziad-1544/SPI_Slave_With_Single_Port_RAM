vlib work
vlog  RAM.v RAM_tb.sv
vsim -voptargs=+acc work.RAM_tb
add wave -radix unsigned *  ;
add wave -position insertpoint  \
sim:/RAM_tb/DUT/memory \
sim:/RAM_tb/DUT/RD_address_bus \
sim:/RAM_tb/DUT/WR_address_bus \
sim:/RAM_tb/DUT/flag_read \
sim:/RAM_tb/DUT/flag_write 
run -all