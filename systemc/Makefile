#############################################################################
# This file is part of uvgKvazaarHW.
#
# Copyright (c) 2025, Tampere University, ITU/ISO/IEC, project contributors
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# 
# * Redistributions in binary form must reproduce the above copyright notice, this
#   list of conditions and the following disclaimer in the documentation and/or
#   other materials provided with the distribution.
# 
# * Neither the name of the Tampere University or ITU/ISO/IEC nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# INCLUDING NEGLIGENCE OR OTHERWISE ARISING IN ANY WAY OUT OF THE USE OF THIS
#############################################################################

FILES := \
    ../rtls/mock_files/OnChipMemory.v \
    ../rtls/mock_files/dc_fifo.v \
    ../rtls/mock_files/OnChipMemoryMixWidth.v \
    ../rtls/mock_files/FiFo.v \
    ../rtls/mock_files/OnChipMemoryDualPortDC.v \
    ../rtls/mock_files/OnChipMemorySinglePort.v \
    ../rtls/adapters/OR.v \
    ../rtls/adapters/AND.v \
    ../rtls/adapters/cu_info_we_adapter.v \
    ../rtls/adapters/indexer_we_adapter.v \
    ../rtls/adapters/coeff_adapter.v \
    ../rtls/adapters/RAM_adapter.v \
    ../rtls/adapters/Cabac_config_flush.v \
    ../rtls/adapters/CTU_done_cycle_extender.v

HLS_GENERATED_RTL := \
    ../rtls/intra_prediction/h265_sad_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_18_18_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_13_23_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_11_25_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_16_20_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_15_21_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_17_19_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_12_24_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_neg/modes_14_22_rtl.v \
    ../rtls/intra_prediction/h265_ip_ctrl_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_pos_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_planar_rtl.v \
    ../rtls/intra_prediction/h265_pred_buffer/pred_buffer_pull_rtl.v \
    ../rtls/intra_prediction/h265_pred_buffer/pred_buffer_push_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_ang_zero_rtl.v \
    ../rtls/intra_prediction/h265_ip_get_dc_rtl.v \
    ../rtls/cabac/kvz_encode_coding_tree/kvz_encode_coding_tree_hier_rtl.v \
    ../rtls/cabac/kvz_encode_coding_tree/mux_channel_rtl.v \
    ../rtls/cabac/encode_intra_coding_unit_and_transform_coeff_rtl.v \
    ../rtls/cabac/binary_coding/bin_coding_rtl.v \
    ../rtls/cabac/binary_coding/bin_arbiter_rtl.v \
    ../rtls/cabac/binarization/coeff_group_scanning_rtl.v \
    ../rtls/cabac/binarization/arbiter_rtl.v \
    ../rtls/cabac/binarization/coeff_group_arranging_rtl.v \
    ../rtls/cabac/binarization/coeff_binarization_rtl.v \
    ../rtls/control/h265_indexer_rtl.v \
    ../rtls/control/h265_build_reference_border_rtl.v \
    ../rtls/control/h265_main_ctrl/init_ctu_rtl.v \
    ../rtls/control/h265_main_ctrl/scheduler_rtl.v \
    ../rtls/control/h265_main_ctrl/exec_str_rtl.v \
    ../rtls/control/h265_main_ctrl/exec_end_rtl.v \
    ../rtls/control/h265_rec_coeff_buffer/buffer_pull_rtl.v \
    ../rtls/control/h265_rec_coeff_buffer/buffer_push_rtl.v \
    ../rtls//transform/h265_it2d_rtl.v \
    ../rtls//transform/h265_coeff_cost_rtl.v \
    ../rtls//transform/h265_quant_rtl.v \
    ../rtls//transform/h265_reconstruct_rtl.v \
    ../rtls//transform/h265_t2d_rtl.v 

KACTUS2_GENERATED_RTL := \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/CabacMemories_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_4.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_6.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/IntraSearchControl_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/CabacCore_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_2.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_4.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_dc_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_1.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/IntraMemories_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/t2d_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_zero_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/intra_prediction_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_2.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_6.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/IntraSearchTransform_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/binarization_1.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_1.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_3.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_planar_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_7.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/rec_coeff_buffer_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/it2d_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/binarization_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_5.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_5.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_neg_3.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_7.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/coeff_cost_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/ip_get_pos_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/indexer_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/CabacCore_1.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/pred_buffer_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/IntraSearchCore_0.v \
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/CabacMemories_1.v 

TOP_LEVEL :=\
    ../tuni.fi/subsystem/Kvazaar/1.0/sim/Kvazaar.v

SYSTEMC_TESTBENCH :=\
    sc_driver.cpp

ALL_FILES = $(FILES) $(HLS_GENERATED_RTL) $(KACTUS2_GENERATED_RTL)
FLAGS = $(foreach file,$(ALL_FILES),-v $(file))

all: verilate simulation

#copy_files:
#	cp $(FILES_TO_COPY) .

# Rule to execute Verilator for each file
verilate: $(ALL_FILES)
	verilator -Wno-fatal -sc --exe --Mdir Kvazaar_Intra_Encoder_HW $(SYSTEMC_TESTBENCH) $(TOP_LEVEL) $(FLAGS)

simulation: $(SYSTEMC_TESTBENCH)
	make -C Kvazaar_Intra_Encoder_HW -f VKvazaar.mk VKvazaar LIBS="-lzmq" VM_USER_CFLAGS="-DVERILATOR"
# Phony target to clean up generated directories
clean:
	rm -rf Kvazaar_Intra_Encoder_HW

# Declare phony targets
.PHONY: all clean
