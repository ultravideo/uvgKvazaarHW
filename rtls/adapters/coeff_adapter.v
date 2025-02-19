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
 
module coeff_to_top_btm (
    input [11:0] coeff_adr,
    input [511:0] coeff_d,
    input [63:0] coeff_byte_enable,
    input coeff_we,
    output wire [10:0] top_coeff_adr,
    output wire [511:0] top_coeff_d,
    output wire [63:0] top_coeff_byte_enable,
    output wire top_coeff_we,
    output wire [10:0] btm_coeff_adr,
    output wire [511:0] btm_coeff_d,
    output wire [63:0] btm_coeff_byte_enable,
    output wire btm_coeff_we
);

    assign top_coeff_we = ((coeff_adr[11:9] == 3'b011) || (coeff_adr[11:9] == 3'b100) || (coeff_adr[11:9] == 3'b101)) ? coeff_we : 1'b0;
    assign btm_coeff_we = ((coeff_adr[11:9] == 3'b000) || (coeff_adr[11:9] == 3'b001) || (coeff_adr[11:9] == 3'b010)) ? coeff_we : 1'b0;
    assign btm_coeff_adr = coeff_adr[10:0];
    assign top_coeff_adr[8:0] = coeff_adr[8:0];
    assign top_coeff_adr[10:9] = (coeff_adr[11:9] == 3'b011) ? 2'b00 : 
                                (coeff_adr[11:9] == 3'b100) ? 2'b01 : 
                                (coeff_adr[11:9] == 3'b101) ? 2'b10 : 
                                2'b00;
    assign top_coeff_byte_enable = coeff_byte_enable;
    assign btm_coeff_byte_enable = coeff_byte_enable;
    assign top_coeff_d = coeff_d;
    assign btm_coeff_d = coeff_d;
    
endmodule
