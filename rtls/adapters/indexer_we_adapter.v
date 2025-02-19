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
 
module Indexer_we_adapter #(
    parameter ADDR_WIDTH = 12,
    parameter WRITE_ENABLES = 9,
    parameter DATA_WIDTH = 128,
    parameter WE_SELECT = 0
)(
    input [ADDR_WIDTH-1:0] in_adr,
    input in_we,
    input [DATA_WIDTH-1+WRITE_ENABLES:0] in_d,
    output [DATA_WIDTH-1+WRITE_ENABLES:0] in_q,
    output [ADDR_WIDTH-1:0] out_adr,
    output out_we,
    output [DATA_WIDTH-1:0] out_d,
    input [DATA_WIDTH-1:0] out_q,
    output [(DATA_WIDTH/8)-1:0] out_byte_enable
);

    assign out_adr = in_adr;
    assign out_we = in_we & in_d[WE_SELECT];
    assign out_d = in_d[DATA_WIDTH-1:0];
    //assign in_q = out_q;
    assign out_byte_enable = {(DATA_WIDTH/8){1'b1}};

endmodule
