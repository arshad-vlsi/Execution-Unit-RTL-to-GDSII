# Execution-Unit-RTL-to-GDSII

![Verilog](https://img.shields.io/badge/Verilog%20HDL-0075ca?style=flat-square)
![Cadence Xcelium](https://img.shields.io/badge/Cadence%20Xcelium-e36209?style=flat-square)
![Cadence Genus](https://img.shields.io/badge/Cadence%20Genus-e36209?style=flat-square)
![Cadence Innovus](https://img.shields.io/badge/Cadence%20Innovus-e36209?style=flat-square)
![ASIC](https://img.shields.io/badge/ASIC%20Design-8957e5?style=flat-square)
![RTL](https://img.shields.io/badge/RTL%20Integration-Complete-2ea44f?style=flat-square)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=flat-square)

RTL-to-GDSII implementation of a 32-bit Processor Execution Unit (Instruction Decoder + Register File + ALU) using Verilog HDL, Cadence Xcelium, Cadence Genus and Cadence Innovus.

---

## 📌 Project Overview

This project demonstrates the complete **RTL-to-GDSII implementation flow** of a processor execution unit. Starting from a 32-bit instruction, the design decodes the instruction, reads operands from a 32×32 Register File, performs an arithmetic or logical operation in the ALU, and writes the result back to the destination register.

**Current stage:** the Instruction Decoder, Register File (Version 2) and ALU are integrated in a single `execution_unit` top module with a register-initialization interface, and the integrated datapath has been functionally verified in Cadence Xcelium / SimVision. The next phases are RTL optimization and synthesis with Cadence Genus.

The entire flow — from RTL design through synthesis, physical design, and timing closure — is implemented using industry-standard Cadence EDA tools on Linux.

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [Architecture](docs/Architecture.md) | Block diagram, module descriptions, interfaces and data flow |
| [Instruction Set](docs/Instruction_Set.md) | 32-bit instruction format and supported operations |
| [Project Plan](docs/Project_Plan.md) | Phases and milestones |
| [Progress Log](docs/Progress_Log.md) | Chronological engineering log |
| [Day 2 Update](docs/Day02_Update.md) | Instruction Decoder RTL and verification |
| [Day 3 Update](docs/Day03_Update.md) | Register File RTL and verification |
| [Day 4 Update](docs/Day04_Update.md) | ALU RTL and verification |
| [Day 5 Update](docs/Day05_Update.md) | Execution Unit integration and functional verification |

---

## 🆕 Current Progress

### Day 5 Progress — Execution Unit Integration & Functional Verification

Integrated the complete execution unit and verified the full datapath in Cadence Xcelium / SimVision.

- Integrated **Instruction Decoder**, **Register File (Version 2)**, **ALU** and the write-back path in the `execution_unit` top module
- Added a **register-initialization interface** (`init_write`, `init_addr`, `init_data`) so registers can be preloaded before instruction execution, which makes verification easier and more realistic
- Verified: register initialization, instruction decoding, register reads, operand forwarding to the ALU, ALU computation, write-back path and register update

**Verification example**

| Step | Value |
|------|-------|
| Initial state | `R1 = 10`, `R2 = 20` |
| Instruction | `ADD R3, R1, R2` (`0x01844000`) |
| Operand A / Operand B | `10` / `20` |
| ALU result | `30` |
| Write-back | `R3 = 30` |
| Zero flag | `0` |

**Next:** RTL optimization, then synthesis with Cadence Genus.

<details>
<summary>Previous progress</summary>

**Day 4 — ALU RTL Complete.** Synthesizable 32-bit combinational ALU with 10 operations (ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS A) and a zero flag. All 11 directed checks passed.

**Day 3 — Register File RTL Complete.** Synthesizable 32×32 Register File with dual asynchronous read ports, a single synchronous write port and synchronous active-high reset. All 4 directed tests passed.

**Day 2 — Instruction Decoder RTL Complete.** Purely combinational decoder parameterized with `defines.vh`. All 3 directed tests passed.

</details>

---

## ✨ Features

- Parameterized 32-bit instruction decoding using `defines.vh`
- 32×32 Register File (Version 2) — dual asynchronous read, single synchronous write, synchronous reset
- 32-bit ALU with 10 operations and zero flag
- Integrated `execution_unit` top module with write-back path
- Register-initialization interface for simulation and verification
- Complete RTL-to-GDSII flow
- Synthesis using Cadence Genus
- Physical Design using Cadence Innovus
- Static Timing Analysis (STA)
- Timing Closure

---

## 🏗 Architecture

![Architecture Diagram](images/architecture.svg)

| Block | Status |
|-------|--------|
| Instruction Decoder | ✅ Complete |
| Register File (Version 2) | ✅ Complete |
| ALU | ✅ Complete |
| Execution Unit (top) | ✅ Complete |

**Data flow**

```
Instruction → Instruction Decoder → Register File (read) → ALU → Write-Back → Destination Register
```

**`execution_unit` interface**

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| `clk` | Input | 1 | System clock |
| `rst` | Input | 1 | Reset, applied to the Register File |
| `reg_write` | Input | 1 | Normal write-back enable |
| `init_write` | Input | 1 | Register-initialization enable (simulation / verification) |
| `init_addr` | Input | 5 | Register to initialize |
| `init_data` | Input | 32 | Initialization value |
| `instruction` | Input | 32 | Instruction word |
| `alu_result` | Output | 32 | ALU result |
| `zero` | Output | 1 | ALU zero flag |

> Full details in [docs/Architecture.md](docs/Architecture.md).

---

## 📁 Directory Structure

```
Execution-Unit-RTL-to-GDSII/
│
├── rtl/
│   ├── defines.vh                  ← Global macro definitions ✅
│   ├── instruction_decoder.v       ← Instruction Decoder ✅
│   ├── register_file.v             ← 32×32 Register File (Version 2) ✅
│   ├── alu.v                       ← 32-bit ALU ✅
│   └── execution_unit.v            ← Execution Unit top module ✅
│
├── tb/
│   ├── tb_instruction_decoder.v    ← Instruction Decoder Testbench ✅
│   ├── register_file_tb.v          ← Register File Testbench ✅
│   ├── alu_tb.v                    ← ALU Testbench ✅
│   └── execution_unit_tb.v         ← Execution Unit Testbench ✅
│
├── images/
│   ├── architecture.svg
│   └── simulation/
│         ├── instruction_decoder_waveform.png  ← Verified ✅
│         ├── register_file_waveform.png        ← Verified ✅
│         ├── alu_waveform.png                  ← Verified ✅
│         └── execution_unit_waveform.png       ← Verified ✅
│
├── constraints/
│   └── execution_unit.sdc
│
├── scripts/
│   ├── genus.tcl
│   └── innovus.tcl
│
├── genus/
├── innovus/
├── reports/
├── docs/
│   ├── Project_Plan.md
│   ├── Architecture.md
│   ├── Instruction_Set.md
│   ├── Progress_Log.md
│   ├── Day02_Update.md
│   ├── Day03_Update.md
│   ├── Day04_Update.md
│   └── Day05_Update.md
│
├── README.md
├── LICENSE
└── .gitignore
```

---

## 🛠 Toolchain

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Cadence Xcelium | Simulation |
| Cadence SimVision | Waveform Viewer |
| Cadence Genus | Logic Synthesis |
| Cadence Innovus | Physical Design (PnR) |
| Linux | Operating System |

---

## 🚦 Project Status

| Milestone | Status |
|-----------|--------|
| Project Setup | ✅ Complete |
| Common Definitions (`defines.vh`) | ✅ Complete |
| Instruction Decoder | ✅ Complete |
| Register File (Version 2) | ✅ Complete |
| ALU | ✅ Complete |
| Execution Unit Integration | ✅ Complete |
| Functional Verification | ✅ Complete |
| RTL Optimization | 🔜 Next |
| Synthesis (Cadence Genus) | ⏳ Pending |
| Timing Constraints | ⏳ Pending |
| Timing Reports | ⏳ Pending |
| Physical Design (Innovus) | ⏳ Pending |
| Physical Verification | ⏳ Pending |
| GDSII Generation | ⏳ Pending |

---

## 🗺 Project Roadmap

- [x] Project Setup
- [x] Common Definitions
- [x] Instruction Decoder
- [x] Register File
- [x] ALU
- [x] Execution Unit Integration
- [x] Functional Verification
- [ ] RTL Optimization
- [ ] Synthesis (Cadence Genus)
- [ ] Timing Constraints
- [ ] Timing Reports
- [ ] Physical Design (Innovus)
- [ ] Floorplanning
- [ ] Placement
- [ ] Clock Tree Synthesis
- [ ] Routing
- [ ] Physical Verification
- [ ] GDSII Generation

---

## 📊 Simulation Results

### Instruction Decoder

![Instruction Decoder Waveform](images/simulation/instruction_decoder_waveform.png)

*Cadence SimVision — `instruction[31:0]`, `opcode[3:0]`, `rd[4:0]`, `rs1[4:0]`, `rs2[4:0]` across 3 directed test vectors. Outputs track the input bit-fields with zero propagation delay, confirming purely combinational behavior.*

| Test Case | opcode | rd | rs1 | rs2 | Result |
|-----------|--------|-----|-----|-----|--------|
| TC1 | 0001 | 00010 | 00011 | 00100 | ✅ PASSED |
| TC2 | 0010 | 00101 | 00110 | 00111 | ✅ PASSED |
| TC3 | 1111 | 11111 | 11110 | 11101 | ✅ PASSED |

---

### Register File Verification

![Register File Waveform](images/simulation/register_file_waveform.png)

*Cadence SimVision — standalone Register File testbench (Day 3), in which the write enable appears as `we`. Version 2 exposes the write enable as `reg_write`, which is how the integrated `execution_unit` drives it.*

| Test | Description | Result |
|------|-------------|--------|
| TEST1 | Write `0xAAAAAAAA` to R5, read R5 | ✅ PASSED |
| TEST2 | Write `0x55555555` to R10, read R10 | ✅ PASSED |
| TEST3 | Simultaneous dual-port read of R5 and R10 | ✅ PASSED |
| TEST4 | Write disabled, R5 unchanged | ✅ PASSED |

---

### ALU Verification

![ALU Waveform](images/simulation/alu_waveform.png)

*Cadence SimVision — `operand_a`, `operand_b`, `alu_op`, `result` and `zero`. `alu_op` steps through 0–9 in 10 ns windows (ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS A), then returns to SUB at 100 ns with equal operands to exercise the zero flag. All 11 checks passed.*

> Module-level details in [Day 2](docs/Day02_Update.md), [Day 3](docs/Day03_Update.md) and [Day 4](docs/Day04_Update.md).

---

## 🔬 Functional Verification

### Execution Unit — Integrated Datapath

![Execution Unit Waveform](images/simulation/execution_unit_waveform.png)

*Cadence SimVision — complete execution-unit run (0–90 ns): initialization, `ADD R3, R1, R2` execution and write-back.*

The testbench resets the design, preloads `R1 = 10` and `R2 = 20` through the initialization interface, then executes `ADD R3, R1, R2`. Each stage is visible in the waveform:

1. **Register Initialization (0–50 ns).** `rst` is high for the first 20 ns and the registers read `0` from the first rising clock edge at 5 ns. With `init_write` high from 20 to 40 ns, the write-back select routes `init_addr` / `init_data` to the Register File: `registers[1]` becomes `10` at the 25 ns edge and `registers[2]` becomes `20` at the 35 ns edge.
2. **Instruction Decode (50 ns).** The instruction `0x01844000` is applied. The decoder splits it into `opcode = 0000` (ADD), `rd = 00011` (R3), `rs1 = 00001` (R1) and `rs2 = 00010` (R2).
3. **Register Read (50 ns).** `rs1` and `rs2` drive `read_addr1` / `read_addr2`, and `read_data1 = 10`, `read_data2 = 20` appear in the same time step as the new addresses, since the read ports are asynchronous.
4. **ALU Operation (50 ns).** `operand_a = 10` and `operand_b = 20` reach the ALU with `alu_op = 0000`, giving `alu_result = 30`. The `zero` flag is `0`.
5. **Write Back (50–70 ns).** `reg_write` is asserted, `init_write` is low, so the select logic drives `write_addr = 3` (`rd`) and `write_data = 30` (`alu_result`).
6. **Register Update (55 ns).** At the next rising clock edge `registers[3]` changes to `30`, completing the instruction.

| Check | Observed in waveform |
|-------|----------------------|
| Register initialization | `registers[1] = 10`, `registers[2] = 20` |
| Instruction decoding | `opcode = 0`, `rd = 3`, `rs1 = 1`, `rs2 = 2` |
| Register reads | `read_data1 = 10`, `read_data2 = 20` |
| Operand forwarding to ALU | `operand_a = 10`, `operand_b = 20` |
| ALU computation | `alu_result = 30`, `zero = 0` |
| Write-back path | `write_addr = 3`, `write_data = 30` |
| Register update | `registers[3] = 30` |

> The testbench is a directed test of one instruction (ADD) verified by waveform inspection and a final `$display` of the instruction, ALU result and zero flag. Full timeline and verification scope in [docs/Day05_Update.md](docs/Day05_Update.md).

---

## 🔮 Future Work

- **RTL optimization** ahead of synthesis
- **Synthesis with Cadence Genus** — timing constraints, area / power / timing reports and gate-level netlist
- **Physical design with Cadence Innovus** — floorplanning, placement, clock tree synthesis, routing, physical verification and GDSII generation
- **Signoff** — static timing analysis and timing closure
- **Wider system-level verification** — remaining opcodes and back-to-back instruction sequences through the integrated datapath, with self-checking comparisons

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

## 👨‍💻 Author

**Arshad Ansari**
M.Tech ECE (VLSI Design) — NIT Hamirpur
[![LinkedIn](https://img.shields.io/badge/LinkedIn-arshadansari04-0077B5?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/arshadansari04/)
[![GitHub](https://img.shields.io/badge/GitHub-arshad--vlsi-181717?style=flat-square&logo=github)](https://github.com/arshad-vlsi)
