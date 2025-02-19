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
 
module OnChipMemoryDualPortDC #(
    parameter width_a_g = 128,
    parameter width_b_g = 128,
    parameter addr_width_a_g = 8,
    parameter addr_width_b_g = 8
)(
    input wire [addr_width_a_g-1:0] address_a,
    input wire [addr_width_b_g-1:0] address_b,
    input wire [(width_a_g/8)-1:0] byteena_a,
    input wire [(width_b_g/8)-1:0] byteena_b,
    input wire clock_a,
    input wire clock_b,
    input wire [width_a_g-1:0] data_a,
    input wire [width_b_g-1:0] data_b,
    input wire wren_a,
    input wire wren_b,
    output reg [width_a_g-1:0] q_a,
    output reg [width_b_g-1:0] q_b
);

    // Calculate the total size of the memory in bits
    localparam total_memory_bits = (1 << addr_width_a_g) * width_a_g;

    // Single large memory vector
    reg [total_memory_bits-1:0] memory;

    // Initialize memory to zero
    initial begin
        memory = 0;
    end

    integer bit_index_a, bit_index_b;
    integer i;

    always @(posedge clock_a or posedge clock_b) begin

        // Port A operations
        if (clock_a) begin
            bit_index_a = address_a * width_a_g;
            q_a <= memory[bit_index_a +: width_a_g];
	    if (wren_a) begin
                for (i = 0; i < width_a_g/8; i = i + 1) begin
                    if (byteena_a[i]) begin
                        memory[bit_index_a + i*8 +: 8] <= data_a[i*8 +: 8];
                    end
                end
            end
            
        end

        // Port B operations
        if (clock_b) begin
            bit_index_b = address_b * width_b_g;
            q_b <= memory[bit_index_b +: width_b_g];
 	    if (wren_b) begin
                for (i = 0; i < width_b_g/8; i = i + 1) begin
                    if (byteena_b[i]) begin
                        memory[bit_index_b + i*8 +: 8] <= data_b[i*8 +: 8];
                    end
                end
            end
            
        end
    end

endmodule

