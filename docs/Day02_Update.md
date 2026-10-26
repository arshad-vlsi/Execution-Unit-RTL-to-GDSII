# Day 2 — Instruction Decoder RTL

**Project:** Execution-Unit-RTL-to-GDSII
**Date:** *(To be filled)*
**Status:** ✅ Completed

---

## Objective

Implement the **Instruction Decoder** module in synthesizable Verilog HDL and verify its functional correctness using Cadence Xcelium / SimVision before proceeding to the Register File RTL.

---

## What Was Implemented

- `instruction_decoder.v` — synthesizable Verilog RTL module
- Dedicated testbench for the Instruction Decoder
- Functional simulation and waveform verification using Cadence Xcelium / SimVision

---

## Instruction Format Used

The Instruction Decoder operates on a **32-bit instruction word** with the following field encoding:

```
 31      28 | 27    23 | 22    18 | 17    13 | 12          0
 ───────────┼──────────┼──────────┼──────────┼─────────────
   Opcode   |    rd    |   rs1    |   rs2    |   Reserved
  (4 bits)  | (5 bits) | (5 bits) | (5 bits) |  (13 bits)
```

| Field | Bits | Width | Description |
|-------|------|-------|-------------|
| Opcode | 31:28 | 4 bits | Operation code |
| rd | 27:23 | 5 bits | Destination register address |
| rs1 | 22:18 | 5 bits | Source register 1 address |
| rs2 | 17:13 | 5 bits | Source register 2 address |
| Reserved | 12:0 | 13 bits | Reserved for future use |

---

## Decoder Architecture

The Instruction Decoder is a **purely combinational module** that extracts fixed bit-fields from the 32-bit instruction using Verilog bit-select and part-select operations.

**Module Ports:**

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| instr | Input | 32 bits | 32-bit instruction word |
| opcode | Output | 4 bits | Extracted operation code |
| rd | Output | 5 bits | Destination register address |
| rs1 | Output | 5 bits | Source register 1 address |
| rs2 | Output | 5 bits | Source register 2 address |

---

## Why Continuous Assignments Were Used

The Instruction Decoder uses `assign` statements (continuous assignments) rather than `always` blocks because:

- The decoder performs **no state-holding operation** — outputs change immediately when input changes
- `assign` statements model **pure combinational logic** which is exactly what a bit-field extractor requires
- Using `assign` produces cleaner, more readable RTL that maps directly to wires in synthesis
- No clock or reset signal is needed — the decoder has **zero latency** and no sequential elements

---

## Why This Module Is Purely Combinational

The Instruction Decoder contains **no registers, no flip-flops and no clock** because:

- Its only function is to **route bits** from the instruction word to named output ports
- All outputs are directly and continuously driven by sub-fields of the input
- Introducing registers would add unnecessary pipeline latency before Register File reads
- The combinational nature allows the Register File to receive addresses in the **same clock cycle**

---

## Verification Approach

The testbench applied multiple 32-bit instruction vectors covering:

- All 10 supported opcodes (ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS)
- Various combinations of rd, rs1, rs2 register addresses
- Boundary values (register address 0 and 31)
- Verification that reserved bits (12:0) do not affect outputs

---

## Expected Waveform Description

| Signal | Expected Behavior |
|--------|------------------|
| `instr[31:0]` | 32-bit stimulus applied at regular intervals |
| `opcode[3:0]` | Immediately tracks `instr[31:28]` with zero propagation delay |
| `rd[4:0]` | Immediately tracks `instr[27:23]` with zero propagation delay |
| `rs1[4:0]` | Immediately tracks `instr[22:18]` with zero propagation delay |
| `rs2[4:0]` | Immediately tracks `instr[17:13]` with zero propagation delay |

---

## Learning Outcomes

- Designed and verified a purely combinational RTL module using synthesizable Verilog
- Understood the role of continuous assignments in combinational logic design
- Applied a structured verification approach using directed test vectors
- Confirmed correct bit-field extraction using Cadence Xcelium / SimVision
- Understood why the decoder must be combinational for zero-latency register addressing

---

## Next Milestone

**Register File RTL** — `rtl/register_file.v`

- 32 registers × 32-bit wide (32×32)
- Dual synchronous read ports (rs1, rs2)
- Single synchronous write port (rd)
- Active-high synchronous reset

---

*See [Progress_Log.md](Progress_Log.md) for the full project timeline.*
    
