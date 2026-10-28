# Architecture — Execution Unit

## Overview

This document describes the high-level architecture of the 32-bit Processor Execution Unit implemented in this project.

| Module | Description | Status |
|--------|-------------|--------|
| Instruction Decoder | Decodes 32-bit instruction into control signals | ✅ Complete |
| Register File | 32×32 Register File storing operands and results | ✅ Complete |
| ALU | 32-bit Arithmetic and Logic Unit | 🔄 Next Module |
| Top Module | Integrates all sub-modules | ⏳ Pending |

---

## Block Diagram

```
                     32-bit Instruction
                              │
                              ▼
                  +----------------------+
                  | Instruction Decoder  |  ✅ Complete
                  | (combinational)      |
                  +----------------------+
                    │      │      │
                  rs1     rs2     rd
                    │      │      │
                    ▼      ▼      ▼
              +----------------------+
              |   Register File      |  ✅ Complete
              |   32 × 32            |
              | sync write           |
              | async read           |
              +----------------------+
                  │            │
                  │            │
                  ▼            ▼
               Operand A   Operand B
                    \        /
                     \      /
                      ▼    ▼
                  +------------+
                  |    ALU     |  🔄 Next Module
                  +------------+
                        │
                   ALU Result
                        │
                        ▼
                Register File
                  (Write Back)
```

---

## Module Descriptions

### 1. Instruction Decoder ✅ Complete — Verified

- Receives a **32-bit instruction**
- Extracts **opcode** (bits 31:28) — 4-bit operation code
- Extracts **rd** (bits 27:23) — 5-bit destination register address
- Extracts **rs1** (bits 22:18) — 5-bit source register 1 address
- Extracts **rs2** (bits 17:13) — 5-bit source register 2 address
- Purely **combinational** — `assign` statements
- Parameterized using `defines.vh` macros
- **Verified** — 3/3 test cases passed

---

### 2. Register File ✅ Complete — Verified

- **32 registers × 32-bit wide** (32×32)
- **Synchronous active-high reset** — all registers cleared on posedge clk with rst=1
- **Synchronous write** — data written on posedge clk with we=1
- **Dual asynchronous read ports** — immediate combinational read output
- **Write enable** (`we`) — protects registers from unintended writes
- **Verified** — 4/4 test cases passed:
  - ✅ Reset initialization
  - ✅ Register write
  - ✅ Register read
  - ✅ Dual-port simultaneous read
  - ✅ Write disable verification

---

### 3. ALU 🔄 Next Module

- Receives **Operand A** and **Operand B** from Register File
- Performs operation based on **opcode** from Instruction Decoder
- Supports **10 operations**: ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS
- Outputs **32-bit ALU Result**
- Result written back to Register File via `rd`

---

### 4. Top Module ⏳ Pending

```
execution_unit_top
    ├── instruction_decoder   ✅ Complete
    ├── register_file         ✅ Complete
    └── alu                   🔄 Next Module
```

---

## Data Flow

```
1. 32-bit instruction → Instruction Decoder
2. Decoder extracts opcode, rs1, rs2, rd
3. Register File reads rs1 → Operand A
4. Register File reads rs2 → Operand B
5. ALU performs operation based on opcode
6. ALU result written back to rd in Register File
```

---

*For instruction encoding details see [Instruction_Set.md](Instruction_Set.md)*
*For project progress see [Progress_Log.md](Progress_Log.md)*
*For Day 3 details see [Day03_Update.md](Day03_Update.md)*
