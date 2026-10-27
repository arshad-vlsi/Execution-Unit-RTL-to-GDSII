# Day 2 — Instruction Decoder RTL & Verification

**Project:** Execution-Unit-RTL-to-GDSII
**Date:** *(To be filled)*
**Status:** ✅ Completed

---

## Objective

Implement the **Instruction Decoder** module in synthesizable Verilog HDL using parameterized macros from `defines.vh`, and verify its functional correctness using a directed testbench in Cadence Xcelium / SimVision.

---

## Files Implemented

| File | Location | Description |
|------|----------|-------------|
| `defines.vh` | `rtl/defines.vh` | Global macro definitions for instruction field widths and bit positions |
| `instruction_decoder.v` | `rtl/instruction_decoder.v` | Synthesizable Verilog RTL — purely combinational decoder |
| `tb_instruction_decoder.v` | `tb/tb_instruction_decoder.v` | Directed testbench — 3 test vectors |

---

## Instruction Format Used

The Instruction Decoder operates on a **32-bit instruction word** parameterized using macros from `defines.vh`:

```
 31      28 | 27    23 | 22    18 | 17    13 | 12          0
 ───────────┼──────────┼──────────┼──────────┼─────────────
   Opcode   |    rd    |   rs1    |   rs2    |   Reserved
  (4 bits)  | (5 bits) | (5 bits) | (5 bits) |  (13 bits)
```

| Field | Bits | Macro | Width |
|-------|------|-------|-------|
| Opcode | 31:28 | `MSB_OPCODE:LSB_OPCODE` | 4 bits |
| rd | 27:23 | `MSB_RD:LSB_RD` | 5 bits |
| rs1 | 22:18 | `MSB_RS1:LSB_RS1` | 5 bits |
| rs2 | 17:13 | `MSB_RS2:LSB_RS2` | 5 bits |
| Reserved | 12:0 | — | 13 bits |

---

## Decoder Architecture

The Instruction Decoder is a **purely combinational module** that uses `assign` statements to extract parameterized bit-fields from the 32-bit instruction.

**Module Ports:**

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| instruction | Input | `INSTR_WIDTH` | 32-bit instruction word |
| opcode | Output | `OPCODE_MSB-OPCODE_LSB` | Extracted operation code |
| rd | Output | `RD_MSB-RD_LSB` | Destination register address |
| rs1 | Output | `RS1_MSB-RS1_LSB` | Source register 1 address |
| rs2 | Output | `RS2_MSB-RS2_LSB` | Source register 2 address |

**Key Design Decision — `defines.vh` macros:**
All bit-field widths and positions are defined as macros in `defines.vh`. This ensures a single point of change for the instruction format — modifying `defines.vh` automatically updates all modules that `include` it.

---

## Why Continuous Assignments Were Used

The Instruction Decoder uses `assign` statements because:

- The decoder performs **no state-holding operation** — outputs change immediately when input changes
- `assign` statements model **pure combinational logic** — exactly what a bit-field extractor requires
- No clock or reset signal is needed — the decoder has **zero propagation delay**
- Maps directly to wires in synthesis — clean, minimal gate count

---

## Why This Module Is Purely Combinational

The Instruction Decoder contains **no registers, no flip-flops and no clock** because:

- Its only function is to **route bits** from the instruction word to named output ports
- Introducing registers would add unnecessary latency before the Register File reads
- Combinational nature allows the Register File to receive addresses in the **same clock cycle**

---

## Testbench Verification Approach

The testbench (`tb`) applied **3 directed test vectors** covering:

| Test Case | Instruction (32-bit binary) | Expected opcode | Expected rd | Expected rs1 | Expected rs2 |
|-----------|----------------------------|-----------------|-------------|-------------|-------------|
| TC1 | `0001_00010_00011_00100_0000000000000` | 4'b0001 | 5'd2 | 5'd3 | 5'd4 |
| TC2 | `0010_00101_00110_00111_0000000000000` | 4'b0010 | 5'd5 | 5'd6 | 5'd7 |
| TC3 | `1111_11111_11110_11101_0000000000000` | 4'b1111 | 5'd31 | 5'd30 | 5'd29 |

Each vector was applied with `#10` delay. Outputs checked using `if` conditions with `$display` pass/fail messages.

---

## Simulation Results

**Tool:** Cadence Xcelium / SimVision
**Result:** ✅ All 3 test cases passed

```
----------------------------------------------
Instruction Decoder Test Started
----------------------------------------------
TEST CASE 1 PASSED
TEST CASE 2 PASSED
TEST CASE 3 PASSED
----------------------------------------------
Simulation Finished
----------------------------------------------
```

---

## Waveform Description

![Waveform](../images/simulation/instruction_decoder_waveform.png)

The SimVision waveform confirms:

| Signal | Behavior |
|--------|----------|
| `instruction[31:0]` | 32-bit stimulus applied at t=0, t=10, t=20 ns |
| `opcode[3:0]` | Immediately tracks `instruction[31:28]` — zero delay |
| `rd[4:0]` | Immediately tracks `instruction[27:23]` — zero delay |
| `rs1[4:0]` | Immediately tracks `instruction[22:18]` — zero delay |
| `rs2[4:0]` | Immediately tracks `instruction[17:13]` — zero delay |

All output transitions are **instantaneous** — confirming purely combinational behavior.

---

## Learning Outcomes

- Implemented a synthesizable combinational RTL module using parameterized macros
- Understood the role of `defines.vh` for centralizing instruction format parameters
- Applied directed test vectors with pass/fail self-checking testbench
- Verified purely combinational behavior through zero-delay waveform transitions

---

## Next Milestone

**Register File RTL** — `rtl/register_file.v`

- 32 registers × 32-bit wide (32×32)
- Dual synchronous read ports (rs1, rs2)
- Single synchronous write port (rd)
- Active-high synchronous reset
- Verification using dedicated testbench in Cadence Xcelium

---

*See [Progress_Log.md](Progress_Log.md) for the full project timeline.*
