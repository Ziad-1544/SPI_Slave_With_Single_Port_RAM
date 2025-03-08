module SPI_tb();
    logic SS_n,CLK,rst_n;
    //TX Inputs
    logic tx_valid;
    logic [7:0] tx_data;
    //Protocol Lines
    logic MOSI_tb;
    bit MISO_tb;
    //RX Outputs
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
        forever begin
          #1  CLK = ~CLK;
        end 
    end
    initial begin
        reset();
        //write address
        SS_n=0;
        @(negedge CLK);
        receive_from_master(10'b00_1111_0000);
        @(negedge CLK);
        @(negedge CLK);
        SS_n=1;
        @(negedge CLK);
        //write data
        SS_n=0;
        @(negedge CLK);
        receive_from_master(10'b01_1111_0000);
        @(negedge CLK);
        @(negedge CLK);
        SS_n=1;
        @(negedge CLK);
        //read address
        SS_n=0;
        //@(negedge CLK);
        receive_from_master(10'b10_1111_0000);
        @(negedge CLK);
        @(negedge CLK);
        SS_n=1;
        @(negedge CLK);
        //read data
        SS_n=0;
        @(negedge CLK);
        receive_from_master(10'b11_0000_0000);
        @(negedge CLK);
        @(negedge CLK);
        SS_n=1;
        @(negedge CLK);
        $stop;
    end
    task reset();
        rst_n = 1 ;
        @(negedge CLK);
        rst_n = 0 ;
        @(negedge CLK);
        rst_n = 1 ;
    endtask 
    
    task receive_from_master(logic [9:0] Parallel_data_in_tb);
    for (int i = 9; i >= 0; i--) begin
        MOSI_tb = Parallel_data_in_tb[i];
        @(negedge CLK);
    end
    endtask
endmodule