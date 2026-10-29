# Execution-Unit-RTL-to-GDSII

![Verilog](https://img.shields.io/badge/Verilog%20HDL-0075ca?style=flat-square)
![Cadence Xcelium](https://img.shields.io/badge/Cadence%20Xcelium-e36209?style=flat-square)
![Cadence Genus](https://img.shields.io/badge/Cadence%20Genus-e36209?style=flat-square)
![Cadence Innovus](https://img.shields.io/badge/Cadence%20Innovus-e36209?style=flat-square)
![ASIC](https://img.shields.io/badge/ASIC%20Design-8957e5?style=flat-square)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=flat-square)

RTL-to-GDSII implementation of a 32-bit Processor Execution Unit (Instruction Decoder + Register File + ALU) using Verilog HDL, Cadence Xcelium, Cadence Genus and Cadence Innovus.

---

## 📌 Project Description

This project demonstrates the complete **RTL-to-GDSII implementation flow** of a processor execution unit. Starting from a 32-bit instruction, the design decodes the instruction, reads operands from a 32×32 Register File, performs an arithmetic or logical operation in the ALU, and writes the result back to the Register File.

The entire flow — from RTL design through synthesis, physical design, and timing closure — is implemented using industry-standard Cadence EDA tools on Linux.

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [Architecture](docs/Architecture.md) | Block diagram, module descriptions and data flow |
| [Instruction Set](docs/Instruction_Set.md) | 32-bit instruction format and supported operations |
| [Project Plan](docs/Project_Plan.md) | Phases and milestones |
| [Progress Log](docs/Progress_Log.md) | Chronological engineering log |
| [Day 2 Update](docs/Day02_Update.md) | Instruction Decoder RTL and verification |
| [Day 3 Update](docs/Day03_Update.md) | Register File RTL and verification |
| [Day 4 Update](docs/Day04_Update.md) | ALU RTL and verification |

---

## 🆕 Latest Progress

### Day 4 Progress — ALU RTL Complete

Implemented a synthesizable 32-bit ALU. Successfully verified using **Cadence Xcelium** and **SimVision**.

Implemented:

- **Arithmetic operations** — ADD, SUB
- **Logical operations** — AND, OR, XOR, NOT
- **Shift operations** — Shift Left Logical (SLL), Shift Right Logical (SRL)
- **Comparison operation** — Set Less Than (SLT)
- **PASS A operation**
- **Zero flag generation**

All 11 directed checks passed and the waveform was verified in SimVision.
**Next:** integrate the three verified modules in the Execution Unit top module.

<details>
<summary>Previous progress</summary>

**Day 3 — Register File RTL Complete.** Synthesizable 32×32 Register File with dual asynchronous read ports, a single synchronous write port, synchronous active-high reset and write enable. All 4 directed tests passed in Cadence Xcelium.

**Day 2 — Instruction Decoder RTL Complete.** Purely combinational decoder parameterized with `defines.vh`. All 3 directed tests passed in Cadence Xcelium.

</details>

---

## ✨ Features

- Parameterized 32-bit instruction decoding using `defines.vh`
- 32×32 Register File — dual asynchronous read, single synchronous write, synchronous reset
- 32-bit ALU with 10 operations and zero flag
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
| Register File | ✅ Complete |
| ALU | ✅ Complete |
| Execution Unit Top | 🔄 In Progress |

> Full details in [docs/Architecture.md](docs/Architecture.md).

---

## 📁 Directory Structure

```
Execution-Unit-RTL-to-GDSII/
│
├── rtl/
│   ├── defines.vh                  ← Global macro definitions ✅
│   ├── instruction_decoder.v       ← Instruction Decoder ✅
│   ├── register_file.v             ← 32×32 Register File ✅
│   ├── alu.v                       ← 32-bit ALU ✅
│   └── execution_unit_top.v        ← Top Module 🔄
│
├── tb/
│   ├── tb_instruction_decoder.v    ← Instruction Decoder Testbench ✅
│   ├── register_file_tb.v          ← Register File Testbench ✅
│   └── alu_tb.v                    ← ALU Testbench ✅
│
├── images/
│   ├── architecture.svg
│   └── simulation/
│         ├── instruction_decoder_waveform.png  ← Verified ✅
│         ├── register_file_waveform.png        ← Verified ✅
│         └── alu_waveform.png                  ← Verified ✅
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
│   └── Day04_Update.md
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
| Repository Setup | ✅ Complete |
| Instruction Decoder | ✅ Complete |
| Register File | ✅ Complete |
| ALU | ✅ Complete |
| Execution Unit Top | 🔄 In Progress |
| System Verification | ⏳ Pending |
| Cadence Genus | ⏳ Pending |
| Cadence Innovus | ⏳ Pending |
| STA | ⏳ Pending |
| Timing Closure | ⏳ Pending |
| GDSII | ⏳ Pending |

---

## 📈 Project Progress

| Stage | Status |
|-------|--------|
| Architecture | ✅ |
| Instruction Decoder | ✅ |
| Register File | ✅ |
| ALU | ✅ |
| Execution Unit Top | 🔄 |
| Verification | 🔄 |
| Genus | ⏳ |
| Innovus | ⏳ |
| Timing Closure | ⏳ |
| GDSII | ⏳ |

---

## 🗺 Development Roadmap

```
Phase 1 — RTL Design
  ├── defines.vh                ✅ Complete
  ├── instruction_decoder.v     ✅ Complete — 3/3 tests passed
  ├── register_file.v           ✅ Complete — 4/4 tests passed
  ├── alu.v                     ✅ Complete — 11/11 checks passed
  └── execution_unit_top.v      🔄 In Progress

Phase 2 — Verification
  ├── tb_instruction_decoder.v  ✅ Complete
  ├── register_file_tb.v        ✅ Complete
  ├── alu_tb.v                  ✅ Complete
  └── System-level testbench    ⏳ Pending

Phase 3 — Synthesis (Cadence Genus)
  ├── genus.tcl
  └── Netlist + Reports

Phase 4 — Physical Design (Cadence Innovus)
  ├── Floorplanning
  ├── Placement
  ├── Clock Tree Synthesis (CTS)
  ├── Routing
  └── GDSII

Phase 5 — Signoff
  ├── STA
  ├── Timing Closure
  └── Final GDSII
```

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

*Cadence SimVision — `clk`, `rst`, `we`, `write_addr`, `write_data`, `read_addr1`, `read_addr2`, `read_data1`, `read_data2` and internal `register_file[5]` / `register_file[10]` across 4 directed tests.*

| Test | Description | Result |
|------|-------------|--------|
| TEST1 | Write `0xAAAAAAAA` to R5, read R5 | ✅ PASSED |
| TEST2 | Write `0x55555555` to R10, read R10 | ✅ PASSED |
| TEST3 | Simultaneous dual-port read of R5 and R10 | ✅ PASSED |
| TEST4 | Write disabled (`we=0`), R5 unchanged | ✅ PASSED |

---

### ALU Verification

![ALU Waveform](images/simulation/alu_waveform.png)

*Figure — ALU functional verification in Cadence SimVision (0–120 ns). Signals: `operand_a[31:0]`, `operand_b[31:0]`, `alu_op[3:0]`, `result[31:0]` and `zero`. `alu_op` steps through 0–9 in 10 ns windows, then returns to SUB at 100 ns with equal operands to exercise the zero flag.*

| Verification | alu_op | Window | What the waveform shows |
|--------------|--------|--------|--------------------------|
| Arithmetic | 0 (ADD), 1 (SUB) | 0–20 ns | `10 + 20 = 30`, `20 − 10 = 10` |
| Logical | 2 (AND), 3 (OR), 4 (XOR), 5 (NOT) | 20–60 ns | `0xF0F0F0F0` AND/OR `0x0FF00FF0`; `0xAAAAAAAA` XOR `0x55555555` = `0xFFFFFFFF`; NOT of `0xAAAAAAAA` = `0x55555555` |
| Shift | 6 (SLL), 7 (SRL) | 60–80 ns | `1 << 2 = 4`, `16 >> 2 = 4` |
| Comparison | 8 (SLT) | 80–90 ns | `5 < 10` gives `result = 1` |
| PASS A | 9 | 90–100 ns | `result` equals `operand_a` (`0x12345678`) |
| Zero flag | 1 (SUB) | from 100 ns | `10 − 10` gives `result = 0` and `zero` rises to 1 |

| Check | Result |
|-------|--------|
| ADD, SUB, AND, OR, XOR, NOT | ✅ PASSED |
| SLL, SRL, SLT, PASS A | ✅ PASSED |
| ZERO FLAG | ✅ PASSED |

> Details and verification scope in [docs/Day04_Update.md](docs/Day04_Update.md).

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

## 👨‍💻 Author

**Arshad Ansari**
M.Tech ECE (VLSI Design) — NIT Hamirpur
[![LinkedIn](https://img.shields.io/badge/LinkedIn-arshadansari04-0077B5?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/arshadansari04/)
[![GitHub](https://img.shields.io/badge/GitHub-arshad--vlsi-181717?style=flat-square&logo=github)](https://github.com/arshad-vlsi)
