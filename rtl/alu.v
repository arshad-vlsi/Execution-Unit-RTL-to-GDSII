`timescale 1ns/1ps

`include "defines.vh"

module alu
(
    input  [31:0] operand_a,
    input  [31:0] operand_b,
    input  [3:0]  alu_op,

    output reg [31:0] result,
    output            zero
);

//------------------------------------------------------------
// ALU Combinational Logic
//------------------------------------------------------------

always @(*)
begin

    case(alu_op)

        `ALU_ADD :
            result = operand_a + operand_b;

        `ALU_SUB :
            result = operand_a - operand_b;

        `ALU_AND :
            result = operand_a & operand_b;

        `ALU_OR :
            result = operand_a | operand_b;

        `ALU_XOR :
            result = operand_a ^ operand_b;

        `ALU_NOT :
            result = ~operand_a;

        `ALU_SLL :
            result = operand_a << operand_b[4:0];

        `ALU_SRL :
            result = operand_a >> operand_b[4:0];

        `ALU_SLT :
        begin
            if(operand_a < operand_b)
                result = 32'd1;
            else
                result = 32'd0;
        end

        `ALU_PASS_A :
            result = operand_a;

        default :
            result = 32'd0;

    endcase

end

//------------------------------------------------------------
// Zero Flag
//------------------------------------------------------------

assign zero = (result == 32'd0);

endmodule
