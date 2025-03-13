module RAM_tb();
    logic CLK,rst_n;
    logic[9:0] din;
    logic rx_valid;
    bit [7:0]dout;
    bit tx_valid;

    logic[4:0] Error_counter,correct_counter;
    //instantiation 
    RAM DUT (
        .clk(CLK),
        .rst_n(rst_n),
        .din(din),
        .rx_valid(rx_valid),
        .dout(dout),
        .tx_valid(tx_valid)
    );
    
    initial begin
        CLK=0;
        forever begin
            #1 CLK = ~CLK ;
        end
    end
    initial begin
        Error_counter=0;
        correct_counter=0;
        reset();
        //intialize the memory
        $readmemb("mem.dat",DUT.memory);
        $display("testing reading after intialization ") ;
            rx_valid = 1;
            din = {2'b10,8'b0000_0010};
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = {2'b11,8'b0000_0010};
            @(negedge CLK);
            rx_valid = 0 ;
            if (tx_valid && dout == 'b0011_0011) begin
                    $display("case 1 valid ",dout);
                    correct_counter= correct_counter + 1; 
            end else begin
                $display("Error in data when tx_valid case 1: dout =%b",dout);
                Error_counter = Error_counter + 1;
            end
            //-----------------
            rx_valid = 1;
            din = {2'b10,8'b0110_0100};
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = {2'b11,8'b0000_0010};
            @(negedge CLK);
            rx_valid = 0 ;
            if (tx_valid && dout == 'b1010_1001) begin
                    $display("case 2 valid ", dout);
                    correct_counter= correct_counter + 1; 
            end else begin
                $display("Error in data when tx_valid case 2: dout =%b",dout);
                Error_counter = Error_counter + 1; 
            end
            //----------------
            rx_valid = 1;
            din = {2'b10,8'b1010_1111};
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = {2'b11,8'b0000_0010};
            @(negedge CLK);
            rx_valid = 0 ;
            if (tx_valid && dout == 'b0000_1111) begin
                      $display("case 3 valid ", dout);
                    correct_counter= correct_counter + 1; 
            end else begin
                $display("Error in data when tx_valid case 3: dout =%b",dout);
                    Error_counter = Error_counter + 1; 
              
            end
            //----------------
            rx_valid = 1;
            din = {2'b10,8'b1111_1010};
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = {2'b11,8'b0000_0010};
            @(negedge CLK);
            rx_valid = 0 ;
            if (tx_valid && dout == 'b1010_1001) begin
                    $display("case 4 valid ", dout);
                    correct_counter= correct_counter + 1; 
            end else begin
                $display("Error in data when tx_valid case 4: dout =%b",dout);
                    Error_counter = Error_counter + 1; 
            end
            //---------------------------------------------------------------------------------------------------------
            $display("Full normal scenario test");
            rx_valid = 1;
            din = 10'b00_1010_1010;
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = 10'b01_1111_0000;
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = 10'b10_1010_1010;
            @(negedge CLK);
            rx_valid = 0 ;
            @(negedge CLK);
            rx_valid = 1;
            din = 10'b11_1010_1010;
            @(negedge CLK);
            rx_valid = 0 ;
            if (tx_valid && dout == 'b1111_0000) begin
                    $display("case 4 valid ", dout);
                    correct_counter= correct_counter + 1; 
            end else begin
                $display("Error in data when tx_valid case 4: dout =%b",dout);
                    Error_counter = Error_counter + 1; 
            end
            $display("Correct Counter =%d , Error Counter =%d",correct_counter,Error_counter);
            $stop;
    end

    // Reset Task
    task reset();
        rst_n = 1;
        @(negedge CLK);
        rst_n = 0;
        @(negedge CLK);
        rst_n = 1;
        @(negedge CLK);
    endtask
endmodule