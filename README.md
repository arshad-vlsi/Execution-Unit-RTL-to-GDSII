# Execution-Unit-RTL-to-GDSII

![Verilog](https://img.shields.io/badge/Verilog%20HDL-0075ca?style=flat-square)
![Cadence Xcelium](https://img.shields.io/badge/Cadence%20Xcelium-e36209?style=flat-square)
![Cadence Genus](https://img.shields.io/badge/Cadence%20Genus-e36209?style=flat-square)
![Cadence Innovus](https://img.shields.io/badge/Cadence%20Innovus-e36209?style=flat-square)
![ASIC](https://img.shields.io/badge/ASIC%20Design-8957e5?style=flat-square)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=flat-square)

RTL-to-GDSII implementation of a 32-bit Processor Execution Unit (Instruction Decoder + Register File + ALU) using Verilog HDL, Cadence Genus and Cadence Innovus.

---

## 📌 Project Description

This project demonstrates the complete **RTL-to-GDSII implementation flow** of a processor execution unit. Starting from a 32-bit instruction, the design decodes the instruction, reads operands from a 32×32 Register File, performs an arithmetic or logical operation in the ALU, and writes the result back to the Register File.

The entire flow — from RTL design through synthesis, physical design, and timing closure — is implemented using industry-standard Cadence EDA tools on Linux.

---

## 🆕 Latest Progress

> **Day 2 — Instruction Decoder RTL Complete**
>
> The Instruction Decoder module has been implemented in synthesizable Verilog HDL using `defines.vh` macros for parameterized bit-field extraction. The module was verified using a 3-vector directed testbench in Cadence Xcelium. All three test cases passed. Waveform verified in Cadence SimVision. The Register File RTL is now in progress.

---

## ✨ Features

- Parameterized 32-bit instruction decoding using `defines.vh`
- 32×32 Register File (32 registers × 32-bit width)
- 32-bit ALU supporting 10 operations
- Complete RTL-to-GDSII flow
- Synthesis using Cadence Genus
- Physical Design using Cadence Innovus
- Static Timing Analysis (STA)
- Timing Closure

---

## 🏗 Architecture

![Architecture Diagram](images/architecture.svg)

---

## 📁 Directory Structure

```
Execution-Unit-RTL-to-GDSII/
│
├── rtl/
│   ├── defines.vh                  ← Global macro definitions ✅
│   ├── instruction_decoder.v       ← Instruction Decoder ✅
│   ├── register_file.v             ← 32×32 Register File 🔄
│   ├── alu.v                       ← 32-bit ALU ⏳
│   └── execution_unit_top.v        ← Top Module ⏳
│
├── tb/
│   └── tb_instruction_decoder.v    ← Instruction Decoder Testbench ✅
│
├── images/
│   └── simulation/
│         └── instruction_decoder_waveform.png ← Verified waveform ✅
│
├── constraints/
│   └── execution_unit.sdc          ← Timing Constraints
│
├── scripts/
│   ├── genus.tcl                   ← Synthesis Script
│   └── innovus.tcl                 ← Physical Design Script
│
├── genus/                          ← Genus output files
├── innovus/                        ← Innovus output files
├── reports/                        ← Timing, Power, Area reports
├── docs/
│   ├── Project_Plan.md
│   ├── Architecture.md
│   ├── Instruction_Set.md
│   ├── Progress_Log.md
│   └── Day02_Update.md
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

| Phase | Status |
|-------|--------|
| Architecture Planning | ✅ Complete |
| Repository Initialization | ✅ Complete |
| Folder Structure | ✅ Complete |
| Project Specification | ✅ Complete |
| defines.vh | ✅ Complete |
| Instruction Decoder RTL | ✅ Complete |
| Instruction Decoder Verification | ✅ Complete |
| Register File RTL | 🔄 In Progress |
| ALU RTL | ⏳ Upcoming |
| Top Module | ⏳ Upcoming |
| Full Verification / Testbench | ⏳ Upcoming |
| Synthesis (Genus) | ⏳ Upcoming |
| Physical Design (Innovus) | ⏳ Upcoming |
| STA & Timing Closure | ⏳ Upcoming |
| GDSII | ⏳ Upcoming |

---

## 🗺 Development Roadmap

```
Phase 1 — RTL Design
  ├── defines.vh                ✅ Complete
  ├── instruction_decoder.v     ✅ Complete — 3/3 test cases passed
  ├── register_file.v           🔄 In Progress
  ├── alu.v                     ⏳ Upcoming
  └── execution_unit_top.v      ⏳ Upcoming

Phase 2 — Verification
  ├── tb_instruction_decoder.v  ✅ Complete
  └── tb_execution_unit.v       ⏳ Upcoming

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

> **Cadence SimVision** — Waveform showing `instruction[31:0]`, `opcode[3:0]`, `rd[4:0]`, `rs1[4:0]`, `rs2[4:0]` across 3 directed test vectors.
> All output fields track input bit-fields with zero propagation delay — confirming purely combinational behavior.
> **All 3 test cases passed.**

| Test Case | instruction | opcode | rd | rs1 | rs2 | Result |
|-----------|-------------|--------|-----|-----|-----|--------|
| TC1 | 32'b0001_00010_00011_00100_... | 0001 | 00010 | 00011 | 00100 | ✅ PASSED |
| TC2 | 32'b0010_00101_00110_00111_... | 0010 | 00101 | 00110 | 00111 | ✅ PASSED |
| TC3 | 32'b1111_11111_11110_11101_... | 1111 | 11111 | 11110 | 11101 | ✅ PASSED |

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

## 👨‍💻 Author

**Arshad Ansari**
M.Tech ECE (VLSI Design) — NIT Hamirpur
[![LinkedIn](https://img.shields.io/badge/LinkedIn-arshadansari04-0077B5?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/arshadansari04/)
[![GitHub](https://img.shields.io/badge/GitHub-arshad--vlsi-181717?style=flat-square&logo=github)](https://github.com/arshad-vlsi)
