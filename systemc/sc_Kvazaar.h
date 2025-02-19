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
 
#ifndef _SCGENMOD_Kvazaar_
#define _SCGENMOD_Kvazaar_
 
#include "systemc.h"
 
 class Kvazaar : public sc_foreign_module {
 public:
     sc_in<bool> rst_n;
     sc_in<sc_lv<32> > cabac_btm_config_in_dat;
     sc_in<sc_logic> cabac_btm_config_in_vld;
     sc_out<sc_logic> cabac_btm_config_in_rdy;
     sc_in<sc_lv<32> > cabac_top_config_in_dat;
     sc_in<sc_logic> cabac_top_config_in_vld;
     sc_out<sc_logic> cabac_top_config_in_rdy;
     sc_in<bool> clk_bin_coding;
     sc_in<bool> clk_binarization;
     sc_in<bool> clk_cabac_base;
     sc_in<bool> clk_mem;
     sc_out<sc_logic> ctu_btm_flush;
     sc_out<sc_lv<8> > ctu_btm_id;
     sc_out<sc_lv<16> > ctu_done_extended_1;
     sc_out<sc_lv<16> > ctu_done_extended;
     sc_out<sc_logic> ctu_top_flush;
     sc_out<sc_lv<8> > ctu_top_id;
     sc_in<sc_lv<32> > intra_config_in_dat;
     sc_in<sc_logic> intra_config_in_vld;
     sc_out<sc_logic> intra_config_in_rdy;
     sc_in<sc_lv<156> > intra_data_in_rsc_dat;
     sc_in<sc_logic> intra_data_in_rsc_vld;
     sc_out<sc_logic> intra_data_in_rsc_rdy;
     sc_in<sc_logic> intra_data_out_rsc_rdy;
     sc_out<sc_lv<128> > intra_data_out_rsc_dat;
     sc_out<sc_logic> intra_data_out_rsc_vld;
     sc_in<sc_lv<4> > intra_data_req_rsc_dat;
     sc_in<sc_logic> intra_data_req_rsc_vld;
     sc_out<sc_logic> intra_data_req_rsc_rdy;
     sc_in<bool> clk_intra_base;
     sc_in<bool> clk_intra_pred;
 
 
     Kvazaar(sc_module_name nm, const char* hdl_name)
      : sc_foreign_module(nm),
        rst_n("rst_n"),
        cabac_btm_config_in_dat("cabac_btm_config_in_dat"),
        cabac_btm_config_in_vld("cabac_btm_config_in_vld"),
        cabac_btm_config_in_rdy("cabac_btm_config_in_rdy"),
        cabac_top_config_in_dat("cabac_top_config_in_dat"),
        cabac_top_config_in_vld("cabac_top_config_in_vld"),
        cabac_top_config_in_rdy("cabac_top_config_in_rdy"),
        clk_bin_coding("clk_bin_coding"),
        clk_binarization("clk_binarization"),
        clk_cabac_base("clk_cabac_base"),
        clk_mem("clk_mem"),
        ctu_btm_flush("ctu_btm_flush"),
        ctu_btm_id("ctu_btm_id"),
        ctu_done_extended_1("ctu_done_extended_1"),
        ctu_done_extended("ctu_done_extended"),
        ctu_top_flush("ctu_top_flush"),
        ctu_top_id("ctu_top_id"),
        intra_config_in_dat("intra_config_in_dat"),
        intra_config_in_vld("intra_config_in_vld"),
        intra_config_in_rdy("intra_config_in_rdy"),
        intra_data_in_rsc_dat("intra_data_in_rsc_dat"),
        intra_data_in_rsc_vld("intra_data_in_rsc_vld"),
        intra_data_in_rsc_rdy("intra_data_in_rsc_rdy"),
        intra_data_out_rsc_rdy("intra_data_out_rsc_rdy"),
        intra_data_out_rsc_dat("intra_data_out_rsc_dat"),
        intra_data_out_rsc_vld("intra_data_out_rsc_vld"),
        intra_data_req_rsc_dat("intra_data_req_rsc_dat"),
        intra_data_req_rsc_vld("intra_data_req_rsc_vld"),
        intra_data_req_rsc_rdy("intra_data_req_rsc_rdy"),
        clk_intra_base("clk_intra_base"),
        clk_intra_pred("clk_intra_pred")
     {
         elaborate_foreign_module(hdl_name);
     }
     ~Kvazaar()
     {}
 
 };
 
#endif
