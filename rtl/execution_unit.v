`timescale 1ns/1ps

`include "defines.vh"

module execution_unit
(
    //------------------------------------------------------------
    // Inputs
    //------------------------------------------------------------
    input                       clk,
    input                       rst,

    // Normal Write Back Enable
    input                       reg_write,

    // Register Initialization Interface (Simulation / Verification)
    input                       init_write,
    input       [4:0]           init_addr,
    input       [31:0]          init_data,

    // Instruction
    input [`INSTR_WIDTH-1:0]    instruction,

    //------------------------------------------------------------
    // Outputs
    //------------------------------------------------------------
    output      [31:0]          alu_result,
    output                      zero
);

    //------------------------------------------------------------
    // Internal Signals
    //------------------------------------------------------------

    // Decoder Outputs
    wire [3:0]  opcode;
    wire [4:0]  rd;
    wire [4:0]  rs1;
    wire [4:0]  rs2;

    // Register File Outputs
    wire [31:0] operand_a;
    wire [31:0] operand_b;

    // Write Back Signals
    wire [4:0]  write_addr;
    wire [31:0] write_data;
    wire         rf_write_enable;

    //------------------------------------------------------------
    // Instruction Decoder
    //------------------------------------------------------------

    instruction_decoder decoder
    (
        .instruction (instruction),

        .opcode      (opcode),
        .rd          (rd),
        .rs1         (rs1),
        .rs2         (rs2)
    );

    //------------------------------------------------------------
    // Register File
    //------------------------------------------------------------

    register_file rf
    (
        .clk         (clk),
        .rst         (rst),

        .reg_write   (rf_write_enable),

        .write_addr  (write_addr),
        .write_data  (write_data),

        .read_addr1  (rs1),
        .read_addr2  (rs2),

        .read_data1  (operand_a),
        .read_data2  (operand_b)
    );

    //------------------------------------------------------------
    // ALU
    //------------------------------------------------------------

    alu alu_core
    (
        .operand_a   (operand_a),
        .operand_b   (operand_b),

        .alu_op      (opcode),

        .result      (alu_result),
        .zero        (zero)
    );

    //------------------------------------------------------------
    // Write Back Control
    //------------------------------------------------------------

    // During initialization:
    //     write init_data into init_addr
    //
    // During normal execution:
    //     write ALU result into destination register (rd)

    assign write_addr = (init_write) ? init_addr : rd;

    assign write_data = (init_write) ? init_data : alu_result;

    assign rf_write_enable = init_write | reg_write;

endmodule
