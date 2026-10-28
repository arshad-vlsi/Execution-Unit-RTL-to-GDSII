`timescale 1ns/1ps

`include "defines.vh"

module register_file
(
    input                  clk,
    input                  rst,

    input                  we,

    input      [4:0]       write_addr,
    input      [31:0]      write_data,

    input      [4:0]       read_addr1,
    input      [4:0]       read_addr2,

    output     [31:0]      read_data1,
    output     [31:0]      read_data2
);

//------------------------------------------------------------
// Register Array
//------------------------------------------------------------

reg [31:0] register_file [0:31];

integer i;

//------------------------------------------------------------
// Synchronous Reset & Write
//------------------------------------------------------------

always @(posedge clk)
begin

    if(rst)
    begin

        for(i=0;i<32;i=i+1)
            register_file[i] <= 32'd0;

    end

    else if(we)
    begin

        register_file[write_addr] <= write_data;

    end

end

//------------------------------------------------------------
// Asynchronous Read
//------------------------------------------------------------

assign read_data1 = register_file[read_addr1];

assign read_data2 = register_file[read_addr2];

endmodule
