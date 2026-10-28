# Day 3 — Register File RTL & Verification

**Project:** Execution-Unit-RTL-to-GDSII
**Date:** *(To be filled)*
**Status:** ✅ Completed

---

## Objective

Implement the **Register File** module in synthesizable Verilog HDL and verify its functional correctness using a 4-test directed testbench in Cadence Xcelium / SimVision before proceeding to the ALU RTL.

---

## Files Implemented

| File | Location | Description |
|------|----------|-------------|
| `register_file.v` | `rtl/register_file.v` | Synthesizable 32×32 Register File RTL |
| `register_file_tb.v` | `tb/register_file_tb.v` | Directed testbench — 4 self-checking test cases |

---

## Register File Architecture

The Register File is a **32×32** synchronous-write, asynchronous-read register bank:

```
                    clk   rst   we
                     │     │    │
                     ▼     ▼    ▼
write_addr[4:0] ──► ┌──────────────────┐
write_data[31:0]──► │   Register File  │ ──► read_data1[31:0]
                    │    32 × 32       │
read_addr1[4:0] ──► │                  │ ──► read_data2[31:0]
read_addr2[4:0] ──► └──────────────────┘
```

---

## Module Port Description

| Port | Direction | Width | Type | Description |
|------|-----------|-------|------|-------------|
| clk | Input | 1-bit | — | System clock — positive edge triggered |
| rst | Input | 1-bit | — | Synchronous active-high reset |
| we | Input | 1-bit | — | Write enable |
| write_addr | Input | 5-bit | — | Destination register address (0–31) |
| write_data | Input | 32-bit | — | Data to write |
| read_addr1 | Input | 5-bit | — | Read port 1 register address |
| read_addr2 | Input | 5-bit | — | Read port 2 register address |
| read_data1 | Output | 32-bit | wire | Read port 1 data output |
| read_data2 | Output | 32-bit | wire | Read port 2 data output |

---

## RTL Design Decisions

### Synchronous Write
- The write operation is clocked — register values update on the **positive edge of clk**
- This ensures **glitch-free writes** and clean synthesis to flip-flops

### Asynchronous Read
- Read ports use `assign` statements — data is available **immediately** without waiting for a clock edge
- This allows the ALU to receive operands in the **same clock cycle** as the read address is presented

### Synchronous Active-High Reset
- On `posedge clk` with `rst=1` — all 32 registers are cleared to `32'd0` using a `for` loop
- Synchronous reset ensures **no glitches** and clean synthesis behavior

### Write Enable (`we`)
- When `we=1` — write operation proceeds on the next clock edge
- When `we=0` — register contents are preserved regardless of `write_addr` and `write_data`

---

## Testbench Verification

**Tool:** Cadence Xcelium / SimVision
**Clock Period:** 10 ns (`always #5 clk = ~clk`)
**Test Cases:** 4 directed self-checking vectors

| Test | Operation | Stimulus | Expected | Result |
|------|-----------|----------|----------|--------|
| TEST1 | Write R5 = 0xAAAAAAAA → Read R5 | we=1, addr=5, data=AAAAAAAA | read_data1=AAAAAAAA | ✅ PASSED |
| TEST2 | Write R10 = 0x55555555 → Read R10 | we=1, addr=10, data=55555555 | read_data2=55555555 | ✅ PASSED |
| TEST3 | Simultaneous dual-port read R5 & R10 | read_addr1=5, read_addr2=10 | data1=AAAAAAAA, data2=55555555 | ✅ PASSED |
| TEST4 | Write disabled (we=0) — verify R5 unchanged | we=0, write_data=FFFFFFFF | read_data1=AAAAAAAA | ✅ PASSED |

**All 4 test cases passed** ✅

---

## Waveform Analysis

![Waveform](../images/simulation/register_file_waveform.png)

The SimVision waveform confirms:

| Signal | Observed Behavior |
|--------|------------------|
| `clk` | 10 ns period clock toggling throughout simulation |
| `rst` | High at t=0, deasserted at t=10ns — all registers cleared |
| `we` | Asserted during write windows only |
| `write_addr[4:0]` | Correctly selects R5 and R10 during write operations |
| `write_data[31:0]` | 0xAAAAAAAA → R5, 0x55555555 → R10 |
| `read_data1[31:0]` | Reads 0xAAAAAAAA from R5 after write |
| `read_data2[31:0]` | Reads 0x55555555 from R10 after write |
| `register_file[5]` | Internal R5 value visible — updates on posedge clk with we=1 |
| `register_file[10]` | Internal R10 value visible — updates on posedge clk with we=1 |

---

## Learning Outcomes

- Implemented a synthesizable synchronous-write asynchronous-read Register File
- Understood the design trade-off between synchronous and asynchronous read ports
- Applied write enable logic for controlled register updates
- Verified reset, write, read, dual-port read and write-disable using directed testbench
- Confirmed correct timing behavior through SimVision waveform inspection

---

## Next Milestone

**ALU RTL** — `rtl/alu.v`

- 32-bit arithmetic and logic unit
- Supports 10 operations: ADD, SUB, AND, OR, XOR, NOT, SLL, SRL, SLT, PASS
- Operation selected by 4-bit opcode from Instruction Decoder
- Verified using dedicated testbench in Cadence Xcelium

---

*See [Progress_Log.md](Progress_Log.md) for the full project timeline.*
