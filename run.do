vlib work
vlog  Main_module.v Main_module_tb.sv SPI.v RAM.v
vsim -voptargs=+acc work.SPI_tb
add wave -position insertpoint  \
sim:/SPI_tb/DUT/Slave_handler/CLK \
sim:/SPI_tb/DUT/Slave_handler/rst_n \
sim:/SPI_tb/DUT/Slave_handler/MOSI \
sim:/SPI_tb/DUT/Slave_handler/SS_n \
sim:/SPI_tb/DUT/Slave_handler/MISO \
sim:/SPI_tb/DUT/Slave_handler/tx_data \
sim:/SPI_tb/DUT/Slave_handler/rx_data \
sim:/SPI_tb/DUT/Slave_handler/tx_valid \
sim:/SPI_tb/DUT/Slave_handler/rx_valid 
run -all