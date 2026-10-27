`timescale 1ns/1ps

`include "defines.vh"

module instruction_decoder (

   input [`INSTR_WIDTH-1:0] instruction,

   output [(`OPCODE_MSB-`OPCODE_LSB):0] opcode,
   output [(`RD_MSB-`RD_LSB):0] rd,
   output [(`RS1_MSB-`RS1_LSB):0] rs1,
   output [(`RS2_MSB-`RS2_LSB):0] rs2

);

assign opcode = instruction [`OPCODE_MSB:`OPCODE_LSB];
assign rd = instruction [`RD_MSB:`RD_LSB];
assign rs1 = instruction [`RS1_MSB:`RS1_LSB];
assign rs2 = instruction [`RS2_MSB:`RS2_LSB];

endmodule
