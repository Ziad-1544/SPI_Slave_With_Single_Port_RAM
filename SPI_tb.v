module SPI_slave_tb ();
    
    reg SS_n, CLK, rst_n;
    reg tx_valid;
    reg [7:0] tx_data;
    reg MOSI;
    wire MISO;
    wire rx_valid;
    wire [9:0] rx_data;
    
    SPI DUT (
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

    initial begin
        CLK = 0;
        forever #1 CLK = ~CLK; 
    end

    reg [9:0] parallel_data_holder;
    integer counter;

    initial begin
        // Checking reset functionality 
        rst_n = 0;
        @(negedge CLK);
        rst_n = 1;
        @(negedge CLK);
        $stop;
        
        // Checking write address functionality and SS_n = 1
        SS_n = 1;
        MOSI = 0;
        parallel_data_holder = 10'b00_1101_0100;
        // @(negedge CLK);
        for (counter = 9; counter >= 0; counter = counter - 1) begin
            MOSI = parallel_data_holder[counter];
            @(negedge CLK);
        end
        $stop;
        
        // Checking write address functionality and SS_n = 0
        SS_n = 0;
        MOSI = 0;
        parallel_data_holder = 10'b00_1101_0100;
        // @(negedge CLK);
        for (counter = 9; counter >= 0; counter = counter - 1) begin
            MOSI = parallel_data_holder[counter];
            @(negedge CLK);
        end
        SS_n = 1;
        @(negedge CLK);

        $stop;
        
        // Checking write data functionality and SS_n = 0
        SS_n = 0;
        MOSI = 0;
        parallel_data_holder = 10'b01_1111_0010;
        // @(negedge CLK);
        for (counter = 9; counter >= 0; counter = counter - 1) begin
            MOSI = parallel_data_holder[counter];
            @(negedge CLK);
        end
        SS_n = 1;
        @(negedge CLK);
        $stop;
        
        // // Reading data inside address without sending the address
        // SS_n = 0;
        // MOSI = 1;
        // parallel_data_holder = 10'b11_1010_1100;
        // // @(negedge CLK);
        // for (counter = 9; counter >= 0; counter = counter - 1) begin
        //     MOSI = parallel_data_holder[counter]; // the 
        //     @(negedge CLK);
        // end
        // @(negedge CLK);
        // for (counter = 9; counter >= 0; counter = counter - 1) begin 
        //     @(negedge CLK);
        // end
        // SS_n = 1;
        // @(negedge CLK);
        // $stop;
        
        // Checking read address functionality and SS_n = 0
        SS_n = 0;
        MOSI = 1;
        parallel_data_holder = 10'b10_1101_0100;
        // @(negedge CLK);
        for (counter = 9; counter >= 0; counter = counter - 1) begin
            MOSI = parallel_data_holder[counter];
            @(negedge CLK);
        end
        SS_n = 1;
        @(negedge CLK);
        $stop;
        
        // Checking read data functionality and SS_n = 0
        SS_n = 0;
        MOSI = 1;
        parallel_data_holder = 10'b11_1010_1100;
        // @(negedge CLK);
        for (counter = 9; counter >= 0; counter = counter - 1) begin
            MOSI = parallel_data_holder[counter];
            @(negedge CLK);
        end
        tx_valid = 1 ; 
        tx_data = 1111_0000 ;
        // for (counter = 7; counter >= 0; counter = counter - 1) begin
        //     MISO = tx_data[counter];
        //     @(negedge CLK);
        // end
        // @(negedge CLK);
        for (counter = 7; counter >= 0; counter = counter - 1) begin 
            @(negedge CLK);
        end
        SS_n = 1;
        @(negedge CLK);
        $stop;
        
        // Turning off SS_n in the middle of the communication
        SS_n = 0;
        MOSI = 0;
        parallel_data_holder = 10'b00_1101_0100;
        // @(negedge CLK);
        for (counter = 9; counter >= 0; counter = counter - 1) begin
            MOSI = parallel_data_holder[counter];
            if(counter == 2)
                SS_n = 1;
            @(negedge CLK);
        end
        SS_n = 1;
        @(negedge CLK);
        $display("test bench finished");
        $stop;
    end
endmodule
