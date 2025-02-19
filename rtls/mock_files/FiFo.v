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

module FiFo #(
    parameter width_g = 8,     // Data width
    parameter size_g = 16,     // Depth of the FIFO
    parameter use_memory_g = 1 // Use memory (1 for true, 0 for false)
)(
    input wire [width_g-1:0] d,    // Input data
    input wire d_vld,              // Input data valid
    output reg d_rdy,              // Input data ready
    output reg [width_g-1:0] q,    // Output data
    input wire q_rdy,              // Output data ready
    output reg q_vld,              // Output data valid
    input wire aclr_n,             // Asynchronous clear
    input wire clk                 // Clock
);

    reg [width_g-1:0] fifo [0:size_g-1];
    reg [$clog2(size_g)-1:0] wr_ptr = 0;
    reg [$clog2(size_g)-1:0] rd_ptr = 0;

    always @(posedge clk) begin
        if(aclr_n == 0) begin
            d_rdy <= 1;  // Changed to 1 to accept data after reset
            q_vld <= 0;
            wr_ptr <= 0;
            rd_ptr <= 0;
            q <= 0;
        end else begin
            q <= q;

            // Write logic
            if (!((wr_ptr+1 == rd_ptr) || (wr_ptr == size_g-1 && rd_ptr == 0))) begin
                d_rdy <= 1;
                if(d_rdy && d_vld) begin
                    fifo[wr_ptr] <= d;
                    if (wr_ptr == size_g-1)
                        wr_ptr <= 0;
                    else
                        wr_ptr <= wr_ptr + 1;
                        
                    // Update d_rdy for next cycle
                    if((wr_ptr+2 == rd_ptr) || 
                       (wr_ptr+1 == size_g-1 && rd_ptr == 0) ||
                       (wr_ptr == size_g-1 && rd_ptr == 1))
                        d_rdy <= 0;
                end
            end else begin
                d_rdy <= 0;
            end

            // Read logic - keeping exactly as in original
            if (wr_ptr != rd_ptr) begin
                q_vld <= 1;
                q <= fifo[rd_ptr];
                if(q_vld && q_rdy) begin
                    if (rd_ptr == size_g-1) begin
                        rd_ptr <= 0;
                        q <= fifo[0];
                    end else begin
                        rd_ptr <= rd_ptr + 1;
                        q <= fifo[rd_ptr+1];
                    end
                    
                    if((wr_ptr == rd_ptr+1) || (rd_ptr+1 == size_g && wr_ptr == 0))
                        q_vld <= 0;
                end
            end
        end
    end

endmodule