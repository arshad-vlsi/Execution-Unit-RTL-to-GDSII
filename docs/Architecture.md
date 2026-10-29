# Architecture — Execution Unit

## Overview

This document describes the high-level architecture of the 32-bit Processor Execution Unit implemented in this project.

| Module | Description | Status |
|--------|-------------|--------|
| Instruction Decoder | Decodes 32-bit instruction into control signals | ✅ Complete |
| Register File | 32×32 Register File storing operands and results | ✅ Complete |
| ALU | 32-bit Arithmetic and Logic Unit | ✅ Complete |
| Execution Unit Top | Integrates all sub-modules | 🔄 In Progress |

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
                  |    ALU     |  ✅ Complete
                  | + zero flag|
                  +------------+
                        │
                   ALU Result
                        │
                        ▼
                Register File
                  (Write Back)

   Execution Unit Top — integration of the blocks above  🔄 In Progress
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
- **Verified** — 4/4 test cases passed

---

### 3. ALU ✅ Complete — Verified

- Receives **Operand A** and **Operand B** (`operand_a`, `operand_b`) from the Register File read ports
- Selects the operation with the 4-bit `alu_op` input
- **Purely combinational** — `always @(*)` with a `case` statement
- Opcodes parameterized through `defines.vh`
- Produces a **32-bit `result`** and a **`zero` flag** (`result == 0`)
- **Verified** — 11/11 checks passed

| alu_op | Operation | Category |
|--------|-----------|----------|
| 0 | ADD | Arithmetic |
| 1 | SUB | Arithmetic |
| 2 | AND | Logical |
| 3 | OR | Logical |
| 4 | XOR | Logical |
| 5 | NOT | Logical |
| 6 | SLL | Shift |
| 7 | SRL | Shift |
| 8 | SLT | Comparison |
| 9 | PASS A | Pass-through |

---

### 4. Execution Unit Top 🔄 In Progress

```
execution_unit_top
    ├── instruction_decoder   ✅ Complete
    ├── register_file         ✅ Complete
    └── alu                   ✅ Complete
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
*For Day 4 details see [Day04_Update.md](Day04_Update.md)*
