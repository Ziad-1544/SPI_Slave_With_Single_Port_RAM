vlib work
vlog  Main_module.v Main_module_tb.sv SPI.v RAM.v
vsim -voptargs=+acc work.SPI_tb
add wave -position insertpoint  \
sim:/SPI_tb/DUT/Slave_handler/CLK \
sim:/SPI_tb/DUT/Slave_handler/rst_n \
sim:/SPI_tb/DUT/Slave_handler/SS_n \
sim:/SPI_tb/DUT/Slave_handler/cs \
sim:/SPI_tb/DUT/Slave_handler/ns \
sim:/SPI_tb/address \
sim:/SPI_tb/DUT/Slave_handler/MOSI \
sim:/SPI_tb/DUT/Slave_handler/rx_data \
sim:/SPI_tb/DUT/RAM1/din \
sim:/SPI_tb/DUT/Slave_handler/rx_valid \
sim:/SPI_tb/DUT/Slave_handler/is_address_received \
sim:/SPI_tb/DUT/Slave_handler/cycle_counter_SER_TO_PAR \
sim:/SPI_tb/DUT/Slave_handler/tx_valid \
sim:/SPI_tb/DUT/Slave_handler/Parallel_data_out \
sim:/SPI_tb/DUT/Slave_handler/tx_data \
sim:/SPI_tb/DUT/RAM1/dout \
sim:/SPI_tb/DUT/Slave_handler/data_received \
sim:/SPI_tb/DUT/Slave_handler/MISO \
sim:/SPI_tb/DUT/Slave_handler/cycle_counter_PAR_TO_SER \
sim:/SPI_tb/DUT/RAM1/WR_address_bus \
sim:/SPI_tb/DUT/RAM1/RD_address_bus \
sim:/SPI_tb/DUT/RAM1/memory 
run -all