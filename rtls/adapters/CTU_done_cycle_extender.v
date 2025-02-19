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

module CTU_done_cycle_extender #(
    parameter cabac_extend_cycles = 8
)(
    input [4:0] ctu_done,
    input ctu_done_vld,
    output reg [15:0] ctu_done_extended,
    input clk,
    input arst_n
);

    reg ctu_done_d;
    integer extend;

    always @(posedge clk or negedge arst_n) begin
        if (!arst_n) begin
            ctu_done_d <= 1'b0;
            ctu_done_extended <= 16'b0;
            extend <= 0;
        end else begin
            ctu_done_d <= ctu_done_vld;
            if (extend == 0) begin
                ctu_done_extended <= 16'b0;
            end else begin
                extend <= extend - 1;
            end
            if (ctu_done_vld == 1'b1 && ctu_done_d == 1'b0) begin
                ctu_done_extended <= 1 << ctu_done;
                extend <= cabac_extend_cycles;
            end
        end
    end

endmodule

