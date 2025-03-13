module SPI_Slave #(
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
(* fsm_encoding = "gray" *)
reg [2:0] cs,ns;

//Global Variables
reg is_address_received;
reg data_received;
//Tasks Variables:
//  1)SER_TO_PAR
reg [3:0] cycle_counter_SER_TO_PAR;
//  2)PAR_TO_SER
reg [3:0] cycle_counter_PAR_TO_SER;
reg [7:0]Parallel_data_out;

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
            if (SS_n) begin
                    ns = IDLE ;
            end
            else if (MOSI == 0) begin
                    ns = WRITE ; 
            end
            else if (~is_address_received) begin
                    ns = READ_ADD ;
            end
            else begin
                    ns = READ_DATA ;
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
        //some internal signals 
        is_address_received         <= 0 ;
        Parallel_data_out           <= 0 ;
        cycle_counter_PAR_TO_SER    <= 0 ;
        cycle_counter_SER_TO_PAR    <= 0 ;
    end
    else begin
        if (SS_n) begin
            communication_ended();
        end else if (cs == CHK_CMD) begin
            SER_TO_PAR();
        end else if (cs == WRITE) begin
            SER_TO_PAR();
        end else if (cs == READ_ADD) begin
            SER_TO_PAR();
        end else if (cs == READ_DATA) begin
            READ_DATA_TASK();
        end 
    end
end    

////////////////////////////////////////////////////////////////////// Tasks //////////////////////////////////////////////////////////////////////////////////////
task SER_TO_PAR();
begin
    if (cycle_counter_SER_TO_PAR < 10) begin
        rx_data <= {rx_data [8:0] , MOSI} ; 
        cycle_counter_SER_TO_PAR <= cycle_counter_SER_TO_PAR + 1 ;
    end
    if (cycle_counter_SER_TO_PAR == 9) begin
        rx_valid <= 1;
        if (cs == READ_ADD)begin
            is_address_received <= 1;
        end 
        else begin
            is_address_received <= 0;
        end
    end
end 
endtask

task PAR_TO_SER();
begin
    if (cycle_counter_PAR_TO_SER < 8) begin
        MISO <= Parallel_data_out[7];
        Parallel_data_out <= Parallel_data_out<<1; 
        cycle_counter_PAR_TO_SER <= cycle_counter_PAR_TO_SER + 1 ;
    end
    if(cycle_counter_PAR_TO_SER == 7) begin
                data_received <= 0 ;
                is_address_received <= 0 ;
    end
end 
endtask

task READ_DATA_TASK();
begin
        if(data_received)begin
            PAR_TO_SER();
        end 
        else if (tx_valid) begin
            rx_valid <= 0;
            Parallel_data_out <= tx_data;
            data_received <= 1 ;
        end 
        else begin
            SER_TO_PAR();
        end
end  
endtask

// Handling any time SS_n = 1 (at the end of communication or accidentaly)  
task communication_ended();begin
    MISO                        <= 0 ; 
    cycle_counter_PAR_TO_SER    <= 0 ;  
    cycle_counter_SER_TO_PAR    <= 0 ;
    rx_valid                    <= 0 ;
    Parallel_data_out           <= 0 ;
end
endtask

endmodule