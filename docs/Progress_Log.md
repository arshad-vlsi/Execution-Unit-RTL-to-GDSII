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
  - 3 test vectors covering normal, boundary and max-value cases
  - Self-checking with `$display` pass/fail messages
- Functional simulation completed using Cadence Xcelium
- Waveform verified in Cadence SimVision
- **All 3 test cases passed** ✅
- Simulation waveform screenshot captured and added to repository
- Day 2 documentation written (`docs/Day02_Update.md`)
- README updated — waveform embedded, project status updated
- Architecture.md updated — Instruction Decoder marked complete
- Ready to begin Register File RTL

### 🎯 Next Goal

- Register File RTL (`rtl/register_file.v`)
  - 32 registers × 32-bit wide (32×32)
  - Dual synchronous read ports (rs1, rs2)
  - Single synchronous write port (rd)
  - Active-high synchronous reset
  - Verification using directed testbench in Cadence Xcelium

---

## Day 3

**Date:** *(To be filled)*

### ✅ Work Completed

*(To be updated)*

### 🎯 Next Goal

*(To be updated)*

---

> This log is updated at the end of each working day.
> Each entry documents completed work and the next goal.
