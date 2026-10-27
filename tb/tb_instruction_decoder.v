`timescale 1ns/1ps

`include "defines.vh"

module tb_instruction_decoder;

reg  [`INSTR_WIDTH-1:0] instruction;

wire [(`OPCODE_MSB-`OPCODE_LSB):0] opcode;
wire [(`RD_MSB-`RD_LSB):0]         rd;
wire [(`RS1_MSB-`RS1_LSB):0]       rs1;
wire [(`RS2_MSB-`RS2_LSB):0]       rs2;


//---------------------------------------------------------------
// DUT
//---------------------------------------------------------------

instruction_decoder dut
(
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .rs1(rs1),
    .rs2(rs2)
);


//---------------------------------------------------------------
// Test Sequence
//---------------------------------------------------------------

initial
begin

    $display("----------------------------------------------");
    $display("Instruction Decoder Test Started");
    $display("----------------------------------------------");

    //-----------------------------------------------------------
    // Test Case 1
    //-----------------------------------------------------------

    instruction = 32'b0001_00010_00011_00100_0000000000000;

    #10;

    if(opcode==4'b0001 &&
       rd==5'd2 &&
       rs1==5'd3 &&
       rs2==5'd4)
        $display("TEST CASE 1 PASSED");
    else
        $display("TEST CASE 1 FAILED");


    //-----------------------------------------------------------
    // Test Case 2
    //-----------------------------------------------------------

    instruction = 32'b0010_00101_00110_00111_0000000000000;

    #10;

    if(opcode==4'b0010 &&
       rd==5'd5 &&
       rs1==5'd6 &&
       rs2==5'd7)
        $display("TEST CASE 2 PASSED");
    else
        $display("TEST CASE 2 FAILED");


    //-----------------------------------------------------------
    // Test Case 3
    //-----------------------------------------------------------

    instruction = 32'b1111_11111_11110_11101_0000000000000;

    #10;

    if(opcode==4'b1111 &&
       rd==5'd31 &&
       rs1==5'd30 &&
       rs2==5'd29)
        $display("TEST CASE 3 PASSED");
    else
        $display("TEST CASE 3 FAILED");


    //-----------------------------------------------------------

    $display("----------------------------------------------");
    $display("Simulation Finished");
    $display("----------------------------------------------");

    $finish;

end

endmodule
