# Execution-Unit-RTL-to-GDSII

![Verilog](https://img.shields.io/badge/Verilog%20HDL-0075ca?style=flat-square)
![Cadence Xcelium](https://img.shields.io/badge/Cadence%20Xcelium-e36209?style=flat-square)
![Cadence Genus](https://img.shields.io/badge/Cadence%20Genus-e36209?style=flat-square)
![Cadence Innovus](https://img.shields.io/badge/Cadence%20Innovus-e36209?style=flat-square)
![ASIC](https://img.shields.io/badge/ASIC%20Design-8957e5?style=flat-square)
![RTL](https://img.shields.io/badge/RTL%20Integration-Complete-2ea44f?style=flat-square)
![Verification](https://img.shields.io/badge/Functional%20Verification-10%2F10%20Passed-2ea44f?style=flat-square)
![Status](https://img.shields.io/badge/Status-In%20Progress-yellow?style=flat-square)

RTL-to-GDSII implementation of a 32-bit Processor Execution Unit (Instruction Decoder + Register File + ALU) using Verilog HDL, Cadence Xcelium, Cadence Genus and Cadence Innovus.

---

## 📌 Project Overview

This project demonstrates the complete **RTL-to-GDSII implementation flow** of a processor execution unit. Starting from a 32-bit instruction, the design decodes the instruction, reads operands from a 32×32 Register File, performs an arithmetic or logical operation in the ALU, and writes the result back to the destination register.

**Current stage:** the Instruction Decoder, Register File (Version 2) and ALU are integrated in the `execution_unit` top module and the complete datapath has been functionally verified. All ten supported ALU operations pass end to end in Cadence Xcelium / SimVision (10 of 10). The next phases are RTL optimization and synthesis with Cadence Genus.

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
| [Day 5 Update](docs/Day05_Update.md) | Execution Unit integration and first datapath run |
| [Day 6 Update](docs/Day06_Update.md) | Comprehensive functional verification of all ALU operations |

---

## 🆕 Current Progress

### Day 6 Progress — Comprehensive Functional Verification

Completed comprehensive functional verification of the complete Execution Unit (Instruction Decoder, Register File, ALU and top module).

- Verified **all 10 supported ALU operations** end to end
- Every instruction was exercised through: Instruction → Instruction Decoder → Register File read → ALU execution → Write-back → Destination register updated
- Registers were preloaded through the initialization interface (`init_write`, `init_addr`, `init_data`)
- The testbench is self-checking: it compares the expected and actual ALU result for each test and prints a PASS / FAIL summary

| Metric | Result |
|--------|--------|
| Total operations verified | 10 |
| Passed | 10 |
| Failed | 0 |
| Simulator | Cadence Xcelium |
| Waveform viewer | Cadence SimVision |
| Status | ✅ Functional verification completed successfully |

**Next:** RTL optimization, then synthesis with Cadence Genus.

<details>
<summary>Previous progress</summary>

**Day 5 — Execution Unit Integration.** Integrated the Instruction Decoder, Register File (Version 2) and ALU in `execution_unit`, added the register-initialization interface and verified a first instruction (`ADD R3, R1, R2`) through the full datapath.

**Day 4 — ALU RTL Complete.** Synthesizable 32-bit combinational ALU with 10 operations and a zero flag. All 11 directed checks passed.

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
- Self-checking system-level testbench covering all 10 ALU operations
- Complete RTL-to-GDSII flow
- Synthesis using Cadence Genus
- Physical Design using Cadence Innovus
- Static Timing Analysis (STA)
- Timing Closure

---

## 🏗 Architecture

![Architecture Diagram](images/architecture.svg)

| Block | Status | Verification |
|-------|--------|--------------|
| Instruction Decoder | ✅ Complete | 3/3 module tests |
| Register File (Version 2) | ✅ Complete | 4/4 module tests (Day 3) · used in all 10 integrated tests |
| ALU | ✅ Complete | 11/11 module checks |
| Execution Unit (top) | ✅ Complete | ✅ 10/10 operations verified end to end |

**Data flow**

```
Instruction → Instruction Decoder → Register File (read) → ALU → Write-Back → Destination Register
```

### Execution Unit

`execution_unit` instantiates the decoder, register file and ALU and adds a write-back select that shares the Register File's single write port between normal write-back and register initialization. All ten ALU operations have been verified through this integrated datapath (see [Functional Verification](#-functional-verification)).

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
│   └── execution_unit_tb.v         ← Execution Unit Testbench — 10-operation, self-checking ✅
│
├── images/
│   ├── architecture.svg
│   └── simulation/
│         ├── instruction_decoder_waveform.png              ← Verified ✅
│         ├── register_file_waveform.png                    ← Verified ✅
│         ├── alu_waveform.png                              ← Verified ✅
│         ├── execution_unit_waveform.png                   ← Day 5 first datapath run ✅
│         └── execution_unit_all_operations_waveform.png    ← Day 6 all 10 operations ✅
│
├── constraints/
│   └── execution_unit.sdc          ← ⏳ Planned
│
├── scripts/
│   ├── genus.tcl                   ← ⏳ Planned
│   └── innovus.tcl                 ← ⏳ Planned
│
├── genus/
├── innovus/
├── reports/
│   └── execution_unit_simulation_transcript.txt   ← Day 6 simulation transcript ✅
├── docs/
│   ├── Project_Plan.md
│   ├── Architecture.md
│   ├── Instruction_Set.md
│   ├── Progress_Log.md
│   ├── Day02_Update.md
│   ├── Day03_Update.md
│   ├── Day04_Update.md
│   ├── Day05_Update.md
│   └── Day06_Update.md
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

## 🚦 Project Progress

| Milestone | Status |
|-----------|--------|
| Project Setup | ✅ Complete |
| Common Definitions (`defines.vh`) | ✅ Complete |
| Instruction Decoder | ✅ Complete |
| Register File (Version 2) | ✅ Complete |
| ALU | ✅ Complete |
| Execution Unit Integration | ✅ Complete |
| Functional Verification | ✅ Complete — 10/10 operations passed |
| RTL Optimization | 🔜 Next |
| Cadence Genus Synthesis | ⏳ Pending |
| Timing Analysis | ⏳ Pending |
| Area Analysis | ⏳ Pending |
| Power Analysis | ⏳ Pending |
| Cadence Innovus Physical Design | ⏳ Pending |
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
- [ ] Cadence Genus Synthesis
- [ ] Timing Analysis
- [ ] Area Analysis
- [ ] Power Analysis
- [ ] Cadence Innovus Physical Design
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

### Execution Unit — All ALU Operations

The complete Execution Unit was verified with a self-checking testbench in **Cadence Xcelium**, with waveforms inspected in **Cadence SimVision**. After reset, the testbench preloads registers through the initialization interface and then runs one instruction for each ALU operation.

**Initial register state**

| Register | Value |
|----------|-------|
| R1 | 10 |
| R2 | 20 |
| R4 | 15 |
| R5 | 3 |
| R6 | 1 |
| R7 | 16 |
| R8 | 5 |

**Path exercised by every instruction**

```
Instruction → Instruction Decoder → Register File Read → ALU Execution → Write Back → Destination Register Updated
```

**Results**

| Test | Operation | Expected ALU Result | Actual ALU Result | Result |
|------|-----------|---------------------|-------------------|--------|
| 1 | ADD | 30 | 30 | ✅ PASS |
| 2 | SUB | 10 | 10 | ✅ PASS |
| 3 | AND | 3 | 3 | ✅ PASS |
| 4 | OR | 15 | 15 | ✅ PASS |
| 5 | XOR | 12 | 12 | ✅ PASS |
| 6 | NOT | `0xFFFFFFF0` | `0xFFFFFFF0` | ✅ PASS |
| 7 | SHIFT LEFT | 8 | 8 | ✅ PASS |
| 8 | SHIFT RIGHT | 2 | 2 | ✅ PASS |
| 9 | SET LESS THAN (SLT) | 1 | 1 | ✅ PASS |
| 10 | PASS A | 20 | 20 | ✅ PASS |

**Total: 10 · Passed: 10 · Failed: 0**

#### Final Waveform

![Execution Unit — All Operations Waveform](images/simulation/execution_unit_all_operations_waveform.png)

*Cadence SimVision — complete Execution Unit run covering all ten ALU operations. `alu_op` changes with each instruction and `alu_result` takes the expected value for each test in turn: `30`, `10`, `3`, `15`, `12`, `0xFFFFFFF0`, `8`, `2`, `1`, `20`.*

#### Simulation Transcript

```
=========================================
EXECUTION UNIT VERIFICATION SUMMARY
=========================================
Total Tests : 10
Passed      : 10
Failed      : 0
STATUS : ALL TESTS PASSED
=========================================
```

<details>
<summary>Full simulation transcript</summary>

```
-----------------------------------------
RESET COMPLETED
-----------------------------------------
-----------------------------------------
REGISTER INITIALIZATION COMPLETED
-----------------------------------------
-----------------------------------------
TEST 1 : ADD
Expected ALU Result : 30
Actual   ALU Result : 30
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 2 : SUB
Expected ALU Result : 10
Actual   ALU Result : 10
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 3 : AND
Expected ALU Result : 3
Actual   ALU Result : 3
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 4 : OR
Expected ALU Result : 15
Actual   ALU Result : 15
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 5 : XOR
Expected ALU Result : 12
Actual   ALU Result : 12
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 6 : NOT
Expected ALU Result : FFFFFFF0
Actual   ALU Result : fffffff0
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 7 : SHIFT LEFT
Expected ALU Result : 8
Actual   ALU Result : 8
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 8 : SHIFT RIGHT
Expected ALU Result : 2
Actual   ALU Result : 2
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 9 : SLT
Expected ALU Result : 1
Actual   ALU Result : 1
RESULT : PASS
-----------------------------------------
-----------------------------------------
TEST 10 : PASS A
Expected ALU Result : 20
Actual   ALU Result : 20
RESULT : PASS
-----------------------------------------

=========================================
EXECUTION UNIT VERIFICATION SUMMARY
=========================================
Total Tests : 10
Passed      : 10
Failed      : 0
STATUS : ALL TESTS PASSED
=========================================
```

The same transcript is saved in [reports/execution_unit_simulation_transcript.txt](reports/execution_unit_simulation_transcript.txt).

</details>

#### Datapath Bring-Up (Day 5)

![Execution Unit Day 5 Waveform](images/simulation/execution_unit_waveform.png)

*The first integrated run — initialization of R1 and R2, then `ADD R3, R1, R2` with `R3 = 30` — is explained stage by stage in [docs/Day05_Update.md](docs/Day05_Update.md).*

> Test setup, scope and waveform notes in [docs/Day06_Update.md](docs/Day06_Update.md).

---

## 🔮 Future Work

- **RTL optimization** ahead of synthesis
- **Cadence Genus synthesis** — timing constraints, timing, area and power analysis, and gate-level netlist
- **Cadence Innovus physical design** — floorplanning, placement, clock tree synthesis, routing, physical verification and GDSII generation
- **Signoff** — static timing analysis and timing closure
- **Additional verification corners** — edge-case operand values, undefined opcodes and dependent instruction sequences, re-run after RTL optimization

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

---

## 👨‍💻 Author

**Arshad Ansari**
M.Tech ECE (VLSI Design) — NIT Hamirpur
[![LinkedIn](https://img.shields.io/badge/LinkedIn-arshadansari04-0077B5?style=flat-square&logo=linkedin)](https://www.linkedin.com/in/arshadansari04/)
[![GitHub](https://img.shields.io/badge/GitHub-arshad--vlsi-181717?style=flat-square&logo=github)](https://github.com/arshad-vlsi)
