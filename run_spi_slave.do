vlib work
vlog  SPI.v SPI_tb.sv 
vsim -voptargs=+acc work.SPI_tb
add wave -position insertpoint  \
sim:/SPI_tb/DUT/CLK \
sim:/SPI_tb/DUT/rst_n \
sim:/SPI_tb/DUT/SS_n \
sim:/SPI_tb/DUT/cs \
sim:/SPI_tb/DUT/ns \
sim:/SPI_tb/receive_from_master/Parallel_data_in_tb \
sim:/SPI_tb/DUT/MOSI \
sim:/SPI_tb/DUT/cycle_counter_SER_TO_PAR \
sim:/SPI_tb/DUT/rx_data \
sim:/SPI_tb/DUT/rx_valid \
sim:/SPI_tb/DUT/cycle_counter_PAR_TO_SER \
sim:/SPI_tb/DUT/Parallel_data_out \
sim:/SPI_tb/DUT/data_received \
sim:/SPI_tb/DUT/is_address_received \
sim:/SPI_tb/DUT/MISO \
sim:/SPI_tb/DUT/tx_data \
sim:/SPI_tb/DUT/tx_valid 
run -all