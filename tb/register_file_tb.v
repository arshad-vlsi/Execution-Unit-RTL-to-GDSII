`timescale 1ns/1ps

module register_file_tb;

reg clk;
reg rst;
reg reg_write;

reg [4:0] write_addr;
reg [31:0] write_data;

reg [4:0] read_addr1;
reg [4:0] read_addr2;

wire [31:0] read_data1;
wire [31:0] read_data2;

register_file uut
(
    .clk(clk),
    .rst(rst),
    .reg_write(reg_write),
    .write_addr(write_addr),
    .write_data(write_data),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin

    clk = 0;
    rst = 1;
    reg_write  = 0;

    write_addr = 0;
    write_data = 0;

    read_addr1 = 0;
    read_addr2 = 0;

    //------------------------------------------------
    // Reset
    //------------------------------------------------

    #10;
    rst = 0;

    //------------------------------------------------
    // Write Register 5
    //------------------------------------------------

    #10;
    reg_write = 1;
    write_addr = 5;
    write_data = 32'hAAAAAAAA;

    #10;
    reg_write = 0;

    //------------------------------------------------
    // Read Register 5
    //------------------------------------------------

    #10;
    read_addr1 = 5;

    #10;

    if(read_data1 == 32'hAAAAAAAA)
        $display("TEST1 PASSED");
    else
        $display("TEST1 FAILED");

    //------------------------------------------------
    // Write Register 10
    //------------------------------------------------

    #10;
    reg_write = 1;
    write_addr = 10;
    write_data = 32'h55555555;

    #10;
    reg_write = 0;

    //------------------------------------------------
    // Read Register 10
    //------------------------------------------------

    #10;
    read_addr2 = 10;

    #10;

    if(read_data2 == 32'h55555555)
        $display("TEST2 PASSED");
    else
        $display("TEST2 FAILED");

    //------------------------------------------------
    // Read Both Registers
    //------------------------------------------------

    #10;
    read_addr1 = 5;
    read_addr2 = 10;

    #10;

    if(read_data1 == 32'hAAAAAAAA &&
       read_data2 == 32'h55555555)
        $display("TEST3 PASSED");
    else
        $display("TEST3 FAILED");

    //------------------------------------------------
    // Write Disabled
    //------------------------------------------------

    #10;
    reg_write = 0;
    write_addr = 5;
    write_data = 32'hFFFFFFFF;

    #20;

    read_addr1 = 5;

    #10;

    if(read_data1 == 32'hAAAAAAAA)
        $display("TEST4 PASSED");
    else
        $display("TEST4 FAILED");

    #20;

    $display("--------------------------------");
    $display("Simulation Completed");
    $display("--------------------------------");

    $finish;

end

endmodule
