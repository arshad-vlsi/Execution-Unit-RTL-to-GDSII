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
  - Write enable (`we`) logic — prevents unintended register updates
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
- Ready to begin ALU RTL

### 🎯 Next Goal

- ALU RTL (`rtl/alu.v`)
  - 32-bit arithmetic and logic unit
  - 10 operations: ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS
  - 4-bit opcode selection from Instruction Decoder
  - Verification using directed testbench in Cadence Xcelium

---

## Day 4

**Date:** *(To be filled)*

### ✅ Work Completed

*(To be updated)*

### 🎯 Next Goal

*(To be updated)*

---

> This log is updated at the end of each working day.
> Each entry documents completed work and the next goal.
