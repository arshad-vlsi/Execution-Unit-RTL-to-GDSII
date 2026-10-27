# Architecture — Execution Unit

## Overview

This document describes the high-level architecture of the 32-bit Processor Execution Unit implemented in this project.

| Module | Description | Status |
|--------|-------------|--------|
| Instruction Decoder | Decodes 32-bit instruction into control signals | ✅ Complete |
| Register File | 32×32 Register File storing operands and results | 🔄 In Progress |
| ALU | 32-bit Arithmetic and Logic Unit | ⏳ Upcoming |
| Top Module | Integrates all sub-modules | ⏳ Upcoming |

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
              |   Register File      |  🔄 In Progress
              |      32 × 32         |
              +----------------------+
                  │            │
                  │            │
                  ▼            ▼
               Operand A   Operand B
                    \        /
                     \      /
                      ▼    ▼
                  +------------+
                  |    ALU     |  ⏳ Upcoming
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
- Purely **combinational** — implemented using `assign` statements
- **Parameterized** using `defines.vh` macros
- **Verified** — 3/3 test cases passed in Cadence Xcelium / SimVision

---

### 2. Register File 🔄 In Progress

- Contains **32 registers**, each **32 bits wide** (32×32)
- Supports **two simultaneous read ports** (rs1, rs2)
- Supports **one write port** (rd)
- Reads operands and provides them to the ALU
- Writes ALU result back on completion

---

### 3. ALU ⏳ Upcoming

- Receives **Operand A** and **Operand B** from Register File
- Performs operation based on **opcode** from Instruction Decoder
- Supports **10 operations** — see Instruction_Set.md
- Outputs **32-bit ALU Result**

---

### 4. Top Module ⏳ Upcoming

```
execution_unit_top
    ├── instruction_decoder   ✅ Complete
    ├── register_file         🔄 In Progress
    └── alu                   ⏳ Upcoming
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
*For Day 2 details see [Day02_Update.md](Day02_Update.md)*
