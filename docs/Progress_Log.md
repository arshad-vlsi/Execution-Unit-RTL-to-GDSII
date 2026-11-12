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

- Comprehensive functional verification of all ALU operations through the Execution Unit

---

## Day 6

**Date:** *(To be filled)*

### ✅ Work Completed

- Comprehensive functional verification of the complete Execution Unit completed
  - `tb/execution_unit_tb.v` updated to a 10-operation, self-checking testbench
  - All ten ALU operations verified end to end: ADD, SUB, AND, OR, XOR, NOT, SHIFT LEFT, SHIFT RIGHT, SLT, PASS A
  - Every instruction exercised through decode, register read, ALU execution, write-back and destination register update
- Registers initialized through `init_write`, `init_addr`, `init_data`
  - `R1 = 10`, `R2 = 20`, `R4 = 15`, `R5 = 3`, `R6 = 1`, `R7 = 16`, `R8 = 5`
- Simulation run in Cadence Xcelium, waveforms viewed in Cadence SimVision
- **Total tests: 10 · Passed: 10 · Failed: 0** ✅
- Final SimVision waveform added to `images/simulation/execution_unit_all_operations_waveform.png`
- Simulation transcript added to `reports/execution_unit_simulation_transcript.txt`
- Day 6 documentation written (`docs/Day06_Update.md`)
- README updated — verification, simulation, execution unit, progress, roadmap, folder structure and future work sections

### 🎯 Next Goal

- Prepare the ASIC synthesis environment for Cadence Genus

---

## Day 7

**Date:** *(To be filled)*

### ✅ Work Completed

- ASIC synthesis environment setup completed — **no synthesis was run**
- Repository organized into a professional ASIC project structure
  - `rtl/` — `defines.vh`, `instruction_decoder.v`, `register_file.v`, `alu.v`, `execution_unit.v`
  - `tb/` — all four verification testbenches
  - `constraints/` — timing constraints
  - `synthesis/` — `scripts`, `reports`, `netlist`, `database`, `logs`
- First SDC file created (`constraints/execution_unit.sdc`)
  - Primary clock `clk`, 10 ns period (100 MHz)
  - Input delay 2 ns on all inputs except `clk`
  - Output delay 2 ns on all outputs
- Automated Cadence Genus script created (`synthesis/scripts/run_genus.tcl`)
  - Read library, read RTL, elaborate, read constraints, check design
  - Generic synthesis, technology mapping, logic optimization
  - Area, gate, timing and power reports, and gate-level netlist
- Project configured for the 90 nm standard-cell library used in the laboratory
- Day 7 documentation written (`docs/Day07_Update.md`)
- README updated — ASIC Implementation section, synthesis preparation workflow, folder structure, badges and progress tracker

### 🎯 Next Goal

- First Cadence Genus synthesis run
- Review timing, area and power reports
- Save reports and gate-level netlist in `synthesis/`

---

## Day 8

**Date:** *(To be filled)*

### ✅ Work Completed

- RTL synthesis of the complete Execution Unit completed using Cadence Genus
  - Technology library: 90 nm standard-cell library (`slow.lib`), slow corner
  - Top module: `execution_unit`
  - RTL synthesized: `defines.vh`, `instruction_decoder.v`, `register_file.v`, `alu.v`, `execution_unit.v`
- Timing constraints applied from `constraints/execution_unit.sdc` — 10 ns clock (100 MHz), input and output delays
- Automated synthesis executed with `synthesis/scripts/run_genus.tcl`
  - Read library, read RTL, elaborate, read constraints, check design
  - Generic synthesis, technology mapping, logic optimization
  - Reports and gate-level netlist generated
- Gate-level netlist generated — `synthesis/netlist/execution_unit_syn.v`
- Synthesis reports generated — `synthesis/reports/area.rpt`, `gates.rpt`, `timing.rpt`, `power.rpt`
- **No synthesis errors encountered** ✅
- Screenshots added to `images/synthesis/`: synthesis completion, gate-level schematic, generated reports and project directory
- Day 8 documentation written (`docs/Day08_Update.md`)
- README updated — RTL Synthesis section, ASIC Implementation status, folder structure, progress tracker and roadmap

### 🎯 Next Goal

- Area analysis (`area.rpt`)
- Gate-level analysis (`gates.rpt` and the netlist)
- Timing analysis (`timing.rpt`)
- Power analysis (`power.rpt`)

---

## Day 9

**Date:** *(To be filled)*

### ✅ Work Completed

- Area analysis of the synthesized Execution Unit completed using the Cadence Genus area report (`synthesis/reports/area.rpt`)
  - Top module: `execution_unit`
  - Technology library: 90 nm standard-cell library, slow corner
  - Wireload mode: enclosed · Operating condition: slow (balanced_tree)
- Area results
  - Cell Count: 5373 standard cells
  - Cell Area: 38190.146 µm²
  - Net Area: 0.000 µm²
  - Total Area: 38190.146 µm²
- Interpreted the report
  - The RTL was mapped to 5373 standard-cell instances
  - Net Area is zero because placement and routing have not been performed, so Total Area equals Cell Area
- Synthesis completed without errors
- Area report screenshot added to `images/synthesis/genus_area_report.png`
- Day 9 documentation written (`docs/Day09_Update.md`)
- README updated — Area Analysis section, ASIC flow, progress tracker, roadmap and folder structure

### 🎯 Next Goal

- Gate-level analysis (`gates.rpt` and the netlist)
- Timing analysis (`timing.rpt`)
- Power analysis (`power.rpt`)

---

## Day 10

**Date:** *(To be filled)*

### ✅ Work Completed

*(To be updated)*

### 🎯 Next Goal

*(To be updated)*

---

> This log is updated at the end of each working day.
> Each entry documents completed work and the next goal.
