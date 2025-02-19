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
 
module dc_fifo #(
    parameter width_in_g = 256,
    parameter width_out_g = 256,
    parameter size_g = 64,
    parameter use_memory_g = "ON"
)(
    input wire [width_in_g-1:0] d,
    input wire d_vld,
    output reg d_rdy,
    output reg [width_out_g-1:0] q,
    output reg q_vld,
    input wire q_rdy,
    input wire wclk,
    input wire rclk,
    input wire aclr_n,
    output reg [$clog2(size_g):0] rdused
);

    reg [width_in_g-1:0] fifo [0:size_g-1];
    reg [$clog2(size_g)-1:0] wr_ptr = 0;
    reg [$clog2(size_g)-1:0] rd_ptr = 0;

    always @(posedge wclk or posedge rclk) begin
        if(aclr_n == 0) begin
            d_rdy <= 0;
            q_vld <= 0;
            wr_ptr <= 0;
            rd_ptr <= 0;
            q <= 0;
        end 
        else begin
            q <= q;
            if (wclk && !(wr_ptr+1 == rd_ptr || (wr_ptr == size_g-1 && rd_ptr == 0))) begin
                d_rdy <= 1;
            if(d_rdy == 1 && d_vld == 1) begin
                fifo[wr_ptr] <= d;
                wr_ptr <= wr_ptr + 1;
                if (wr_ptr+1 == size_g)
                    wr_ptr <= 0;
                if(wr_ptr+2 == rd_ptr || (wr_ptr+2 == size_g && rd_ptr == 0))
                    d_rdy <= 0;
            end                  
        end
            if (rclk && wr_ptr != rd_ptr) begin
                q_vld <= 1;
                q <= fifo[rd_ptr];
                if(q_vld == 1 && q_rdy == 1) begin
                    rd_ptr <= rd_ptr + 1;
                    q <= fifo[rd_ptr+1];
                    if (rd_ptr+1 == size_g) begin
                        rd_ptr <= 0;
                        q <= fifo[0];
                    end
                if(wr_ptr == rd_ptr+1 || (rd_ptr+1 == size_g && wr_ptr == 0))
                    q_vld <= 0;              
                end
            end
        end
    end

endmodule
