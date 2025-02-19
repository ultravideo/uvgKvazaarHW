
module Kvazaar(
    // Interface: arst_n
    input                               rst_n,

    // Interface: cabac_btm_config_in
    input                [31:0]         cabac_btm_config_in_dat,
    input                               cabac_btm_config_in_vld,
    output                              cabac_btm_config_in_rdy,

    // Interface: cabac_top_config_in
    input                [31:0]         cabac_top_config_in_dat,
    input                               cabac_top_config_in_vld,
    output                              cabac_top_config_in_rdy,

    // Interface: clk_bin_coding
    input                               clk_bin_coding,

    // Interface: clk_binarization
    input                               clk_binarization,

    // Interface: clk_cabac_base
    input                               clk_cabac_base,

    // Interface: clk_mem
    input                               clk_mem,

    // Interface: ctu_btm_flush
    output                              ctu_btm_flush,

    // Interface: ctu_btm_id
    output               [7:0]          ctu_btm_id,

    // Interface: ctu_done_btm_extended_out
    output               [15:0]         ctu_done_extended_1,

    // Interface: ctu_done_top_extended_out
    output               [15:0]         ctu_done_extended,

    // Interface: ctu_top_flush
    output                              ctu_top_flush,

    // Interface: ctu_top_id
    output               [7:0]          ctu_top_id,

    // Interface: intra_config_in
    input                [31:0]         intra_config_in_dat,
    input                               intra_config_in_vld,
    output                              intra_config_in_rdy,

    // Interface: intra_data_in
    input                [155:0]        intra_data_in_rsc_dat,
    input                               intra_data_in_rsc_vld,
    output                              intra_data_in_rsc_rdy,

    // Interface: intra_data_out
    input                               intra_data_out_rsc_rdy,
    output               [127:0]        intra_data_out_rsc_dat,
    output                              intra_data_out_rsc_vld,

    // Interface: intra_data_req
    input                [3:0]          intra_data_req_rsc_dat,
    input                               intra_data_req_rsc_vld,
    output                              intra_data_req_rsc_rdy,

    // There ports are contained in many interfaces
    input                               clk_intra_base,

    // These ports are not in any interface
    input                               clk_intra_pred
);

    // IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff wires:
    wire [11:0] IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_ADDR;
    wire [63:0] IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN;
    wire [513:0] IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_RDATA;
    wire [511:0] IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_WDATA;
    wire       IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_WREN;
    // IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc wires:
    wire [14:0] IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_ADDR;
    wire [31:0] IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_RDATA;
    wire [31:0] IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_WDATA;
    wire       IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_WREN;
    // IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b wires:
    wire [9:0] IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_ADDR;
    wire [31:0] IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_RDATA;
    wire [31:0] IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_WDATA;
    wire       IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_WREN;
    // IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b wires:
    wire [9:0] IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_ADDR;
    wire [31:0] IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_RDATA;
    wire [31:0] IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_WDATA;
    wire       IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_WREN;
    // IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b wires:
    wire [7:0] IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_ADDR;
    wire [7:0] IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_RDATA;
    wire [7:0] IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_WDATA;
    wire       IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_WREN;
    // IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b wires:
    wire [7:0] IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_ADDR;
    wire [7:0] IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_RDATA;
    wire [7:0] IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_WDATA;
    wire       IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_WREN;
    // IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b wires:
    wire [7:0] IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_ADDR;
    wire [7:0] IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_RDATA;
    wire [7:0] IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_WDATA;
    wire       IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_WREN;
    // IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b wires:
    wire [11:0] IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_ADDR;
    wire [31:0] IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_RDATA;
    wire [31:0] IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_WDATA;
    wire       IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_WREN;
    // IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b wires:
    wire [3:0] IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_ADDR;
    wire [127:0] IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_RDATA;
    wire [127:0] IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_WDATA;
    wire       IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_WREN;
    // IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b wires:
    wire [11:0] IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_ADDR;
    wire [31:0] IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_BYTEEN;
    wire [287:0] IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_RDATA;
    wire [255:0] IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_WDATA;
    wire       IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_WREN;
    // CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b wires:
    wire [7:0] CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_ADDR;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_RDATA;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_WDATA;
    wire       CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_WREN;
    // CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc wires:
    wire [7:0] CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_ADDR;
    wire [7:0] CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_RDATA;
    wire [7:0] CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_WDATA;
    wire       CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_WREN;
    // CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b wires:
    wire [11:0] CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_ADDR;
    wire [31:0] CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_RDATA;
    wire [31:0] CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_WDATA;
    wire       CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_WREN;
    // CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1 wires:
    wire [7:0] CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_ADDR;
    wire [7:0] CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_RDATA;
    wire [7:0] CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_WDATA;
    wire       CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_WREN;
    // CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b wires:
    wire [7:0] CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_ADDR;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_RDATA;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_WDATA;
    wire       CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_WREN;
    // CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc wires:
    wire [13:0] CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_ADDR;
    wire [7:0] CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_RDATA;
    wire [7:0] CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_WDATA;
    wire       CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_WREN;
    // CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b wires:
    wire [14:0] CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_ADDR;
    wire [7:0] CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_RDATA;
    wire [7:0] CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_WDATA;
    wire       CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_WREN;
    // CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc wires:
    wire [14:0] CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_ADDR;
    wire [63:0] CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_RDATA;
    wire [63:0] CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_WDATA;
    wire       CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_WREN;
    // CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b wires:
    wire [11:0] CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_ADDR;
    wire [31:0] CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_RDATA;
    wire [31:0] CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_WDATA;
    wire       CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_WREN;
    // CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc wires:
    wire [7:0] CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_ADDR;
    wire [7:0] CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_RDATA;
    wire [7:0] CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_WDATA;
    wire       CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_WREN;
    // CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b wires:
    wire [7:0] CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_ADDR;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_RDATA;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_WDATA;
    wire       CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_WREN;
    // CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1 wires:
    wire [11:0] CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_ADDR;
    wire [31:0] CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_RDATA;
    wire [31:0] CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_WDATA;
    wire       CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_WREN;
    // CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b wires:
    wire [7:0] CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_ADDR;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_RDATA;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_WDATA;
    wire       CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_WREN;
    // CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1 wires:
    wire [7:0] CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_ADDR;
    wire [7:0] CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_RDATA;
    wire [7:0] CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_WDATA;
    wire       CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_WREN;
    // CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b wires:
    wire [13:0] CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_ADDR;
    wire [7:0] CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_RDATA;
    wire [7:0] CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_WDATA;
    wire       CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_WREN;
    // CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc wires:
    wire [14:0] CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_ADDR;
    wire [7:0] CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_RDATA;
    wire [7:0] CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_WDATA;
    wire       CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_WREN;
    // CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b wires:
    wire [14:0] CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_ADDR;
    wire [63:0] CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_RDATA;
    wire [63:0] CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_WDATA;
    wire       CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_WREN;
    // CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b wires:
    wire [11:0] CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_ADDR;
    wire [31:0] CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_RDATA;
    wire [31:0] CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_WDATA;
    wire       CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_WREN;
    // coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a wires:
    wire [11:0] coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_ADDR;
    wire [63:0] coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_BYTEEN;
    wire [511:0] coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_RDATA;
    wire [511:0] coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_WDATA;
    wire       coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_WREN;
    // coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a wires:
    wire [11:0] coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_ADDR;
    wire [63:0] coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_BYTEEN;
    wire [511:0] coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_RDATA;
    wire [511:0] coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_WDATA;
    wire       coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_WREN;
    // intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc wires:
    wire [31:0] intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_DAT;
    wire       intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_RDY;
    wire       intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_VLD;
    // cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc wires:
    wire [31:0] cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_DAT;
    wire       cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_RDY;
    wire       cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_VLD;
    // cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc wires:
    wire [31:0] cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_DAT;
    wire       cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_RDY;
    wire       cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_VLD;
    // IntraMemories_ref_a_to_indexer_0_ref wires:
    wire [12:0] IntraMemories_ref_a_to_indexer_0_ref_ADDR;
    wire [15:0] IntraMemories_ref_a_to_indexer_0_ref_BYTEEN;
    wire [127:0] IntraMemories_ref_a_to_indexer_0_ref_RDATA;
    wire [127:0] IntraMemories_ref_a_to_indexer_0_ref_WDATA;
    wire       IntraMemories_ref_a_to_indexer_0_ref_WREN;
    // indexer_0_top_border_to_IntraMemories_top_border_a wires:
    wire [12:0] indexer_0_top_border_to_IntraMemories_top_border_a_ADDR;
    wire [15:0] indexer_0_top_border_to_IntraMemories_top_border_a_BYTEEN;
    wire [127:0] indexer_0_top_border_to_IntraMemories_top_border_a_RDATA;
    wire [127:0] indexer_0_top_border_to_IntraMemories_top_border_a_WDATA;
    wire       indexer_0_top_border_to_IntraMemories_top_border_a_WREN;
    // IntraMemories_left_border_a_to_indexer_0_left_border wires:
    wire [12:0] IntraMemories_left_border_a_to_indexer_0_left_border_ADDR;
    wire [15:0] IntraMemories_left_border_a_to_indexer_0_left_border_BYTEEN;
    wire [127:0] IntraMemories_left_border_a_to_indexer_0_left_border_RDATA;
    wire [127:0] IntraMemories_left_border_a_to_indexer_0_left_border_WDATA;
    wire       IntraMemories_left_border_a_to_indexer_0_left_border_WREN;
    // indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a wires:
    wire [12:0] indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_ADDR;
    wire [15:0] indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_BYTEEN;
    wire [127:0] indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_RDATA;
    wire [127:0] indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_WDATA;
    wire       indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_WREN;
    // IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor wires:
    wire [12:0] IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_ADDR;
    wire [15:0] IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_BYTEEN;
    wire [127:0] IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_RDATA;
    wire [127:0] IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_WDATA;
    wire       IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_WREN;
    // indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a wires:
    wire [12:0] indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_ADDR;
    wire [15:0] indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_BYTEEN;
    wire [127:0] indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_RDATA;
    wire [127:0] indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_WDATA;
    wire       indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_WREN;
    // IntraMemories_cu_info_a_to_indexer_0_cu_info wires:
    wire [9:0] IntraMemories_cu_info_a_to_indexer_0_cu_info_ADDR;
    wire [15:0] IntraMemories_cu_info_a_to_indexer_0_cu_info_BYTEEN;
    wire [127:0] IntraMemories_cu_info_a_to_indexer_0_cu_info_RDATA;
    wire [127:0] IntraMemories_cu_info_a_to_indexer_0_cu_info_WDATA;
    wire       IntraMemories_cu_info_a_to_indexer_0_cu_info_WREN;
    // indexer_0_cabac_to_IntraMemories_cabac_a wires:
    wire [12:0] indexer_0_cabac_to_IntraMemories_cabac_a_ADDR;
    wire [15:0] indexer_0_cabac_to_IntraMemories_cabac_a_BYTEEN;
    wire [127:0] indexer_0_cabac_to_IntraMemories_cabac_a_RDATA;
    wire [127:0] indexer_0_cabac_to_IntraMemories_cabac_a_WDATA;
    wire       indexer_0_cabac_to_IntraMemories_cabac_a_WREN;
    // IntraMemories_rec_a_to_indexer_0_rec wires:
    wire [12:0] IntraMemories_rec_a_to_indexer_0_rec_ADDR;
    wire [15:0] IntraMemories_rec_a_to_indexer_0_rec_BYTEEN;
    wire [127:0] IntraMemories_rec_a_to_indexer_0_rec_RDATA;
    wire [127:0] IntraMemories_rec_a_to_indexer_0_rec_WDATA;
    wire       IntraMemories_rec_a_to_indexer_0_rec_WREN;
    // indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a wires:
    wire [12:0] indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_ADDR;
    wire [15:0] indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_BYTEEN;
    wire [127:0] indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_RDATA;
    wire [127:0] indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_WDATA;
    wire       indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_WREN;
    // CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top wires:
    wire [12:0] CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_ADDR;
    wire [15:0] CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_BYTEEN;
    wire [127:0] CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_RDATA;
    wire [127:0] CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_WDATA;
    wire       CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_WREN;
    // indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a wires:
    wire [12:0] indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_ADDR;
    wire [15:0] indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_BYTEEN;
    wire [127:0] indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_RDATA;
    wire [127:0] indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_WDATA;
    wire       indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_WREN;
    // CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top wires:
    wire [12:0] CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_ADDR;
    wire [15:0] CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_BYTEEN;
    wire [127:0] CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_RDATA;
    wire [127:0] CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_WDATA;
    wire       CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_WREN;
    // indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a wires:
    wire [6:0] indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_ADDR;
    wire [15:0] indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_BYTEEN;
    wire [127:0] indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_RDATA;
    wire [127:0] indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_WDATA;
    wire       indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_WREN;
    // CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top wires:
    wire [9:0] CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_ADDR;
    wire [15:0] CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_BYTEEN;
    wire [127:0] CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_RDATA;
    wire [127:0] CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_WDATA;
    wire       CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_WREN;
    // indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a wires:
    wire [12:0] indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_ADDR;
    wire [15:0] indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_BYTEEN;
    wire [127:0] indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_RDATA;
    wire [127:0] indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_WDATA;
    wire       indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_WREN;
    // CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm wires:
    wire [12:0] CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_ADDR;
    wire [15:0] CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_BYTEEN;
    wire [127:0] CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_RDATA;
    wire [127:0] CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_WDATA;
    wire       CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_WREN;
    // indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a wires:
    wire [12:0] indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_ADDR;
    wire [15:0] indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_BYTEEN;
    wire [127:0] indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_RDATA;
    wire [127:0] indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_WDATA;
    wire       indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_WREN;
    // CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm wires:
    wire [12:0] CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_ADDR;
    wire [15:0] CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_BYTEEN;
    wire [127:0] CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_RDATA;
    wire [127:0] CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_WDATA;
    wire       CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_WREN;
    // indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a wires:
    wire [6:0] indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_ADDR;
    wire [15:0] indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_BYTEEN;
    wire [127:0] indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_RDATA;
    wire [127:0] indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_WDATA;
    wire       indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_WREN;
    // CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm wires:
    wire [9:0] CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_ADDR;
    wire [15:0] CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_BYTEEN;
    wire [127:0] CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_RDATA;
    wire [127:0] CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_WDATA;
    wire       CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_WREN;
    // Cabac_config_flush_ctu_done_in_to_IntraSearchCore_lcu_poll wires:
    wire [15:0] Cabac_config_flush_ctu_done_in_to_IntraSearchCore_lcu_poll_DAT;
    // CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in wires:
    wire [4:0] CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_DAT;
    wire       CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_RDY;
    wire       CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_VLD;
    // CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in wires:
    wire [4:0] CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_DAT;
    wire       CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_RDY;
    wire       CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_VLD;
    // Cabac_config_flush_ctu_btm_id_to_bus_3 wires:
    wire [7:0] Cabac_config_flush_ctu_btm_id_to_bus_3_DAT;
    // Cabac_config_flush_ctu_btm_flush_to_bus_6 wires:
    wire       Cabac_config_flush_ctu_btm_flush_to_bus_6_DAT;
    // Cabac_config_flush_ctu_top_id_to_bus_5 wires:
    wire [7:0] Cabac_config_flush_ctu_top_id_to_bus_5_DAT;
    // Cabac_config_flush_ctu_top_flush_to_bus_1 wires:
    wire       Cabac_config_flush_ctu_top_flush_to_bus_1_DAT;
    // CTU_done_cycle_extender_btm_ctu_done_extended_out_to_ctu_done_btm_extended_out
    // wires:
    wire [15:0] CTU_done_cycle_extender_btm_ctu_done_extended_out_to_ctu_done_btm_extended_out_DAT;
    // CTU_done_cycle_extender_top_ctu_done_extended_out_to_ctu_done_top_extended_out
    // wires:
    wire [15:0] CTU_done_cycle_extender_top_ctu_done_extended_out_to_ctu_done_top_extended_out_DAT;
    // IntraMemories_arst_n_to_bus wires:
    wire       IntraMemories_arst_n_to_bus_arst_n;
    // CabacCore_TOP_clk_base_to_clk_cabac_base wires:
    wire       CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    // CabacCore_TOP_clk_binarization_to_clk_binarization wires:
    wire       CabacCore_TOP_clk_binarization_to_clk_binarization_CLK;
    // CabacCore_TOP_clk_bin_coding_to_clk_bin_coding wires:
    wire       CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    // Cabac_config_flush_clk_to_clk_intra_base wires:
    wire       Cabac_config_flush_clk_to_clk_intra_base_CLK;
    // IntraSearchCore_clk_intra_to_clk_intra_pred wires:
    wire       IntraSearchCore_clk_intra_to_clk_intra_pred_CLK;
    // intra_conf_dc_fifo_in_clk_to_clk_mem wires:
    wire       intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    // indexer_0_data_out_to_intra_data_out wires:
    wire [127:0] indexer_0_data_out_to_intra_data_out_DAT;
    wire       indexer_0_data_out_to_intra_data_out_RDY;
    wire       indexer_0_data_out_to_intra_data_out_VLD;
    // indexer_0_data_in_to_intra_data_in wires:
    wire [155:0] indexer_0_data_in_to_intra_data_in_DAT;
    wire       indexer_0_data_in_to_intra_data_in_RDY;
    wire       indexer_0_data_in_to_intra_data_in_VLD;
    // intra_conf_dc_fifo_data_in_to_intra_config_in wires:
    wire [31:0] intra_conf_dc_fifo_data_in_to_intra_config_in_DAT;
    wire       intra_conf_dc_fifo_data_in_to_intra_config_in_RDY;
    wire       intra_conf_dc_fifo_data_in_to_intra_config_in_VLD;
    // cabac_top_dc_fifo_data_in_to_cabac_top_config_in wires:
    wire [31:0] cabac_top_dc_fifo_data_in_to_cabac_top_config_in_DAT;
    wire       cabac_top_dc_fifo_data_in_to_cabac_top_config_in_RDY;
    wire       cabac_top_dc_fifo_data_in_to_cabac_top_config_in_VLD;
    // cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in wires:
    wire [31:0] cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_DAT;
    wire       cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_RDY;
    wire       cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_VLD;
    // indexer_0_data_req_to_intra_data_req wires:
    wire [3:0] indexer_0_data_req_to_intra_data_req_DAT;
    wire       indexer_0_data_req_to_intra_data_req_RDY;
    wire       indexer_0_data_req_to_intra_data_req_VLD;
    // IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in wires:
    wire [9:0] IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_ADDR;
    wire [15:0] IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_BYTEEN;
    wire [127:0] IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_RDATA;
    wire [127:0] IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WDATA;
    wire       IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WREN;
    // cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a wires:
    wire [9:0] cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_ADDR;
    wire [15:0] cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_BYTEEN;
    wire [127:0] cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_RDATA;
    wire [127:0] cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WDATA;
    wire       cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WREN;
    // cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a wires:
    wire [9:0] cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_ADDR;
    wire [15:0] cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_BYTEEN;
    wire [127:0] cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_RDATA;
    wire [127:0] cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WDATA;
    wire       cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WREN;
    // CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b wires:
    wire [4:0] CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_ADDR;
    wire [127:0] CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_RDATA;
    wire [127:0] CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_WDATA;
    wire       CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_WREN;
    // CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b wires:
    wire [3:0] CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_ADDR;
    wire [127:0] CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_RDATA;
    wire [127:0] CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_WDATA;
    wire       CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_WREN;
    // CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b wires:
    wire [3:0] CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_ADDR;
    wire [127:0] CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_RDATA;
    wire [127:0] CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_WDATA;
    wire       CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_WREN;
    // CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push wires:
    wire [4:0] CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_ADDR;
    wire [127:0] CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_RDATA;
    wire [127:0] CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_WDATA;
    wire       CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_WREN;
    // CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm wires:
    wire [12:0] CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_ADDR;
    wire [15:0] CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_BYTEEN;
    wire [127:0] CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_RDATA;
    wire [127:0] CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_WDATA;
    wire       CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_WREN;
    // indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a wires:
    wire [3:0] indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_ADDR;
    wire [15:0] indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_BYTEEN;
    wire [127:0] indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_RDATA;
    wire [127:0] indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_WDATA;
    wire       indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_WREN;
    // CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top wires:
    wire [12:0] CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_ADDR;
    wire [15:0] CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_BYTEEN;
    wire [127:0] CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_RDATA;
    wire [127:0] CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_WDATA;
    wire       CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_WREN;
    // indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a wires:
    wire [3:0] indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_ADDR;
    wire [15:0] indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_BYTEEN;
    wire [127:0] indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_RDATA;
    wire [127:0] indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_WDATA;
    wire       indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_WREN;

    // CTU_done_cycle_extender_btm port wires:
    wire       CTU_done_cycle_extender_btm_arst_n;
    wire       CTU_done_cycle_extender_btm_clk;
    wire [4:0] CTU_done_cycle_extender_btm_ctu_done;
    wire [15:0] CTU_done_cycle_extender_btm_ctu_done_extended;
    wire       CTU_done_cycle_extender_btm_ctu_done_vld;
    // CTU_done_cycle_extender_top port wires:
    wire       CTU_done_cycle_extender_top_arst_n;
    wire       CTU_done_cycle_extender_top_clk;
    wire [4:0] CTU_done_cycle_extender_top_ctu_done;
    wire [15:0] CTU_done_cycle_extender_top_ctu_done_extended;
    wire       CTU_done_cycle_extender_top_ctu_done_vld;
    // CabacCore_BTM port wires:
    wire       CabacCore_BTM_arst_n;
    wire [14:0] CabacCore_BTM_bitstream_last_data_rsc_adr_1;
    wire [7:0] CabacCore_BTM_bitstream_last_data_rsc_d_1;
    wire [7:0] CabacCore_BTM_bitstream_last_data_rsc_q_1;
    wire       CabacCore_BTM_bitstream_last_data_rsc_we_1;
    wire [3:0] CabacCore_BTM_cabac_metas_rsc_adr;
    wire [4:0] CabacCore_BTM_cabac_metas_rsc_adr_1;
    wire [127:0] CabacCore_BTM_cabac_metas_rsc_d;
    wire [127:0] CabacCore_BTM_cabac_metas_rsc_d_1;
    wire [127:0] CabacCore_BTM_cabac_metas_rsc_q;
    wire [127:0] CabacCore_BTM_cabac_metas_rsc_q_1;
    wire       CabacCore_BTM_cabac_metas_rsc_we;
    wire       CabacCore_BTM_cabac_metas_rsc_we_1;
    wire [11:0] CabacCore_BTM_cabac_states_rsc_adr;
    wire [7:0] CabacCore_BTM_cabac_states_rsc_d;
    wire [7:0] CabacCore_BTM_cabac_states_rsc_q;
    wire       CabacCore_BTM_cabac_states_rsc_we;
    wire       CabacCore_BTM_clk_base;
    wire       CabacCore_BTM_clk_bin_coding;
    wire       CabacCore_BTM_clk_binarization;
    wire [14:0] CabacCore_BTM_coeff_rsc_adr_1;
    wire [63:0] CabacCore_BTM_coeff_rsc_d_1;
    wire [63:0] CabacCore_BTM_coeff_rsc_q_1;
    wire       CabacCore_BTM_coeff_rsc_we_1;
    wire [31:0] CabacCore_BTM_config_in_rsc_dat;
    wire       CabacCore_BTM_config_in_rsc_rdy;
    wire       CabacCore_BTM_config_in_rsc_vld;
    wire [4:0] CabacCore_BTM_ctu_done_rsc_dat;
    wire       CabacCore_BTM_ctu_done_rsc_rdy;
    wire       CabacCore_BTM_ctu_done_rsc_vld;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_adr;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_adr_1;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_d;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_d_1;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_q;
    wire [7:0] CabacCore_BTM_lcu_left_rsc_q_1;
    wire       CabacCore_BTM_lcu_left_rsc_we;
    wire       CabacCore_BTM_lcu_left_rsc_we_1;
    wire [11:0] CabacCore_BTM_lcu_rsc_adr;
    wire [11:0] CabacCore_BTM_lcu_rsc_adr_1;
    wire [31:0] CabacCore_BTM_lcu_rsc_d;
    wire [31:0] CabacCore_BTM_lcu_rsc_d_1;
    wire [31:0] CabacCore_BTM_lcu_rsc_q;
    wire [31:0] CabacCore_BTM_lcu_rsc_q_1;
    wire       CabacCore_BTM_lcu_rsc_we;
    wire       CabacCore_BTM_lcu_rsc_we_1;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_adr;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_adr_1;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_d;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_d_1;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_q;
    wire [7:0] CabacCore_BTM_lcu_top_rsc_q_1;
    wire       CabacCore_BTM_lcu_top_rsc_we;
    wire       CabacCore_BTM_lcu_top_rsc_we_1;
    // CabacCore_TOP port wires:
    wire       CabacCore_TOP_arst_n;
    wire [14:0] CabacCore_TOP_bitstream_last_data_rsc_adr_1;
    wire [7:0] CabacCore_TOP_bitstream_last_data_rsc_d_1;
    wire [7:0] CabacCore_TOP_bitstream_last_data_rsc_q_1;
    wire       CabacCore_TOP_bitstream_last_data_rsc_we_1;
    wire [3:0] CabacCore_TOP_cabac_metas_rsc_adr;
    wire [4:0] CabacCore_TOP_cabac_metas_rsc_adr_1;
    wire [127:0] CabacCore_TOP_cabac_metas_rsc_d;
    wire [127:0] CabacCore_TOP_cabac_metas_rsc_d_1;
    wire [127:0] CabacCore_TOP_cabac_metas_rsc_q;
    wire [127:0] CabacCore_TOP_cabac_metas_rsc_q_1;
    wire       CabacCore_TOP_cabac_metas_rsc_we;
    wire       CabacCore_TOP_cabac_metas_rsc_we_1;
    wire [11:0] CabacCore_TOP_cabac_states_rsc_adr;
    wire [7:0] CabacCore_TOP_cabac_states_rsc_d;
    wire [7:0] CabacCore_TOP_cabac_states_rsc_q;
    wire       CabacCore_TOP_cabac_states_rsc_we;
    wire       CabacCore_TOP_clk_base;
    wire       CabacCore_TOP_clk_bin_coding;
    wire       CabacCore_TOP_clk_binarization;
    wire [14:0] CabacCore_TOP_coeff_rsc_adr_1;
    wire [63:0] CabacCore_TOP_coeff_rsc_d_1;
    wire [63:0] CabacCore_TOP_coeff_rsc_q_1;
    wire       CabacCore_TOP_coeff_rsc_we_1;
    wire [31:0] CabacCore_TOP_config_in_rsc_dat;
    wire       CabacCore_TOP_config_in_rsc_rdy;
    wire       CabacCore_TOP_config_in_rsc_vld;
    wire [4:0] CabacCore_TOP_ctu_done_rsc_dat;
    wire       CabacCore_TOP_ctu_done_rsc_rdy;
    wire       CabacCore_TOP_ctu_done_rsc_vld;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_adr;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_adr_1;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_d;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_d_1;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_q;
    wire [7:0] CabacCore_TOP_lcu_left_rsc_q_1;
    wire       CabacCore_TOP_lcu_left_rsc_we;
    wire       CabacCore_TOP_lcu_left_rsc_we_1;
    wire [11:0] CabacCore_TOP_lcu_rsc_adr;
    wire [11:0] CabacCore_TOP_lcu_rsc_adr_1;
    wire [31:0] CabacCore_TOP_lcu_rsc_d;
    wire [31:0] CabacCore_TOP_lcu_rsc_d_1;
    wire [31:0] CabacCore_TOP_lcu_rsc_q;
    wire [31:0] CabacCore_TOP_lcu_rsc_q_1;
    wire       CabacCore_TOP_lcu_rsc_we;
    wire       CabacCore_TOP_lcu_rsc_we_1;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_adr;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_adr_1;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_d;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_d_1;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_q;
    wire [7:0] CabacCore_TOP_lcu_top_rsc_q_1;
    wire       CabacCore_TOP_lcu_top_rsc_we;
    wire       CabacCore_TOP_lcu_top_rsc_we_1;
    // CabacMemories_BTM port wires:
    wire [8:0] CabacMemories_BTM_address_a;
    wire [2:0] CabacMemories_BTM_address_a_1;
    wire [3:0] CabacMemories_BTM_address_a_10;
    wire [2:0] CabacMemories_BTM_address_a_2;
    wire [8:0] CabacMemories_BTM_address_a_3;
    wire [2:0] CabacMemories_BTM_address_a_4;
    wire [2:0] CabacMemories_BTM_address_a_5;
    wire [6:0] CabacMemories_BTM_address_a_6;
    wire [9:0] CabacMemories_BTM_address_a_7;
    wire [11:0] CabacMemories_BTM_address_a_8;
    wire [2:0] CabacMemories_BTM_address_a_9;
    wire [2:0] CabacMemories_BTM_address_b;
    wire [3:0] CabacMemories_BTM_address_b_1;
    wire [15:0] CabacMemories_BTM_byteena_a;
    wire [15:0] CabacMemories_BTM_byteena_a_1;
    wire [15:0] CabacMemories_BTM_byteena_a_2;
    wire [15:0] CabacMemories_BTM_byteena_a_3;
    wire [15:0] CabacMemories_BTM_byteena_a_4;
    wire [15:0] CabacMemories_BTM_byteena_a_5;
    wire [63:0] CabacMemories_BTM_byteena_a_8;
    wire [15:0] CabacMemories_BTM_byteena_a_9;
    wire       CabacMemories_BTM_clk;
    wire       CabacMemories_BTM_clk_intra_base;
    wire       CabacMemories_BTM_clock_a;
    wire       CabacMemories_BTM_clock_a_1;
    wire       CabacMemories_BTM_clock_a_2;
    wire [127:0] CabacMemories_BTM_data_a;
    wire [127:0] CabacMemories_BTM_data_a_1;
    wire [127:0] CabacMemories_BTM_data_a_10;
    wire [127:0] CabacMemories_BTM_data_a_2;
    wire [127:0] CabacMemories_BTM_data_a_3;
    wire [127:0] CabacMemories_BTM_data_a_4;
    wire [127:0] CabacMemories_BTM_data_a_5;
    wire [127:0] CabacMemories_BTM_data_a_6;
    wire [127:0] CabacMemories_BTM_data_a_7;
    wire [511:0] CabacMemories_BTM_data_a_8;
    wire [127:0] CabacMemories_BTM_data_a_9;
    wire [127:0] CabacMemories_BTM_data_b;
    wire [127:0] CabacMemories_BTM_data_b_1;
    wire [127:0] CabacMemories_BTM_q_a;
    wire [127:0] CabacMemories_BTM_q_a_10;
    wire [127:0] CabacMemories_BTM_q_a_3;
    wire [127:0] CabacMemories_BTM_q_a_6;
    wire [127:0] CabacMemories_BTM_q_a_7;
    wire [127:0] CabacMemories_BTM_q_b;
    wire [127:0] CabacMemories_BTM_q_b_1;
    wire [11:0] CabacMemories_BTM_ram_a_address;
    wire [7:0] CabacMemories_BTM_ram_a_address_1;
    wire [7:0] CabacMemories_BTM_ram_a_address_2;
    wire [11:0] CabacMemories_BTM_ram_a_address_3;
    wire [7:0] CabacMemories_BTM_ram_a_address_4;
    wire [7:0] CabacMemories_BTM_ram_a_address_5;
    wire [13:0] CabacMemories_BTM_ram_a_address_6;
    wire [14:0] CabacMemories_BTM_ram_a_address_7;
    wire [14:0] CabacMemories_BTM_ram_a_address_8;
    wire [31:0] CabacMemories_BTM_ram_a_readdata;
    wire [7:0] CabacMemories_BTM_ram_a_readdata_1;
    wire [7:0] CabacMemories_BTM_ram_a_readdata_2;
    wire [31:0] CabacMemories_BTM_ram_a_readdata_3;
    wire [7:0] CabacMemories_BTM_ram_a_readdata_4;
    wire [7:0] CabacMemories_BTM_ram_a_readdata_5;
    wire [7:0] CabacMemories_BTM_ram_a_readdata_6;
    wire [7:0] CabacMemories_BTM_ram_a_readdata_7;
    wire [63:0] CabacMemories_BTM_ram_a_readdata_8;
    wire       CabacMemories_BTM_ram_a_write;
    wire       CabacMemories_BTM_ram_a_write_1;
    wire       CabacMemories_BTM_ram_a_write_2;
    wire       CabacMemories_BTM_ram_a_write_3;
    wire       CabacMemories_BTM_ram_a_write_4;
    wire       CabacMemories_BTM_ram_a_write_5;
    wire       CabacMemories_BTM_ram_a_write_6;
    wire       CabacMemories_BTM_ram_a_write_7;
    wire       CabacMemories_BTM_ram_a_write_8;
    wire [31:0] CabacMemories_BTM_ram_a_writedata;
    wire [7:0] CabacMemories_BTM_ram_a_writedata_1;
    wire [7:0] CabacMemories_BTM_ram_a_writedata_2;
    wire [31:0] CabacMemories_BTM_ram_a_writedata_3;
    wire [7:0] CabacMemories_BTM_ram_a_writedata_4;
    wire [7:0] CabacMemories_BTM_ram_a_writedata_5;
    wire [7:0] CabacMemories_BTM_ram_a_writedata_6;
    wire [7:0] CabacMemories_BTM_ram_a_writedata_7;
    wire [63:0] CabacMemories_BTM_ram_a_writedata_8;
    wire       CabacMemories_BTM_rst_n;
    wire       CabacMemories_BTM_wren_a;
    wire       CabacMemories_BTM_wren_a_1;
    wire       CabacMemories_BTM_wren_a_10;
    wire       CabacMemories_BTM_wren_a_2;
    wire       CabacMemories_BTM_wren_a_3;
    wire       CabacMemories_BTM_wren_a_4;
    wire       CabacMemories_BTM_wren_a_5;
    wire       CabacMemories_BTM_wren_a_6;
    wire       CabacMemories_BTM_wren_a_7;
    wire       CabacMemories_BTM_wren_a_8;
    wire       CabacMemories_BTM_wren_a_9;
    wire       CabacMemories_BTM_wren_b;
    wire       CabacMemories_BTM_wren_b_1;
    // CabacMemories_TOP port wires:
    wire [8:0] CabacMemories_TOP_address_a;
    wire [2:0] CabacMemories_TOP_address_a_1;
    wire [3:0] CabacMemories_TOP_address_a_10;
    wire [2:0] CabacMemories_TOP_address_a_2;
    wire [8:0] CabacMemories_TOP_address_a_3;
    wire [2:0] CabacMemories_TOP_address_a_4;
    wire [2:0] CabacMemories_TOP_address_a_5;
    wire [6:0] CabacMemories_TOP_address_a_6;
    wire [9:0] CabacMemories_TOP_address_a_7;
    wire [11:0] CabacMemories_TOP_address_a_8;
    wire [2:0] CabacMemories_TOP_address_a_9;
    wire [2:0] CabacMemories_TOP_address_b;
    wire [3:0] CabacMemories_TOP_address_b_1;
    wire [15:0] CabacMemories_TOP_byteena_a;
    wire [15:0] CabacMemories_TOP_byteena_a_1;
    wire [15:0] CabacMemories_TOP_byteena_a_2;
    wire [15:0] CabacMemories_TOP_byteena_a_3;
    wire [15:0] CabacMemories_TOP_byteena_a_4;
    wire [15:0] CabacMemories_TOP_byteena_a_5;
    wire [63:0] CabacMemories_TOP_byteena_a_8;
    wire [15:0] CabacMemories_TOP_byteena_a_9;
    wire       CabacMemories_TOP_clk;
    wire       CabacMemories_TOP_clk_intra_base;
    wire       CabacMemories_TOP_clock_a;
    wire       CabacMemories_TOP_clock_a_1;
    wire       CabacMemories_TOP_clock_a_2;
    wire [127:0] CabacMemories_TOP_data_a;
    wire [127:0] CabacMemories_TOP_data_a_1;
    wire [127:0] CabacMemories_TOP_data_a_10;
    wire [127:0] CabacMemories_TOP_data_a_2;
    wire [127:0] CabacMemories_TOP_data_a_3;
    wire [127:0] CabacMemories_TOP_data_a_4;
    wire [127:0] CabacMemories_TOP_data_a_5;
    wire [127:0] CabacMemories_TOP_data_a_6;
    wire [127:0] CabacMemories_TOP_data_a_7;
    wire [511:0] CabacMemories_TOP_data_a_8;
    wire [127:0] CabacMemories_TOP_data_a_9;
    wire [127:0] CabacMemories_TOP_data_b;
    wire [127:0] CabacMemories_TOP_data_b_1;
    wire [127:0] CabacMemories_TOP_q_a;
    wire [127:0] CabacMemories_TOP_q_a_10;
    wire [127:0] CabacMemories_TOP_q_a_3;
    wire [127:0] CabacMemories_TOP_q_a_6;
    wire [127:0] CabacMemories_TOP_q_a_7;
    wire [127:0] CabacMemories_TOP_q_b;
    wire [127:0] CabacMemories_TOP_q_b_1;
    wire [11:0] CabacMemories_TOP_ram_a_address;
    wire [7:0] CabacMemories_TOP_ram_a_address_1;
    wire [7:0] CabacMemories_TOP_ram_a_address_2;
    wire [11:0] CabacMemories_TOP_ram_a_address_3;
    wire [7:0] CabacMemories_TOP_ram_a_address_4;
    wire [7:0] CabacMemories_TOP_ram_a_address_5;
    wire [13:0] CabacMemories_TOP_ram_a_address_6;
    wire [14:0] CabacMemories_TOP_ram_a_address_7;
    wire [14:0] CabacMemories_TOP_ram_a_address_8;
    wire [31:0] CabacMemories_TOP_ram_a_readdata;
    wire [7:0] CabacMemories_TOP_ram_a_readdata_1;
    wire [7:0] CabacMemories_TOP_ram_a_readdata_2;
    wire [31:0] CabacMemories_TOP_ram_a_readdata_3;
    wire [7:0] CabacMemories_TOP_ram_a_readdata_4;
    wire [7:0] CabacMemories_TOP_ram_a_readdata_5;
    wire [7:0] CabacMemories_TOP_ram_a_readdata_6;
    wire [7:0] CabacMemories_TOP_ram_a_readdata_7;
    wire [63:0] CabacMemories_TOP_ram_a_readdata_8;
    wire       CabacMemories_TOP_ram_a_write;
    wire       CabacMemories_TOP_ram_a_write_1;
    wire       CabacMemories_TOP_ram_a_write_2;
    wire       CabacMemories_TOP_ram_a_write_3;
    wire       CabacMemories_TOP_ram_a_write_4;
    wire       CabacMemories_TOP_ram_a_write_5;
    wire       CabacMemories_TOP_ram_a_write_6;
    wire       CabacMemories_TOP_ram_a_write_7;
    wire       CabacMemories_TOP_ram_a_write_8;
    wire [31:0] CabacMemories_TOP_ram_a_writedata;
    wire [7:0] CabacMemories_TOP_ram_a_writedata_1;
    wire [7:0] CabacMemories_TOP_ram_a_writedata_2;
    wire [31:0] CabacMemories_TOP_ram_a_writedata_3;
    wire [7:0] CabacMemories_TOP_ram_a_writedata_4;
    wire [7:0] CabacMemories_TOP_ram_a_writedata_5;
    wire [7:0] CabacMemories_TOP_ram_a_writedata_6;
    wire [7:0] CabacMemories_TOP_ram_a_writedata_7;
    wire [63:0] CabacMemories_TOP_ram_a_writedata_8;
    wire       CabacMemories_TOP_rst_n;
    wire       CabacMemories_TOP_wren_a;
    wire       CabacMemories_TOP_wren_a_1;
    wire       CabacMemories_TOP_wren_a_10;
    wire       CabacMemories_TOP_wren_a_2;
    wire       CabacMemories_TOP_wren_a_3;
    wire       CabacMemories_TOP_wren_a_4;
    wire       CabacMemories_TOP_wren_a_5;
    wire       CabacMemories_TOP_wren_a_6;
    wire       CabacMemories_TOP_wren_a_7;
    wire       CabacMemories_TOP_wren_a_8;
    wire       CabacMemories_TOP_wren_a_9;
    wire       CabacMemories_TOP_wren_b;
    wire       CabacMemories_TOP_wren_b_1;
    // Cabac_config_flush port wires:
    wire       Cabac_config_flush_arst_n;
    wire       Cabac_config_flush_clk;
    wire       Cabac_config_flush_ctu_btm_flush;
    wire [7:0] Cabac_config_flush_ctu_btm_id;
    wire       Cabac_config_flush_ctu_top_flush;
    wire [7:0] Cabac_config_flush_ctu_top_id;
    wire [15:0] Cabac_config_flush_intra_ctu_done;
    // IntraMemories port wires:
    wire [12:0] IntraMemories_address_a;
    wire [7:0] IntraMemories_address_a_1;
    wire [7:0] IntraMemories_address_a_2;
    wire [3:0] IntraMemories_address_a_3;
    wire [3:0] IntraMemories_address_a_4;
    wire [3:0] IntraMemories_address_a_5;
    wire [9:0] IntraMemories_address_a_6;
    wire [3:0] IntraMemories_address_a_7;
    wire [12:0] IntraMemories_address_a_8;
    wire [3:0] IntraMemories_address_b;
    wire [11:0] IntraMemories_address_b_1;
    wire [15:0] IntraMemories_byteena_a;
    wire [15:0] IntraMemories_byteena_a_1;
    wire [15:0] IntraMemories_byteena_a_2;
    wire [15:0] IntraMemories_byteena_a_3;
    wire [15:0] IntraMemories_byteena_a_4;
    wire [15:0] IntraMemories_byteena_a_5;
    wire [15:0] IntraMemories_byteena_a_7;
    wire [31:0] IntraMemories_byteena_b_1;
    wire       IntraMemories_clk;
    wire       IntraMemories_clock_a;
    wire [127:0] IntraMemories_data_a;
    wire [127:0] IntraMemories_data_a_1;
    wire [127:0] IntraMemories_data_a_2;
    wire [127:0] IntraMemories_data_a_3;
    wire [127:0] IntraMemories_data_a_4;
    wire [127:0] IntraMemories_data_a_5;
    wire [127:0] IntraMemories_data_a_6;
    wire [127:0] IntraMemories_data_a_7;
    wire [127:0] IntraMemories_data_a_8;
    wire [127:0] IntraMemories_data_b;
    wire [255:0] IntraMemories_data_b_1;
    wire [127:0] IntraMemories_q_a_6;
    wire [127:0] IntraMemories_q_a_8;
    wire [127:0] IntraMemories_q_b;
    wire [255:0] IntraMemories_q_b_1;
    wire [14:0] IntraMemories_ram_a_address;
    wire [9:0] IntraMemories_ram_a_address_1;
    wire [9:0] IntraMemories_ram_a_address_2;
    wire [7:0] IntraMemories_ram_a_address_3;
    wire [7:0] IntraMemories_ram_a_address_4;
    wire [7:0] IntraMemories_ram_a_address_5;
    wire [11:0] IntraMemories_ram_a_address_6;
    wire [31:0] IntraMemories_ram_a_readdata;
    wire [31:0] IntraMemories_ram_a_readdata_1;
    wire [31:0] IntraMemories_ram_a_readdata_2;
    wire [7:0] IntraMemories_ram_a_readdata_3;
    wire [7:0] IntraMemories_ram_a_readdata_4;
    wire [7:0] IntraMemories_ram_a_readdata_5;
    wire [31:0] IntraMemories_ram_a_readdata_6;
    wire       IntraMemories_ram_a_write;
    wire       IntraMemories_ram_a_write_1;
    wire       IntraMemories_ram_a_write_2;
    wire       IntraMemories_ram_a_write_3;
    wire       IntraMemories_ram_a_write_4;
    wire       IntraMemories_ram_a_write_5;
    wire       IntraMemories_ram_a_write_6;
    wire [31:0] IntraMemories_ram_a_writedata;
    wire [31:0] IntraMemories_ram_a_writedata_1;
    wire [31:0] IntraMemories_ram_a_writedata_2;
    wire [7:0] IntraMemories_ram_a_writedata_3;
    wire [7:0] IntraMemories_ram_a_writedata_4;
    wire [7:0] IntraMemories_ram_a_writedata_5;
    wire [31:0] IntraMemories_ram_a_writedata_6;
    wire [9:0] IntraMemories_ram_b_address;
    wire [15:0] IntraMemories_ram_b_byteen;
    wire       IntraMemories_ram_b_write;
    wire [127:0] IntraMemories_ram_b_writedata;
    wire       IntraMemories_rst_n;
    wire       IntraMemories_wren_a;
    wire       IntraMemories_wren_a_1;
    wire       IntraMemories_wren_a_2;
    wire       IntraMemories_wren_a_3;
    wire       IntraMemories_wren_a_4;
    wire       IntraMemories_wren_a_5;
    wire       IntraMemories_wren_a_6;
    wire       IntraMemories_wren_a_7;
    wire       IntraMemories_wren_a_8;
    wire       IntraMemories_wren_b;
    wire       IntraMemories_wren_b_1;
    // IntraSearchCore port wires:
    wire       IntraSearchCore_arst_n;
    wire [3:0] IntraSearchCore_cabac_rsc_adr;
    wire [127:0] IntraSearchCore_cabac_rsc_d;
    wire [127:0] IntraSearchCore_cabac_rsc_q;
    wire       IntraSearchCore_cabac_rsc_we;
    wire       IntraSearchCore_clk_base;
    wire       IntraSearchCore_clk_intra;
    wire [31:0] IntraSearchCore_conf_in_rsc_dat;
    wire       IntraSearchCore_conf_in_rsc_rdy;
    wire       IntraSearchCore_conf_in_rsc_vld;
    wire [11:0] IntraSearchCore_cu_cu_cu_info_rsc_adr;
    wire [31:0] IntraSearchCore_cu_cu_cu_info_rsc_d;
    wire [7:0] IntraSearchCore_cu_cu_cu_info_rsc_d_1;
    wire [31:0] IntraSearchCore_cu_cu_cu_info_rsc_q;
    wire [7:0] IntraSearchCore_cu_cu_cu_info_rsc_q_1;
    wire       IntraSearchCore_cu_cu_cu_info_rsc_we;
    wire [7:0] IntraSearchCore_cu_cu_hor_cu_info_rsc_adr;
    wire [7:0] IntraSearchCore_cu_cu_hor_cu_info_rsc_adr_1;
    wire [7:0] IntraSearchCore_cu_cu_hor_cu_info_rsc_d;
    wire [7:0] IntraSearchCore_cu_cu_hor_cu_info_rsc_q;
    wire       IntraSearchCore_cu_cu_hor_cu_info_rsc_we;
    wire       IntraSearchCore_cu_cu_hor_cu_info_rsc_we_1;
    wire [7:0] IntraSearchCore_cu_cu_ver_cu_info_rsc_adr;
    wire [7:0] IntraSearchCore_cu_cu_ver_cu_info_rsc_d;
    wire [7:0] IntraSearchCore_cu_cu_ver_cu_info_rsc_q;
    wire       IntraSearchCore_cu_cu_ver_cu_info_rsc_we;
    wire [15:0] IntraSearchCore_irq_rsc_dat;
    wire [9:0] IntraSearchCore_lcu_border_left_rsc_adr;
    wire [31:0] IntraSearchCore_lcu_border_left_rsc_d;
    wire [31:0] IntraSearchCore_lcu_border_left_rsc_q;
    wire       IntraSearchCore_lcu_border_left_rsc_we;
    wire [9:0] IntraSearchCore_lcu_border_top_rsc_adr;
    wire [31:0] IntraSearchCore_lcu_border_top_rsc_d;
    wire [31:0] IntraSearchCore_lcu_border_top_rsc_q;
    wire       IntraSearchCore_lcu_border_top_rsc_we;
    wire [11:0] IntraSearchCore_lcu_coeff_rsc_adr;
    wire [513:0] IntraSearchCore_lcu_coeff_rsc_d;
    wire       IntraSearchCore_lcu_coeff_rsc_we;
    wire [11:0] IntraSearchCore_lcu_rec_rsc_adr;
    wire [287:0] IntraSearchCore_lcu_rec_rsc_d;
    wire [287:0] IntraSearchCore_lcu_rec_rsc_q;
    wire       IntraSearchCore_lcu_rec_rsc_we;
    wire [14:0] IntraSearchCore_lcu_ref_rsc_adr;
    wire [31:0] IntraSearchCore_lcu_ref_rsc_d;
    wire [31:0] IntraSearchCore_lcu_ref_rsc_q;
    wire       IntraSearchCore_lcu_ref_rsc_we;
    // cabac_btm_dc_fifo port wires:
    wire       cabac_btm_dc_fifo_aclr_n;
    wire [31:0] cabac_btm_dc_fifo_d;
    wire       cabac_btm_dc_fifo_d_rdy;
    wire       cabac_btm_dc_fifo_d_vld;
    wire [31:0] cabac_btm_dc_fifo_q;
    wire       cabac_btm_dc_fifo_q_rdy;
    wire       cabac_btm_dc_fifo_q_vld;
    wire       cabac_btm_dc_fifo_rclk;
    wire       cabac_btm_dc_fifo_wclk;
    // cabac_top_dc_fifo port wires:
    wire       cabac_top_dc_fifo_aclr_n;
    wire [31:0] cabac_top_dc_fifo_d;
    wire       cabac_top_dc_fifo_d_rdy;
    wire       cabac_top_dc_fifo_d_vld;
    wire [31:0] cabac_top_dc_fifo_q;
    wire       cabac_top_dc_fifo_q_rdy;
    wire       cabac_top_dc_fifo_q_vld;
    wire       cabac_top_dc_fifo_rclk;
    wire       cabac_top_dc_fifo_wclk;
    // coeff_top_btm_adapter_0 port wires:
    wire [10:0] coeff_top_btm_adapter_0_btm_coeff_adr;
    wire [63:0] coeff_top_btm_adapter_0_btm_coeff_byte_enable;
    wire [511:0] coeff_top_btm_adapter_0_btm_coeff_d;
    wire       coeff_top_btm_adapter_0_btm_coeff_we;
    wire [11:0] coeff_top_btm_adapter_0_coeff_adr;
    wire [63:0] coeff_top_btm_adapter_0_coeff_byte_enable;
    wire [511:0] coeff_top_btm_adapter_0_coeff_d;
    wire       coeff_top_btm_adapter_0_coeff_we;
    wire [10:0] coeff_top_btm_adapter_0_top_coeff_adr;
    wire [63:0] coeff_top_btm_adapter_0_top_coeff_byte_enable;
    wire [511:0] coeff_top_btm_adapter_0_top_coeff_d;
    wire       coeff_top_btm_adapter_0_top_coeff_we;
    // cu_info_we_adapter_btm port wires:
    wire [9:0] cu_info_we_adapter_btm_in_adr;
    wire [15:0] cu_info_we_adapter_btm_in_byte_enable;
    wire [127:0] cu_info_we_adapter_btm_in_d;
    wire [127:0] cu_info_we_adapter_btm_in_q;
    wire       cu_info_we_adapter_btm_in_we;
    wire [9:0] cu_info_we_adapter_btm_out_adr;
    wire [15:0] cu_info_we_adapter_btm_out_byte_enable;
    wire [127:0] cu_info_we_adapter_btm_out_d;
    wire [127:0] cu_info_we_adapter_btm_out_q;
    wire       cu_info_we_adapter_btm_out_we;
    // cu_info_we_adapter_top port wires:
    wire [9:0] cu_info_we_adapter_top_in_adr;
    wire [15:0] cu_info_we_adapter_top_in_byte_enable;
    wire [127:0] cu_info_we_adapter_top_in_d;
    wire [127:0] cu_info_we_adapter_top_in_q;
    wire       cu_info_we_adapter_top_in_we;
    wire [9:0] cu_info_we_adapter_top_out_adr;
    wire [15:0] cu_info_we_adapter_top_out_byte_enable;
    wire [127:0] cu_info_we_adapter_top_out_d;
    wire [127:0] cu_info_we_adapter_top_out_q;
    wire       cu_info_we_adapter_top_out_we;
    // indexer_0 port wires:
    wire       indexer_0_arst_n;
    wire [9:0] indexer_0_bitstream_last_data_rsc_adr;
    wire [127:0] indexer_0_bitstream_last_data_rsc_d;
    wire [127:0] indexer_0_bitstream_last_data_rsc_q;
    wire       indexer_0_bitstream_last_data_rsc_we;
    wire [9:0] indexer_0_bitstream_last_data_top_rsc_adr;
    wire [127:0] indexer_0_bitstream_last_data_top_rsc_d;
    wire [127:0] indexer_0_bitstream_last_data_top_rsc_q;
    wire       indexer_0_bitstream_last_data_top_rsc_we;
    wire [3:0] indexer_0_cabac_metas2_rsc_adr;
    wire [127:0] indexer_0_cabac_metas2_rsc_d;
    wire [127:0] indexer_0_cabac_metas2_rsc_q;
    wire       indexer_0_cabac_metas2_rsc_we;
    wire [3:0] indexer_0_cabac_metas2_top_rsc_adr;
    wire [127:0] indexer_0_cabac_metas2_top_rsc_d;
    wire [127:0] indexer_0_cabac_metas2_top_rsc_q;
    wire       indexer_0_cabac_metas2_top_rsc_we;
    wire [6:0] indexer_0_cabac_states_rsc_adr;
    wire [127:0] indexer_0_cabac_states_rsc_d;
    wire [127:0] indexer_0_cabac_states_rsc_q;
    wire       indexer_0_cabac_states_rsc_we;
    wire [6:0] indexer_0_cabac_states_top_rsc_adr;
    wire [127:0] indexer_0_cabac_states_top_rsc_d;
    wire [127:0] indexer_0_cabac_states_top_rsc_q;
    wire       indexer_0_cabac_states_top_rsc_we;
    wire       indexer_0_clk;
    wire [9:0] indexer_0_cu_info_rsc_adr;
    wire [127:0] indexer_0_cu_info_rsc_d;
    wire [127:0] indexer_0_cu_info_rsc_q;
    wire       indexer_0_cu_info_rsc_we;
    wire [155:0] indexer_0_data_in_rsc_dat;
    wire       indexer_0_data_in_rsc_rdy;
    wire       indexer_0_data_in_rsc_vld;
    wire [127:0] indexer_0_data_out_rsc_dat;
    wire       indexer_0_data_out_rsc_rdy;
    wire       indexer_0_data_out_rsc_vld;
    wire [3:0] indexer_0_data_req_rsc_dat_1;
    wire       indexer_0_data_req_rsc_rdy_1;
    wire       indexer_0_data_req_rsc_vld_1;
    wire [12:0] indexer_0_out_adr;
    wire [12:0] indexer_0_out_adr_1;
    wire [12:0] indexer_0_out_adr_10;
    wire [12:0] indexer_0_out_adr_11;
    wire [12:0] indexer_0_out_adr_12;
    wire [12:0] indexer_0_out_adr_13;
    wire [12:0] indexer_0_out_adr_14;
    wire [12:0] indexer_0_out_adr_15;
    wire [12:0] indexer_0_out_adr_16;
    wire [12:0] indexer_0_out_adr_2;
    wire [12:0] indexer_0_out_adr_3;
    wire [12:0] indexer_0_out_adr_4;
    wire [12:0] indexer_0_out_adr_5;
    wire [12:0] indexer_0_out_adr_6;
    wire [12:0] indexer_0_out_adr_7;
    wire [12:0] indexer_0_out_adr_8;
    wire [12:0] indexer_0_out_adr_9;
    wire [15:0] indexer_0_out_byte_enable;
    wire [15:0] indexer_0_out_byte_enable_1;
    wire [15:0] indexer_0_out_byte_enable_10;
    wire [15:0] indexer_0_out_byte_enable_11;
    wire [15:0] indexer_0_out_byte_enable_12;
    wire [15:0] indexer_0_out_byte_enable_13;
    wire [15:0] indexer_0_out_byte_enable_14;
    wire [15:0] indexer_0_out_byte_enable_15;
    wire [15:0] indexer_0_out_byte_enable_16;
    wire [15:0] indexer_0_out_byte_enable_2;
    wire [15:0] indexer_0_out_byte_enable_3;
    wire [15:0] indexer_0_out_byte_enable_4;
    wire [15:0] indexer_0_out_byte_enable_5;
    wire [15:0] indexer_0_out_byte_enable_6;
    wire [15:0] indexer_0_out_byte_enable_7;
    wire [15:0] indexer_0_out_byte_enable_8;
    wire [15:0] indexer_0_out_byte_enable_9;
    wire [127:0] indexer_0_out_d;
    wire [127:0] indexer_0_out_d_1;
    wire [127:0] indexer_0_out_d_10;
    wire [127:0] indexer_0_out_d_11;
    wire [127:0] indexer_0_out_d_12;
    wire [127:0] indexer_0_out_d_13;
    wire [127:0] indexer_0_out_d_14;
    wire [127:0] indexer_0_out_d_15;
    wire [127:0] indexer_0_out_d_16;
    wire [127:0] indexer_0_out_d_2;
    wire [127:0] indexer_0_out_d_3;
    wire [127:0] indexer_0_out_d_4;
    wire [127:0] indexer_0_out_d_5;
    wire [127:0] indexer_0_out_d_6;
    wire [127:0] indexer_0_out_d_7;
    wire [127:0] indexer_0_out_d_8;
    wire [127:0] indexer_0_out_d_9;
    wire       indexer_0_out_we;
    wire       indexer_0_out_we_1;
    wire       indexer_0_out_we_10;
    wire       indexer_0_out_we_11;
    wire       indexer_0_out_we_12;
    wire       indexer_0_out_we_13;
    wire       indexer_0_out_we_14;
    wire       indexer_0_out_we_15;
    wire       indexer_0_out_we_16;
    wire       indexer_0_out_we_2;
    wire       indexer_0_out_we_3;
    wire       indexer_0_out_we_4;
    wire       indexer_0_out_we_5;
    wire       indexer_0_out_we_6;
    wire       indexer_0_out_we_7;
    wire       indexer_0_out_we_8;
    wire       indexer_0_out_we_9;
    wire [12:0] indexer_0_rec_rsc_adr;
    wire [127:0] indexer_0_rec_rsc_d;
    wire [127:0] indexer_0_rec_rsc_q;
    wire       indexer_0_rec_rsc_we;
    // intra_conf_dc_fifo port wires:
    wire       intra_conf_dc_fifo_aclr_n;
    wire [31:0] intra_conf_dc_fifo_d;
    wire       intra_conf_dc_fifo_d_rdy;
    wire       intra_conf_dc_fifo_d_vld;
    wire [31:0] intra_conf_dc_fifo_q;
    wire       intra_conf_dc_fifo_q_rdy;
    wire       intra_conf_dc_fifo_q_vld;
    wire       intra_conf_dc_fifo_rclk;
    wire       intra_conf_dc_fifo_wclk;

    // Assignments for the ports of the encompassing component:
    assign cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_DAT = cabac_btm_config_in_dat;
    assign cabac_btm_config_in_rdy = cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_RDY;
    assign cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_VLD = cabac_btm_config_in_vld;
    assign cabac_top_dc_fifo_data_in_to_cabac_top_config_in_DAT = cabac_top_config_in_dat;
    assign cabac_top_config_in_rdy = cabac_top_dc_fifo_data_in_to_cabac_top_config_in_RDY;
    assign cabac_top_dc_fifo_data_in_to_cabac_top_config_in_VLD = cabac_top_config_in_vld;
    assign CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK = clk_bin_coding;
    assign CabacCore_TOP_clk_binarization_to_clk_binarization_CLK = clk_binarization;
    assign CabacCore_TOP_clk_base_to_clk_cabac_base_CLK = clk_cabac_base;
    assign IntraSearchCore_clk_intra_to_clk_intra_pred_CLK = clk_intra_base;
    assign Cabac_config_flush_clk_to_clk_intra_base_CLK = clk_intra_base;
    assign intra_conf_dc_fifo_in_clk_to_clk_mem_CLK = clk_mem;
    assign ctu_btm_flush = Cabac_config_flush_ctu_btm_flush_to_bus_6_DAT;
    assign ctu_btm_id = Cabac_config_flush_ctu_btm_id_to_bus_3_DAT;
    assign ctu_done_extended = CTU_done_cycle_extender_top_ctu_done_extended_out_to_ctu_done_top_extended_out_DAT;
    assign ctu_done_extended_1 = CTU_done_cycle_extender_btm_ctu_done_extended_out_to_ctu_done_btm_extended_out_DAT;
    assign ctu_top_flush = Cabac_config_flush_ctu_top_flush_to_bus_1_DAT;
    assign ctu_top_id = Cabac_config_flush_ctu_top_id_to_bus_5_DAT;
    assign intra_conf_dc_fifo_data_in_to_intra_config_in_DAT = intra_config_in_dat;
    assign intra_config_in_rdy = intra_conf_dc_fifo_data_in_to_intra_config_in_RDY;
    assign intra_conf_dc_fifo_data_in_to_intra_config_in_VLD = intra_config_in_vld;
    assign indexer_0_data_in_to_intra_data_in_DAT = intra_data_in_rsc_dat;
    assign intra_data_in_rsc_rdy = indexer_0_data_in_to_intra_data_in_RDY;
    assign indexer_0_data_in_to_intra_data_in_VLD = intra_data_in_rsc_vld;
    assign intra_data_out_rsc_dat = indexer_0_data_out_to_intra_data_out_DAT;
    assign indexer_0_data_out_to_intra_data_out_RDY = intra_data_out_rsc_rdy;
    assign intra_data_out_rsc_vld = indexer_0_data_out_to_intra_data_out_VLD;
    assign indexer_0_data_req_to_intra_data_req_DAT = intra_data_req_rsc_dat;
    assign intra_data_req_rsc_rdy = indexer_0_data_req_to_intra_data_req_RDY;
    assign indexer_0_data_req_to_intra_data_req_VLD = intra_data_req_rsc_vld;
    assign IntraMemories_arst_n_to_bus_arst_n = rst_n;


    // CTU_done_cycle_extender_btm assignments:
    assign CTU_done_cycle_extender_btm_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CTU_done_cycle_extender_btm_clk = CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    assign CTU_done_cycle_extender_btm_ctu_done = CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_DAT;
    assign CTU_done_cycle_extender_btm_ctu_done_extended_out_to_ctu_done_btm_extended_out_DAT = CTU_done_cycle_extender_btm_ctu_done_extended;
    assign CTU_done_cycle_extender_btm_ctu_done_vld = CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_VLD;
    // CTU_done_cycle_extender_top assignments:
    assign CTU_done_cycle_extender_top_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CTU_done_cycle_extender_top_clk = CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    assign CTU_done_cycle_extender_top_ctu_done = CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_DAT;
    assign CTU_done_cycle_extender_top_ctu_done_extended_out_to_ctu_done_top_extended_out_DAT = CTU_done_cycle_extender_top_ctu_done_extended;
    assign CTU_done_cycle_extender_top_ctu_done_vld = CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_VLD;
    // CabacCore_BTM assignments:
    assign CabacCore_BTM_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_ADDR = CabacCore_BTM_bitstream_last_data_rsc_adr_1;
    assign CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_WDATA = CabacCore_BTM_bitstream_last_data_rsc_d_1;
    assign CabacCore_BTM_bitstream_last_data_rsc_q_1 = CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_RDATA;
    assign CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_WREN = CabacCore_BTM_bitstream_last_data_rsc_we_1;
    assign CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_ADDR = CabacCore_BTM_cabac_metas_rsc_adr;
    assign CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_ADDR = CabacCore_BTM_cabac_metas_rsc_adr_1;
    assign CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_WDATA = CabacCore_BTM_cabac_metas_rsc_d;
    assign CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_WDATA = CabacCore_BTM_cabac_metas_rsc_d_1;
    assign CabacCore_BTM_cabac_metas_rsc_q = CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_RDATA;
    assign CabacCore_BTM_cabac_metas_rsc_q_1 = CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_RDATA;
    assign CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_WREN = CabacCore_BTM_cabac_metas_rsc_we;
    assign CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_WREN = CabacCore_BTM_cabac_metas_rsc_we_1;
    assign CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_ADDR[11:0] = CabacCore_BTM_cabac_states_rsc_adr;
    assign CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_WDATA = CabacCore_BTM_cabac_states_rsc_d;
    assign CabacCore_BTM_cabac_states_rsc_q = CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_RDATA;
    assign CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_WREN = CabacCore_BTM_cabac_states_rsc_we;
    assign CabacCore_BTM_clk_base = CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    assign CabacCore_BTM_clk_bin_coding = CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    assign CabacCore_BTM_clk_binarization = CabacCore_TOP_clk_binarization_to_clk_binarization_CLK;
    assign CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_ADDR = CabacCore_BTM_coeff_rsc_adr_1;
    assign CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_WDATA = CabacCore_BTM_coeff_rsc_d_1;
    assign CabacCore_BTM_coeff_rsc_q_1 = CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_RDATA;
    assign CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_WREN = CabacCore_BTM_coeff_rsc_we_1;
    assign CabacCore_BTM_config_in_rsc_dat = cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_DAT;
    assign cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_RDY = CabacCore_BTM_config_in_rsc_rdy;
    assign CabacCore_BTM_config_in_rsc_vld = cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_VLD;
    assign CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_DAT = CabacCore_BTM_ctu_done_rsc_dat;
    assign CabacCore_BTM_ctu_done_rsc_rdy = 1;
    assign CabacCore_BTM_ctu_done_rsc_to_CTU_done_cycle_extender_btm_ctu_done_in_VLD = CabacCore_BTM_ctu_done_rsc_vld;
    assign CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_ADDR = CabacCore_BTM_lcu_left_rsc_adr;
    assign CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_ADDR = CabacCore_BTM_lcu_left_rsc_adr_1;
    assign CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_WDATA = CabacCore_BTM_lcu_left_rsc_d;
    assign CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_WDATA = CabacCore_BTM_lcu_left_rsc_d_1;
    assign CabacCore_BTM_lcu_left_rsc_q = CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_RDATA;
    assign CabacCore_BTM_lcu_left_rsc_q_1 = CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_RDATA;
    assign CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_WREN = CabacCore_BTM_lcu_left_rsc_we;
    assign CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_WREN = CabacCore_BTM_lcu_left_rsc_we_1;
    assign CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_ADDR = CabacCore_BTM_lcu_rsc_adr;
    assign CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_ADDR = CabacCore_BTM_lcu_rsc_adr_1;
    assign CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_WDATA = CabacCore_BTM_lcu_rsc_d;
    assign CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_WDATA = CabacCore_BTM_lcu_rsc_d_1;
    assign CabacCore_BTM_lcu_rsc_q = CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_RDATA;
    assign CabacCore_BTM_lcu_rsc_q_1 = CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_RDATA;
    assign CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_WREN = CabacCore_BTM_lcu_rsc_we;
    assign CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_WREN = CabacCore_BTM_lcu_rsc_we_1;
    assign CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_ADDR = CabacCore_BTM_lcu_top_rsc_adr;
    assign CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_ADDR = CabacCore_BTM_lcu_top_rsc_adr_1;
    assign CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_WDATA = CabacCore_BTM_lcu_top_rsc_d;
    assign CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_WDATA = CabacCore_BTM_lcu_top_rsc_d_1;
    assign CabacCore_BTM_lcu_top_rsc_q = CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_RDATA;
    assign CabacCore_BTM_lcu_top_rsc_q_1 = CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_RDATA;
    assign CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_WREN = CabacCore_BTM_lcu_top_rsc_we;
    assign CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_WREN = CabacCore_BTM_lcu_top_rsc_we_1;
    // CabacCore_TOP assignments:
    assign CabacCore_TOP_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_ADDR = CabacCore_TOP_bitstream_last_data_rsc_adr_1;
    assign CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_WDATA = CabacCore_TOP_bitstream_last_data_rsc_d_1;
    assign CabacCore_TOP_bitstream_last_data_rsc_q_1 = CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_RDATA;
    assign CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_WREN = CabacCore_TOP_bitstream_last_data_rsc_we_1;
    assign CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_ADDR = CabacCore_TOP_cabac_metas_rsc_adr;
    assign CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_ADDR = CabacCore_TOP_cabac_metas_rsc_adr_1;
    assign CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_WDATA = CabacCore_TOP_cabac_metas_rsc_d;
    assign CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_WDATA = CabacCore_TOP_cabac_metas_rsc_d_1;
    assign CabacCore_TOP_cabac_metas_rsc_q = CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_RDATA;
    assign CabacCore_TOP_cabac_metas_rsc_q_1 = CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_RDATA;
    assign CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_WREN = CabacCore_TOP_cabac_metas_rsc_we;
    assign CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_WREN = CabacCore_TOP_cabac_metas_rsc_we_1;
    assign CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_ADDR[11:0] = CabacCore_TOP_cabac_states_rsc_adr;
    assign CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_WDATA = CabacCore_TOP_cabac_states_rsc_d;
    assign CabacCore_TOP_cabac_states_rsc_q = CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_RDATA;
    assign CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_WREN = CabacCore_TOP_cabac_states_rsc_we;
    assign CabacCore_TOP_clk_base = CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    assign CabacCore_TOP_clk_bin_coding = CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    assign CabacCore_TOP_clk_binarization = CabacCore_TOP_clk_binarization_to_clk_binarization_CLK;
    assign CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_ADDR = CabacCore_TOP_coeff_rsc_adr_1;
    assign CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_WDATA = CabacCore_TOP_coeff_rsc_d_1;
    assign CabacCore_TOP_coeff_rsc_q_1 = CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_RDATA;
    assign CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_WREN = CabacCore_TOP_coeff_rsc_we_1;
    assign CabacCore_TOP_config_in_rsc_dat = cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_DAT;
    assign cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_RDY = CabacCore_TOP_config_in_rsc_rdy;
    assign CabacCore_TOP_config_in_rsc_vld = cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_VLD;
    assign CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_DAT = CabacCore_TOP_ctu_done_rsc_dat;
    assign CabacCore_TOP_ctu_done_rsc_rdy = 1;
    assign CabacCore_TOP_ctu_done_rsc_to_CTU_done_cycle_extender_top_ctu_done_in_VLD = CabacCore_TOP_ctu_done_rsc_vld;
    assign CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_ADDR = CabacCore_TOP_lcu_left_rsc_adr;
    assign CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_ADDR = CabacCore_TOP_lcu_left_rsc_adr_1;
    assign CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_WDATA = CabacCore_TOP_lcu_left_rsc_d;
    assign CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_WDATA = CabacCore_TOP_lcu_left_rsc_d_1;
    assign CabacCore_TOP_lcu_left_rsc_q = CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_RDATA;
    assign CabacCore_TOP_lcu_left_rsc_q_1 = CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_RDATA;
    assign CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_WREN = CabacCore_TOP_lcu_left_rsc_we;
    assign CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_WREN = CabacCore_TOP_lcu_left_rsc_we_1;
    assign CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_ADDR = CabacCore_TOP_lcu_rsc_adr;
    assign CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_ADDR = CabacCore_TOP_lcu_rsc_adr_1;
    assign CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_WDATA = CabacCore_TOP_lcu_rsc_d;
    assign CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_WDATA = CabacCore_TOP_lcu_rsc_d_1;
    assign CabacCore_TOP_lcu_rsc_q = CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_RDATA;
    assign CabacCore_TOP_lcu_rsc_q_1 = CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_RDATA;
    assign CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_WREN = CabacCore_TOP_lcu_rsc_we;
    assign CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_WREN = CabacCore_TOP_lcu_rsc_we_1;
    assign CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_ADDR = CabacCore_TOP_lcu_top_rsc_adr;
    assign CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_ADDR = CabacCore_TOP_lcu_top_rsc_adr_1;
    assign CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_WDATA = CabacCore_TOP_lcu_top_rsc_d;
    assign CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_WDATA = CabacCore_TOP_lcu_top_rsc_d_1;
    assign CabacCore_TOP_lcu_top_rsc_q = CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_RDATA;
    assign CabacCore_TOP_lcu_top_rsc_q_1 = CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_RDATA;
    assign CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_WREN = CabacCore_TOP_lcu_top_rsc_we;
    assign CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_WREN = CabacCore_TOP_lcu_top_rsc_we_1;
    // CabacMemories_BTM assignments:
    assign CabacMemories_BTM_address_a = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_ADDR[8:0];
    assign CabacMemories_BTM_address_a_1 = indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_ADDR[2:0];
    assign CabacMemories_BTM_address_a_10 = indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_ADDR;
    assign CabacMemories_BTM_address_a_2 = CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_ADDR[2:0];
    assign CabacMemories_BTM_address_a_3 = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_ADDR[8:0];
    assign CabacMemories_BTM_address_a_4 = indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_ADDR[2:0];
    assign CabacMemories_BTM_address_a_5 = CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_ADDR[2:0];
    assign CabacMemories_BTM_address_a_6 = indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_ADDR;
    assign CabacMemories_BTM_address_a_7 = CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_ADDR;
    assign CabacMemories_BTM_address_a_8 = coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_ADDR;
    assign CabacMemories_BTM_address_a_9 = CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_ADDR[2:0];
    assign CabacMemories_BTM_address_b = CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_ADDR[2:0];
    assign CabacMemories_BTM_address_b_1 = CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_ADDR[3:0];
    assign CabacMemories_BTM_byteena_a = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_BYTEEN;
    assign CabacMemories_BTM_byteena_a_1 = indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_BYTEEN;
    assign CabacMemories_BTM_byteena_a_2 = CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_BYTEEN;
    assign CabacMemories_BTM_byteena_a_3 = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_BYTEEN;
    assign CabacMemories_BTM_byteena_a_4 = indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_BYTEEN;
    assign CabacMemories_BTM_byteena_a_5 = CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_BYTEEN;
    assign CabacMemories_BTM_byteena_a_8 = coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_BYTEEN;
    assign CabacMemories_BTM_byteena_a_9 = CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_BYTEEN;
    assign CabacMemories_BTM_clk = CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    assign CabacMemories_BTM_clk_intra_base = Cabac_config_flush_clk_to_clk_intra_base_CLK;
    assign CabacMemories_BTM_clock_a = CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    assign CabacMemories_BTM_clock_a_1 = CabacCore_TOP_clk_binarization_to_clk_binarization_CLK;
    assign CabacMemories_BTM_clock_a_2 = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    assign CabacMemories_BTM_data_a = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WDATA;
    assign CabacMemories_BTM_data_a_1 = indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_WDATA;
    assign CabacMemories_BTM_data_a_10 = indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_WDATA;
    assign CabacMemories_BTM_data_a_2 = CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_WDATA;
    assign CabacMemories_BTM_data_a_3 = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WDATA;
    assign CabacMemories_BTM_data_a_4 = indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_WDATA;
    assign CabacMemories_BTM_data_a_5 = CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_WDATA;
    assign CabacMemories_BTM_data_a_6 = indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_WDATA;
    assign CabacMemories_BTM_data_a_7 = CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_WDATA;
    assign CabacMemories_BTM_data_a_8 = coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_WDATA;
    assign CabacMemories_BTM_data_a_9 = CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_WDATA;
    assign CabacMemories_BTM_data_b = CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_WDATA;
    assign CabacMemories_BTM_data_b_1 = CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_WDATA;
    assign cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_RDATA = CabacMemories_BTM_q_a;
    assign indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_RDATA = CabacMemories_BTM_q_a_10;
    assign cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_RDATA = CabacMemories_BTM_q_a_3;
    assign indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_RDATA = CabacMemories_BTM_q_a_6;
    assign CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_RDATA = CabacMemories_BTM_q_a_7;
    assign CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_RDATA = CabacMemories_BTM_q_b;
    assign CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_RDATA = CabacMemories_BTM_q_b_1;
    assign CabacMemories_BTM_ram_a_address = CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_ADDR;
    assign CabacMemories_BTM_ram_a_address_1 = CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_ADDR;
    assign CabacMemories_BTM_ram_a_address_2 = CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_ADDR;
    assign CabacMemories_BTM_ram_a_address_3 = CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_ADDR;
    assign CabacMemories_BTM_ram_a_address_4 = CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_ADDR;
    assign CabacMemories_BTM_ram_a_address_5 = CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_ADDR;
    assign CabacMemories_BTM_ram_a_address_6 = CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_ADDR;
    assign CabacMemories_BTM_ram_a_address_7 = CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_ADDR;
    assign CabacMemories_BTM_ram_a_address_8 = CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_ADDR;
    assign CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_RDATA = CabacMemories_BTM_ram_a_readdata;
    assign CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_RDATA = CabacMemories_BTM_ram_a_readdata_1;
    assign CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_RDATA = CabacMemories_BTM_ram_a_readdata_2;
    assign CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_RDATA = CabacMemories_BTM_ram_a_readdata_3;
    assign CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_RDATA = CabacMemories_BTM_ram_a_readdata_4;
    assign CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_RDATA = CabacMemories_BTM_ram_a_readdata_5;
    assign CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_RDATA = CabacMemories_BTM_ram_a_readdata_6;
    assign CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_RDATA = CabacMemories_BTM_ram_a_readdata_7;
    assign CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_RDATA = CabacMemories_BTM_ram_a_readdata_8;
    assign CabacMemories_BTM_ram_a_write = CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_WREN;
    assign CabacMemories_BTM_ram_a_write_1 = CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_WREN;
    assign CabacMemories_BTM_ram_a_write_2 = CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_WREN;
    assign CabacMemories_BTM_ram_a_write_3 = CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_WREN;
    assign CabacMemories_BTM_ram_a_write_4 = CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_WREN;
    assign CabacMemories_BTM_ram_a_write_5 = CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_WREN;
    assign CabacMemories_BTM_ram_a_write_6 = CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_WREN;
    assign CabacMemories_BTM_ram_a_write_7 = CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_WREN;
    assign CabacMemories_BTM_ram_a_write_8 = CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_WREN;
    assign CabacMemories_BTM_ram_a_writedata = CabacCore_BTM_lcu_rsc_to_CabacMemories_BTM_cu_info1_b_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_1 = CabacMemories_BTM_cu_info1_top_b_to_CabacCore_BTM_lcu_top_rsc_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_2 = CabacCore_BTM_lcu_left_rsc_to_CabacMemories_BTM_cu_info1_left_b_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_3 = CabacMemories_BTM_cu_info2_b_to_CabacCore_BTM_lcu_rsc_1_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_4 = CabacCore_BTM_lcu_top_rsc_1_to_CabacMemories_BTM_cu_info2_top_b_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_5 = CabacMemories_BTM_cu_info2_left_b_to_CabacCore_BTM_lcu_left_rsc_1_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_6 = CabacCore_BTM_cabac_states_rsc_to_CabacMemories_BTM_cabac_states_b_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_7 = CabacMemories_BTM_bitstream_b_to_CabacCore_BTM_bitstream_last_data_rsc_WDATA;
    assign CabacMemories_BTM_ram_a_writedata_8 = CabacCore_BTM_coeff_rsc_to_CabacMemories_BTM_coeff_b_WDATA;
    assign CabacMemories_BTM_rst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CabacMemories_BTM_wren_a = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WREN;
    assign CabacMemories_BTM_wren_a_1 = indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_WREN;
    assign CabacMemories_BTM_wren_a_10 = indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_WREN;
    assign CabacMemories_BTM_wren_a_2 = CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_WREN;
    assign CabacMemories_BTM_wren_a_3 = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WREN;
    assign CabacMemories_BTM_wren_a_4 = indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_WREN;
    assign CabacMemories_BTM_wren_a_5 = CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_WREN;
    assign CabacMemories_BTM_wren_a_6 = indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_WREN;
    assign CabacMemories_BTM_wren_a_7 = CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_WREN;
    assign CabacMemories_BTM_wren_a_8 = coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_WREN;
    assign CabacMemories_BTM_wren_a_9 = CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_WREN;
    assign CabacMemories_BTM_wren_b = CabacCore_BTM_cabac_metas_pull_to_CabacMemories_BTM_cabac_metas_pull_b_WREN;
    assign CabacMemories_BTM_wren_b_1 = CabacCore_BTM_cabac_metas_push_to_CabacMemories_BTM_cabac_metas_push_b_WREN;
    // CabacMemories_TOP assignments:
    assign CabacMemories_TOP_address_a = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_ADDR[8:0];
    assign CabacMemories_TOP_address_a_1 = indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_ADDR[2:0];
    assign CabacMemories_TOP_address_a_10 = indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_ADDR;
    assign CabacMemories_TOP_address_a_2 = CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_ADDR[2:0];
    assign CabacMemories_TOP_address_a_3 = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_ADDR[8:0];
    assign CabacMemories_TOP_address_a_4 = indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_ADDR[2:0];
    assign CabacMemories_TOP_address_a_5 = CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_ADDR[2:0];
    assign CabacMemories_TOP_address_a_6 = indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_ADDR;
    assign CabacMemories_TOP_address_a_7 = CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_ADDR;
    assign CabacMemories_TOP_address_a_8 = coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_ADDR;
    assign CabacMemories_TOP_address_a_9 = CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_ADDR[2:0];
    assign CabacMemories_TOP_address_b = CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_ADDR[2:0];
    assign CabacMemories_TOP_address_b_1 = CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_ADDR[3:0];
    assign CabacMemories_TOP_byteena_a = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_BYTEEN;
    assign CabacMemories_TOP_byteena_a_1 = indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_BYTEEN;
    assign CabacMemories_TOP_byteena_a_2 = CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_BYTEEN;
    assign CabacMemories_TOP_byteena_a_3 = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_BYTEEN;
    assign CabacMemories_TOP_byteena_a_4 = indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_BYTEEN;
    assign CabacMemories_TOP_byteena_a_5 = CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_BYTEEN;
    assign CabacMemories_TOP_byteena_a_8 = coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_BYTEEN;
    assign CabacMemories_TOP_byteena_a_9 = CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_BYTEEN;
    assign CabacMemories_TOP_clk = CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    assign CabacMemories_TOP_clk_intra_base = Cabac_config_flush_clk_to_clk_intra_base_CLK;
    assign CabacMemories_TOP_clock_a = CabacCore_TOP_clk_bin_coding_to_clk_bin_coding_CLK;
    assign CabacMemories_TOP_clock_a_1 = CabacCore_TOP_clk_binarization_to_clk_binarization_CLK;
    assign CabacMemories_TOP_clock_a_2 = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    assign CabacMemories_TOP_data_a = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WDATA;
    assign CabacMemories_TOP_data_a_1 = indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_WDATA;
    assign CabacMemories_TOP_data_a_10 = indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_WDATA;
    assign CabacMemories_TOP_data_a_2 = CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_WDATA;
    assign CabacMemories_TOP_data_a_3 = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WDATA;
    assign CabacMemories_TOP_data_a_4 = indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_WDATA;
    assign CabacMemories_TOP_data_a_5 = CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_WDATA;
    assign CabacMemories_TOP_data_a_6 = indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_WDATA;
    assign CabacMemories_TOP_data_a_7 = CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_WDATA;
    assign CabacMemories_TOP_data_a_8 = coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_WDATA;
    assign CabacMemories_TOP_data_a_9 = CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_WDATA;
    assign CabacMemories_TOP_data_b = CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_WDATA;
    assign CabacMemories_TOP_data_b_1 = CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_WDATA;
    assign cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_RDATA = CabacMemories_TOP_q_a;
    assign indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_RDATA = CabacMemories_TOP_q_a_10;
    assign cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_RDATA = CabacMemories_TOP_q_a_3;
    assign indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_RDATA = CabacMemories_TOP_q_a_6;
    assign CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_RDATA = CabacMemories_TOP_q_a_7;
    assign CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_RDATA = CabacMemories_TOP_q_b;
    assign CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_RDATA = CabacMemories_TOP_q_b_1;
    assign CabacMemories_TOP_ram_a_address = CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_ADDR;
    assign CabacMemories_TOP_ram_a_address_1 = CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_ADDR;
    assign CabacMemories_TOP_ram_a_address_2 = CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_ADDR;
    assign CabacMemories_TOP_ram_a_address_3 = CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_ADDR;
    assign CabacMemories_TOP_ram_a_address_4 = CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_ADDR;
    assign CabacMemories_TOP_ram_a_address_5 = CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_ADDR;
    assign CabacMemories_TOP_ram_a_address_6 = CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_ADDR;
    assign CabacMemories_TOP_ram_a_address_7 = CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_ADDR;
    assign CabacMemories_TOP_ram_a_address_8 = CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_ADDR;
    assign CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_RDATA = CabacMemories_TOP_ram_a_readdata;
    assign CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_RDATA = CabacMemories_TOP_ram_a_readdata_1;
    assign CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_RDATA = CabacMemories_TOP_ram_a_readdata_2;
    assign CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_RDATA = CabacMemories_TOP_ram_a_readdata_3;
    assign CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_RDATA = CabacMemories_TOP_ram_a_readdata_4;
    assign CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_RDATA = CabacMemories_TOP_ram_a_readdata_5;
    assign CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_RDATA = CabacMemories_TOP_ram_a_readdata_6;
    assign CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_RDATA = CabacMemories_TOP_ram_a_readdata_7;
    assign CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_RDATA = CabacMemories_TOP_ram_a_readdata_8;
    assign CabacMemories_TOP_ram_a_write = CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_WREN;
    assign CabacMemories_TOP_ram_a_write_1 = CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_WREN;
    assign CabacMemories_TOP_ram_a_write_2 = CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_WREN;
    assign CabacMemories_TOP_ram_a_write_3 = CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_WREN;
    assign CabacMemories_TOP_ram_a_write_4 = CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_WREN;
    assign CabacMemories_TOP_ram_a_write_5 = CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_WREN;
    assign CabacMemories_TOP_ram_a_write_6 = CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_WREN;
    assign CabacMemories_TOP_ram_a_write_7 = CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_WREN;
    assign CabacMemories_TOP_ram_a_write_8 = CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_WREN;
    assign CabacMemories_TOP_ram_a_writedata = CabacCore_TOP_lcu_rsc_to_CabacMemories_TOP_cu_info1_b_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_1 = CabacCore_TOP_lcu_top_rsc_to_CabacMemories_TOP_cu_info1_top_b_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_2 = CabacMemories_TOP_cu_info1_left_b_to_CabacCore_TOP_lcu_left_rsc_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_3 = CabacCore_TOP_lcu_rsc_1_to_CabacMemories_TOP_cu_info2_b_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_4 = CabacMemories_TOP_cu_info2_top_b_to_CabacCore_TOP_lcu_top_rsc_1_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_5 = CabacCore_TOP_lcu_left_rsc_1_to_CabacMemories_TOP_cu_info2_left_b_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_6 = CabacMemories_TOP_cabac_states_b_to_CabacCore_TOP_cabac_states_rsc_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_7 = CabacCore_TOP_bitstream_last_data_rsc_to_CabacMemories_TOP_bitstream_b_WDATA;
    assign CabacMemories_TOP_ram_a_writedata_8 = CabacMemories_TOP_coeff_b_to_CabacCore_TOP_coeff_rsc_WDATA;
    assign CabacMemories_TOP_rst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CabacMemories_TOP_wren_a = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WREN;
    assign CabacMemories_TOP_wren_a_1 = indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_WREN;
    assign CabacMemories_TOP_wren_a_10 = indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_WREN;
    assign CabacMemories_TOP_wren_a_2 = CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_WREN;
    assign CabacMemories_TOP_wren_a_3 = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WREN;
    assign CabacMemories_TOP_wren_a_4 = indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_WREN;
    assign CabacMemories_TOP_wren_a_5 = CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_WREN;
    assign CabacMemories_TOP_wren_a_6 = indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_WREN;
    assign CabacMemories_TOP_wren_a_7 = CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_WREN;
    assign CabacMemories_TOP_wren_a_8 = coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_WREN;
    assign CabacMemories_TOP_wren_a_9 = CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_WREN;
    assign CabacMemories_TOP_wren_b = CabacCore_TOP_cabac_metas_pull_to_CabacMemories_TOP_cabac_metas_pull_b_WREN;
    assign CabacMemories_TOP_wren_b_1 = CabacMemories_TOP_cabac_metas_push_b_to_CabacCore_TOP_cabac_metas_push_WREN;
    // Cabac_config_flush assignments:
    assign Cabac_config_flush_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign Cabac_config_flush_clk = Cabac_config_flush_clk_to_clk_intra_base_CLK;
    assign Cabac_config_flush_ctu_btm_flush_to_bus_6_DAT = Cabac_config_flush_ctu_btm_flush;
    assign Cabac_config_flush_ctu_btm_id_to_bus_3_DAT = Cabac_config_flush_ctu_btm_id;
    assign Cabac_config_flush_ctu_top_flush_to_bus_1_DAT = Cabac_config_flush_ctu_top_flush;
    assign Cabac_config_flush_ctu_top_id_to_bus_5_DAT = Cabac_config_flush_ctu_top_id;
    assign Cabac_config_flush_intra_ctu_done = Cabac_config_flush_ctu_done_in_to_IntraSearchCore_lcu_poll_DAT;
    // IntraMemories assignments:
    assign IntraMemories_address_a = IntraMemories_ref_a_to_indexer_0_ref_ADDR;
    assign IntraMemories_address_a_1 = indexer_0_top_border_to_IntraMemories_top_border_a_ADDR[7:0];
    assign IntraMemories_address_a_2 = IntraMemories_left_border_a_to_indexer_0_left_border_ADDR[7:0];
    assign IntraMemories_address_a_3 = indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_ADDR[3:0];
    assign IntraMemories_address_a_4 = IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_ADDR[3:0];
    assign IntraMemories_address_a_5 = indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_ADDR[3:0];
    assign IntraMemories_address_a_6 = IntraMemories_cu_info_a_to_indexer_0_cu_info_ADDR;
    assign IntraMemories_address_a_7 = indexer_0_cabac_to_IntraMemories_cabac_a_ADDR[3:0];
    assign IntraMemories_address_a_8 = IntraMemories_rec_a_to_indexer_0_rec_ADDR;
    assign IntraMemories_address_b = IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_ADDR;
    assign IntraMemories_address_b_1 = IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_ADDR;
    assign IntraMemories_byteena_a = IntraMemories_ref_a_to_indexer_0_ref_BYTEEN;
    assign IntraMemories_byteena_a_1 = indexer_0_top_border_to_IntraMemories_top_border_a_BYTEEN;
    assign IntraMemories_byteena_a_2 = IntraMemories_left_border_a_to_indexer_0_left_border_BYTEEN;
    assign IntraMemories_byteena_a_3 = indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_BYTEEN;
    assign IntraMemories_byteena_a_4 = IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_BYTEEN;
    assign IntraMemories_byteena_a_5 = indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_BYTEEN;
    assign IntraMemories_byteena_a_7 = indexer_0_cabac_to_IntraMemories_cabac_a_BYTEEN;
    assign IntraMemories_byteena_b_1 = IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_BYTEEN;
    assign IntraMemories_clk = Cabac_config_flush_clk_to_clk_intra_base_CLK;
    assign IntraMemories_clock_a = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    assign IntraMemories_data_a = IntraMemories_ref_a_to_indexer_0_ref_WDATA;
    assign IntraMemories_data_a_1 = indexer_0_top_border_to_IntraMemories_top_border_a_WDATA;
    assign IntraMemories_data_a_2 = IntraMemories_left_border_a_to_indexer_0_left_border_WDATA;
    assign IntraMemories_data_a_3 = indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_WDATA;
    assign IntraMemories_data_a_4 = IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_WDATA;
    assign IntraMemories_data_a_5 = indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_WDATA;
    assign IntraMemories_data_a_6 = IntraMemories_cu_info_a_to_indexer_0_cu_info_WDATA;
    assign IntraMemories_data_a_7 = indexer_0_cabac_to_IntraMemories_cabac_a_WDATA;
    assign IntraMemories_data_a_8 = IntraMemories_rec_a_to_indexer_0_rec_WDATA;
    assign IntraMemories_data_b = IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_WDATA;
    assign IntraMemories_data_b_1 = IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_WDATA;
    assign IntraMemories_cu_info_a_to_indexer_0_cu_info_RDATA = IntraMemories_q_a_6;
    assign IntraMemories_rec_a_to_indexer_0_rec_RDATA = IntraMemories_q_a_8;
    assign IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_RDATA = IntraMemories_q_b;
    assign IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_RDATA[255:0] = IntraMemories_q_b_1;
    assign IntraMemories_ram_a_address = IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_ADDR;
    assign IntraMemories_ram_a_address_1 = IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_ADDR;
    assign IntraMemories_ram_a_address_2 = IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_ADDR;
    assign IntraMemories_ram_a_address_3 = IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_ADDR;
    assign IntraMemories_ram_a_address_4 = IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_ADDR;
    assign IntraMemories_ram_a_address_5 = IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_ADDR;
    assign IntraMemories_ram_a_address_6 = IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_ADDR;
    assign IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_RDATA = IntraMemories_ram_a_readdata;
    assign IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_RDATA = IntraMemories_ram_a_readdata_1;
    assign IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_RDATA = IntraMemories_ram_a_readdata_2;
    assign IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_RDATA = IntraMemories_ram_a_readdata_3;
    assign IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_RDATA = IntraMemories_ram_a_readdata_4;
    assign IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_RDATA = IntraMemories_ram_a_readdata_5;
    assign IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_RDATA = IntraMemories_ram_a_readdata_6;
    assign IntraMemories_ram_a_write = IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_WREN;
    assign IntraMemories_ram_a_write_1 = IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_WREN;
    assign IntraMemories_ram_a_write_2 = IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_WREN;
    assign IntraMemories_ram_a_write_3 = IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_WREN;
    assign IntraMemories_ram_a_write_4 = IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_WREN;
    assign IntraMemories_ram_a_write_5 = IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_WREN;
    assign IntraMemories_ram_a_write_6 = IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_WREN;
    assign IntraMemories_ram_a_writedata = IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_WDATA;
    assign IntraMemories_ram_a_writedata_1 = IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_WDATA;
    assign IntraMemories_ram_a_writedata_2 = IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_WDATA;
    assign IntraMemories_ram_a_writedata_3 = IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_WDATA;
    assign IntraMemories_ram_a_writedata_4 = IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_WDATA;
    assign IntraMemories_ram_a_writedata_5 = IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_WDATA;
    assign IntraMemories_ram_a_writedata_6 = IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_WDATA;
    assign IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_ADDR = IntraMemories_ram_b_address;
    assign IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_BYTEEN = IntraMemories_ram_b_byteen;
    assign IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WREN = IntraMemories_ram_b_write;
    assign IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WDATA = IntraMemories_ram_b_writedata;
    assign IntraMemories_rst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign IntraMemories_wren_a = IntraMemories_ref_a_to_indexer_0_ref_WREN;
    assign IntraMemories_wren_a_1 = indexer_0_top_border_to_IntraMemories_top_border_a_WREN;
    assign IntraMemories_wren_a_2 = IntraMemories_left_border_a_to_indexer_0_left_border_WREN;
    assign IntraMemories_wren_a_3 = indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_WREN;
    assign IntraMemories_wren_a_4 = IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_WREN;
    assign IntraMemories_wren_a_5 = indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_WREN;
    assign IntraMemories_wren_a_6 = IntraMemories_cu_info_a_to_indexer_0_cu_info_WREN;
    assign IntraMemories_wren_a_7 = indexer_0_cabac_to_IntraMemories_cabac_a_WREN;
    assign IntraMemories_wren_a_8 = IntraMemories_rec_a_to_indexer_0_rec_WREN;
    assign IntraMemories_wren_b = IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_WREN;
    assign IntraMemories_wren_b_1 = IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_WREN;
    // IntraSearchCore assignments:
    assign IntraSearchCore_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_ADDR = IntraSearchCore_cabac_rsc_adr;
    assign IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_WDATA = IntraSearchCore_cabac_rsc_d;
    assign IntraSearchCore_cabac_rsc_q = IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_RDATA;
    assign IntraSearchCore_cabac_rsc_to_IntraMemories_cabac_b_WREN = IntraSearchCore_cabac_rsc_we;
    assign IntraSearchCore_clk_base = Cabac_config_flush_clk_to_clk_intra_base_CLK;
    assign IntraSearchCore_clk_intra = IntraSearchCore_clk_intra_to_clk_intra_pred_CLK;
    assign IntraSearchCore_conf_in_rsc_dat = intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_DAT;
    assign intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_RDY = IntraSearchCore_conf_in_rsc_rdy;
    assign IntraSearchCore_conf_in_rsc_vld = intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_VLD;
    assign IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_ADDR = IntraSearchCore_cu_cu_cu_info_rsc_adr;
    assign IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_WDATA = IntraSearchCore_cu_cu_cu_info_rsc_d;
    assign IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_WDATA = IntraSearchCore_cu_cu_cu_info_rsc_d_1;
    assign IntraSearchCore_cu_cu_cu_info_rsc_q = IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_RDATA;
    assign IntraSearchCore_cu_cu_cu_info_rsc_q_1 = IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_RDATA;
    assign IntraSearchCore_cu_info_rsc_to_IntraMemories_cu_info_b_WREN = IntraSearchCore_cu_cu_cu_info_rsc_we;
    assign IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_ADDR = IntraSearchCore_cu_cu_hor_cu_info_rsc_adr;
    assign IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_ADDR = IntraSearchCore_cu_cu_hor_cu_info_rsc_adr_1;
    assign IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_WDATA = IntraSearchCore_cu_cu_hor_cu_info_rsc_d;
    assign IntraSearchCore_cu_cu_hor_cu_info_rsc_q = IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_RDATA;
    assign IntraSearchCore_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_b_WREN = IntraSearchCore_cu_cu_hor_cu_info_rsc_we;
    assign IntraSearchCore_cu_info_hor_to_IntraMemories_cu_info_hor_b_WREN = IntraSearchCore_cu_cu_hor_cu_info_rsc_we_1;
    assign IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_ADDR = IntraSearchCore_cu_cu_ver_cu_info_rsc_adr;
    assign IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_WDATA = IntraSearchCore_cu_cu_ver_cu_info_rsc_d;
    assign IntraSearchCore_cu_cu_ver_cu_info_rsc_q = IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_RDATA;
    assign IntraSearchCore_cu_info_ver_to_IntraMemories_cu_info_ver_b_WREN = IntraSearchCore_cu_cu_ver_cu_info_rsc_we;
    assign Cabac_config_flush_ctu_done_in_to_IntraSearchCore_lcu_poll_DAT = IntraSearchCore_irq_rsc_dat;
    assign IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_ADDR = IntraSearchCore_lcu_border_left_rsc_adr;
    assign IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_WDATA = IntraSearchCore_lcu_border_left_rsc_d;
    assign IntraSearchCore_lcu_border_left_rsc_q = IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_RDATA;
    assign IntraSearchCore_lcu_border_left_to_IntraMemories_left_border_b_WREN = IntraSearchCore_lcu_border_left_rsc_we;
    assign IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_ADDR = IntraSearchCore_lcu_border_top_rsc_adr;
    assign IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_WDATA = IntraSearchCore_lcu_border_top_rsc_d;
    assign IntraSearchCore_lcu_border_top_rsc_q = IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_RDATA;
    assign IntraSearchCore_lcu_border_top_to_IntraMemories_top_border_b_WREN = IntraSearchCore_lcu_border_top_rsc_we;
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_ADDR = IntraSearchCore_lcu_coeff_rsc_adr;
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[9] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[10] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[11] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[12] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[13] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[14] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[15] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[16] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[17] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[18] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[19] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[20] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[21] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[22] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[23] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[24] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[25] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[26] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[27] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[28] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[29] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[30] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[31] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[8] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[7] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[6] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[3] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[4] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[5] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[0] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[1] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[2] = IntraSearchCore_lcu_coeff_rsc_d[512];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[35] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[36] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[37] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[38] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[39] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[40] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[41] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[42] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[43] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[44] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[45] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[46] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[47] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[48] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[49] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[50] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[51] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[52] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[53] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[54] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[55] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[56] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[57] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[58] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[59] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[60] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[61] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[62] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[63] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[34] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[32] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN[33] = IntraSearchCore_lcu_coeff_rsc_d[513];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_WDATA = IntraSearchCore_lcu_coeff_rsc_d[511:0];
    assign IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_WREN = IntraSearchCore_lcu_coeff_rsc_we;
    assign IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_ADDR = IntraSearchCore_lcu_rec_rsc_adr;
    assign IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_BYTEEN = IntraSearchCore_lcu_rec_rsc_d[287:256];
    assign IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_WDATA = IntraSearchCore_lcu_rec_rsc_d[255:0];
    assign IntraSearchCore_lcu_rec_rsc_q = IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_RDATA;
    assign IntraSearchCore_lcu_rec_rsc_to_IntraMemories_rec_b_WREN = IntraSearchCore_lcu_rec_rsc_we;
    assign IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_ADDR = IntraSearchCore_lcu_ref_rsc_adr;
    assign IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_WDATA = IntraSearchCore_lcu_ref_rsc_d;
    assign IntraSearchCore_lcu_ref_rsc_q = IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_RDATA;
    assign IntraMemories_ref_b_to_IntraSearchCore_lcu_ref_rsc_WREN = IntraSearchCore_lcu_ref_rsc_we;
    // cabac_btm_dc_fifo assignments:
    assign cabac_btm_dc_fifo_aclr_n = IntraMemories_arst_n_to_bus_arst_n;
    assign cabac_btm_dc_fifo_d = cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_DAT;
    assign cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_RDY = cabac_btm_dc_fifo_d_rdy;
    assign cabac_btm_dc_fifo_d_vld = cabac_btm_dc_fifo_data_in_to_cabac_btm_config_in_VLD;
    assign cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_DAT = cabac_btm_dc_fifo_q;
    assign cabac_btm_dc_fifo_q_rdy = cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_RDY;
    assign cabac_btm_dc_fifo_data_out_to_CabacCore_BTM_config_in_rsc_VLD = cabac_btm_dc_fifo_q_vld;
    assign cabac_btm_dc_fifo_rclk = CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    assign cabac_btm_dc_fifo_wclk = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    // cabac_top_dc_fifo assignments:
    assign cabac_top_dc_fifo_aclr_n = IntraMemories_arst_n_to_bus_arst_n;
    assign cabac_top_dc_fifo_d = cabac_top_dc_fifo_data_in_to_cabac_top_config_in_DAT;
    assign cabac_top_dc_fifo_data_in_to_cabac_top_config_in_RDY = cabac_top_dc_fifo_d_rdy;
    assign cabac_top_dc_fifo_d_vld = cabac_top_dc_fifo_data_in_to_cabac_top_config_in_VLD;
    assign cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_DAT = cabac_top_dc_fifo_q;
    assign cabac_top_dc_fifo_q_rdy = cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_RDY;
    assign cabac_top_dc_fifo_data_out_to_CabacCore_TOP_config_in_rsc_VLD = cabac_top_dc_fifo_q_vld;
    assign cabac_top_dc_fifo_rclk = CabacCore_TOP_clk_base_to_clk_cabac_base_CLK;
    assign cabac_top_dc_fifo_wclk = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    // coeff_top_btm_adapter_0 assignments:
    assign coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_ADDR[10:0] = coeff_top_btm_adapter_0_btm_coeff_adr;
    assign coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_BYTEEN = coeff_top_btm_adapter_0_btm_coeff_byte_enable;
    assign coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_WDATA = coeff_top_btm_adapter_0_btm_coeff_d;
    assign coeff_top_btm_adapter_0_coeff_btm_to_CabacMemories_BTM_coeff_a_WREN = coeff_top_btm_adapter_0_btm_coeff_we;
    assign coeff_top_btm_adapter_0_coeff_adr = IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_ADDR;
    assign coeff_top_btm_adapter_0_coeff_byte_enable = IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_BYTEEN;
    assign coeff_top_btm_adapter_0_coeff_d = IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_WDATA;
    assign coeff_top_btm_adapter_0_coeff_we = IntraSearchCore_lcu_coeff_rsc_to_coeff_top_btm_adapter_0_coeff_WREN;
    assign coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_ADDR[10:0] = coeff_top_btm_adapter_0_top_coeff_adr;
    assign coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_BYTEEN = coeff_top_btm_adapter_0_top_coeff_byte_enable;
    assign coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_WDATA = coeff_top_btm_adapter_0_top_coeff_d;
    assign coeff_top_btm_adapter_0_coeff_top_to_CabacMemories_TOP_coeff_a_WREN = coeff_top_btm_adapter_0_top_coeff_we;
    // cu_info_we_adapter_btm assignments:
    assign cu_info_we_adapter_btm_in_adr = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_ADDR;
    assign cu_info_we_adapter_btm_in_byte_enable = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_BYTEEN;
    assign cu_info_we_adapter_btm_in_d = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WDATA;
    assign IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_RDATA = cu_info_we_adapter_btm_in_q;
    assign cu_info_we_adapter_btm_in_we = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WREN;
    assign cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_ADDR = cu_info_we_adapter_btm_out_adr;
    assign cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_BYTEEN = cu_info_we_adapter_btm_out_byte_enable;
    assign cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WDATA = cu_info_we_adapter_btm_out_d;
    assign cu_info_we_adapter_btm_out_q = cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_RDATA;
    assign cu_info_we_adapter_btm_out_to_CabacMemories_BTM_cu_info1_a_WREN = cu_info_we_adapter_btm_out_we;
    // cu_info_we_adapter_top assignments:
    assign cu_info_we_adapter_top_in_adr = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_ADDR;
    assign cu_info_we_adapter_top_in_byte_enable = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_BYTEEN;
    assign cu_info_we_adapter_top_in_d = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WDATA;
    assign IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_RDATA = cu_info_we_adapter_top_in_q;
    assign cu_info_we_adapter_top_in_we = IntraMemories_cu_info_to_cabac_to_cu_info_we_adapter_top_in_WREN;
    assign cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_ADDR = cu_info_we_adapter_top_out_adr;
    assign cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_BYTEEN = cu_info_we_adapter_top_out_byte_enable;
    assign cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WDATA = cu_info_we_adapter_top_out_d;
    assign cu_info_we_adapter_top_out_q = cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_RDATA;
    assign cu_info_we_adapter_top_out_to_CabacMemories_TOP_cu_info1_a_WREN = cu_info_we_adapter_top_out_we;
    // indexer_0 assignments:
    assign indexer_0_arst_n = IntraMemories_arst_n_to_bus_arst_n;
    assign CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_ADDR = indexer_0_bitstream_last_data_rsc_adr;
    assign CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_WDATA = indexer_0_bitstream_last_data_rsc_d;
    assign indexer_0_bitstream_last_data_rsc_q = CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_RDATA;
    assign CabacMemories_BTM_bitstream_a_to_indexer_0_bitstream_btm_WREN = indexer_0_bitstream_last_data_rsc_we;
    assign CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_ADDR = indexer_0_bitstream_last_data_top_rsc_adr;
    assign CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_WDATA = indexer_0_bitstream_last_data_top_rsc_d;
    assign indexer_0_bitstream_last_data_top_rsc_q = CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_RDATA;
    assign CabacMemories_TOP_bitstream_a_to_indexer_0_bitstream_top_WREN = indexer_0_bitstream_last_data_top_rsc_we;
    assign indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_ADDR = indexer_0_cabac_metas2_rsc_adr;
    assign indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_WDATA = indexer_0_cabac_metas2_rsc_d;
    assign indexer_0_cabac_metas2_rsc_q = indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_RDATA;
    assign indexer_0_cabac_metas_push_btm_to_CabacMemories_BTM_cabac_metas_push_a_WREN = indexer_0_cabac_metas2_rsc_we;
    assign indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_ADDR = indexer_0_cabac_metas2_top_rsc_adr;
    assign indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_WDATA = indexer_0_cabac_metas2_top_rsc_d;
    assign indexer_0_cabac_metas2_top_rsc_q = indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_RDATA;
    assign indexer_0_cabac_metas_push_top_to_CabacMemories_TOP_cabac_metas_push_a_WREN = indexer_0_cabac_metas2_top_rsc_we;
    assign indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_ADDR = indexer_0_cabac_states_rsc_adr;
    assign indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_WDATA = indexer_0_cabac_states_rsc_d;
    assign indexer_0_cabac_states_rsc_q = indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_RDATA;
    assign indexer_0_cabac_states_btm_to_CabacMemories_BTM_cabac_states_a_WREN = indexer_0_cabac_states_rsc_we;
    assign indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_ADDR = indexer_0_cabac_states_top_rsc_adr;
    assign indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_WDATA = indexer_0_cabac_states_top_rsc_d;
    assign indexer_0_cabac_states_top_rsc_q = indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_RDATA;
    assign indexer_0_cabac_states_top_to_CabacMemories_TOP_cabac_states_a_WREN = indexer_0_cabac_states_top_rsc_we;
    assign indexer_0_clk = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;
    assign IntraMemories_cu_info_a_to_indexer_0_cu_info_ADDR = indexer_0_cu_info_rsc_adr;
    assign IntraMemories_cu_info_a_to_indexer_0_cu_info_WDATA = indexer_0_cu_info_rsc_d;
    assign indexer_0_cu_info_rsc_q = IntraMemories_cu_info_a_to_indexer_0_cu_info_RDATA;
    assign IntraMemories_cu_info_a_to_indexer_0_cu_info_WREN = indexer_0_cu_info_rsc_we;
    assign indexer_0_data_in_rsc_dat = indexer_0_data_in_to_intra_data_in_DAT;
    assign indexer_0_data_in_to_intra_data_in_RDY = indexer_0_data_in_rsc_rdy;
    assign indexer_0_data_in_rsc_vld = indexer_0_data_in_to_intra_data_in_VLD;
    assign indexer_0_data_out_to_intra_data_out_DAT = indexer_0_data_out_rsc_dat;
    assign indexer_0_data_out_rsc_rdy = indexer_0_data_out_to_intra_data_out_RDY;
    assign indexer_0_data_out_to_intra_data_out_VLD = indexer_0_data_out_rsc_vld;
    assign indexer_0_data_req_rsc_dat_1 = indexer_0_data_req_to_intra_data_req_DAT;
    assign indexer_0_data_req_to_intra_data_req_RDY = indexer_0_data_req_rsc_rdy_1;
    assign indexer_0_data_req_rsc_vld_1 = indexer_0_data_req_to_intra_data_req_VLD;
    assign IntraMemories_ref_a_to_indexer_0_ref_ADDR = indexer_0_out_adr;
    assign indexer_0_top_border_to_IntraMemories_top_border_a_ADDR = indexer_0_out_adr_1;
    assign indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_ADDR = indexer_0_out_adr_10;
    assign CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_ADDR = indexer_0_out_adr_11;
    assign CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_ADDR = indexer_0_out_adr_12;
    assign indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_ADDR = indexer_0_out_adr_13;
    assign indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_ADDR = indexer_0_out_adr_14;
    assign CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_ADDR = indexer_0_out_adr_15;
    assign CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_ADDR = indexer_0_out_adr_16;
    assign IntraMemories_left_border_a_to_indexer_0_left_border_ADDR = indexer_0_out_adr_2;
    assign IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_ADDR = indexer_0_out_adr_3;
    assign indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_ADDR = indexer_0_out_adr_4;
    assign indexer_0_cabac_to_IntraMemories_cabac_a_ADDR = indexer_0_out_adr_5;
    assign CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_ADDR = indexer_0_out_adr_6;
    assign CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_ADDR = indexer_0_out_adr_7;
    assign indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_ADDR = indexer_0_out_adr_8;
    assign indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_ADDR = indexer_0_out_adr_9;
    assign IntraMemories_ref_a_to_indexer_0_ref_BYTEEN = indexer_0_out_byte_enable;
    assign indexer_0_top_border_to_IntraMemories_top_border_a_BYTEEN = indexer_0_out_byte_enable_1;
    assign indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_BYTEEN = indexer_0_out_byte_enable_10;
    assign CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_BYTEEN = indexer_0_out_byte_enable_11;
    assign CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_BYTEEN = indexer_0_out_byte_enable_12;
    assign indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_BYTEEN = indexer_0_out_byte_enable_13;
    assign indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_BYTEEN = indexer_0_out_byte_enable_14;
    assign CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_BYTEEN = indexer_0_out_byte_enable_15;
    assign CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_BYTEEN = indexer_0_out_byte_enable_16;
    assign IntraMemories_left_border_a_to_indexer_0_left_border_BYTEEN = indexer_0_out_byte_enable_2;
    assign IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_BYTEEN = indexer_0_out_byte_enable_3;
    assign indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_BYTEEN = indexer_0_out_byte_enable_4;
    assign indexer_0_cabac_to_IntraMemories_cabac_a_BYTEEN = indexer_0_out_byte_enable_5;
    assign CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_BYTEEN = indexer_0_out_byte_enable_6;
    assign CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_BYTEEN = indexer_0_out_byte_enable_7;
    assign indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_BYTEEN = indexer_0_out_byte_enable_8;
    assign indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_BYTEEN = indexer_0_out_byte_enable_9;
    assign IntraMemories_ref_a_to_indexer_0_ref_WDATA = indexer_0_out_d;
    assign indexer_0_top_border_to_IntraMemories_top_border_a_WDATA = indexer_0_out_d_1;
    assign indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_WDATA = indexer_0_out_d_10;
    assign CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_WDATA = indexer_0_out_d_11;
    assign CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_WDATA = indexer_0_out_d_12;
    assign indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_WDATA = indexer_0_out_d_13;
    assign indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_WDATA = indexer_0_out_d_14;
    assign CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_WDATA = indexer_0_out_d_15;
    assign CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_WDATA = indexer_0_out_d_16;
    assign IntraMemories_left_border_a_to_indexer_0_left_border_WDATA = indexer_0_out_d_2;
    assign IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_WDATA = indexer_0_out_d_3;
    assign indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_WDATA = indexer_0_out_d_4;
    assign indexer_0_cabac_to_IntraMemories_cabac_a_WDATA = indexer_0_out_d_5;
    assign CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_WDATA = indexer_0_out_d_6;
    assign CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_WDATA = indexer_0_out_d_7;
    assign indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_WDATA = indexer_0_out_d_8;
    assign indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_WDATA = indexer_0_out_d_9;
    assign IntraMemories_ref_a_to_indexer_0_ref_WREN = indexer_0_out_we;
    assign indexer_0_top_border_to_IntraMemories_top_border_a_WREN = indexer_0_out_we_1;
    assign indexer_0_cu_info1_hor_top_to_CabacMemories_TOP_cu_info1_top_a_WREN = indexer_0_out_we_10;
    assign CabacMemories_BTM_cu_info1_left_a_to_indexer_0_cu_info1_ver_btm_WREN = indexer_0_out_we_11;
    assign CabacMemories_TOP_cu_info1_left_a_to_indexer_0_cu_info1_ver_top_WREN = indexer_0_out_we_12;
    assign indexer_0_cu_info2_hor_btm_to_CabacMemories_BTM_cu_info2_top_a_WREN = indexer_0_out_we_13;
    assign indexer_0_cu_info2_hor_top_to_CabacMemories_TOP_cu_info2_top_a_WREN = indexer_0_out_we_14;
    assign CabacMemories_BTM_cu_info2_left_a_to_indexer_0_cu_info2_ver_btm_WREN = indexer_0_out_we_15;
    assign CabacMemories_TOP_cu_info2_left_a_to_indexer_0_cu_info2_ver_top_WREN = indexer_0_out_we_16;
    assign IntraMemories_left_border_a_to_indexer_0_left_border_WREN = indexer_0_out_we_2;
    assign IntraMemories_cu_info_hor_a_to_indexer_0_cu_info_hor_WREN = indexer_0_out_we_3;
    assign indexer_0_cu_info_ver_to_IntraMemories_cu_info_ver_a_WREN = indexer_0_out_we_4;
    assign indexer_0_cabac_to_IntraMemories_cabac_a_WREN = indexer_0_out_we_5;
    assign CabacMemories_BTM_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_btm_WREN = indexer_0_out_we_6;
    assign CabacMemories_TOP_cabac_metas_pull_a_to_indexer_0_cabac_metas_pull_top_WREN = indexer_0_out_we_7;
    assign indexer_0_cu_info_hor_str_to_IntraMemories_cu_info_hor_str_a_WREN = indexer_0_out_we_8;
    assign indexer_0_cu_info1_hor_btm_to_CabacMemories_BTM_cu_info1_top_a_WREN = indexer_0_out_we_9;
    assign IntraMemories_rec_a_to_indexer_0_rec_ADDR = indexer_0_rec_rsc_adr;
    assign IntraMemories_rec_a_to_indexer_0_rec_WDATA = indexer_0_rec_rsc_d;
    assign indexer_0_rec_rsc_q = IntraMemories_rec_a_to_indexer_0_rec_RDATA;
    assign IntraMemories_rec_a_to_indexer_0_rec_WREN = indexer_0_rec_rsc_we;
    // intra_conf_dc_fifo assignments:
    assign intra_conf_dc_fifo_aclr_n = IntraMemories_arst_n_to_bus_arst_n;
    assign intra_conf_dc_fifo_d = intra_conf_dc_fifo_data_in_to_intra_config_in_DAT;
    assign intra_conf_dc_fifo_data_in_to_intra_config_in_RDY = intra_conf_dc_fifo_d_rdy;
    assign intra_conf_dc_fifo_d_vld = intra_conf_dc_fifo_data_in_to_intra_config_in_VLD;
    assign intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_DAT = intra_conf_dc_fifo_q;
    assign intra_conf_dc_fifo_q_rdy = intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_RDY;
    assign intra_conf_dc_fifo_data_out_to_IntraSearchCore_conf_in_rsc_VLD = intra_conf_dc_fifo_q_vld;
    assign intra_conf_dc_fifo_rclk = Cabac_config_flush_clk_to_clk_intra_base_CLK;
    assign intra_conf_dc_fifo_wclk = intra_conf_dc_fifo_in_clk_to_clk_mem_CLK;

    // IP-XACT VLNV: tuni.fi:Kvazaar:CTU_done_cycle_extender:1.0
    CTU_done_cycle_extender     CTU_done_cycle_extender_btm(
        // Interface: arst_n
        .arst_n              (CTU_done_cycle_extender_btm_arst_n),
        // Interface: clk
        .clk                 (CTU_done_cycle_extender_btm_clk),
        // Interface: ctu_done_extended_out
        .ctu_done_extended   (CTU_done_cycle_extender_btm_ctu_done_extended),
        // Interface: ctu_done_in
        .ctu_done            (CTU_done_cycle_extender_btm_ctu_done),
        .ctu_done_vld        (CTU_done_cycle_extender_btm_ctu_done_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:CTU_done_cycle_extender:1.0
    CTU_done_cycle_extender     CTU_done_cycle_extender_top(
        // Interface: arst_n
        .arst_n              (CTU_done_cycle_extender_top_arst_n),
        // Interface: clk
        .clk                 (CTU_done_cycle_extender_top_clk),
        // Interface: ctu_done_extended_out
        .ctu_done_extended   (CTU_done_cycle_extender_top_ctu_done_extended),
        // Interface: ctu_done_in
        .ctu_done            (CTU_done_cycle_extender_top_ctu_done),
        .ctu_done_vld        (CTU_done_cycle_extender_top_ctu_done_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:CabacCore:1.0
    CabacCore_1 CabacCore_BTM(
        // Interface: arst_n
        .arst_n              (CabacCore_BTM_arst_n),
        // Interface: bitstream_last_data_rsc
        .bitstream_last_data_rsc_q_1(CabacCore_BTM_bitstream_last_data_rsc_q_1),
        .bitstream_last_data_rsc_adr_1(CabacCore_BTM_bitstream_last_data_rsc_adr_1),
        .bitstream_last_data_rsc_d_1(CabacCore_BTM_bitstream_last_data_rsc_d_1),
        .bitstream_last_data_rsc_we_1(CabacCore_BTM_bitstream_last_data_rsc_we_1),
        // Interface: cabac_metas_pull
        .cabac_metas_rsc_q   (CabacCore_BTM_cabac_metas_rsc_q),
        .cabac_metas_rsc_adr (CabacCore_BTM_cabac_metas_rsc_adr),
        .cabac_metas_rsc_d   (CabacCore_BTM_cabac_metas_rsc_d),
        .cabac_metas_rsc_we  (CabacCore_BTM_cabac_metas_rsc_we),
        // Interface: cabac_metas_push
        .cabac_metas_rsc_q_1 (CabacCore_BTM_cabac_metas_rsc_q_1),
        .cabac_metas_rsc_adr_1(CabacCore_BTM_cabac_metas_rsc_adr_1),
        .cabac_metas_rsc_d_1 (CabacCore_BTM_cabac_metas_rsc_d_1),
        .cabac_metas_rsc_we_1(CabacCore_BTM_cabac_metas_rsc_we_1),
        // Interface: cabac_states_rsc
        .cabac_states_rsc_q  (CabacCore_BTM_cabac_states_rsc_q),
        .cabac_states_rsc_adr(CabacCore_BTM_cabac_states_rsc_adr),
        .cabac_states_rsc_d  (CabacCore_BTM_cabac_states_rsc_d),
        .cabac_states_rsc_we (CabacCore_BTM_cabac_states_rsc_we),
        // Interface: clk_base
        .clk_base            (CabacCore_BTM_clk_base),
        // Interface: clk_bin_coding
        .clk_bin_coding      (CabacCore_BTM_clk_bin_coding),
        // Interface: clk_binarization
        .clk_binarization    (CabacCore_BTM_clk_binarization),
        // Interface: coeff_rsc
        .coeff_rsc_q_1       (CabacCore_BTM_coeff_rsc_q_1),
        .coeff_rsc_adr_1     (CabacCore_BTM_coeff_rsc_adr_1),
        .coeff_rsc_d_1       (CabacCore_BTM_coeff_rsc_d_1),
        .coeff_rsc_we_1      (CabacCore_BTM_coeff_rsc_we_1),
        // Interface: config_in_rsc
        .config_in_rsc_dat   (CabacCore_BTM_config_in_rsc_dat),
        .config_in_rsc_vld   (CabacCore_BTM_config_in_rsc_vld),
        .config_in_rsc_rdy   (CabacCore_BTM_config_in_rsc_rdy),
        // Interface: ctu_done_rsc
        .ctu_done_rsc_rdy    (CabacCore_BTM_ctu_done_rsc_rdy),
        .ctu_done_rsc_dat    (CabacCore_BTM_ctu_done_rsc_dat),
        .ctu_done_rsc_vld    (CabacCore_BTM_ctu_done_rsc_vld),
        // Interface: lcu_left_rsc
        .lcu_left_rsc_q      (CabacCore_BTM_lcu_left_rsc_q),
        .lcu_left_rsc_adr    (CabacCore_BTM_lcu_left_rsc_adr),
        .lcu_left_rsc_d      (CabacCore_BTM_lcu_left_rsc_d),
        .lcu_left_rsc_we     (CabacCore_BTM_lcu_left_rsc_we),
        // Interface: lcu_left_rsc_1
        .lcu_left_rsc_q_1    (CabacCore_BTM_lcu_left_rsc_q_1),
        .lcu_left_rsc_adr_1  (CabacCore_BTM_lcu_left_rsc_adr_1),
        .lcu_left_rsc_d_1    (CabacCore_BTM_lcu_left_rsc_d_1),
        .lcu_left_rsc_we_1   (CabacCore_BTM_lcu_left_rsc_we_1),
        // Interface: lcu_rsc
        .lcu_rsc_q           (CabacCore_BTM_lcu_rsc_q),
        .lcu_rsc_adr         (CabacCore_BTM_lcu_rsc_adr),
        .lcu_rsc_d           (CabacCore_BTM_lcu_rsc_d),
        .lcu_rsc_we          (CabacCore_BTM_lcu_rsc_we),
        // Interface: lcu_rsc_1
        .lcu_rsc_q_1         (CabacCore_BTM_lcu_rsc_q_1),
        .lcu_rsc_adr_1       (CabacCore_BTM_lcu_rsc_adr_1),
        .lcu_rsc_d_1         (CabacCore_BTM_lcu_rsc_d_1),
        .lcu_rsc_we_1        (CabacCore_BTM_lcu_rsc_we_1),
        // Interface: lcu_top_rsc
        .lcu_top_rsc_q       (CabacCore_BTM_lcu_top_rsc_q),
        .lcu_top_rsc_adr     (CabacCore_BTM_lcu_top_rsc_adr),
        .lcu_top_rsc_d       (CabacCore_BTM_lcu_top_rsc_d),
        .lcu_top_rsc_we      (CabacCore_BTM_lcu_top_rsc_we),
        // Interface: lcu_top_rsc_1
        .lcu_top_rsc_q_1     (CabacCore_BTM_lcu_top_rsc_q_1),
        .lcu_top_rsc_adr_1   (CabacCore_BTM_lcu_top_rsc_adr_1),
        .lcu_top_rsc_d_1     (CabacCore_BTM_lcu_top_rsc_d_1),
        .lcu_top_rsc_we_1    (CabacCore_BTM_lcu_top_rsc_we_1));

    // IP-XACT VLNV: tuni.fi:Kvazaar:CabacCore:1.0
    CabacCore_0 CabacCore_TOP(
        // Interface: arst_n
        .arst_n              (CabacCore_TOP_arst_n),
        // Interface: bitstream_last_data_rsc
        .bitstream_last_data_rsc_q_1(CabacCore_TOP_bitstream_last_data_rsc_q_1),
        .bitstream_last_data_rsc_adr_1(CabacCore_TOP_bitstream_last_data_rsc_adr_1),
        .bitstream_last_data_rsc_d_1(CabacCore_TOP_bitstream_last_data_rsc_d_1),
        .bitstream_last_data_rsc_we_1(CabacCore_TOP_bitstream_last_data_rsc_we_1),
        // Interface: cabac_metas_pull
        .cabac_metas_rsc_q   (CabacCore_TOP_cabac_metas_rsc_q),
        .cabac_metas_rsc_adr (CabacCore_TOP_cabac_metas_rsc_adr),
        .cabac_metas_rsc_d   (CabacCore_TOP_cabac_metas_rsc_d),
        .cabac_metas_rsc_we  (CabacCore_TOP_cabac_metas_rsc_we),
        // Interface: cabac_metas_push
        .cabac_metas_rsc_q_1 (CabacCore_TOP_cabac_metas_rsc_q_1),
        .cabac_metas_rsc_adr_1(CabacCore_TOP_cabac_metas_rsc_adr_1),
        .cabac_metas_rsc_d_1 (CabacCore_TOP_cabac_metas_rsc_d_1),
        .cabac_metas_rsc_we_1(CabacCore_TOP_cabac_metas_rsc_we_1),
        // Interface: cabac_states_rsc
        .cabac_states_rsc_q  (CabacCore_TOP_cabac_states_rsc_q),
        .cabac_states_rsc_adr(CabacCore_TOP_cabac_states_rsc_adr),
        .cabac_states_rsc_d  (CabacCore_TOP_cabac_states_rsc_d),
        .cabac_states_rsc_we (CabacCore_TOP_cabac_states_rsc_we),
        // Interface: clk_base
        .clk_base            (CabacCore_TOP_clk_base),
        // Interface: clk_bin_coding
        .clk_bin_coding      (CabacCore_TOP_clk_bin_coding),
        // Interface: clk_binarization
        .clk_binarization    (CabacCore_TOP_clk_binarization),
        // Interface: coeff_rsc
        .coeff_rsc_q_1       (CabacCore_TOP_coeff_rsc_q_1),
        .coeff_rsc_adr_1     (CabacCore_TOP_coeff_rsc_adr_1),
        .coeff_rsc_d_1       (CabacCore_TOP_coeff_rsc_d_1),
        .coeff_rsc_we_1      (CabacCore_TOP_coeff_rsc_we_1),
        // Interface: config_in_rsc
        .config_in_rsc_dat   (CabacCore_TOP_config_in_rsc_dat),
        .config_in_rsc_vld   (CabacCore_TOP_config_in_rsc_vld),
        .config_in_rsc_rdy   (CabacCore_TOP_config_in_rsc_rdy),
        // Interface: ctu_done_rsc
        .ctu_done_rsc_rdy    (CabacCore_TOP_ctu_done_rsc_rdy),
        .ctu_done_rsc_dat    (CabacCore_TOP_ctu_done_rsc_dat),
        .ctu_done_rsc_vld    (CabacCore_TOP_ctu_done_rsc_vld),
        // Interface: lcu_left_rsc
        .lcu_left_rsc_q      (CabacCore_TOP_lcu_left_rsc_q),
        .lcu_left_rsc_adr    (CabacCore_TOP_lcu_left_rsc_adr),
        .lcu_left_rsc_d      (CabacCore_TOP_lcu_left_rsc_d),
        .lcu_left_rsc_we     (CabacCore_TOP_lcu_left_rsc_we),
        // Interface: lcu_left_rsc_1
        .lcu_left_rsc_q_1    (CabacCore_TOP_lcu_left_rsc_q_1),
        .lcu_left_rsc_adr_1  (CabacCore_TOP_lcu_left_rsc_adr_1),
        .lcu_left_rsc_d_1    (CabacCore_TOP_lcu_left_rsc_d_1),
        .lcu_left_rsc_we_1   (CabacCore_TOP_lcu_left_rsc_we_1),
        // Interface: lcu_rsc
        .lcu_rsc_q           (CabacCore_TOP_lcu_rsc_q),
        .lcu_rsc_adr         (CabacCore_TOP_lcu_rsc_adr),
        .lcu_rsc_d           (CabacCore_TOP_lcu_rsc_d),
        .lcu_rsc_we          (CabacCore_TOP_lcu_rsc_we),
        // Interface: lcu_rsc_1
        .lcu_rsc_q_1         (CabacCore_TOP_lcu_rsc_q_1),
        .lcu_rsc_adr_1       (CabacCore_TOP_lcu_rsc_adr_1),
        .lcu_rsc_d_1         (CabacCore_TOP_lcu_rsc_d_1),
        .lcu_rsc_we_1        (CabacCore_TOP_lcu_rsc_we_1),
        // Interface: lcu_top_rsc
        .lcu_top_rsc_q       (CabacCore_TOP_lcu_top_rsc_q),
        .lcu_top_rsc_adr     (CabacCore_TOP_lcu_top_rsc_adr),
        .lcu_top_rsc_d       (CabacCore_TOP_lcu_top_rsc_d),
        .lcu_top_rsc_we      (CabacCore_TOP_lcu_top_rsc_we),
        // Interface: lcu_top_rsc_1
        .lcu_top_rsc_q_1     (CabacCore_TOP_lcu_top_rsc_q_1),
        .lcu_top_rsc_adr_1   (CabacCore_TOP_lcu_top_rsc_adr_1),
        .lcu_top_rsc_d_1     (CabacCore_TOP_lcu_top_rsc_d_1),
        .lcu_top_rsc_we_1    (CabacCore_TOP_lcu_top_rsc_we_1));

    // IP-XACT VLNV: tuni.fi:Kvazaar:CabacMemories:1.0
    CabacMemories_1 #(
        .bitstream_addr      (10),
        .cabac_addr          (7),
        .cabac_metas_pull_addr(3),
        .cabac_metas_push_addr(4),
        .coeff_addr          (11),
        .coeff_width         (512),
        .cu_info_addr        (9),
        .cu_info_border_addr (3),
        .mem_width           (128))
    CabacMemories_BTM(
        // Interface: arst_n
        .rst_n               (CabacMemories_BTM_rst_n),
        // Interface: bitstream_a
        .address_a_7         (CabacMemories_BTM_address_a_7),
        .byteena_a_7         (16'hffff),
        .data_a_7            (CabacMemories_BTM_data_a_7),
        .wren_a_7            (CabacMemories_BTM_wren_a_7),
        .q_a_7               (CabacMemories_BTM_q_a_7),
        // Interface: bitstream_b
        .ram_a_address_7     (CabacMemories_BTM_ram_a_address_7),
        .ram_a_write_7       (CabacMemories_BTM_ram_a_write_7),
        .ram_a_writedata_7   (CabacMemories_BTM_ram_a_writedata_7),
        .ram_a_readdata_7    (CabacMemories_BTM_ram_a_readdata_7),
        // Interface: cabac_metas_pull_a
        .address_a_9         (CabacMemories_BTM_address_a_9),
        .byteena_a_9         (CabacMemories_BTM_byteena_a_9),
        .data_a_9            (CabacMemories_BTM_data_a_9),
        .wren_a_9            (CabacMemories_BTM_wren_a_9),
        .q_a_9               (),
        // Interface: cabac_metas_pull_b
        .address_b           (CabacMemories_BTM_address_b),
        .data_b              (CabacMemories_BTM_data_b),
        .wren_b              (CabacMemories_BTM_wren_b),
        .q_b                 (CabacMemories_BTM_q_b),
        // Interface: cabac_metas_push_a
        .address_a_10        (CabacMemories_BTM_address_a_10),
        .byteena_a_10        (16'hffff),
        .data_a_10           (CabacMemories_BTM_data_a_10),
        .wren_a_10           (CabacMemories_BTM_wren_a_10),
        .q_a_10              (CabacMemories_BTM_q_a_10),
        // Interface: cabac_metas_push_b
        .address_b_1         (CabacMemories_BTM_address_b_1),
        .data_b_1            (CabacMemories_BTM_data_b_1),
        .wren_b_1            (CabacMemories_BTM_wren_b_1),
        .q_b_1               (CabacMemories_BTM_q_b_1),
        // Interface: cabac_states_a
        .address_a_6         (CabacMemories_BTM_address_a_6),
        .byteena_a_6         (16'hffff),
        .data_a_6            (CabacMemories_BTM_data_a_6),
        .wren_a_6            (CabacMemories_BTM_wren_a_6),
        .q_a_6               (CabacMemories_BTM_q_a_6),
        // Interface: cabac_states_b
        .ram_a_address_6     (CabacMemories_BTM_ram_a_address_6),
        .ram_a_write_6       (CabacMemories_BTM_ram_a_write_6),
        .ram_a_writedata_6   (CabacMemories_BTM_ram_a_writedata_6),
        .ram_a_readdata_6    (CabacMemories_BTM_ram_a_readdata_6),
        // Interface: clk_base
        .clk                 (CabacMemories_BTM_clk),
        // Interface: clk_bin_coding
        .clock_a             (CabacMemories_BTM_clock_a),
        // Interface: clk_binarization
        .clock_a_1           (CabacMemories_BTM_clock_a_1),
        // Interface: clk_intra_base
        .clk_intra_base      (CabacMemories_BTM_clk_intra_base),
        // Interface: clk_mem
        .clock_a_2           (CabacMemories_BTM_clock_a_2),
        // Interface: coeff_a
        .address_a_8         (CabacMemories_BTM_address_a_8),
        .byteena_a_8         (CabacMemories_BTM_byteena_a_8),
        .data_a_8            (CabacMemories_BTM_data_a_8),
        .wren_a_8            (CabacMemories_BTM_wren_a_8),
        .q_a_8               (),
        // Interface: coeff_b
        .ram_a_address_8     (CabacMemories_BTM_ram_a_address_8),
        .ram_a_write_8       (CabacMemories_BTM_ram_a_write_8),
        .ram_a_writedata_8   (CabacMemories_BTM_ram_a_writedata_8),
        .ram_a_readdata_8    (CabacMemories_BTM_ram_a_readdata_8),
        // Interface: cu_info1_a
        .address_a           (CabacMemories_BTM_address_a),
        .byteena_a           (CabacMemories_BTM_byteena_a),
        .data_a              (CabacMemories_BTM_data_a),
        .wren_a              (CabacMemories_BTM_wren_a),
        .q_a                 (CabacMemories_BTM_q_a),
        // Interface: cu_info1_b
        .ram_a_address       (CabacMemories_BTM_ram_a_address),
        .ram_a_write         (CabacMemories_BTM_ram_a_write),
        .ram_a_writedata     (CabacMemories_BTM_ram_a_writedata),
        .ram_a_readdata      (CabacMemories_BTM_ram_a_readdata),
        // Interface: cu_info1_left_a
        .address_a_2         (CabacMemories_BTM_address_a_2),
        .byteena_a_2         (CabacMemories_BTM_byteena_a_2),
        .data_a_2            (CabacMemories_BTM_data_a_2),
        .wren_a_2            (CabacMemories_BTM_wren_a_2),
        .q_a_2               (),
        // Interface: cu_info1_left_b
        .ram_a_address_2     (CabacMemories_BTM_ram_a_address_2),
        .ram_a_write_2       (CabacMemories_BTM_ram_a_write_2),
        .ram_a_writedata_2   (CabacMemories_BTM_ram_a_writedata_2),
        .ram_a_readdata_2    (CabacMemories_BTM_ram_a_readdata_2),
        // Interface: cu_info1_top_a
        .address_a_1         (CabacMemories_BTM_address_a_1),
        .byteena_a_1         (CabacMemories_BTM_byteena_a_1),
        .data_a_1            (CabacMemories_BTM_data_a_1),
        .wren_a_1            (CabacMemories_BTM_wren_a_1),
        .q_a_1               (),
        // Interface: cu_info1_top_b
        .ram_a_address_1     (CabacMemories_BTM_ram_a_address_1),
        .ram_a_write_1       (CabacMemories_BTM_ram_a_write_1),
        .ram_a_writedata_1   (CabacMemories_BTM_ram_a_writedata_1),
        .ram_a_readdata_1    (CabacMemories_BTM_ram_a_readdata_1),
        // Interface: cu_info2_a
        .address_a_3         (CabacMemories_BTM_address_a_3),
        .byteena_a_3         (CabacMemories_BTM_byteena_a_3),
        .data_a_3            (CabacMemories_BTM_data_a_3),
        .wren_a_3            (CabacMemories_BTM_wren_a_3),
        .q_a_3               (CabacMemories_BTM_q_a_3),
        // Interface: cu_info2_b
        .ram_a_address_3     (CabacMemories_BTM_ram_a_address_3),
        .ram_a_write_3       (CabacMemories_BTM_ram_a_write_3),
        .ram_a_writedata_3   (CabacMemories_BTM_ram_a_writedata_3),
        .ram_a_readdata_3    (CabacMemories_BTM_ram_a_readdata_3),
        // Interface: cu_info2_left_a
        .address_a_5         (CabacMemories_BTM_address_a_5),
        .byteena_a_5         (CabacMemories_BTM_byteena_a_5),
        .data_a_5            (CabacMemories_BTM_data_a_5),
        .wren_a_5            (CabacMemories_BTM_wren_a_5),
        .q_a_5               (),
        // Interface: cu_info2_left_b
        .ram_a_address_5     (CabacMemories_BTM_ram_a_address_5),
        .ram_a_write_5       (CabacMemories_BTM_ram_a_write_5),
        .ram_a_writedata_5   (CabacMemories_BTM_ram_a_writedata_5),
        .ram_a_readdata_5    (CabacMemories_BTM_ram_a_readdata_5),
        // Interface: cu_info2_top_a
        .address_a_4         (CabacMemories_BTM_address_a_4),
        .byteena_a_4         (CabacMemories_BTM_byteena_a_4),
        .data_a_4            (CabacMemories_BTM_data_a_4),
        .wren_a_4            (CabacMemories_BTM_wren_a_4),
        .q_a_4               (),
        // Interface: cu_info2_top_b
        .ram_a_address_4     (CabacMemories_BTM_ram_a_address_4),
        .ram_a_write_4       (CabacMemories_BTM_ram_a_write_4),
        .ram_a_writedata_4   (CabacMemories_BTM_ram_a_writedata_4),
        .ram_a_readdata_4    (CabacMemories_BTM_ram_a_readdata_4));

    // IP-XACT VLNV: tuni.fi:Kvazaar:CabacMemories:1.0
    CabacMemories_0 #(
        .bitstream_addr      (10),
        .cabac_addr          (7),
        .cabac_metas_pull_addr(3),
        .cabac_metas_push_addr(4),
        .coeff_addr          (11),
        .coeff_width         (512),
        .cu_info_addr        (9),
        .cu_info_border_addr (3),
        .mem_width           (128))
    CabacMemories_TOP(
        // Interface: arst_n
        .rst_n               (CabacMemories_TOP_rst_n),
        // Interface: bitstream_a
        .address_a_7         (CabacMemories_TOP_address_a_7),
        .byteena_a_7         (16'hffff),
        .data_a_7            (CabacMemories_TOP_data_a_7),
        .wren_a_7            (CabacMemories_TOP_wren_a_7),
        .q_a_7               (CabacMemories_TOP_q_a_7),
        // Interface: bitstream_b
        .ram_a_address_7     (CabacMemories_TOP_ram_a_address_7),
        .ram_a_write_7       (CabacMemories_TOP_ram_a_write_7),
        .ram_a_writedata_7   (CabacMemories_TOP_ram_a_writedata_7),
        .ram_a_readdata_7    (CabacMemories_TOP_ram_a_readdata_7),
        // Interface: cabac_metas_pull_a
        .address_a_9         (CabacMemories_TOP_address_a_9),
        .byteena_a_9         (CabacMemories_TOP_byteena_a_9),
        .data_a_9            (CabacMemories_TOP_data_a_9),
        .wren_a_9            (CabacMemories_TOP_wren_a_9),
        .q_a_9               (),
        // Interface: cabac_metas_pull_b
        .address_b           (CabacMemories_TOP_address_b),
        .data_b              (CabacMemories_TOP_data_b),
        .wren_b              (CabacMemories_TOP_wren_b),
        .q_b                 (CabacMemories_TOP_q_b),
        // Interface: cabac_metas_push_a
        .address_a_10        (CabacMemories_TOP_address_a_10),
        .byteena_a_10        (16'hffff),
        .data_a_10           (CabacMemories_TOP_data_a_10),
        .wren_a_10           (CabacMemories_TOP_wren_a_10),
        .q_a_10              (CabacMemories_TOP_q_a_10),
        // Interface: cabac_metas_push_b
        .address_b_1         (CabacMemories_TOP_address_b_1),
        .data_b_1            (CabacMemories_TOP_data_b_1),
        .wren_b_1            (CabacMemories_TOP_wren_b_1),
        .q_b_1               (CabacMemories_TOP_q_b_1),
        // Interface: cabac_states_a
        .address_a_6         (CabacMemories_TOP_address_a_6),
        .byteena_a_6         (16'hffff),
        .data_a_6            (CabacMemories_TOP_data_a_6),
        .wren_a_6            (CabacMemories_TOP_wren_a_6),
        .q_a_6               (CabacMemories_TOP_q_a_6),
        // Interface: cabac_states_b
        .ram_a_address_6     (CabacMemories_TOP_ram_a_address_6),
        .ram_a_write_6       (CabacMemories_TOP_ram_a_write_6),
        .ram_a_writedata_6   (CabacMemories_TOP_ram_a_writedata_6),
        .ram_a_readdata_6    (CabacMemories_TOP_ram_a_readdata_6),
        // Interface: clk_base
        .clk                 (CabacMemories_TOP_clk),
        // Interface: clk_bin_coding
        .clock_a             (CabacMemories_TOP_clock_a),
        // Interface: clk_binarization
        .clock_a_1           (CabacMemories_TOP_clock_a_1),
        // Interface: clk_intra_base
        .clk_intra_base      (CabacMemories_TOP_clk_intra_base),
        // Interface: clk_mem
        .clock_a_2           (CabacMemories_TOP_clock_a_2),
        // Interface: coeff_a
        .address_a_8         (CabacMemories_TOP_address_a_8),
        .byteena_a_8         (CabacMemories_TOP_byteena_a_8),
        .data_a_8            (CabacMemories_TOP_data_a_8),
        .wren_a_8            (CabacMemories_TOP_wren_a_8),
        .q_a_8               (),
        // Interface: coeff_b
        .ram_a_address_8     (CabacMemories_TOP_ram_a_address_8),
        .ram_a_write_8       (CabacMemories_TOP_ram_a_write_8),
        .ram_a_writedata_8   (CabacMemories_TOP_ram_a_writedata_8),
        .ram_a_readdata_8    (CabacMemories_TOP_ram_a_readdata_8),
        // Interface: cu_info1_a
        .address_a           (CabacMemories_TOP_address_a),
        .byteena_a           (CabacMemories_TOP_byteena_a),
        .data_a              (CabacMemories_TOP_data_a),
        .wren_a              (CabacMemories_TOP_wren_a),
        .q_a                 (CabacMemories_TOP_q_a),
        // Interface: cu_info1_b
        .ram_a_address       (CabacMemories_TOP_ram_a_address),
        .ram_a_write         (CabacMemories_TOP_ram_a_write),
        .ram_a_writedata     (CabacMemories_TOP_ram_a_writedata),
        .ram_a_readdata      (CabacMemories_TOP_ram_a_readdata),
        // Interface: cu_info1_left_a
        .address_a_2         (CabacMemories_TOP_address_a_2),
        .byteena_a_2         (CabacMemories_TOP_byteena_a_2),
        .data_a_2            (CabacMemories_TOP_data_a_2),
        .wren_a_2            (CabacMemories_TOP_wren_a_2),
        .q_a_2               (),
        // Interface: cu_info1_left_b
        .ram_a_address_2     (CabacMemories_TOP_ram_a_address_2),
        .ram_a_write_2       (CabacMemories_TOP_ram_a_write_2),
        .ram_a_writedata_2   (CabacMemories_TOP_ram_a_writedata_2),
        .ram_a_readdata_2    (CabacMemories_TOP_ram_a_readdata_2),
        // Interface: cu_info1_top_a
        .address_a_1         (CabacMemories_TOP_address_a_1),
        .byteena_a_1         (CabacMemories_TOP_byteena_a_1),
        .data_a_1            (CabacMemories_TOP_data_a_1),
        .wren_a_1            (CabacMemories_TOP_wren_a_1),
        .q_a_1               (),
        // Interface: cu_info1_top_b
        .ram_a_address_1     (CabacMemories_TOP_ram_a_address_1),
        .ram_a_write_1       (CabacMemories_TOP_ram_a_write_1),
        .ram_a_writedata_1   (CabacMemories_TOP_ram_a_writedata_1),
        .ram_a_readdata_1    (CabacMemories_TOP_ram_a_readdata_1),
        // Interface: cu_info2_a
        .address_a_3         (CabacMemories_TOP_address_a_3),
        .byteena_a_3         (CabacMemories_TOP_byteena_a_3),
        .data_a_3            (CabacMemories_TOP_data_a_3),
        .wren_a_3            (CabacMemories_TOP_wren_a_3),
        .q_a_3               (CabacMemories_TOP_q_a_3),
        // Interface: cu_info2_b
        .ram_a_address_3     (CabacMemories_TOP_ram_a_address_3),
        .ram_a_write_3       (CabacMemories_TOP_ram_a_write_3),
        .ram_a_writedata_3   (CabacMemories_TOP_ram_a_writedata_3),
        .ram_a_readdata_3    (CabacMemories_TOP_ram_a_readdata_3),
        // Interface: cu_info2_left_a
        .address_a_5         (CabacMemories_TOP_address_a_5),
        .byteena_a_5         (CabacMemories_TOP_byteena_a_5),
        .data_a_5            (CabacMemories_TOP_data_a_5),
        .wren_a_5            (CabacMemories_TOP_wren_a_5),
        .q_a_5               (),
        // Interface: cu_info2_left_b
        .ram_a_address_5     (CabacMemories_TOP_ram_a_address_5),
        .ram_a_write_5       (CabacMemories_TOP_ram_a_write_5),
        .ram_a_writedata_5   (CabacMemories_TOP_ram_a_writedata_5),
        .ram_a_readdata_5    (CabacMemories_TOP_ram_a_readdata_5),
        // Interface: cu_info2_top_a
        .address_a_4         (CabacMemories_TOP_address_a_4),
        .byteena_a_4         (CabacMemories_TOP_byteena_a_4),
        .data_a_4            (CabacMemories_TOP_data_a_4),
        .wren_a_4            (CabacMemories_TOP_wren_a_4),
        .q_a_4               (),
        // Interface: cu_info2_top_b
        .ram_a_address_4     (CabacMemories_TOP_ram_a_address_4),
        .ram_a_write_4       (CabacMemories_TOP_ram_a_write_4),
        .ram_a_writedata_4   (CabacMemories_TOP_ram_a_writedata_4),
        .ram_a_readdata_4    (CabacMemories_TOP_ram_a_readdata_4));

    // IP-XACT VLNV: tuni.fi:Kvazaar:Cabac_config_flush:1.0
    Cabac_config_flush     Cabac_config_flush(
        // Interface: arst_n
        .arst_n              (Cabac_config_flush_arst_n),
        // Interface: clk
        .clk                 (Cabac_config_flush_clk),
        // Interface: ctu_btm_flush
        .ctu_btm_flush       (Cabac_config_flush_ctu_btm_flush),
        // Interface: ctu_btm_id
        .ctu_btm_id          (Cabac_config_flush_ctu_btm_id),
        // Interface: ctu_done_in
        .intra_ctu_done      (Cabac_config_flush_intra_ctu_done),
        // Interface: ctu_top_flush
        .ctu_top_flush       (Cabac_config_flush_ctu_top_flush),
        // Interface: ctu_top_id
        .ctu_top_id          (Cabac_config_flush_ctu_top_id));

    // IP-XACT VLNV: tuni.fi:Kvazaar:IntraMemories:1.0
    IntraMemories_0 #(
        .border_addr         (8),
        .cabac_addr          (4),
        .cu_info_addr        (10),
        .cu_info_border_addr (4),
        .mem_width           (128),
        .rec_addr            (13),
        .ref_addr            (13))
    IntraMemories(
        // Interface: arst_n
        .rst_n               (IntraMemories_rst_n),
        // Interface: cabac_a
        .address_a_7         (IntraMemories_address_a_7),
        .byteena_a_7         (IntraMemories_byteena_a_7),
        .data_a_7            (IntraMemories_data_a_7),
        .wren_a_7            (IntraMemories_wren_a_7),
        .q_a_7               (),
        // Interface: cabac_b
        .address_b           (IntraMemories_address_b),
        .data_b              (IntraMemories_data_b),
        .wren_b              (IntraMemories_wren_b),
        .q_b                 (IntraMemories_q_b),
        // Interface: clk_base
        .clk                 (IntraMemories_clk),
        // Interface: clk_mem
        .clock_a             (IntraMemories_clock_a),
        // Interface: cu_info_a
        .address_a_6         (IntraMemories_address_a_6),
        .byteena_a_6         (16'hffff),
        .data_a_6            (IntraMemories_data_a_6),
        .wren_a_6            (IntraMemories_wren_a_6),
        .q_a_6               (IntraMemories_q_a_6),
        // Interface: cu_info_b
        .ram_a_address_6     (IntraMemories_ram_a_address_6),
        .ram_a_write_6       (IntraMemories_ram_a_write_6),
        .ram_a_writedata_6   (IntraMemories_ram_a_writedata_6),
        .ram_a_readdata_6    (IntraMemories_ram_a_readdata_6),
        // Interface: cu_info_hor_a
        .address_a_4         (IntraMemories_address_a_4),
        .byteena_a_4         (IntraMemories_byteena_a_4),
        .data_a_4            (IntraMemories_data_a_4),
        .wren_a_4            (IntraMemories_wren_a_4),
        .q_a_4               (),
        // Interface: cu_info_hor_b
        .ram_a_address_4     (IntraMemories_ram_a_address_4),
        .ram_a_write_4       (IntraMemories_ram_a_write_4),
        .ram_a_writedata_4   (IntraMemories_ram_a_writedata_4),
        .ram_a_readdata_4    (IntraMemories_ram_a_readdata_4),
        // Interface: cu_info_hor_str_a
        .address_a_5         (IntraMemories_address_a_5),
        .byteena_a_5         (IntraMemories_byteena_a_5),
        .data_a_5            (IntraMemories_data_a_5),
        .wren_a_5            (IntraMemories_wren_a_5),
        .q_a_5               (),
        // Interface: cu_info_hor_str_b
        .ram_a_address_5     (IntraMemories_ram_a_address_5),
        .ram_a_write_5       (IntraMemories_ram_a_write_5),
        .ram_a_writedata_5   (IntraMemories_ram_a_writedata_5),
        .ram_a_readdata_5    (IntraMemories_ram_a_readdata_5),
        // Interface: cu_info_to_cabac
        .ram_b_address       (IntraMemories_ram_b_address),
        .ram_b_byteen        (IntraMemories_ram_b_byteen),
        .ram_b_write         (IntraMemories_ram_b_write),
        .ram_b_writedata     (IntraMemories_ram_b_writedata),
        // Interface: cu_info_ver_a
        .address_a_3         (IntraMemories_address_a_3),
        .byteena_a_3         (IntraMemories_byteena_a_3),
        .data_a_3            (IntraMemories_data_a_3),
        .wren_a_3            (IntraMemories_wren_a_3),
        .q_a_3               (),
        // Interface: cu_info_ver_b
        .ram_a_address_3     (IntraMemories_ram_a_address_3),
        .ram_a_write_3       (IntraMemories_ram_a_write_3),
        .ram_a_writedata_3   (IntraMemories_ram_a_writedata_3),
        .ram_a_readdata_3    (IntraMemories_ram_a_readdata_3),
        // Interface: left_border_a
        .address_a_2         (IntraMemories_address_a_2),
        .byteena_a_2         (IntraMemories_byteena_a_2),
        .data_a_2            (IntraMemories_data_a_2),
        .wren_a_2            (IntraMemories_wren_a_2),
        .q_a_2               (),
        // Interface: left_border_b
        .ram_a_address_2     (IntraMemories_ram_a_address_2),
        .ram_a_write_2       (IntraMemories_ram_a_write_2),
        .ram_a_writedata_2   (IntraMemories_ram_a_writedata_2),
        .ram_a_readdata_2    (IntraMemories_ram_a_readdata_2),
        // Interface: rec_a
        .address_a_8         (IntraMemories_address_a_8),
        .byteena_a_8         (16'hffff),
        .data_a_8            (IntraMemories_data_a_8),
        .wren_a_8            (IntraMemories_wren_a_8),
        .q_a_8               (IntraMemories_q_a_8),
        // Interface: rec_b
        .address_b_1         (IntraMemories_address_b_1),
        .byteena_b_1         (IntraMemories_byteena_b_1),
        .data_b_1            (IntraMemories_data_b_1),
        .wren_b_1            (IntraMemories_wren_b_1),
        .q_b_1               (IntraMemories_q_b_1),
        // Interface: ref_a
        .address_a           (IntraMemories_address_a),
        .byteena_a           (IntraMemories_byteena_a),
        .data_a              (IntraMemories_data_a),
        .wren_a              (IntraMemories_wren_a),
        .q_a                 (),
        // Interface: ref_b
        .ram_a_address       (IntraMemories_ram_a_address),
        .ram_a_write         (IntraMemories_ram_a_write),
        .ram_a_writedata     (IntraMemories_ram_a_writedata),
        .ram_a_readdata      (IntraMemories_ram_a_readdata),
        // Interface: top_border_a
        .address_a_1         (IntraMemories_address_a_1),
        .byteena_a_1         (IntraMemories_byteena_a_1),
        .data_a_1            (IntraMemories_data_a_1),
        .wren_a_1            (IntraMemories_wren_a_1),
        .q_a_1               (),
        // Interface: top_border_b
        .ram_a_address_1     (IntraMemories_ram_a_address_1),
        .ram_a_write_1       (IntraMemories_ram_a_write_1),
        .ram_a_writedata_1   (IntraMemories_ram_a_writedata_1),
        .ram_a_readdata_1    (IntraMemories_ram_a_readdata_1));

    // IP-XACT VLNV: tuni.fi:Kvazaar:IntraSearchCore:1.0
    IntraSearchCore_0 IntraSearchCore(
        // Interface: cabac_rsc
        .cabac_rsc_q         (IntraSearchCore_cabac_rsc_q),
        .cabac_rsc_adr       (IntraSearchCore_cabac_rsc_adr),
        .cabac_rsc_d         (IntraSearchCore_cabac_rsc_d),
        .cabac_rsc_we        (IntraSearchCore_cabac_rsc_we),
        // Interface: clk_base
        .clk_base            (IntraSearchCore_clk_base),
        // Interface: clk_intra
        .clk_intra           (IntraSearchCore_clk_intra),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (IntraSearchCore_conf_in_rsc_dat),
        .conf_in_rsc_vld     (IntraSearchCore_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (IntraSearchCore_conf_in_rsc_rdy),
        // Interface: cu_info_hor
        .cu_cu_hor_cu_info_rsc_q(IntraSearchCore_cu_cu_hor_cu_info_rsc_q),
        .cu_cu_hor_cu_info_rsc_adr_1(IntraSearchCore_cu_cu_hor_cu_info_rsc_adr_1),
        .cu_cu_hor_cu_info_rsc_d(IntraSearchCore_cu_cu_hor_cu_info_rsc_d),
        .cu_cu_hor_cu_info_rsc_we_1(IntraSearchCore_cu_cu_hor_cu_info_rsc_we_1),
        // Interface: cu_info_hor_str
        .cu_cu_cu_info_rsc_q_1(IntraSearchCore_cu_cu_cu_info_rsc_q_1),
        .cu_cu_cu_info_rsc_d_1(IntraSearchCore_cu_cu_cu_info_rsc_d_1),
        .cu_cu_hor_cu_info_rsc_adr(IntraSearchCore_cu_cu_hor_cu_info_rsc_adr),
        .cu_cu_hor_cu_info_rsc_we(IntraSearchCore_cu_cu_hor_cu_info_rsc_we),
        // Interface: cu_info_rsc
        .cu_cu_cu_info_rsc_q (IntraSearchCore_cu_cu_cu_info_rsc_q),
        .cu_cu_cu_info_rsc_adr(IntraSearchCore_cu_cu_cu_info_rsc_adr),
        .cu_cu_cu_info_rsc_d (IntraSearchCore_cu_cu_cu_info_rsc_d),
        .cu_cu_cu_info_rsc_we(IntraSearchCore_cu_cu_cu_info_rsc_we),
        // Interface: cu_info_ver
        .cu_cu_ver_cu_info_rsc_q(IntraSearchCore_cu_cu_ver_cu_info_rsc_q),
        .cu_cu_ver_cu_info_rsc_adr(IntraSearchCore_cu_cu_ver_cu_info_rsc_adr),
        .cu_cu_ver_cu_info_rsc_d(IntraSearchCore_cu_cu_ver_cu_info_rsc_d),
        .cu_cu_ver_cu_info_rsc_we(IntraSearchCore_cu_cu_ver_cu_info_rsc_we),
        // Interface: lcu_border_left
        .lcu_border_left_rsc_q(IntraSearchCore_lcu_border_left_rsc_q),
        .lcu_border_left_rsc_adr(IntraSearchCore_lcu_border_left_rsc_adr),
        .lcu_border_left_rsc_d(IntraSearchCore_lcu_border_left_rsc_d),
        .lcu_border_left_rsc_we(IntraSearchCore_lcu_border_left_rsc_we),
        // Interface: lcu_border_top
        .lcu_border_top_rsc_q(IntraSearchCore_lcu_border_top_rsc_q),
        .lcu_border_top_rsc_adr(IntraSearchCore_lcu_border_top_rsc_adr),
        .lcu_border_top_rsc_d(IntraSearchCore_lcu_border_top_rsc_d),
        .lcu_border_top_rsc_we(IntraSearchCore_lcu_border_top_rsc_we),
        // Interface: lcu_coeff_rsc
        .lcu_coeff_rsc_q_1   (),
        .lcu_coeff_rsc_adr   (IntraSearchCore_lcu_coeff_rsc_adr),
        .lcu_coeff_rsc_d     (IntraSearchCore_lcu_coeff_rsc_d),
        .lcu_coeff_rsc_we    (IntraSearchCore_lcu_coeff_rsc_we),
        // Interface: lcu_poll
        .irq_rsc_dat         (IntraSearchCore_irq_rsc_dat),
        // Interface: lcu_rec_rsc
        .lcu_rec_rsc_q       (IntraSearchCore_lcu_rec_rsc_q),
        .lcu_rec_rsc_adr     (IntraSearchCore_lcu_rec_rsc_adr),
        .lcu_rec_rsc_d       (IntraSearchCore_lcu_rec_rsc_d),
        .lcu_rec_rsc_we      (IntraSearchCore_lcu_rec_rsc_we),
        // Interface: lcu_ref_rsc
        .lcu_ref_rsc_q       (IntraSearchCore_lcu_ref_rsc_q),
        .lcu_ref_rsc_adr     (IntraSearchCore_lcu_ref_rsc_adr),
        .lcu_ref_rsc_d       (IntraSearchCore_lcu_ref_rsc_d),
        .lcu_ref_rsc_we      (IntraSearchCore_lcu_ref_rsc_we),
        // Interface: reset
        .arst_n              (IntraSearchCore_arst_n));

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (32),
        .width_out_g         (32),
        .size_g              (96),
        .use_memory_g        ("ON"))
    cabac_btm_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (cabac_btm_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (cabac_btm_dc_fifo_d),
        .d_vld               (cabac_btm_dc_fifo_d_vld),
        .d_rdy               (cabac_btm_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (cabac_btm_dc_fifo_q_rdy),
        .q                   (cabac_btm_dc_fifo_q),
        .q_vld               (cabac_btm_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (cabac_btm_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (cabac_btm_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (32),
        .width_out_g         (32),
        .size_g              (96),
        .use_memory_g        ("ON"))
    cabac_top_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (cabac_top_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (cabac_top_dc_fifo_d),
        .d_vld               (cabac_top_dc_fifo_d_vld),
        .d_rdy               (cabac_top_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (cabac_top_dc_fifo_q_rdy),
        .q                   (cabac_top_dc_fifo_q),
        .q_vld               (cabac_top_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (cabac_top_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (cabac_top_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:coeff_top_btm_adapter:1.0
    coeff_to_top_btm coeff_top_btm_adapter_0(
        // Interface: coeff
        .coeff_adr           (coeff_top_btm_adapter_0_coeff_adr),
        .coeff_byte_enable   (coeff_top_btm_adapter_0_coeff_byte_enable),
        .coeff_d             (coeff_top_btm_adapter_0_coeff_d),
        .coeff_we            (coeff_top_btm_adapter_0_coeff_we),
        // Interface: coeff_btm
        .btm_coeff_adr       (coeff_top_btm_adapter_0_btm_coeff_adr),
        .btm_coeff_byte_enable(coeff_top_btm_adapter_0_btm_coeff_byte_enable),
        .btm_coeff_d         (coeff_top_btm_adapter_0_btm_coeff_d),
        .btm_coeff_we        (coeff_top_btm_adapter_0_btm_coeff_we),
        // Interface: coeff_top
        .top_coeff_adr       (coeff_top_btm_adapter_0_top_coeff_adr),
        .top_coeff_byte_enable(coeff_top_btm_adapter_0_top_coeff_byte_enable),
        .top_coeff_d         (coeff_top_btm_adapter_0_top_coeff_d),
        .top_coeff_we        (coeff_top_btm_adapter_0_top_coeff_we));

    // IP-XACT VLNV: tuni.fi:Kvazaar:cu_info_we_adapter:1.0
    cu_info_we_adapter #(
        .ADDR_WIDTH          (10),
        .DATA_WIDTH          (128),
        .WE_SELECT           (9),
        .INVERT_WE           (1))
    cu_info_we_adapter_btm(
        // Interface: in
        .in_adr              (cu_info_we_adapter_btm_in_adr),
        .in_byte_enable      (cu_info_we_adapter_btm_in_byte_enable),
        .in_d                (cu_info_we_adapter_btm_in_d),
        .in_we               (cu_info_we_adapter_btm_in_we),
        .in_q                (cu_info_we_adapter_btm_in_q),
        // Interface: out
        .out_q               (cu_info_we_adapter_btm_out_q),
        .out_adr             (cu_info_we_adapter_btm_out_adr),
        .out_byte_enable     (cu_info_we_adapter_btm_out_byte_enable),
        .out_d               (cu_info_we_adapter_btm_out_d),
        .out_we              (cu_info_we_adapter_btm_out_we));

    // IP-XACT VLNV: tuni.fi:Kvazaar:cu_info_we_adapter:1.0
    cu_info_we_adapter #(
        .ADDR_WIDTH          (10),
        .DATA_WIDTH          (128),
        .WE_SELECT           (9),
        .INVERT_WE           (0))
    cu_info_we_adapter_top(
        // Interface: in
        .in_adr              (cu_info_we_adapter_top_in_adr),
        .in_byte_enable      (cu_info_we_adapter_top_in_byte_enable),
        .in_d                (cu_info_we_adapter_top_in_d),
        .in_we               (cu_info_we_adapter_top_in_we),
        .in_q                (cu_info_we_adapter_top_in_q),
        // Interface: out
        .out_q               (cu_info_we_adapter_top_out_q),
        .out_adr             (cu_info_we_adapter_top_out_adr),
        .out_byte_enable     (cu_info_we_adapter_top_out_byte_enable),
        .out_d               (cu_info_we_adapter_top_out_d),
        .out_we              (cu_info_we_adapter_top_out_we));

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer:1.0
    indexer_0 indexer_0(
        // Interface: arst_n
        .arst_n              (indexer_0_arst_n),
        // Interface: bitstream_btm
        .bitstream_last_data_rsc_q(indexer_0_bitstream_last_data_rsc_q),
        .bitstream_last_data_rsc_adr(indexer_0_bitstream_last_data_rsc_adr),
        .bitstream_last_data_rsc_d(indexer_0_bitstream_last_data_rsc_d),
        .bitstream_last_data_rsc_we(indexer_0_bitstream_last_data_rsc_we),
        // Interface: bitstream_top
        .bitstream_last_data_top_rsc_q(indexer_0_bitstream_last_data_top_rsc_q),
        .bitstream_last_data_top_rsc_adr(indexer_0_bitstream_last_data_top_rsc_adr),
        .bitstream_last_data_top_rsc_d(indexer_0_bitstream_last_data_top_rsc_d),
        .bitstream_last_data_top_rsc_we(indexer_0_bitstream_last_data_top_rsc_we),
        // Interface: cabac
        .out_adr_5           (indexer_0_out_adr_5),
        .out_byte_enable_5   (indexer_0_out_byte_enable_5),
        .out_d_5             (indexer_0_out_d_5),
        .out_we_5            (indexer_0_out_we_5),
        // Interface: cabac_metas_pull_btm
        .out_adr_6           (indexer_0_out_adr_6),
        .out_byte_enable_6   (indexer_0_out_byte_enable_6),
        .out_d_6             (indexer_0_out_d_6),
        .out_we_6            (indexer_0_out_we_6),
        // Interface: cabac_metas_pull_top
        .out_adr_7           (indexer_0_out_adr_7),
        .out_byte_enable_7   (indexer_0_out_byte_enable_7),
        .out_d_7             (indexer_0_out_d_7),
        .out_we_7            (indexer_0_out_we_7),
        // Interface: cabac_metas_push_btm
        .cabac_metas2_rsc_q  (indexer_0_cabac_metas2_rsc_q),
        .cabac_metas2_rsc_adr(indexer_0_cabac_metas2_rsc_adr),
        .cabac_metas2_rsc_d  (indexer_0_cabac_metas2_rsc_d),
        .cabac_metas2_rsc_we (indexer_0_cabac_metas2_rsc_we),
        // Interface: cabac_metas_push_top
        .cabac_metas2_top_rsc_q(indexer_0_cabac_metas2_top_rsc_q),
        .cabac_metas2_top_rsc_adr(indexer_0_cabac_metas2_top_rsc_adr),
        .cabac_metas2_top_rsc_d(indexer_0_cabac_metas2_top_rsc_d),
        .cabac_metas2_top_rsc_we(indexer_0_cabac_metas2_top_rsc_we),
        // Interface: cabac_states_btm
        .cabac_states_rsc_q  (indexer_0_cabac_states_rsc_q),
        .cabac_states_rsc_adr(indexer_0_cabac_states_rsc_adr),
        .cabac_states_rsc_d  (indexer_0_cabac_states_rsc_d),
        .cabac_states_rsc_we (indexer_0_cabac_states_rsc_we),
        // Interface: cabac_states_top
        .cabac_states_top_rsc_q(indexer_0_cabac_states_top_rsc_q),
        .cabac_states_top_rsc_adr(indexer_0_cabac_states_top_rsc_adr),
        .cabac_states_top_rsc_d(indexer_0_cabac_states_top_rsc_d),
        .cabac_states_top_rsc_we(indexer_0_cabac_states_top_rsc_we),
        // Interface: clk
        .clk                 (indexer_0_clk),
        // Interface: cu_info
        .cu_info_rsc_q       (indexer_0_cu_info_rsc_q),
        .cu_info_rsc_adr     (indexer_0_cu_info_rsc_adr),
        .cu_info_rsc_d       (indexer_0_cu_info_rsc_d),
        .cu_info_rsc_we      (indexer_0_cu_info_rsc_we),
        // Interface: cu_info1_hor_btm
        .out_adr_9           (indexer_0_out_adr_9),
        .out_byte_enable_9   (indexer_0_out_byte_enable_9),
        .out_d_9             (indexer_0_out_d_9),
        .out_we_9            (indexer_0_out_we_9),
        // Interface: cu_info1_hor_top
        .out_adr_10          (indexer_0_out_adr_10),
        .out_byte_enable_10  (indexer_0_out_byte_enable_10),
        .out_d_10            (indexer_0_out_d_10),
        .out_we_10           (indexer_0_out_we_10),
        // Interface: cu_info1_ver_btm
        .out_adr_11          (indexer_0_out_adr_11),
        .out_byte_enable_11  (indexer_0_out_byte_enable_11),
        .out_d_11            (indexer_0_out_d_11),
        .out_we_11           (indexer_0_out_we_11),
        // Interface: cu_info1_ver_top
        .out_adr_12          (indexer_0_out_adr_12),
        .out_byte_enable_12  (indexer_0_out_byte_enable_12),
        .out_d_12            (indexer_0_out_d_12),
        .out_we_12           (indexer_0_out_we_12),
        // Interface: cu_info2_hor_btm
        .out_adr_13          (indexer_0_out_adr_13),
        .out_byte_enable_13  (indexer_0_out_byte_enable_13),
        .out_d_13            (indexer_0_out_d_13),
        .out_we_13           (indexer_0_out_we_13),
        // Interface: cu_info2_hor_top
        .out_adr_14          (indexer_0_out_adr_14),
        .out_byte_enable_14  (indexer_0_out_byte_enable_14),
        .out_d_14            (indexer_0_out_d_14),
        .out_we_14           (indexer_0_out_we_14),
        // Interface: cu_info2_ver_btm
        .out_adr_15          (indexer_0_out_adr_15),
        .out_byte_enable_15  (indexer_0_out_byte_enable_15),
        .out_d_15            (indexer_0_out_d_15),
        .out_we_15           (indexer_0_out_we_15),
        // Interface: cu_info2_ver_top
        .out_adr_16          (indexer_0_out_adr_16),
        .out_byte_enable_16  (indexer_0_out_byte_enable_16),
        .out_d_16            (indexer_0_out_d_16),
        .out_we_16           (indexer_0_out_we_16),
        // Interface: cu_info_hor
        .out_adr_3           (indexer_0_out_adr_3),
        .out_byte_enable_3   (indexer_0_out_byte_enable_3),
        .out_d_3             (indexer_0_out_d_3),
        .out_we_3            (indexer_0_out_we_3),
        // Interface: cu_info_hor_str
        .out_adr_8           (indexer_0_out_adr_8),
        .out_byte_enable_8   (indexer_0_out_byte_enable_8),
        .out_d_8             (indexer_0_out_d_8),
        .out_we_8            (indexer_0_out_we_8),
        // Interface: cu_info_ver
        .out_adr_4           (indexer_0_out_adr_4),
        .out_byte_enable_4   (indexer_0_out_byte_enable_4),
        .out_d_4             (indexer_0_out_d_4),
        .out_we_4            (indexer_0_out_we_4),
        // Interface: data_in
        .data_in_rsc_dat     (indexer_0_data_in_rsc_dat),
        .data_in_rsc_vld     (indexer_0_data_in_rsc_vld),
        .data_in_rsc_rdy     (indexer_0_data_in_rsc_rdy),
        // Interface: data_out
        .data_out_rsc_rdy    (indexer_0_data_out_rsc_rdy),
        .data_out_rsc_dat    (indexer_0_data_out_rsc_dat),
        .data_out_rsc_vld    (indexer_0_data_out_rsc_vld),
        // Interface: data_req
        .data_req_rsc_dat_1  (indexer_0_data_req_rsc_dat_1),
        .data_req_rsc_vld_1  (indexer_0_data_req_rsc_vld_1),
        .data_req_rsc_rdy_1  (indexer_0_data_req_rsc_rdy_1),
        // Interface: left_border
        .out_adr_2           (indexer_0_out_adr_2),
        .out_byte_enable_2   (indexer_0_out_byte_enable_2),
        .out_d_2             (indexer_0_out_d_2),
        .out_we_2            (indexer_0_out_we_2),
        // Interface: rec
        .rec_rsc_q           (indexer_0_rec_rsc_q),
        .rec_rsc_adr         (indexer_0_rec_rsc_adr),
        .rec_rsc_d           (indexer_0_rec_rsc_d),
        .rec_rsc_we          (indexer_0_rec_rsc_we),
        // Interface: ref
        .out_adr             (indexer_0_out_adr),
        .out_byte_enable     (indexer_0_out_byte_enable),
        .out_d               (indexer_0_out_d),
        .out_we              (indexer_0_out_we),
        // Interface: top_border
        .out_adr_1           (indexer_0_out_adr_1),
        .out_byte_enable_1   (indexer_0_out_byte_enable_1),
        .out_d_1             (indexer_0_out_d_1),
        .out_we_1            (indexer_0_out_we_1));

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (32),
        .width_out_g         (32),
        .size_g              (32),
        .use_memory_g        ("ON"))
    intra_conf_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (intra_conf_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (intra_conf_dc_fifo_d),
        .d_vld               (intra_conf_dc_fifo_d_vld),
        .d_rdy               (intra_conf_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (intra_conf_dc_fifo_q_rdy),
        .q                   (intra_conf_dc_fifo_q),
        .q_vld               (intra_conf_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (intra_conf_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (intra_conf_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());


endmodule
