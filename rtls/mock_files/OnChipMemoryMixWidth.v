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

module OnChipMemoryMixWidth #(
  parameter width_w_g = 256,        // Write data width
  parameter addr_width_w_g = 7,     // Write address width
  parameter width_r_g = 8,          // Read data width
  parameter addr_width_r_g = 12     // Read address width
)(
  input wire [width_w_g-1:0] wdata,     // Write data
  input wire [addr_width_w_g-1:0] wraddress, // Write address
  input wire   wren,                    // Write enable

  output reg [width_r_g-1:0] rdata,     // Read data
  input wire [addr_width_r_g-1:0] rdaddress, // Read address

  input    clock                     // Clock
);

    // Calculate the total size of the memory in bits
    localparam total_memory_bits = (1 << addr_width_w_g) * width_w_g;

    // Single large memory vector
    reg [total_memory_bits-1:0] memory;

    // Initialize memory to zero
    initial begin
        memory = 0;
    end

    integer bit_index_w;
    integer bit_index_r;

    // Write operation
    always @(posedge clock) begin
        if (wren) begin
            bit_index_w = wraddress * width_w_g;
            memory[bit_index_w +: width_w_g] <= wdata;
        end
    end

    // Read operation
    always @(posedge clock) begin
        bit_index_r = rdaddress * width_r_g;
        if (bit_index_r + width_r_g <= total_memory_bits) begin
            rdata = memory[bit_index_r +: width_r_g];
        end
        else begin
            rdata = 0; // Default value if rdaddress is out of range
        end
    end

endmodule

