/*****************************************************************************
 * This file is part of uvgKvazaarHW.
 *
 * Copyright (c) 2025, Tampere University, ITU/ISO/IEC, project contributors
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * * Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * 
 * * Neither the name of the Tampere University or ITU/ISO/IEC nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * INCLUDING NEGLIGENCE OR OTHERWISE ARISING IN ANY WAY OUT OF THE USE OF THIS
 ****************************************************************************/

module RAM_adapter #(
    parameter ram_a_width_g = 8,
    parameter ram_a_address_width_g = 7,
    parameter ram_b_width_g = 128,
    parameter ram_b_address_width_g = 3
)(
    // RAM A
    input  wire [ram_a_address_width_g-1:0] ram_a_address,
    input  wire ram_a_read,
    output reg  [ram_a_width_g-1:0] ram_a_readdata,
    input  wire ram_a_write,
    input  wire [ram_a_width_g-1:0] ram_a_writedata,
    input  wire [(ram_a_width_g/8)-1:0] ram_a_byteen,
    
    // RAM B
    output reg  [ram_b_address_width_g-1:0] ram_b_address,
    output reg  ram_b_read,
    input  wire [ram_b_width_g-1:0] ram_b_readdata,
    output reg  ram_b_write,
    output reg  [ram_b_width_g-1:0] ram_b_writedata,
    output reg  [(ram_b_width_g/8)-1:0] ram_b_byteen,

    // Clock and Reset
    input  wire clk,
    input  wire rst_n
);

    localparam integer ram_a_b_diff = $clog2(ram_b_width_g / ram_a_width_g);
    localparam integer a_bytes = ram_a_width_g / 8;

    reg [ram_a_address_width_g-1:0] ram_a_address_d;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            ram_a_address_d <= {ram_a_address_width_g{1'b0}};
        else
            ram_a_address_d <= ram_a_address;
    end

    always @(*) begin
        ram_b_address = ram_a_address >> ram_a_b_diff;
        ram_b_read = ram_a_read;
        ram_b_write = ram_a_write;

        ram_a_readdata = ram_b_readdata[((ram_a_address_d[ram_a_b_diff-1:0] + 1) * ram_a_width_g) - 1 -: ram_a_width_g];
        ram_b_writedata = ram_a_writedata << (ram_a_width_g * ram_a_address[ram_a_b_diff-1:0]);
        ram_b_byteen = ram_a_byteen << (a_bytes * ram_a_address[ram_a_b_diff-1:0]);
    end

endmodule
