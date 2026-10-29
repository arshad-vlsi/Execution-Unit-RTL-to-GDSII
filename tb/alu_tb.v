`timescale 1ns/1ps

`include "defines.vh"

module alu_tb;

reg  [31:0] operand_a;
reg  [31:0] operand_b;
reg  [3:0]  alu_op;

wire [31:0] result;
wire        zero;

//------------------------------------------------------------
// DUT
//------------------------------------------------------------

alu uut
(
    .operand_a(operand_a),
    .operand_b(operand_b),
    .alu_op(alu_op),

    .result(result),
    .zero(zero)
);

//------------------------------------------------------------
// Test Sequence
//------------------------------------------------------------

initial
begin

    //--------------------------------------------------------
    // ADD
    //--------------------------------------------------------

    operand_a = 10;
    operand_b = 20;
    alu_op    = `ALU_ADD;

    #10;

    if(result == 30)
        $display("ADD PASSED");
    else
        $display("ADD FAILED");

    //--------------------------------------------------------
    // SUB
    //--------------------------------------------------------

    operand_a = 20;
    operand_b = 10;
    alu_op    = `ALU_SUB;

    #10;

    if(result == 10)
        $display("SUB PASSED");
    else
        $display("SUB FAILED");

    //--------------------------------------------------------
    // AND
    //--------------------------------------------------------

    operand_a = 32'hF0F0F0F0;
    operand_b = 32'h0FF00FF0;
    alu_op    = `ALU_AND;

    #10;

    if(result == (32'hF0F0F0F0 & 32'h0FF00FF0))
        $display("AND PASSED");
    else
        $display("AND FAILED");

    //--------------------------------------------------------
    // OR
    //--------------------------------------------------------

    alu_op = `ALU_OR;

    #10;

    if(result == (32'hF0F0F0F0 | 32'h0FF00FF0))
        $display("OR PASSED");
    else
        $display("OR FAILED");

    //--------------------------------------------------------
    // XOR
    //--------------------------------------------------------

    operand_a = 32'hAAAAAAAA;
    operand_b = 32'h55555555;
    alu_op    = `ALU_XOR;

    #10;

    if(result == 32'hFFFFFFFF)
        $display("XOR PASSED");
    else
        $display("XOR FAILED");

    //--------------------------------------------------------
    // NOT
    //--------------------------------------------------------

    operand_a = 32'hAAAAAAAA;
    alu_op    = `ALU_NOT;

    #10;

    if(result == ~32'hAAAAAAAA)
        $display("NOT PASSED");
    else
        $display("NOT FAILED");

    //--------------------------------------------------------
    // SLL
    //--------------------------------------------------------

    operand_a = 1;
    operand_b = 2;
    alu_op    = `ALU_SLL;

    #10;

    if(result == 4)
        $display("SLL PASSED");
    else
        $display("SLL FAILED");

    //--------------------------------------------------------
    // SRL
    //--------------------------------------------------------

    operand_a = 16;
    operand_b = 2;
    alu_op    = `ALU_SRL;

    #10;

    if(result == 4)
        $display("SRL PASSED");
    else
        $display("SRL FAILED");

    //--------------------------------------------------------
    // SLT
    //--------------------------------------------------------

    operand_a = 5;
    operand_b = 10;
    alu_op    = `ALU_SLT;

    #10;

    if(result == 1)
        $display("SLT PASSED");
    else
        $display("SLT FAILED");

    //--------------------------------------------------------
    // PASS A
    //--------------------------------------------------------

    operand_a = 32'h12345678;
    alu_op    = `ALU_PASS_A;

    #10;

    if(result == 32'h12345678)
        $display("PASS A PASSED");
    else
        $display("PASS A FAILED");

    //--------------------------------------------------------
    // ZERO FLAG
    //--------------------------------------------------------

    operand_a = 10;
    operand_b = 10;
    alu_op    = `ALU_SUB;

    #10;

    if(zero == 1)
        $display("ZERO FLAG PASSED");
    else
        $display("ZERO FLAG FAILED");

    //--------------------------------------------------------

    #20;

    $display("--------------------------------");
    $display("ALU Simulation Completed");
    $display("--------------------------------");

    $finish;

end

endmodule
