# 🕸️ SPIder Web Project - SPI Slave with Single Port RAM🕷️

## 📌 Project Overview
Welcome to **SPIder Web Project** – a digital design adventure that implements an **SPI Slave** integrated with **Single Port RAM** using **Verilog** and the **Vivado FPGA Flow**! 🚀

## 🎯 Features
✔️ SPI Slave communication for data transmission 📡  
✔️ Integrated **256-depth** Single-Port RAM 🗄️  
✔️ FSM-based SPI communication 🏗️  
✔️ Supports Read/Write operations 📝  
✔️ Synthesis & implementation reports 📊  
✔️ Debugging using **ILA Core** 🛠️

---

## 📂 File Structure
| 📁 <em>Directory</em> | 📜 <em>Description</em> |
|-------------|--------------|
| [`RAM Design Code`](./RAM.v) | Contains the implementation of **RAM** module |
| [`SPI Slave Design Code`](./SPI.v) | Implementation of **SPI Slave** logic |
| [`Main Module`](./Main_module.v) | Integrates SPI Slave & RAM 🎛️ |
| [`Test Bench`](./Main_module_tb.sv) | Simulation scripts for verification 🧪 |
| [`Constraints File`](Constraints_basys3.xdc) | Hardware constraints settings ⚙️ |
| [`Synthesis & Implementation`](./SPIder_Web_Project2.pdf) | FPGA synthesis & bitstream generation 🏭 |
| [`Debugging`](https://github.com/Ziad-1544/SPI_Slave_With_Single_Port_RAM/blob/master/Constraints_basys3.xdc#L23) | Debug core for signal monitoring 🔍 |


---

## 🛠️ Implementation Details
### 🏗️ SPI Slave
The SPI Slave module receives **MOSI** signals, processes commands, and communicates with RAM. It supports the following operations:

| Command | Function |
|---------|---------|
| `00` | Write Address to RAM |
| `01` | Write Data to RAM |
| `10` | Read Address from RAM |
| `11` | Read Data from RAM |

### 📦 RAM Module
- **Depth:** 256
- **Address Size:** 8 bits
- **Supports Read/Write using SPI commands**

### 🔍 Debugging & Testing
- Testbench ensures proper functionality of SPI communication 🧑‍🔬
- **Waveform analysis** validates data transfers 📊

---

## 🚀 How to Use
1️⃣ **Synthesize the design** using **Vivado** 🛠️  
2️⃣ **Program the FPGA** with the generated bitstream 💾  
3️⃣ **Run testbench** to validate functionality 🔬  
4️⃣ **Analyze debugging signals** using ILA Core 🔍

---

## 🎯 Conclusion
This project successfully demonstrates an SPI-based RAM interface using FPGA logic design. With structured FSM, efficient RAM access, and debugging capabilities, **SPIder Web Project** is a step towards mastering digital design! 🏆

🔹 Happy Coding! 🕷️🎯

---

## 📜 License
This project is licensed under the **MIT License**. Feel free to use, modify, and distribute it with proper attribution. 📝

## 👨‍💻 Digital Designers 

| 👨‍💻 Name | 📸 Profile Picture |
|-----------|------------------|
| [Ziad Kassem](https://github.com/Ziad-1544) | <img src="https://github.com/Ziad-1544.png" width="150"> |
| [Bassel Mahmoud](https://github.com/basselmahmoud1) | <img src="https://github.com/basselmahmoud1.png" width="150"> |

👨‍🏫 Under the supervision of **Eng. Kareem Wassem**

