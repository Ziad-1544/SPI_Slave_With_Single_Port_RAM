// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Thu Mar 13 10:45:28 2025
// Host        : Ziad-Kassem running 64-bit major release  (build 9200)
// Command     : write_verilog D:/Kareem_Wassem/DESIGN/Projects/SPI_Slave_With_Single_Port_RAM/GRAY_NETLIST.v
// Design      : SPI
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module RAM
   (DOBDO,
    flag_write_reg_0,
    tx_valid,
    flag_read,
    flag_write,
    D,
    CLK_IBUF_BUFG,
    \rx_data_reg[8] ,
    Q,
    WEA,
    \rx_data_reg[9] ,
    rx_valid_reg,
    rx_valid_reg_0,
    rx_valid,
    rst_n_IBUF,
    data_received_reg,
    E,
    flag_read_reg_0);
  output [6:0]DOBDO;
  output flag_write_reg_0;
  output tx_valid;
  output flag_read;
  output flag_write;
  output [0:0]D;
  input CLK_IBUF_BUFG;
  input \rx_data_reg[8] ;
  input [7:0]Q;
  input [0:0]WEA;
  input \rx_data_reg[9] ;
  input rx_valid_reg;
  input rx_valid_reg_0;
  input rx_valid;
  input rst_n_IBUF;
  input data_received_reg;
  input [0:0]E;
  input [0:0]flag_read_reg_0;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK_IBUF_BUFG;
  wire [0:0]D;
  wire [6:0]DOBDO;
  wire [0:0]E;
  wire [7:0]Q;
  wire [7:0]RD_address_bus;
  wire [0:0]WEA;
  wire [7:0]WR_address_bus;
  wire data_received_reg;
  wire flag_read;
  wire [0:0]flag_read_reg_0;
  wire flag_write;
  wire flag_write00_out;
  wire flag_write_reg_0;
  wire rst_n_IBUF;
  wire \rx_data_reg[8] ;
  wire \rx_data_reg[9] ;
  wire rx_valid;
  wire rx_valid_reg;
  wire rx_valid_reg_0;
  wire [0:0]tx_data;
  wire tx_valid;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_gray_cs[2]_i_1 
       (.I0(rst_n_IBUF),
        .O(flag_write_reg_0));
  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \Parallel_data_out[0]_i_1 
       (.I0(tx_data),
        .I1(data_received_reg),
        .O(D));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[0]),
        .Q(RD_address_bus[0]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[1]),
        .Q(RD_address_bus[1]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[2]),
        .Q(RD_address_bus[2]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[3]),
        .Q(RD_address_bus[3]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[4]),
        .Q(RD_address_bus[4]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[5]),
        .Q(RD_address_bus[5]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[6]),
        .Q(RD_address_bus[6]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \RD_address_bus_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(flag_read_reg_0),
        .D(Q[7]),
        .Q(RD_address_bus[7]),
        .R(flag_write_reg_0));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[0]),
        .Q(WR_address_bus[0]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[1]),
        .Q(WR_address_bus[1]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[2]),
        .Q(WR_address_bus[2]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[3]),
        .Q(WR_address_bus[3]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[4]),
        .Q(WR_address_bus[4]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[5]),
        .Q(WR_address_bus[5]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[6]),
        .Q(WR_address_bus[6]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \WR_address_bus_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .D(Q[7]),
        .Q(WR_address_bus[7]),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    flag_read_reg
       (.C(CLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rx_valid_reg),
        .Q(flag_read),
        .R(flag_write_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    flag_write_reg
       (.C(CLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rx_valid_reg_0),
        .Q(flag_write),
        .R(flag_write_reg_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "memory" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    memory_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,WR_address_bus,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,RD_address_bus,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(CLK_IBUF_BUFG),
        .CLKBWRCLK(CLK_IBUF_BUFG),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,Q}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO({DOBDO,tx_data}),
        .ENARDEN(flag_write00_out),
        .ENBWREN(\rx_data_reg[8] ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(flag_write_reg_0),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({WEA,WEA}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  LUT2 #(
    .INIT(4'h8)) 
    memory_reg_i_1
       (.I0(flag_write),
        .I1(rx_valid),
        .O(flag_write00_out));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(CLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data_reg[9] ),
        .Q(tx_valid),
        .R(flag_write_reg_0));
endmodule

(* ADDR_SIZE = "8" *) (* MEM_DEPTH = "256" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module SPI
   (MOSI,
    SS_n,
    CLK,
    rst_n,
    MISO);
  input MOSI;
  input SS_n;
  input CLK;
  input rst_n;
  output MISO;

  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire RAM1_n_7;
  wire SS_n;
  wire SS_n_IBUF;
  wire Slave_handler_n_1;
  wire Slave_handler_n_12;
  wire Slave_handler_n_13;
  wire Slave_handler_n_14;
  wire Slave_handler_n_15;
  wire Slave_handler_n_16;
  wire Slave_handler_n_17;
  wire flag_read;
  wire flag_write;
  wire memory;
  wire [0:0]p_1_in;
  wire rst_n;
  wire rst_n_IBUF;
  wire [7:0]rx_data;
  wire rx_valid;
  wire [7:1]tx_data;
  wire tx_valid;

  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  RAM RAM1
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .D(p_1_in),
        .DOBDO(tx_data),
        .E(Slave_handler_n_13),
        .Q(rx_data),
        .WEA(memory),
        .data_received_reg(Slave_handler_n_1),
        .flag_read(flag_read),
        .flag_read_reg_0(Slave_handler_n_14),
        .flag_write(flag_write),
        .flag_write_reg_0(RAM1_n_7),
        .rst_n_IBUF(rst_n_IBUF),
        .\rx_data_reg[8] (Slave_handler_n_17),
        .\rx_data_reg[9] (Slave_handler_n_12),
        .rx_valid(rx_valid),
        .rx_valid_reg(Slave_handler_n_15),
        .rx_valid_reg_0(Slave_handler_n_16),
        .tx_valid(tx_valid));
  IBUF SS_n_IBUF_inst
       (.I(SS_n),
        .O(SS_n_IBUF));
  SPI_Slave Slave_handler
       (.CLK(CLK_IBUF_BUFG),
        .D(MOSI_IBUF),
        .DOBDO(tx_data),
        .E(Slave_handler_n_13),
        .MISO_OBUF(MISO_OBUF),
        .Q(rx_data),
        .\RD_address_bus_reg[7] (Slave_handler_n_14),
        .SR(RAM1_n_7),
        .SS_n_IBUF(SS_n_IBUF),
        .WEA(memory),
        .data_received_reg_0(Slave_handler_n_1),
        .flag_read(flag_read),
        .flag_read_reg(Slave_handler_n_15),
        .flag_write(flag_write),
        .flag_write_reg(Slave_handler_n_16),
        .memory_reg(Slave_handler_n_17),
        .memory_reg_0(p_1_in),
        .rst_n_IBUF(rst_n_IBUF),
        .rx_valid(rx_valid),
        .tx_valid(tx_valid),
        .tx_valid_reg(Slave_handler_n_12));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
endmodule

module SPI_Slave
   (MISO_OBUF,
    data_received_reg_0,
    rx_valid,
    WEA,
    Q,
    tx_valid_reg,
    E,
    \RD_address_bus_reg[7] ,
    flag_read_reg,
    flag_write_reg,
    memory_reg,
    CLK,
    tx_valid,
    SS_n_IBUF,
    rst_n_IBUF,
    D,
    flag_read,
    flag_write,
    memory_reg_0,
    DOBDO,
    SR);
  output MISO_OBUF;
  output data_received_reg_0;
  output rx_valid;
  output [0:0]WEA;
  output [7:0]Q;
  output tx_valid_reg;
  output [0:0]E;
  output [0:0]\RD_address_bus_reg[7] ;
  output flag_read_reg;
  output flag_write_reg;
  output memory_reg;
  input CLK;
  input tx_valid;
  input SS_n_IBUF;
  input rst_n_IBUF;
  input [0:0]D;
  input flag_read;
  input flag_write;
  input [0:0]memory_reg_0;
  input [6:0]DOBDO;
  input [0:0]SR;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [0:0]D;
  wire [6:0]DOBDO;
  wire [0:0]E;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire \Parallel_data_out[7]_i_1_n_0 ;
  wire \Parallel_data_out[7]_i_2_n_0 ;
  wire \Parallel_data_out_reg_n_0_[0] ;
  wire \Parallel_data_out_reg_n_0_[1] ;
  wire \Parallel_data_out_reg_n_0_[2] ;
  wire \Parallel_data_out_reg_n_0_[3] ;
  wire \Parallel_data_out_reg_n_0_[4] ;
  wire \Parallel_data_out_reg_n_0_[5] ;
  wire \Parallel_data_out_reg_n_0_[6] ;
  wire [7:0]Q;
  wire [0:0]\RD_address_bus_reg[7] ;
  wire [0:0]SR;
  wire SS_n_IBUF;
  wire [0:0]WEA;
  (* RTL_KEEP = "yes" *) wire [2:0]cs;
  wire [3:0]cycle_counter_PAR_TO_SER_reg__0;
  wire \cycle_counter_SER_TO_PAR[3]_i_1_n_0 ;
  wire [3:0]cycle_counter_SER_TO_PAR_reg__0;
  wire data_received_i_1_n_0;
  wire data_received_i_2_n_0;
  wire data_received_i_3_n_0;
  wire data_received_reg_0;
  wire flag_read;
  wire flag_read_reg;
  wire flag_write;
  wire flag_write_reg;
  wire is_address_received_i_1_n_0;
  wire is_address_received_i_2_n_0;
  wire is_address_received_i_3_n_0;
  wire is_address_received_reg_n_0;
  wire memory_reg;
  wire [0:0]memory_reg_0;
  wire [2:0]ns;
  wire [3:0]p_0_in;
  wire [3:0]p_0_in__0;
  wire [7:1]p_1_in;
  wire p_5_out;
  wire rst_n_IBUF;
  wire [9:8]rx_data;
  wire \rx_data[9]_i_1_n_0 ;
  wire \rx_data[9]_i_2_n_0 ;
  wire rx_valid;
  wire rx_valid_i_1_n_0;
  wire rx_valid_i_2_n_0;
  wire rx_valid_i_3_n_0;
  wire rx_valid_i_4_n_0;
  wire rx_valid_i_5_n_0;
  wire tx_valid;
  wire tx_valid_reg;

  LUT6 #(
    .INIT(64'h00000000FEFFDDDD)) 
    \FSM_gray_cs[0]_i_1 
       (.I0(cs[1]),
        .I1(cs[2]),
        .I2(is_address_received_reg_n_0),
        .I3(D),
        .I4(cs[0]),
        .I5(SS_n_IBUF),
        .O(ns[0]));
  LUT4 #(
    .INIT(16'h0F0E)) 
    \FSM_gray_cs[1]_i_1 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(SS_n_IBUF),
        .I3(cs[2]),
        .O(ns[1]));
  LUT6 #(
    .INIT(64'h0000FFFF00002000)) 
    \FSM_gray_cs[2]_i_2 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(D),
        .I3(is_address_received_reg_n_0),
        .I4(SS_n_IBUF),
        .I5(cs[2]),
        .O(ns[2]));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:011,READ_ADD:010,READ_DATA:111,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(ns[0]),
        .Q(cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:011,READ_ADD:010,READ_DATA:111,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(ns[1]),
        .Q(cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:011,READ_ADD:010,READ_DATA:111,IDLE:000" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .D(ns[2]),
        .Q(cs[2]),
        .R(SR));
  GND GND
       (.G(\<const0> ));
  LUT5 #(
    .INIT(32'h40000000)) 
    MISO_i_1
       (.I0(cycle_counter_PAR_TO_SER_reg__0[3]),
        .I1(data_received_reg_0),
        .I2(cs[2]),
        .I3(cs[0]),
        .I4(cs[1]),
        .O(MISO_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(CLK),
        .CE(MISO_i_1_n_0),
        .D(p_5_out),
        .Q(MISO_OBUF),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[1]_i_1 
       (.I0(\Parallel_data_out_reg_n_0_[0] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[0]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[2]_i_1 
       (.I0(\Parallel_data_out_reg_n_0_[1] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[1]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[3]_i_1 
       (.I0(\Parallel_data_out_reg_n_0_[2] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[2]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[4]_i_1 
       (.I0(\Parallel_data_out_reg_n_0_[3] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[3]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[5]_i_1 
       (.I0(\Parallel_data_out_reg_n_0_[4] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[4]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[6]_i_1 
       (.I0(\Parallel_data_out_reg_n_0_[5] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[5]),
        .O(p_1_in[6]));
  LUT2 #(
    .INIT(4'hB)) 
    \Parallel_data_out[7]_i_1 
       (.I0(SS_n_IBUF),
        .I1(rst_n_IBUF),
        .O(\Parallel_data_out[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00008000C0008000)) 
    \Parallel_data_out[7]_i_2 
       (.I0(tx_valid),
        .I1(cs[1]),
        .I2(cs[0]),
        .I3(cs[2]),
        .I4(data_received_reg_0),
        .I5(cycle_counter_PAR_TO_SER_reg__0[3]),
        .O(\Parallel_data_out[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \Parallel_data_out[7]_i_3 
       (.I0(\Parallel_data_out_reg_n_0_[6] ),
        .I1(data_received_reg_0),
        .I2(DOBDO[6]),
        .O(p_1_in[7]));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[0] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(memory_reg_0),
        .Q(\Parallel_data_out_reg_n_0_[0] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[1] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[1]),
        .Q(\Parallel_data_out_reg_n_0_[1] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[2] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[2]),
        .Q(\Parallel_data_out_reg_n_0_[2] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[3] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[3]),
        .Q(\Parallel_data_out_reg_n_0_[3] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[4] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[4]),
        .Q(\Parallel_data_out_reg_n_0_[4] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[5] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[5]),
        .Q(\Parallel_data_out_reg_n_0_[5] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[6] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[6]),
        .Q(\Parallel_data_out_reg_n_0_[6] ),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \Parallel_data_out_reg[7] 
       (.C(CLK),
        .CE(\Parallel_data_out[7]_i_2_n_0 ),
        .D(p_1_in[7]),
        .Q(p_5_out),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \RD_address_bus[7]_i_1 
       (.I0(flag_read),
        .I1(rx_data[9]),
        .I2(rx_data[8]),
        .I3(rx_valid),
        .O(\RD_address_bus_reg[7] ));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \WR_address_bus[7]_i_1 
       (.I0(flag_write),
        .I1(rx_data[9]),
        .I2(rx_data[8]),
        .I3(rx_valid),
        .O(E));
  LUT1 #(
    .INIT(2'h1)) 
    \cycle_counter_PAR_TO_SER[0]_i_1 
       (.I0(cycle_counter_PAR_TO_SER_reg__0[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cycle_counter_PAR_TO_SER[1]_i_1 
       (.I0(cycle_counter_PAR_TO_SER_reg__0[0]),
        .I1(cycle_counter_PAR_TO_SER_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cycle_counter_PAR_TO_SER[2]_i_1 
       (.I0(cycle_counter_PAR_TO_SER_reg__0[1]),
        .I1(cycle_counter_PAR_TO_SER_reg__0[0]),
        .I2(cycle_counter_PAR_TO_SER_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \cycle_counter_PAR_TO_SER[3]_i_1 
       (.I0(cycle_counter_PAR_TO_SER_reg__0[2]),
        .I1(cycle_counter_PAR_TO_SER_reg__0[0]),
        .I2(cycle_counter_PAR_TO_SER_reg__0[1]),
        .O(p_0_in__0[3]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_PAR_TO_SER_reg[0] 
       (.C(CLK),
        .CE(MISO_i_1_n_0),
        .D(p_0_in__0[0]),
        .Q(cycle_counter_PAR_TO_SER_reg__0[0]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_PAR_TO_SER_reg[1] 
       (.C(CLK),
        .CE(MISO_i_1_n_0),
        .D(p_0_in__0[1]),
        .Q(cycle_counter_PAR_TO_SER_reg__0[1]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_PAR_TO_SER_reg[2] 
       (.C(CLK),
        .CE(MISO_i_1_n_0),
        .D(p_0_in__0[2]),
        .Q(cycle_counter_PAR_TO_SER_reg__0[2]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_PAR_TO_SER_reg[3] 
       (.C(CLK),
        .CE(MISO_i_1_n_0),
        .D(p_0_in__0[3]),
        .Q(cycle_counter_PAR_TO_SER_reg__0[3]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cycle_counter_SER_TO_PAR[0]_i_1 
       (.I0(cycle_counter_SER_TO_PAR_reg__0[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cycle_counter_SER_TO_PAR[1]_i_1 
       (.I0(cycle_counter_SER_TO_PAR_reg__0[0]),
        .I1(cycle_counter_SER_TO_PAR_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cycle_counter_SER_TO_PAR[2]_i_1 
       (.I0(cycle_counter_SER_TO_PAR_reg__0[1]),
        .I1(cycle_counter_SER_TO_PAR_reg__0[0]),
        .I2(cycle_counter_SER_TO_PAR_reg__0[2]),
        .O(p_0_in[2]));
  LUT4 #(
    .INIT(16'h222A)) 
    \cycle_counter_SER_TO_PAR[3]_i_1 
       (.I0(\rx_data[9]_i_2_n_0 ),
        .I1(cycle_counter_SER_TO_PAR_reg__0[3]),
        .I2(cycle_counter_SER_TO_PAR_reg__0[1]),
        .I3(cycle_counter_SER_TO_PAR_reg__0[2]),
        .O(\cycle_counter_SER_TO_PAR[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cycle_counter_SER_TO_PAR[3]_i_2 
       (.I0(cycle_counter_SER_TO_PAR_reg__0[2]),
        .I1(cycle_counter_SER_TO_PAR_reg__0[0]),
        .I2(cycle_counter_SER_TO_PAR_reg__0[1]),
        .I3(cycle_counter_SER_TO_PAR_reg__0[3]),
        .O(p_0_in[3]));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_SER_TO_PAR_reg[0] 
       (.C(CLK),
        .CE(\cycle_counter_SER_TO_PAR[3]_i_1_n_0 ),
        .D(p_0_in[0]),
        .Q(cycle_counter_SER_TO_PAR_reg__0[0]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_SER_TO_PAR_reg[1] 
       (.C(CLK),
        .CE(\cycle_counter_SER_TO_PAR[3]_i_1_n_0 ),
        .D(p_0_in[1]),
        .Q(cycle_counter_SER_TO_PAR_reg__0[1]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_SER_TO_PAR_reg[2] 
       (.C(CLK),
        .CE(\cycle_counter_SER_TO_PAR[3]_i_1_n_0 ),
        .D(p_0_in[2]),
        .Q(cycle_counter_SER_TO_PAR_reg__0[2]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cycle_counter_SER_TO_PAR_reg[3] 
       (.C(CLK),
        .CE(\cycle_counter_SER_TO_PAR[3]_i_1_n_0 ),
        .D(p_0_in[3]),
        .Q(cycle_counter_SER_TO_PAR_reg__0[3]),
        .R(\Parallel_data_out[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FF00EFF0EF00)) 
    data_received_i_1
       (.I0(cycle_counter_PAR_TO_SER_reg__0[3]),
        .I1(data_received_i_2_n_0),
        .I2(data_received_i_3_n_0),
        .I3(data_received_reg_0),
        .I4(tx_valid),
        .I5(\Parallel_data_out[7]_i_1_n_0 ),
        .O(data_received_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    data_received_i_2
       (.I0(cycle_counter_PAR_TO_SER_reg__0[1]),
        .I1(cycle_counter_PAR_TO_SER_reg__0[0]),
        .I2(cycle_counter_PAR_TO_SER_reg__0[2]),
        .O(data_received_i_2_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    data_received_i_3
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(cs[2]),
        .O(data_received_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    data_received_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(data_received_i_1_n_0),
        .Q(data_received_reg_0),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'h7F20)) 
    flag_read_i_1
       (.I0(rx_valid),
        .I1(rx_data[8]),
        .I2(rx_data[9]),
        .I3(flag_read),
        .O(flag_read_reg));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hF702)) 
    flag_write_i_1
       (.I0(rx_valid),
        .I1(rx_data[8]),
        .I2(rx_data[9]),
        .I3(flag_write),
        .O(flag_write_reg));
  LUT6 #(
    .INIT(64'h0400FFFF04000000)) 
    is_address_received_i_1
       (.I0(cs[0]),
        .I1(rst_n_IBUF),
        .I2(cs[2]),
        .I3(cs[1]),
        .I4(is_address_received_i_2_n_0),
        .I5(is_address_received_reg_n_0),
        .O(is_address_received_i_1_n_0));
  LUT6 #(
    .INIT(64'hD5D5D5D5D5D5FFD5)) 
    is_address_received_i_2
       (.I0(rst_n_IBUF),
        .I1(is_address_received_i_3_n_0),
        .I2(\rx_data[9]_i_2_n_0 ),
        .I3(MISO_i_1_n_0),
        .I4(data_received_i_2_n_0),
        .I5(SS_n_IBUF),
        .O(is_address_received_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00040000)) 
    is_address_received_i_3
       (.I0(SS_n_IBUF),
        .I1(cycle_counter_SER_TO_PAR_reg__0[0]),
        .I2(cycle_counter_SER_TO_PAR_reg__0[1]),
        .I3(cycle_counter_SER_TO_PAR_reg__0[2]),
        .I4(cycle_counter_SER_TO_PAR_reg__0[3]),
        .O(is_address_received_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    is_address_received_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(is_address_received_i_1_n_0),
        .Q(is_address_received_reg_n_0),
        .R(\<const0> ));
  LUT5 #(
    .INIT(32'h8000FFFF)) 
    memory_reg_i_2
       (.I0(rx_data[8]),
        .I1(rx_valid),
        .I2(flag_read),
        .I3(rx_data[9]),
        .I4(rst_n_IBUF),
        .O(memory_reg));
  LUT3 #(
    .INIT(8'h08)) 
    memory_reg_i_3
       (.I0(rst_n_IBUF),
        .I1(rx_data[8]),
        .I2(rx_data[9]),
        .O(WEA));
  LUT5 #(
    .INIT(32'h01550000)) 
    \rx_data[9]_i_1 
       (.I0(SS_n_IBUF),
        .I1(cycle_counter_SER_TO_PAR_reg__0[2]),
        .I2(cycle_counter_SER_TO_PAR_reg__0[1]),
        .I3(cycle_counter_SER_TO_PAR_reg__0[3]),
        .I4(\rx_data[9]_i_2_n_0 ),
        .O(\rx_data[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h1000FFF0)) 
    \rx_data[9]_i_2 
       (.I0(tx_valid),
        .I1(data_received_reg_0),
        .I2(cs[0]),
        .I3(cs[1]),
        .I4(cs[2]),
        .O(\rx_data[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(D),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[0]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[1]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[2]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[3]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[4]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[5]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[6]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(Q[7]),
        .Q(rx_data[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(CLK),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data[8]),
        .Q(rx_data[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'h0077007F00770070)) 
    rx_valid_i_1
       (.I0(rx_valid_i_2_n_0),
        .I1(tx_valid),
        .I2(rx_valid_i_3_n_0),
        .I3(\Parallel_data_out[7]_i_1_n_0 ),
        .I4(rx_valid_i_4_n_0),
        .I5(rx_valid),
        .O(rx_valid_i_1_n_0));
  LUT3 #(
    .INIT(8'hAB)) 
    rx_valid_i_2
       (.I0(cs[2]),
        .I1(cs[1]),
        .I2(cs[0]),
        .O(rx_valid_i_2_n_0));
  LUT5 #(
    .INIT(32'h40000000)) 
    rx_valid_i_3
       (.I0(data_received_reg_0),
        .I1(tx_valid),
        .I2(cs[2]),
        .I3(cs[0]),
        .I4(cs[1]),
        .O(rx_valid_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00200000)) 
    rx_valid_i_4
       (.I0(cycle_counter_SER_TO_PAR_reg__0[3]),
        .I1(cycle_counter_SER_TO_PAR_reg__0[2]),
        .I2(cycle_counter_SER_TO_PAR_reg__0[0]),
        .I3(cycle_counter_SER_TO_PAR_reg__0[1]),
        .I4(rx_valid_i_5_n_0),
        .O(rx_valid_i_4_n_0));
  LUT4 #(
    .INIT(16'h40FC)) 
    rx_valid_i_5
       (.I0(data_received_reg_0),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(cs[2]),
        .O(rx_valid_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(CLK),
        .CE(\<const1> ),
        .D(rx_valid_i_1_n_0),
        .Q(rx_valid),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    tx_valid_i_1
       (.I0(rx_data[9]),
        .I1(flag_read),
        .I2(rx_valid),
        .I3(rx_data[8]),
        .O(tx_valid_reg));
endmodule
