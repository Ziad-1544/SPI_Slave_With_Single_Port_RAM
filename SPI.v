module SPI #(
    //States
    parameter IDLE      ='b000 ,
    parameter CHK_CMD   ='b001 ,
    parameter WRITE     ='b010 ,
    parameter READ_ADD  ='b011 ,
    parameter READ_DATA ='b100 
)(
    //Control Inputs
    input SS_n,CLK,rst_n,
    //TX Inputs
    input tx_valid,
    input [7:0] tx_data,
    //Protocol Lines
    input MOSI,
    output reg MISO,
    //RX Outputs
    output reg rx_valid,
    output reg [9:0] rx_data
);
////////////////////////////////////////////////////////////////////// Variables //////////////////////////////////////////////////////////////////////////////////////
// State Variables 
reg [2:0] cs,ns;

//Global Variables
reg is_address_received;

//Tasks Variables:
//  1)SER_TO_PAR
reg [3:0] cycle_counter_SER_TO_PAR;
reg [9:0] Parallel_data_in;
reg data_ready_to_ram;
//  2)PAR_TO_SER
reg [2:0] cycle_counter_PAR_TO_SER;
reg [7:0]Parallel_data_out;
reg data_out_to_master;

////////////////////////////////////////////////////////////////////// FSM Algorithm //////////////////////////////////////////////////////////////////////////////////////
//State Memory
always @(posedge CLK) begin
    if(~rst_n)begin
        cs <= IDLE ;
    end
    else begin
        cs <= ns   ;
    end
end 

//Next State Logic
always @(*) begin
    case (cs)
        IDLE: begin
            if (SS_n) begin
                ns = IDLE ;
            end   
            else begin
                ns = CHK_CMD ;
            end
        end 

        CHK_CMD: begin
            if (SS_n == 0 && MOSI == 0) begin
                    ns = WRITE ; 
            end
            else if (SS_n == 0 && MOSI == 1 && ~is_address_received) begin
                    ns = READ_ADD ;
            end
            else if (SS_n == 0 && MOSI == 1 && is_address_received) begin
                    ns = READ_DATA ;
            end
            else if (SS_n) begin
                    ns = IDLE ;
            end
        end 

        WRITE: begin
            if (SS_n) begin
                ns = IDLE ;
            end else begin
                ns = WRITE ;
            end
        end

        READ_ADD: begin
            if (SS_n) begin
                ns = IDLE ;
            end else begin
                ns = READ_ADD ;
            end
        end 

        READ_DATA: begin
            if (SS_n) begin
                ns = IDLE ;
            end else begin
                ns = READ_DATA ;
            end
        end
        default: ns = IDLE ;
    endcase
end

//Output Logic
always @(posedge CLK) begin
    if(~rst_n)begin
        MISO        <= 0 ;
        rx_valid    <= 0 ;
        rx_data     <= 0 ;
    end
    else begin
        if (cs == WRITE && SS_n == 0) begin
            WRITE_TASK();
        end else if (cs == READ_ADD && SS_n == 0) begin
            READ_ADD_TASK();
        end else if (cs == READ_DATA && SS_n == 0) begin
            READ_DATA_TASK();
        end else if (SS_n == 1) begin
            communication_ended();
        end
    end
end    
// To reset this internal signal in case of general reset on the module 
always @(posedge CLK) begin
    if(~rst_n)begin
        is_address_received         <= 0;
        Parallel_data_in            <= 0;
        Parallel_data_out           <= 0;
        data_out_to_master          <= 0;
        data_ready_to_ram           <= 0; 
        cycle_counter_PAR_TO_SER    <= 0 ;
        cycle_counter_SER_TO_PAR    <= 0 ;

    end
end

////////////////////////////////////////////////////////////////////// Tasks //////////////////////////////////////////////////////////////////////////////////////
//Serial To Parallel Converter:
/*
    -Counter based that counts to 10 to receive the 10 bits in series and each clock edge do a shift to the bus and add the the new bit in
    -After receiving the data , the task raise a flag called data_ready_to_ram
*/
task SER_TO_PAR();
    if (cycle_counter_SER_TO_PAR < 10) begin
        if (cycle_counter_SER_TO_PAR == 9) begin
            data_ready_to_ram <= 1 ;
        end
        else begin
            data_ready_to_ram <= 0 ;
            Parallel_data_in <= {Parallel_data_in [8:0] , MOSI} ; 
            cycle_counter_SER_TO_PAR <= cycle_counter_SER_TO_PAR + 1 ;
        end
    end
endtask
//Parallel To Serial Converter:
/*
    -Counter based that counts to 8 and on each count the parallel bus shift a bit out to the MOSI
    -After sending the data , the task raise a flag called data_out_to_master
*/
task PAR_TO_SER();
    if (cycle_counter_PAR_TO_SER < 8) begin

        data_out_to_master <= 0 ;
        {MISO , Parallel_data_out [6:0]} <= Parallel_data_out ; 
        cycle_counter_PAR_TO_SER <= cycle_counter_PAR_TO_SER + 1 ;

        if (cycle_counter_PAR_TO_SER == 7) begin
        data_out_to_master <= 1 ;
        cycle_counter_PAR_TO_SER <= 0 ;
        end
    end
endtask
//Write Task:
/*
    -Check first if the data is ready to be transfered using the flag data_ready_to_ram , if not he start the conversion from series to parallel until it's ready 
    -Now the data is ready , get the ram ready by rx_valid , make sure again it's writting a data or address command & send the data 
    -Lower the rx_valid when the communication is ended 
*/
//Send The Data Or The Address To The Ram 
task send_address_or_data();
    rx_data = Parallel_data_in;
endtask

task WRITE_TASK ();
    if(data_ready_to_ram == 0) begin
        SER_TO_PAR();
    end
    else begin
        if (Parallel_data_in[9:8] == 'b00 || Parallel_data_in[9:8] == 'b01) begin
            rx_valid <= 1;
            send_address_or_data();
        end
    end
endtask
//Read Address:
/*
    -First we will do the same as the WRITE TASK to recieve the address from master 
    -Once received and the check the 'b10 of the Most significant 2 bits of the command 
    -Rais the flag of received address , this flag is so important to differentiate between the READ_ADD & READ_DATA states
    -Send address to the RAM 
    -Lower the rx_valid when the communication is ended 
*/
task READ_ADD_TASK();
    if (data_ready_to_ram == 0) begin
        SER_TO_PAR();
    end else begin
        if(Parallel_data_in[9:8] == 'b10)begin
            rx_valid <= 1 ;
            is_address_received <= 1;
            send_address_or_data();
        end
    end
endtask
//Read Data:
/*
    -First we will do the same as the WRITE TASK to recieve the read data command '2'b11 in the most significant bits' from master
    -After taking the 10 bits from the master , raise the rx_valid and send the command 
    NB:making the raising & sending the command ,the last the condition is giving priority to receive data from RAM because the Parallel_data_in[9:8] == 'b11 
    as long we are in this state
    - Once the date is received from the ram , we will convert the data from parallel to series and send a bit on each edge to the MOSI
    - Lowering the is_address_received to handle getting a new address next time 
*/ 
//Receive Data From RAM
task receive_data();
    Parallel_data_out = tx_data;
endtask

task READ_DATA_TASK();
    if (data_ready_to_ram == 0) begin
        SER_TO_PAR();
    end else begin
        if (tx_valid) begin
            receive_data();
        end
        else if(data_out_to_master == 0)begin
            PAR_TO_SER();

            if (data_out_to_master) begin
            is_address_received <= 0;
            end
        end 
        else if (Parallel_data_in[9:8] == 'b11)begin
            rx_valid <= 1 ;
            send_address_or_data();
        end
    end
endtask

// Reset or Error handling any time SS_n = 1 accidentaly  
/*
    - If at any time the ss_n = 1 , we will reset all counter in case of normal communication ending between master & slave
    or the connection ended accidentaly
*/
task communication_ended();begin
    cycle_counter_PAR_TO_SER    <= 0 ;
    cycle_counter_SER_TO_PAR    <= 0 ;
    data_ready_to_ram           <= 0 ;
    data_out_to_master          <= 0 ;
    rx_valid                    <= 0 ;
    Parallel_data_in            <= 0 ;
    Parallel_data_out           <= 0 ;
end
endtask

endmodule