# Day 7 — ASIC Synthesis Environment Setup

**Project:** Execution-Unit-RTL-to-GDSII
**Date:** *(To be filled)*
**Status:** ✅ Completed — environment prepared, **no synthesis run yet**

---

## Objective

Prepare the project for RTL synthesis with Cadence Genus. Today's work organized the repository into a professional ASIC project structure and created the files a synthesis run needs: timing constraints, an automated Genus script and output directories. No synthesis was performed.

---

## Files Added

| File | Location | Description |
|------|----------|-------------|
| `execution_unit.sdc` | `constraints/execution_unit.sdc` | First Synopsys Design Constraints file |
| `run_genus.tcl` | `synthesis/scripts/run_genus.tcl` | Automated Cadence Genus synthesis script |
| Synthesis directories | `synthesis/reports`, `netlist`, `database`, `logs` | Output locations for the synthesis run |

---

## Repository Organization

```
Execution-Unit-RTL-to-GDSII/
│
├── rtl/
├── tb/
├── constraints/
├── synthesis/
│   ├── scripts/
│   ├── reports/
│   ├── netlist/
│   ├── database/
│   └── logs/
└── README.md
```

| Directory | Purpose |
|-----------|---------|
| `rtl/` | Synthesizable RTL source |
| `tb/` | Verification testbenches |
| `constraints/` | Timing constraints (SDC) |
| `synthesis/scripts/` | Synthesis scripts |
| `synthesis/reports/` | Area, gate-count, timing and power reports |
| `synthesis/netlist/` | Gate-level netlist |
| `synthesis/database/` | Genus database |
| `synthesis/logs/` | Genus logs |

`docs/`, `images/` and `reports/` (the Day 6 simulation transcript) are unchanged.

### RTL and testbenches

| RTL (`rtl/`) | Testbench (`tb/`) |
|--------------|-------------------|
| `defines.vh` | — |
| `instruction_decoder.v` | Instruction Decoder testbench |
| `register_file.v` | `register_file_tb.v` |
| `alu.v` | `alu_tb.v` |
| `execution_unit.v` | `execution_unit_tb.v` |

---

## Timing Constraints

**File:** `constraints/execution_unit.sdc`

```tcl
create_clock -name clk -period 10 [get_ports clk]

set_input_delay 2 -clock clk [remove_from_collection [all_inputs] [get_ports clk]]

set_output_delay 2 -clock clk [all_outputs]
```

| Constraint | Value | Applied to |
|------------|-------|------------|
| Primary clock | `clk`, 10 ns period (100 MHz) | Port `clk` |
| Input delay | 2 ns relative to `clk` | All inputs except `clk` |
| Output delay | 2 ns relative to `clk` | All outputs |

- The clock port is removed from the input-delay collection, so `clk` is not given an input delay.
- A path that runs directly from an input port to an output port has a window of 10 ns − 2 ns − 2 ns = **6 ns**.

---

## Cadence Genus Script

**File:** `synthesis/scripts/run_genus.tcl`

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `read_lib` | Read the 90 nm technology library (`slow.lib`) |
| 2 | `read_hdl` | Read `defines.vh`, `alu.v`, `instruction_decoder.v`, `register_file.v` and `execution_unit.v` |
| 3 | `elaborate execution_unit` | Elaborate the top module |
| 4 | `read_sdc` | Read `constraints/execution_unit.sdc` |
| 5 | `check_design` | Check the design |
| 6 | `syn_gen` | Generic synthesis |
| 7 | `syn_map` | Technology mapping |
| 8 | `syn_opt` | Logic optimization |
| 9 | `report area`, `gates`, `timing`, `power` | Generate reports |
| 10 | `write_hdl` | Write the gate-level netlist |

### Output locations

| Output | Location |
|--------|----------|
| Area report | `synthesis/reports/area.rpt` |
| Gate (cell count) report | `synthesis/reports/gates.rpt` |
| Timing report | `synthesis/reports/timing.rpt` |
| Power report | `synthesis/reports/power.rpt` |
| Gate-level netlist | `synthesis/netlist/execution_unit_syn.v` |

`synthesis/database/` and `synthesis/logs/` are prepared for later use and are not written by the script yet.

---

## Technology Library

The project is configured for the **90 nm standard-cell library** used in the laboratory (`slow.lib`). The library belongs to the lab environment and is not included in this repository.

---

## Planned ASIC Flow

```
RTL
 ↓
Timing Constraints
 ↓
Cadence Genus
 ↓
Synthesis
 ↓
Timing Analysis
 ↓
Area Analysis
 ↓
Power Analysis
 ↓
Cadence Innovus
 ↓
Physical Design
 ↓
GDSII
```

---

## Items to Review During the First Synthesis Run

- **Paths.** The script uses absolute paths from the lab workstation. They need adjusting to run on another machine.
- **Macro file.** `defines.vh` is read with `read_hdl` and is also included by the RTL. Confirm in the first elaboration log that the macros resolve.
- **Constraint set.** The SDC currently holds the clock and the input and output delays only. Review whether further constraints are needed.
- **Input-to-output path.** `instruction` reaches `alu_result` and `zero` through the decoder, the asynchronous register read and the ALU, all combinational. Check it against the 6 ns window in `timing.rpt`.
- **Output directories.** The script redirects reports and the netlist into `synthesis/reports/` and `synthesis/netlist/`, so these folders must exist before the run.

---

## Learning Outcomes

- Organized an ASIC project into separate RTL, verification, constraint and synthesis areas
- Wrote a first SDC file with a primary clock and input and output delays
- Automated the synthesis flow in a single Genus script
- Planned report and netlist outputs before running the tool

---

## Next Step

Run `run_genus.tcl` in Cadence Genus, review the timing, area and power reports, and save the reports and gate-level netlist in `synthesis/`.

---

*See [Progress_Log.md](Progress_Log.md) for the full project timeline and [Day06_Update.md](Day06_Update.md) for the functional verification results.*
