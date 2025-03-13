module SPI_tb();
    bit MOSI_tb ,SS_n, CLK , rst_n;
    logic MISO_tb;
    SPI DUT (
        .SS_n(SS_n),
        .CLK(CLK),
        .rst_n(rst_n),
        .MOSI(MOSI_tb),
        .MISO(MISO_tb)
    );

    initial begin
        CLK = 0;
        forever #1 CLK = ~CLK; 
    end
    logic [7:0] address,data;
    initial begin
        SS_n = 1;
        MOSI_tb = 0;
        // Reset the system
        reset();
        $readmemb("mem.dat",DUT.RAM1.memory);
//////////////////////////////////////////////////////////////////////////////// Normal FulL Scenario ///////////////////////////////////////////////////////////////////////////
        // Test Case 1: Write Address (WRITE)
        SS_n = 0;
        @(negedge CLK);
        address = 8'b1111_0000;
        receive_from_master(10'b00_1111_0000); // Command 00 (WRITE) + 8-bit data
        SS_n = 1;
        @(negedge CLK);
        $stop; 

        // Test Case 2: Write Data (WRITE)
        SS_n = 0;
        @(negedge CLK);
        address = 8'b1111_0000;
        receive_from_master(10'b01_1111_0000); // Command 01 (WRITE) + 8-bit data
        SS_n = 1;
        @(negedge CLK);
        $stop;
        // Test Case 3: Read Address (READ_ADD)
        SS_n = 0;
        @(negedge CLK);
        address = 8'b1111_0000;
        receive_from_master(10'b10_1111_0000); // Command 10 (READ_ADD) + 8-bit address
        SS_n = 1;
        @(negedge CLK);
        $stop;
        // Test Case 4: Read Data (READ_DATA)
        SS_n = 0;
        @(negedge CLK);
        address = 8'b0000_0000;
        receive_from_master(10'b11_0000_0000); // Command 11 (READ_DATA) + dummy data
        @(negedge CLK);// wait for tx data from RAM 
        repeat(9) @(negedge CLK); // Wait for 8-bit serialization
        SS_n = 1;
        @(negedge CLK);
        $display("Normal Scenerio Finished ,Now starting Just Reading with self checking");
///////////////////////////////////////////////////////////////////////////////// Just Reading with self checking //////////////////////////////////////////////////// 
        repeat(10)begin
            //Read Address (READ_ADD)
            SS_n = 0;
            @(negedge CLK);
            address = $random;
            receive_from_master({2'b10,address}); // Command 10 (READ_ADD) + 8-bit address
            SS_n = 1;
            @(negedge CLK);
        
            // Test Case 4: Read Data (READ_DATA)
            SS_n = 0;
            @(negedge CLK);
            receive_from_master(10'b11_0000_0000); // Command 11 (READ_DATA) + dummy data
            repeat(2)@(negedge CLK);// wait for tx_valid trigger+ another edge spi receive data
            if (DUT.RAM1.memory [address] != DUT.Slave_handler.Parallel_data_out) begin
                $display("Error in just reading with self checking at time =%d",$time);
                $stop;
            end
            repeat(9) @(negedge CLK); // Wait for 8-bit serialization
            SS_n = 1;
            @(negedge CLK);
        end
         $display("Just Reading with self checking Finished with no errors ,Now starting Just Writing with self checking");
///////////////////////////////////////////////////////////////////////////////// Just Writing with self checking //////////////////////////////////////////////////// 
        repeat(10)begin
            //Read Address (Write_ADD)
            SS_n = 0;
            @(negedge CLK);
            address = $random;
            data = $random ;
            receive_from_master({2'b00,address}); // Command 10 (READ_ADD) + 8-bit address
            SS_n = 1;
            @(negedge CLK);
        
            // Test Case 4: Read Data (READ_DATA)
            SS_n = 0;
            @(negedge CLK);
            receive_from_master({2'b01,data}); // Command 11 (READ_DATA) + dummy data
            @(negedge CLK);// wait for data to be written 
            if (DUT.RAM1.memory [address] != data ) begin
                $display("Error in just Writing with self checking at time =%d",$time);
                $stop;
            end
            SS_n = 1;
            @(negedge CLK);
        end
        $display("Just Writing with self checking Finished with no errors");
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