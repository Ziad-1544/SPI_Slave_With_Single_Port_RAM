module RAM_tb ();
    parameter MEM_DEPTH = 256;  // Defines the depth of memory (number of addresses available)
    parameter ADDR_SIZE = 8  ;   // Address size (number of bits to address memory locations)
    reg [9:0] din;            // 10-bit data input (2 bits for control, 8 bits for address/data)
    reg rx_valid, clk, rst_n; // Control signals: receive valid, clock, and active-low reset
    wire [7:0] dout;      // 8-bit data output (memory read result)
    wire tx_valid  ;
    RAM #(.MEM_DEPTH(MEM_DEPTH),.ADDR_SIZE(ADDR_SIZE)) DUT (
        .din(din),
        .rx_valid(rx_valid),
        .clk(clk),
        .rst_n(rst_n),
        .dout(dout),
        .tx_valid(tx_valid)
    );

    // Clock generation
    initial begin
        clk = 1;
        forever #1 clk = ~clk; 
    end

    // Testbench logic
    initial begin
        // Initialize signals
        rst_n = 0;
        rx_valid = 0;
        din = 10'b0;
        //the output will take 0 and internal flags also ;
        @(negedge clk);
        rst_n = 1;

        rx_valid = 0 ;
        
        din=10'b00_1111_1111;
        @(negedge clk);
        din=10'b01_0101_1100;
        @(negedge clk);
        $display("data should be written either in WR_address or in memory") ;
        $stop;
        rx_valid = 1 ;
        
        din=10'b00_1111_1111;
        @(negedge clk);
        din=10'b01_0101_1100;
        @(negedge clk);
        $display("data of 01011100 should be written inside address of 1111_1111");
        $stop;
        din=10'b00_1111_1100;
        @(negedge clk);
        din=10'b01_0101_1111;
        @(negedge clk);
        $display ("data of 0101_1111 should be written inside address of 1111_1100");
        $stop;
        din=10'b10_1111_1111;
        @(negedge clk);
        din=10'b11_1010_1011; //random value
        @(negedge clk);
        $display ("data of 0101_1100 should be read from address 1111_1111");  
        $stop;
        din=10'b10_1111_1100;
        @(negedge clk);
        rx_valid = 0 ;
        din=10'b11_1010_1001;
        @(negedge clk);
        $display ("data of 0101_1100 should be read from address 0101_1111");  
        $display("finished");
        $stop;
    end
endmodule
