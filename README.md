# Execution-Unit-RTL-to-GDSII

![Verilog](https://img.shields.io/badge/Verilog%20HDL-0075ca?style=flat-square)
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

## ✨ Features

- 32-bit instruction decoding
- 32×32 Register File (32 registers × 32-bit width)
- 32-bit ALU supporting 10 operations
- Complete RTL-to-GDSII flow
- Synthesis using Cadence Genus
- Physical Design using Cadence Innovus
- Static Timing Analysis (STA)
- Timing Closure

---

## 🏗 Architecture

```
                     32-bit Instruction
                              │
                              ▼
                  ┌──────────────────────┐
                  │  Instruction Decoder │  ◄── Purple
                  │  Opcode·rs1·rs2·rd   │
                  └──────────────────────┘
                    │        │        │
                   rs1      rs2       rd
                    │        │        │
                    ▼        ▼        ▼
              ┌──────────────────────────┐
              │      Register File       │  ◄── Teal
              │        32 × 32           │
              └──────────────────────────┘
                   │              │
                   ▼              ▼
               Operand A      Operand B
                    \            /
                     \          /
                      ▼        ▼
                  ┌────────────┐
                  │    ALU     │  ◄── Coral
                  │  32-bit    │
                  └────────────┘
                        │
                   ALU Result
                        │
                        ▼
              ┌──────────────────────────┐
              │  Register File Writeback │  ◄── Teal
              │       Result → rd        │
              └──────────────────────────┘
```

---

## 📁 Directory Structure

```
Execution-Unit-RTL-to-GDSII/
│
├── rtl/
│   ├── defines.vh                  ← Global definitions
│   ├── instruction_decoder.v       ← Instruction Decoder
│   ├── register_file.v             ← 32×32 Register File
│   ├── alu.v                       ← 32-bit ALU
│   └── execution_unit_top.v        ← Top Module
│
├── tb/
│   └── execution_unit_tb.v         ← Testbench
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
├── images/                         ← Screenshots & layouts
├── docs/
│   ├── Project_Plan.md
│   ├── Architecture.md
│   ├── Instruction_Set.md
│   └── Progress_Log.md
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
| Cadence Xcelium / SimVision | Simulation & Verification |
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
| Instruction Decoder RTL | 🔜 Upcoming |
| Register File RTL | 🔜 Upcoming |
| ALU RTL | 🔜 Upcoming |
| Top Module | 🔜 Upcoming |
| Verification / Testbench | 🔜 Upcoming |
| Synthesis (Genus) | 🔜 Upcoming |
| Physical Design (Innovus) | 🔜 Upcoming |
| STA & Timing Closure | 🔜 Upcoming |
| GDSII | 🔜 Upcoming |

---

## 🗺 Development Roadmap

```
Phase 1 — RTL Design
  ├── defines.vh
  ├── instruction_decoder.v
  ├── register_file.v
  ├── alu.v
  └── execution_unit_top.v

Phase 2 — Verification
  └── execution_unit_tb.v

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

## 📊 Screenshots

> Screenshots of simulation waveforms, synthesis reports, floorplan, placement, routing and final GDSII layout will be added here as the project progresses.

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

## 👨‍💻 Author

**Arshad Ansari**
M.Tech ECE (VLSI Design) — NIT Hamirpur
[![LinkedIn](https://img.shields.io/badge/LinkedIn-arshadansari04-0077B5?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/arshadansari04/)
[![GitHub](https://img.shields.io/badge/GitHub-arshad04022002-181717?style=flat-square&logo=github)](https://github.com/arshad04022002)
