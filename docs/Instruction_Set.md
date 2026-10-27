# Instruction Set — Execution Unit

## Instruction Format

Each instruction is **32 bits wide** with the following field encoding:

```
 31      28 | 27    23 | 22    18 | 17    13 | 12          0
 ───────────┼──────────┼──────────┼──────────┼─────────────
   Opcode   |    rd    |   rs1    |   rs2    |   Reserved
  (4 bits)  | (5 bits) | (5 bits) | (5 bits) |  (13 bits)
```

---

## Field Description

| Field | Bits | Width | Description |
|-------|------|-------|-------------|
| Opcode | 31:28 | 4 bits | Operation code |
| rd | 27:23 | 5 bits | Destination Register |
| rs1 | 22:18 | 5 bits | Source Register 1 |
| rs2 | 17:13 | 5 bits | Source Register 2 |
| Reserved | 12:0 | 13 bits | Reserved for future use |

---

## Supported Operations

| Opcode | Mnemonic | Operation | Description |
|--------|----------|-----------|-------------|
| 4'b0000 | ADD | rd = rs1 + rs2 | Addition |
| 4'b0001 | SUB | rd = rs1 - rs2 | Subtraction |
| 4'b0010 | AND | rd = rs1 & rs2 | Bitwise AND |
| 4'b0011 | OR | rd = rs1 \| rs2 | Bitwise OR |
| 4'b0100 | XOR | rd = rs1 ^ rs2 | Bitwise XOR |
| 4'b0101 | NOT | rd = ~rs1 | Bitwise NOT |
| 4'b0110 | SLL | rd = rs1 << rs2 | Shift Left Logical |
| 4'b0111 | SRL | rd = rs1 >> rs2 | Shift Right Logical |
| 4'b1000 | SLT | rd = (rs1 < rs2) ? 1 : 0 | Set Less Than |
| 4'b1001 | PASS | rd = rs1 | Pass through |

---

## Instruction Encoding Example

**ADD R2, R3, R4** (R2 = R3 + R4)

```
 31:28   27:23   22:18   17:13   12:0
 0000    00010   00011   00100   0000000000000
 ADD      rd=2   rs1=3   rs2=4   Reserved
```

---

## defines.vh Macros

All instruction field widths and bit positions are defined in `rtl/defines.vh`:

| Macro | Value | Description |
|-------|-------|-------------|
| `INSTR_WIDTH` | 32 | Total instruction width |
| `MSB_OPCODE` | 31 | Opcode MSB position |
| `LSB_OPCODE` | 28 | Opcode LSB position |
| `OPCODE_MSB` | 3 | Opcode field MSB |
| `OPCODE_LSB` | 0 | Opcode field LSB |
| `MSB_RD` | 27 | rd MSB position |
| `LSB_RD` | 23 | rd LSB position |
| `RD_MSB` | 4 | rd field MSB |
| `RD_LSB` | 0 | rd field LSB |
| `MSB_RS1` | 22 | rs1 MSB position |
| `LSB_RS1` | 18 | rs1 LSB position |
| `RS1_MSB` | 4 | rs1 field MSB |
| `RS1_LSB` | 0 | rs1 field LSB |
| `MSB_RS2` | 17 | rs2 MSB position |
| `LSB_RS2` | 13 | rs2 LSB position |
| `RS2_MSB` | 4 | rs2 field MSB |
| `RS2_LSB` | 0 | rs2 field LSB |

---

*For architecture details see [Architecture.md](Architecture.md)*
*For project progress see [Progress_Log.md](Progress_Log.md)*
  
