# Progress Log — Execution Unit RTL-to-GDSII

---

## Day 1

**Date:** *(To be filled)*

### ✅ Work Completed

- Project planning finalized
- Architecture designed and documented
- Instruction set defined (10 operations)
- Folder structure created
- Repository initialized
- README written
- Documentation files created:
  - Architecture.md
  - Instruction_Set.md
  - Progress_Log.md
  - Project_Plan.md

### 🎯 Next Goal

- defines.vh — global macro definitions
- Instruction Decoder RTL

---

## Day 2

**Date:** *(To be filled)*

### ✅ Work Completed

- `defines.vh` implemented — parameterized macros for instruction field widths and bit positions
- Instruction Decoder RTL implemented (`rtl/instruction_decoder.v`)
  - Purely combinational — `assign` statements
  - Parameterized using `defines.vh` macros
  - Extracts opcode, rd, rs1, rs2 from 32-bit instruction
- Directed testbench implemented (`tb/tb_instruction_decoder.v`)
  - 3 test vectors — self-checking with pass/fail display
- Functional simulation completed using Cadence Xcelium
- Waveform verified in Cadence SimVision
- **All 3 test cases passed** ✅
- Day 2 documentation written (`docs/Day02_Update.md`)
- README and Architecture.md updated

### 🎯 Next Goal

- Register File RTL (`rtl/register_file.v`)

---

## Day 3

**Date:** Oct 28 2026

### ✅ Work Completed

- Register File RTL implemented (`rtl/register_file.v`)
  - 32 registers × 32-bit wide (32×32)
  - Synchronous active-high reset — clears all 32 registers
  - Synchronous write port — positive edge triggered with write enable
  - Dual asynchronous read ports — immediate combinational output
  - Write enable logic — prevents unintended register updates
- Register File testbench implemented (`tb/register_file_tb.v`)
  - 4 directed self-checking test cases
  - Covers: reset, write, read, dual-port read, write-disable
- Functional simulation completed using Cadence Xcelium
- Waveform verified in Cadence SimVision
- **All 4 test cases passed** ✅
- Waveform screenshot added to `images/simulation/`
- Day 3 documentation written (`docs/Day03_Update.md`)
- README updated — waveform embedded, project status updated
- Architecture.md updated — Register File marked complete

### 🎯 Next Goal

- ALU RTL (`rtl/alu.v`)

---

## Day 4

**Date:** *(To be filled)*

### ✅ Work Completed

- ALU RTL completed (`rtl/alu.v`)
  - Purely combinational 32-bit ALU
  - 10 operations: ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS A
  - Zero flag generation
  - Opcodes parameterized through `defines.vh`
- ALU testbench completed (`tb/alu_tb.v`)
  - 11 directed self-checking tests — one per operation plus the zero flag
- Functional verification completed using Cadence Xcelium
- Waveform verified in Cadence SimVision
- Zero flag verified
- **All 11 checks passed** ✅
- Waveform screenshot added to `images/simulation/alu_waveform.png`
- Day 4 documentation written (`docs/Day04_Update.md`)
- README updated — ALU waveform embedded, project status and progress tables updated
- Architecture.md updated — ALU marked complete

### 🎯 Next Goal

- Execution Unit integration (`rtl/execution_unit.v`)
  - Integrate Instruction Decoder, Register File and ALU
  - Connect the ALU result to the Register File write-back path
  - System-level testbench and verification in Cadence Xcelium

---

## Day 5

**Date:** Nov 4 2026

### ✅ Work Completed

- Execution Unit integration completed (`rtl/execution_unit.v`)
  - Instantiates the Instruction Decoder, Register File (Version 2) and ALU
  - Decoder `opcode` drives the ALU `alu_op`; `rs1` / `rs2` drive the Register File read addresses
  - Write-back select logic chooses between the initialization path and the normal write-back path
- Register initialization interface added — `init_write`, `init_addr`, `init_data`
- Register File updated to Version 2 (`rtl/register_file.v`)
- Execution Unit testbench completed (`tb/execution_unit_tb.v`)
  - Initializes `R1 = 10` and `R2 = 20`, then executes `ADD R3, R1, R2` (`0x01844000`)
- Functional verification completed using Cadence Xcelium / SimVision
  - Register initialization, instruction decoding, register reads, operand forwarding to the ALU, ALU computation, write-back path and register update verified
  - `R3 = 30`, zero flag = 0
- Waveform screenshot added to `images/simulation/execution_unit_waveform.png`
- Day 5 documentation written (`docs/Day05_Update.md`)
- README, Architecture.md and `images/architecture.svg` updated

### 🎯 Next Goal

- RTL optimization
- Synthesis with Cadence Genus — timing constraints and timing reports

---

## Day 6

**Date:** *(To be filled)*

### ✅ Work Completed

*(To be updated)*

### 🎯 Next Goal

*(To be updated)*

---

> This log is updated at the end of each working day.
> Each entry documents completed work and the next goal.
