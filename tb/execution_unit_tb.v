`timescale 1ns/1ps

`include "defines.vh"

module execution_unit_tb;

    //------------------------------------------------------------
    // Testbench Signals
    //------------------------------------------------------------

    reg clk;
    reg rst;

    reg reg_write;

    reg init_write;
    reg [4:0] init_addr;
    reg [31:0] init_data;

    reg [`INSTR_WIDTH-1:0] instruction;

    wire [31:0] alu_result;
    wire zero;

    //------------------------------------------------------------
    // Instantiate DUT
    //------------------------------------------------------------

    execution_unit DUT
    (
        .clk         (clk),
        .rst         (rst),

        .reg_write   (reg_write),

        .init_write  (init_write),
        .init_addr   (init_addr),
        .init_data   (init_data),

        .instruction (instruction),

        .alu_result  (alu_result),
        .zero        (zero)
    );


     integer pass_count;
     integer fail_count;

     initial 
     begin
         pass_count = 0;
         fail_count = 0;
     end
      
    //------------------------------------------------------------
    // Clock Generation
    //------------------------------------------------------------

    initial
    begin
        clk = 0;

        forever
            #5 clk = ~clk;
    end

    //------------------------------------------------------------
    // Test Sequence
    //------------------------------------------------------------

    initial
    begin

        //--------------------------------------------------------
        // Initialize Inputs
        //--------------------------------------------------------

        rst         = 1;

        reg_write   = 0;

        init_write  = 0;
        init_addr   = 0;
        init_data   = 0;

        instruction = 0;

        //--------------------------------------------------------
        // Reset
        //--------------------------------------------------------

        #20;

        rst = 0;

        $display("-----------------------------------------");
        $display("RESET COMPLETED");
        $display("-----------------------------------------");

        //--------------------------------------------------------
        // Register Initialization
        //--------------------------------------------------------

        init_write = 1;

        //-----------------------------------
        // R1 = 10
        //-----------------------------------

        init_addr = 5'd1;
        init_data = 32'd10;

        #10;

        //-----------------------------------
        // R2 = 20
        //-----------------------------------

        init_addr = 5'd2;
        init_data = 32'd20;

        #10;

        //-----------------------------------
        // R4 = 15
        //-----------------------------------

        init_addr = 5'd4;
        init_data = 32'd15;

        #10;

        //-----------------------------------
        // R5 = 3
        //-----------------------------------

        init_addr = 5'd5;
        init_data = 32'd3;

        #10;

        //-----------------------------------
        // R6 = 1
        //-----------------------------------

        init_addr = 5'd6;
        init_data = 32'd1;

        #10;

        //-----------------------------------
        // R7 = 16
        //-----------------------------------

        init_addr = 5'd7;
        init_data = 32'd16;

        #10;

        //-----------------------------------
        // R8 = 5
        //-----------------------------------

        init_addr = 5'd8;
        init_data = 32'd5;

        #10;

        init_write = 0;

        $display("-----------------------------------------");
        $display("REGISTER INITIALIZATION COMPLETED");
        $display("-----------------------------------------");

        //--------------------------------------------------------
        // Enable Register Write
        //--------------------------------------------------------

        reg_write = 1;

        //========================================================
        // ALU TESTS START HERE
        //========================================================


        //--------------------------------------------------------
        // TEST 1 : ADD
        // R3 = R1 + R2 = 10 + 20 = 30
        //--------------------------------------------------------

        instruction =
        {
            4'd0,
            5'd3,
            5'd1,
            5'd2,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 1 : ADD");
        $display("Expected ALU Result : 30");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd30)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end        

        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 2 : SUB
        // R9 = R2 - R1 = 20 - 10 = 10
        //--------------------------------------------------------

        instruction =
        {
            4'd1,
            5'd9,
            5'd2,
            5'd1,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 2 : SUB");
        $display("Expected ALU Result : 10");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd10)
         begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    

        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 3 : AND
        // R10 = R4 & R5 = 15 & 3 = 3
        //--------------------------------------------------------

        instruction =
        {
            4'd2,
            5'd10,
            5'd4,
            5'd5,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 3 : AND");
        $display("Expected ALU Result : 3");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd3)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    
        
        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 4 : OR
        // R11 = R4 | R5 = 15 | 3 = 15
        //--------------------------------------------------------

        instruction =
        {
            4'd3,
            5'd11,
            5'd4,
            5'd5,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 4 : OR");
        $display("Expected ALU Result : 15");
        $display("Actual   ALU Result : %0d", alu_result);
        if (alu_result == 32'd15)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    
        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 5 : XOR
        // R12 = R4 ^ R5 = 15 ^ 3 = 12
        //--------------------------------------------------------

        instruction =
        {
            4'd4,
            5'd12,
            5'd4,
            5'd5,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 5 : XOR");
        $display("Expected ALU Result : 12");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd12)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    
        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 6 : NOT
        // R13 = ~R4 = ~15 = 0xFFFFFFF0
        //--------------------------------------------------------

        instruction =
        {
            4'd5,
            5'd13,
            5'd4,
            5'd0,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 6 : NOT");
        $display("Expected ALU Result : FFFFFFF0");
        $display("Actual   ALU Result : %h", alu_result);

        if (alu_result == 32'hFFFFFFF0)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    

        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 7 : SHIFT LEFT
        // R14 = R6 << R5 = 1 << 3 = 8
        //--------------------------------------------------------

        instruction =
        {
            4'd6,
            5'd14,
            5'd6,
            5'd5,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 7 : SHIFT LEFT");
        $display("Expected ALU Result : 8");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd8)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    
        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 8 : SHIFT RIGHT
        // R15 = R7 >> R5 = 16 >> 3 = 2
        //--------------------------------------------------------

        instruction =
        {
            4'd7,
            5'd15,
            5'd7,
            5'd5,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 8 : SHIFT RIGHT");
        $display("Expected ALU Result : 2");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd2)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    

        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 9 : SET LESS THAN
        // R16 = (R8 < R1)
        // 5 < 10 = 1
        //--------------------------------------------------------

        instruction =
        {
            4'd8,
            5'd16,
            5'd8,
            5'd1,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 9 : SLT");
        $display("Expected ALU Result : 1");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd1)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    
        $display("-----------------------------------------");


        //--------------------------------------------------------
        // TEST 10 : PASS A
        // R17 = R2 = 20
        //--------------------------------------------------------

        instruction =
        {
            4'd9,
            5'd17,
            5'd2,
            5'd0,
            13'd0
        };

        #20;

        $display("-----------------------------------------");
        $display("TEST 10 : PASS A");
        $display("Expected ALU Result : 20");
        $display("Actual   ALU Result : %0d", alu_result);

        if (alu_result == 32'd20)
        begin
              pass_count = pass_count + 1;
              $display("RESULT : PASS");
        end
        else
        begin
              fail_count = fail_count + 1;
              $display("RESULT : FAIL");
        end    

        $display("-----------------------------------------");


        //--------------------------------------------------------
        // Disable Register Write
        //--------------------------------------------------------

        reg_write = 0;

        #20;

        //--------------------------------------------------------
        // Simulation Summary
        //--------------------------------------------------------

        $display("");
        $display("=========================================");
        $display("EXECUTION UNIT VERIFICATION SUMMARY");
        $display("=========================================");
        $display("Total Tests : %0d", pass_count + fail_count);
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);

        if (fail_count == 0)
            $display("STATUS : ALL TESTS PASSED");
        else
            $display("STATUS : SOME TESTS FAILED");

        $display("=========================================");

        #20;

        $finish;

    end

endmodule

