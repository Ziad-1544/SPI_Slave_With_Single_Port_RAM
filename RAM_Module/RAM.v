module RAM #(
    parameter MEM_DEPTH = 256,  // Defines the depth of memory (number of addresses available)
    parameter ADDR_SIZE = 8     // Address size (number of bits to address memory locations)
) (
    input [9:0] din,            // 10-bit data input (2 bits for control, 8 bits for address/data)
    input rx_valid, clk, rst_n, // Control signals: receive valid, clock, and active-low reset
    output reg [7:0] dout,      // 8-bit data output (memory read result)
    output reg tx_valid         // Transmit valid signal (indicates data is ready to be transmitted)
);
    reg [7:0] memory [MEM_DEPTH-1:0]; // Memory array declaration
    reg [ADDR_SIZE-1:0] WR_address_bus; // Write address register
    reg [ADDR_SIZE-1:0] RD_address_bus; // Read address register

    reg flag_read;  // Flag to indicate a pending read operation
    reg flag_write; // Flag to indicate a pending write operation

    always @(posedge clk) begin
        if (~rst_n) begin // Active-low reset handling
            dout <= 0;
            tx_valid <= 0;
            flag_write <= 0;
            flag_read <= 0;
            RD_address_bus <= 0;
            WR_address_bus <= 0;      
        end 
        else begin
            tx_valid <= 0; // Ensure tx_valid is cleared at the start of each clock cycle
            case ({din[9], din[8]}) // Extracting the control bits from din
                2'b00: begin
                    /*
                    * Case 00: Handle write address request from SPI slave
                    * If no previous write is pending, store the write address
                    */   
                    if (rx_valid && ~flag_write) begin
                        WR_address_bus <= din[7:0]; // Store write address
                        flag_write <= 1; // Indicate address is ready to be written on
                    end
                    // TODO: Implement SPI Slave communication to set SS_n = 1 after accepting the address
                end
                2'b01: begin
                    /*
                    * Case 01: Handle writing data to memory
                    * Only write if a previous write address has been set
                    */
                    if (rx_valid && flag_write) begin
                        flag_write <= 0;
                        memory[WR_address_bus] <= din[7:0]; // Write data to the address stored
                    end
                end    
                2'b10: begin
                    /*
                    * Case 10: Handle read address request from SPI slave
                    * If no previous read is pending, store the read address
                    */
                    if (rx_valid && ~flag_read) begin
                        flag_read <= 1;
                        RD_address_bus <= din[7:0]; // Store read address
                    end
                end
                2'b11: begin
                    /*
                    *   Case 11: Handle memory read operation
                    *   Read data from stored read address and assert tx_valid 
                    */
                    if (rx_valid && flag_read) begin 
                        dout <= memory[RD_address_bus]; // Read data from memory
                        flag_read <= 0;
                        tx_valid <= 1; // Indicate data is ready to be sent
                    end
                end
            endcase
        end
    end
endmodule