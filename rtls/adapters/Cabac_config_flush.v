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

module Cabac_config_flush #(
    parameter cabac_conf_extend_cycles = 8
)(
    input [15:0] intra_ctu_done,
    output [7:0] ctu_btm_id,
    output [7:0] ctu_top_id,
    output reg ctu_btm_flush,
    output reg ctu_top_flush,
    input clk,
    input arst_n
);

    reg [15:0] ctu_done_d;
    integer extend_0;
    integer extend_top_0;
    reg [15:0] ctu_done_r;
    reg [7:0] ctu_btm_id_r;
    reg [7:0] ctu_top_id_r;
    integer i;

    always @(posedge clk or negedge arst_n) begin
        if (!arst_n) begin
            ctu_btm_id_r     <= 8'b0;
            ctu_top_id_r     <= 8'b0;
            ctu_btm_flush  <= 1'b0;
            ctu_top_flush  <= 1'b0;
            ctu_done_d     <= 16'b0;
            extend_0       <= 0;
            extend_top_0   <= 0;
            ctu_done_r     <= 16'b0;
        end else begin
            ctu_btm_id_r        <= ctu_btm_id_r;
            ctu_top_id_r    <= ctu_top_id_r;
            ctu_done_d    <= intra_ctu_done;
            ctu_btm_flush <= ctu_btm_flush;
            ctu_top_flush <= ctu_top_flush;
            extend_0      <= extend_0;
            extend_top_0  <= extend_top_0;
            ctu_done_r    <= ctu_done_r | (intra_ctu_done & ~ctu_done_d);

            if (ctu_btm_flush == 1'b1) begin
                if (extend_0 == 0) begin
                    ctu_done_r[ctu_btm_id_r] <= 1'b0;
                    ctu_btm_id_r  <= 8'b0;
                    ctu_btm_flush <= 1'b0;
                end else begin
                    extend_0 <= extend_0 - 1;
                end
            end

            if (ctu_top_flush == 1'b1) begin
                if (extend_top_0 == 0) begin
                    ctu_done_r[ctu_top_id_r + 8] <= 1'b0;
                    ctu_top_id_r  <= 8'b0;
                    ctu_top_flush <= 1'b0;
                end else begin
                    extend_top_0 <= extend_top_0 - 1;
                end
            end

            if ((ctu_btm_flush == 1'b0) && (ctu_done_r[7:0] != 8'b0)) begin
                for (i = 0; i < 8; i = i + 1) begin
                    if (ctu_done_r[i] == 1'b1) begin
                        ctu_btm_id_r <= i;
                    end
                end
                extend_0 <= cabac_conf_extend_cycles;
                ctu_btm_flush <= 1'b1;
            end

            if ((ctu_top_flush == 1'b0) && (ctu_done_r[15:8] != 8'b0)) begin
                for (i = 0; i < 8; i = i + 1) begin
                    if (ctu_done_r[i + 8] == 1'b1) begin
                        ctu_top_id_r <= i;
                    end
                end
                extend_top_0 <= cabac_conf_extend_cycles;
                ctu_top_flush <= 1'b1;
            end

        end
    end

    assign ctu_btm_id = ctu_btm_id_r;
    assign ctu_top_id = ctu_top_id_r;

endmodule

