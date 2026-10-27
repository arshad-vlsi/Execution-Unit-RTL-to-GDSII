//==============================================================================
// Project    : Execution Unit RTL-to-GDSII
// File       : defines.vh
// Version    : v1.0
// Author     : Arshad Ansari
//
// Description:
// Common project-wide macro definitions.
// This header contains instruction-related definitions shared
// across multiple RTL modules.
//==============================================================================

`ifndef EXECUTION_UNIT_DEFINES_VH
`define EXECUTION_UNIT_DEFINES_VH

//==============================================================================
// Instruction Width
//==============================================================================

`define INSTR_WIDTH 32

//==============================================================================
// Instruction Field Bit Positions
//==============================================================================

// Opcode Field [31:28]
`define OPCODE_MSB 31
`define OPCODE_LSB 28

// Destination Register (rd) [27:23]
`define RD_MSB 27
`define RD_LSB 23

// Source Register 1 (rs1) [22:18]
`define RS1_MSB 22
`define RS1_LSB 18

// Source Register 2 (rs2) [17:13]
`define RS2_MSB 17
`define RS2_LSB 13

`endif
