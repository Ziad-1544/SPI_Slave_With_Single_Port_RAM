module SPI_tb();
    logic SS_n, CLK, rst_n;
    logic tx_valid;
    logic [7:0] tx_data;
    logic MOSI_tb;
    bit MISO_tb;
    bit rx_valid;
    bit [9:0] rx_data;
    SPI DUT (
        .SS_n(SS_n),
        .CLK(CLK),
        .rst_n(rst_n),
        .tx_valid(tx_valid),
        .tx_data(tx_data),
        .MOSI(MOSI_tb),
        .MISO(MISO_tb),
        .rx_valid(rx_valid),
        .rx_data(rx_data)
    );

    initial begin
        CLK = 0;
        forever #1 CLK = ~CLK; 
    end

    initial begin
        SS_n = 1;
        tx_valid = 0;
        tx_data = 8'h00;
        MOSI_tb = 0;
        // Reset the system
        reset();
        
        // Test Case 1: Write Address (WRITE)
        SS_n = 0;
        @(negedge CLK);
        receive_from_master(10'b00_1111_0000); // Command 00 (WRITE) + 8-bit data
        SS_n = 1;
        @(negedge CLK);

        // Test Case 2: Write Data (WRITE)
        SS_n = 0;
        @(negedge CLK);
        receive_from_master(10'b01_1111_0000); // Command 01 (WRITE) + 8-bit data
        SS_n = 1;
        @(negedge CLK);
        
        // Test Case 3: Read Address (READ_ADD)
        SS_n = 0;
        @(negedge CLK);
        receive_from_master(10'b10_1111_0000); // Command 10 (READ_ADD) + 8-bit address
        SS_n = 1;
        @(negedge CLK);
        
        // Test Case 4: Read Data (READ_DATA)
        SS_n = 0;
        @(negedge CLK);
        receive_from_master(10'b11_0000_0000); // Command 11 (READ_DATA) + dummy data
        tx_valid = 1;
        tx_data = 8'hA5; // Provide data to serialize via MISO
        @(negedge CLK);
        tx_valid = 0;
        repeat(8) @(negedge CLK); // Wait for 8-bit serialization
        SS_n = 1;
        @(negedge CLK);

        // SS_n=0;
        // @(negedge CLK);
        // MOSI_tb = 0;
        // repeat(2) @(negedge CLK);
        // receive_from_master(8'b1111_0000); // Command 01 (WRITE) + 8-bit data
        // SS_n=1;
        // @(negedge CLK);

        // SS_n=0;
        // @(negedge CLK);
        // MOSI_tb = 0;
        // repeat(1) @(negedge CLK);
        // MOSI_tb = 1;
        // @(negedge CLK);
        // receive_from_master(8'b1111_0000); // Command 01 (WRITE) + 8-bit data
        // SS_n=1;
        // @(negedge CLK);

        // SS_n=0;
        // @(negedge CLK);
        // MOSI_tb = 1;
        // repeat(1) @(negedge CLK);
        // MOSI_tb = 0;
        // @(negedge CLK);
        // receive_from_master(8'b1111_0000); // Command 01 (WRITE) + 8-bit data
        // SS_n=1;
        // @(negedge CLK);

        // SS_n=0;
        // @(negedge CLK);
        // MOSI_tb = 1;
        // repeat(2) @(negedge CLK);
        // receive_from_master(8'b1111_0000); // Command 01 (WRITE) + 8-bit data
        // tx_valid = 1;
        // tx_data = 8'hA5; // Provide data to serialize via MISO
        // @(negedge CLK);
        // tx_valid = 0;
        // repeat(8) @(negedge CLK); // Wait for 8-bit serialization
        // SS_n=1;
        // @(negedge CLK);
        $stop;
    end

    // Reset Task
    task reset();
        rst_n = 1;
        @(negedge CLK);
        rst_n = 0;
        @(negedge CLK);
        rst_n = 1;
    endtask
    task receive_from_master(logic [9:0] Parallel_data_in_tb);
        for (int i = 9; i >= 0; i--) begin
            MOSI_tb = Parallel_data_in_tb[i];
            @(negedge CLK);
        end
    endtask
endmodule