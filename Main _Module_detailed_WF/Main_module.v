module SPI#(
    parameter MEM_DEPTH = 256,  
    parameter ADDR_SIZE = 8     
) (
    input MOSI ,SS_n, CLK , rst_n,
    output MISO 
);
(*fsm_encoding ="one_hot"*)
    wire [7:0] tx_data ; 
    wire [9:0] rx_data ; 
    wire rx_valid, tx_valid;

    SPI_Slave Slave_handler (
        .SS_n(SS_n),
        .CLK(CLK),
        .rst_n(rst_n),
        .tx_valid(tx_valid),
        .tx_data(tx_data),
        .MOSI(MOSI),
        .MISO(MISO),
        .rx_valid(rx_valid),
        .rx_data(rx_data)
    );

    RAM #(
        .MEM_DEPTH(MEM_DEPTH),
        .ADDR_SIZE(ADDR_SIZE) 
    )RAM1 (
        .clk(CLK),
        .rst_n(rst_n),
        .din(rx_data),
        .rx_valid(rx_valid),
        .dout(tx_data),
        .tx_valid(tx_valid)
    );
endmodule