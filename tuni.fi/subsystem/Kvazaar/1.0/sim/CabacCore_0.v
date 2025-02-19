
module CabacCore_0 #(
    parameter                              Fifo_width       = 1
) (
    // Interface: arst_n
    input                               arst_n,

    // Interface: bitstream_last_data_rsc
    input                [7:0]          bitstream_last_data_rsc_q_1,
    output               [14:0]         bitstream_last_data_rsc_adr_1,
    output               [7:0]          bitstream_last_data_rsc_d_1,
    output                              bitstream_last_data_rsc_we_1,

    // Interface: cabac_metas_pull
    input                [127:0]        cabac_metas_rsc_q,
    output               [3:0]          cabac_metas_rsc_adr,
    output               [127:0]        cabac_metas_rsc_d,
    output                              cabac_metas_rsc_we,

    // Interface: cabac_metas_push
    input                [127:0]        cabac_metas_rsc_q_1,
    output               [4:0]          cabac_metas_rsc_adr_1,
    output               [127:0]        cabac_metas_rsc_d_1,
    output                              cabac_metas_rsc_we_1,

    // Interface: cabac_states_rsc
    input                [7:0]          cabac_states_rsc_q,
    output               [11:0]         cabac_states_rsc_adr,
    output               [7:0]          cabac_states_rsc_d,
    output                              cabac_states_rsc_we,

    // Interface: clk_base
    input                               clk_base,

    // Interface: clk_bin_coding
    input                               clk_bin_coding,

    // Interface: clk_binarization
    input                               clk_binarization,

    // Interface: coeff_rsc
    input                [63:0]         coeff_rsc_q_1,
    output               [14:0]         coeff_rsc_adr_1,
    output               [63:0]         coeff_rsc_d_1,
    output                              coeff_rsc_we_1,

    // Interface: config_in_rsc
    input                [31:0]         config_in_rsc_dat,
    input                               config_in_rsc_vld,
    output                              config_in_rsc_rdy,

    // Interface: ctu_done_rsc
    input                               ctu_done_rsc_rdy,
    output               [4:0]          ctu_done_rsc_dat,
    output                              ctu_done_rsc_vld,

    // Interface: lcu_left_rsc
    input                [7:0]          lcu_left_rsc_q,
    output               [7:0]          lcu_left_rsc_adr,
    output               [7:0]          lcu_left_rsc_d,
    output                              lcu_left_rsc_we,

    // Interface: lcu_left_rsc_1
    input                [7:0]          lcu_left_rsc_q_1,
    output               [7:0]          lcu_left_rsc_adr_1,
    output               [7:0]          lcu_left_rsc_d_1,
    output                              lcu_left_rsc_we_1,

    // Interface: lcu_rsc
    input                [31:0]         lcu_rsc_q,
    output               [11:0]         lcu_rsc_adr,
    output               [31:0]         lcu_rsc_d,
    output                              lcu_rsc_we,

    // Interface: lcu_rsc_1
    input                [31:0]         lcu_rsc_q_1,
    output               [11:0]         lcu_rsc_adr_1,
    output               [31:0]         lcu_rsc_d_1,
    output                              lcu_rsc_we_1,

    // Interface: lcu_top_rsc
    input                [7:0]          lcu_top_rsc_q,
    output               [7:0]          lcu_top_rsc_adr,
    output               [7:0]          lcu_top_rsc_d,
    output                              lcu_top_rsc_we,

    // Interface: lcu_top_rsc_1
    input                [7:0]          lcu_top_rsc_q_1,
    output               [7:0]          lcu_top_rsc_adr_1,
    output               [7:0]          lcu_top_rsc_d_1,
    output                              lcu_top_rsc_we_1
);

    // mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc
    // wires:
    wire [115:0] mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_DAT;
    wire       mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_RDY;
    wire       mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_VLD;
    // mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc
    // wires:
    wire [114:0] mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_DAT;
    wire       mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_RDY;
    wire       mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_VLD;
    // kvz_encode_coding_tree_hier_config_in_rsc_to_bus wires:
    wire [31:0] kvz_encode_coding_tree_hier_config_in_rsc_to_bus_DAT;
    wire       kvz_encode_coding_tree_hier_config_in_rsc_to_bus_RDY;
    wire       kvz_encode_coding_tree_hier_config_in_rsc_to_bus_VLD;
    // bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc wires:
    wire [35:0] bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_DAT;
    wire       bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_RDY;
    wire       bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_VLD;
    // bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc wires:
    wire [35:0] bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_DAT;
    wire       bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_RDY;
    wire       bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_VLD;
    // bin_coding_ctu_done_rsc_to_bus wires:
    wire [4:0] bin_coding_ctu_done_rsc_to_bus_DAT;
    wire       bin_coding_ctu_done_rsc_to_bus_RDY;
    wire       bin_coding_ctu_done_rsc_to_bus_VLD;
    // FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc wires:
    wire       FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_DAT;
    wire       FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_RDY;
    wire       FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_VLD;
    // binarization_done_rsc_to_FiFo_data_in wires:
    wire       binarization_done_rsc_to_FiFo_data_in_DAT;
    wire       binarization_done_rsc_to_FiFo_data_in_RDY;
    wire       binarization_done_rsc_to_FiFo_data_in_VLD;
    // encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc
    // wires:
    wire [35:0] encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_DAT;
    wire       encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_RDY;
    wire       encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_VLD;
    // binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc wires:
    wire [35:0] binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_DAT;
    wire       binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_RDY;
    wire       binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_VLD;
    // encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc wires:
    wire [78:0] encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_DAT;
    wire       encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_RDY;
    wire       encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_VLD;
    // bin_arbiter_arst_n_to_arst_n wires:
    wire       bin_arbiter_arst_n_to_arst_n_arst_n;
    // kvz_encode_coding_tree_hier_lcu_rsc_to_bus wires:
    wire [11:0] kvz_encode_coding_tree_hier_lcu_rsc_to_bus_ADDR;
    wire [31:0] kvz_encode_coding_tree_hier_lcu_rsc_to_bus_RDATA;
    wire [31:0] kvz_encode_coding_tree_hier_lcu_rsc_to_bus_WDATA;
    wire       kvz_encode_coding_tree_hier_lcu_rsc_to_bus_WREN;
    // kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus wires:
    wire [7:0] kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_ADDR;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_RDATA;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_WDATA;
    wire       kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_WREN;
    // kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1 wires:
    wire [7:0] kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_ADDR;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_RDATA;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_WDATA;
    wire       kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_WREN;
    // encode_transform_coeff_lcu_rsc_to_bus_1 wires:
    wire [11:0] encode_transform_coeff_lcu_rsc_to_bus_1_ADDR;
    wire [31:0] encode_transform_coeff_lcu_rsc_to_bus_1_RDATA;
    wire [31:0] encode_transform_coeff_lcu_rsc_to_bus_1_WDATA;
    wire       encode_transform_coeff_lcu_rsc_to_bus_1_WREN;
    // encode_transform_coeff_lcu_top_rsc_to_bus_2 wires:
    wire [7:0] encode_transform_coeff_lcu_top_rsc_to_bus_2_ADDR;
    wire [7:0] encode_transform_coeff_lcu_top_rsc_to_bus_2_RDATA;
    wire [7:0] encode_transform_coeff_lcu_top_rsc_to_bus_2_WDATA;
    wire       encode_transform_coeff_lcu_top_rsc_to_bus_2_WREN;
    // encode_transform_coeff_lcu_left_rsc_to_bus wires:
    wire [7:0] encode_transform_coeff_lcu_left_rsc_to_bus_ADDR;
    wire [7:0] encode_transform_coeff_lcu_left_rsc_to_bus_RDATA;
    wire [7:0] encode_transform_coeff_lcu_left_rsc_to_bus_WDATA;
    wire       encode_transform_coeff_lcu_left_rsc_to_bus_WREN;
    // bin_coding_cabac_states_rsc_to_bus wires:
    wire [11:0] bin_coding_cabac_states_rsc_to_bus_ADDR;
    wire [7:0] bin_coding_cabac_states_rsc_to_bus_RDATA;
    wire [7:0] bin_coding_cabac_states_rsc_to_bus_WDATA;
    wire       bin_coding_cabac_states_rsc_to_bus_WREN;
    // bin_coding_bitstream_last_data_rsc_to_bus_1 wires:
    wire [14:0] bin_coding_bitstream_last_data_rsc_to_bus_1_ADDR;
    wire [7:0] bin_coding_bitstream_last_data_rsc_to_bus_1_RDATA;
    wire [7:0] bin_coding_bitstream_last_data_rsc_to_bus_1_WDATA;
    wire       bin_coding_bitstream_last_data_rsc_to_bus_1_WREN;
    // binarization_coeff_rsc_to_bus_2 wires:
    wire [14:0] binarization_coeff_rsc_to_bus_2_ADDR;
    wire [63:0] binarization_coeff_rsc_to_bus_2_RDATA;
    wire [63:0] binarization_coeff_rsc_to_bus_2_WDATA;
    wire       binarization_coeff_rsc_to_bus_2_WREN;
    // kvz_encode_coding_tree_hier_clk_to_clk_base wires:
    wire       kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    // binarization_clk_binarization_to_clk_binarization wires:
    wire       binarization_clk_binarization_to_clk_binarization_CLK;
    // bin_arbiter_clk_cabac_state_to_clk_bin_coding wires:
    wire       bin_arbiter_clk_cabac_state_to_clk_bin_coding_CLK;
    // bin_coding_cabac_metas_rsc_to_cabac_metas_push wires:
    wire [4:0] bin_coding_cabac_metas_rsc_to_cabac_metas_push_ADDR;
    wire [127:0] bin_coding_cabac_metas_rsc_to_cabac_metas_push_RDATA;
    wire [127:0] bin_coding_cabac_metas_rsc_to_cabac_metas_push_WDATA;
    wire       bin_coding_cabac_metas_rsc_to_cabac_metas_push_WREN;
    // kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull wires:
    wire [3:0] kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_ADDR;
    wire [127:0] kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_RDATA;
    wire [127:0] kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_WDATA;
    wire       kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_WREN;

    // Ad-hoc wires:
    wire [31:0] bin_coding_low_rsc_dat_to_kvz_encode_coding_tree_hier_low_rsc_dat;
    wire [15:0] kvz_encode_coding_tree_hier_range_rsc_dat_to_bin_coding_range_rsc_dat;
    wire [7:0] bin_coding_num_buffered_bytes_rsc_dat_to_kvz_encode_coding_tree_hier_num_buffered_bytes_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_buffered_byte_rsc_dat_to_bin_coding_buffered_byte_rsc_dat;
    wire [7:0] bin_coding_bits_left_rsc_dat_to_kvz_encode_coding_tree_hier_bits_left_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_stream_data_rsc_dat_to_bin_coding_stream_data_rsc_dat;
    wire [7:0] bin_coding_stream_cur_bit_rsc_dat_to_kvz_encode_coding_tree_hier_stream_cur_bit_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_stream_zercount_rsc_dat_to_bin_coding_stream_zercount_rsc_dat;
    wire       OR3_1_output1_to_bin_arbiter_stall_coding_tree_rsc_dat;
    wire       mux_channel_encode_intra_config_rsc_vld_to_OR3_1_input2;
    wire       OR3_1_input1_to_encode_transform_coeff_active_rsc_dat;
    wire       OR3_1_input3_to_binarization_cabac_write_out_rsc_vld;

    // FiFo port wires:
    wire       FiFo_aclr_n;
    wire       FiFo_clk;
    wire       FiFo_d;
    wire       FiFo_d_rdy;
    wire       FiFo_d_vld;
    wire       FiFo_q;
    wire       FiFo_q_rdy;
    wire       FiFo_q_vld;
    // OR3_1 port wires:
    wire       OR3_1_input1;
    wire       OR3_1_input2;
    wire       OR3_1_input3;
    wire       OR3_1_output1;
    // bin_arbiter port wires:
    wire       bin_arbiter_arst_n;
    wire [35:0] bin_arbiter_cabac_write_coding_tree_rsc_dat;
    wire       bin_arbiter_cabac_write_coding_tree_rsc_rdy;
    wire       bin_arbiter_cabac_write_coding_tree_rsc_vld;
    wire [35:0] bin_arbiter_cabac_write_encode_rsc_dat;
    wire       bin_arbiter_cabac_write_encode_rsc_rdy;
    wire       bin_arbiter_cabac_write_encode_rsc_vld;
    wire [35:0] bin_arbiter_cabac_write_out_rsc_dat;
    wire       bin_arbiter_cabac_write_out_rsc_rdy;
    wire       bin_arbiter_cabac_write_out_rsc_vld;
    wire [35:0] bin_arbiter_cabac_write_rsc_dat;
    wire       bin_arbiter_cabac_write_rsc_rdy;
    wire       bin_arbiter_cabac_write_rsc_vld;
    wire       bin_arbiter_clk;
    wire       bin_arbiter_clk_cabac_main;
    wire       bin_arbiter_clk_cabac_main_arst_n;
    wire       bin_arbiter_clk_cabac_state;
    wire       bin_arbiter_clk_cabac_state_arst_n;
    wire       bin_arbiter_stall_coding_tree_rsc_dat;
    // bin_coding port wires:
    wire       bin_coding_arst_n;
    wire [7:0] bin_coding_bits_left_rsc_dat;
    wire [14:0] bin_coding_bitstream_last_data_rsc_adr;
    wire [7:0] bin_coding_bitstream_last_data_rsc_d;
    wire [7:0] bin_coding_bitstream_last_data_rsc_q;
    wire       bin_coding_bitstream_last_data_rsc_we;
    wire [7:0] bin_coding_buffered_byte_rsc_dat;
    wire [4:0] bin_coding_cabac_metas_rsc_adr;
    wire [127:0] bin_coding_cabac_metas_rsc_d;
    wire [127:0] bin_coding_cabac_metas_rsc_q;
    wire       bin_coding_cabac_metas_rsc_we;
    wire [11:0] bin_coding_cabac_states_rsc_adr;
    wire [7:0] bin_coding_cabac_states_rsc_d;
    wire [7:0] bin_coding_cabac_states_rsc_q;
    wire       bin_coding_cabac_states_rsc_we;
    wire [35:0] bin_coding_cabac_write_rsc_dat;
    wire       bin_coding_cabac_write_rsc_rdy;
    wire       bin_coding_cabac_write_rsc_vld;
    wire       bin_coding_clk;
    wire [4:0] bin_coding_ctu_done_rsc_dat;
    wire       bin_coding_ctu_done_rsc_rdy;
    wire       bin_coding_ctu_done_rsc_vld;
    wire [31:0] bin_coding_low_rsc_dat;
    wire [7:0] bin_coding_num_buffered_bytes_rsc_dat;
    wire [15:0] bin_coding_range_rsc_dat;
    wire [7:0] bin_coding_stream_cur_bit_rsc_dat;
    wire [7:0] bin_coding_stream_data_rsc_dat;
    wire [7:0] bin_coding_stream_zercount_rsc_dat;
    // binarization port wires:
    wire       binarization_arst_n;
    wire [35:0] binarization_cabac_write_out_rsc_dat;
    wire       binarization_cabac_write_out_rsc_rdy;
    wire       binarization_cabac_write_out_rsc_vld;
    wire       binarization_clk;
    wire       binarization_clk_cabac_main;
    wire [14:0] binarization_coeff_rsc_adr;
    wire [63:0] binarization_coeff_rsc_d_1;
    wire [63:0] binarization_coeff_rsc_q;
    wire       binarization_coeff_rsc_we_1;
    wire [78:0] binarization_conf_in_rsc_dat;
    wire       binarization_conf_in_rsc_rdy;
    wire       binarization_conf_in_rsc_vld;
    wire       binarization_done_rsc_dat;
    wire       binarization_done_rsc_rdy;
    wire       binarization_done_rsc_vld;
    // encode_transform_coeff port wires:
    wire       encode_transform_coeff_active_rsc_dat;
    wire       encode_transform_coeff_arst_n;
    wire       encode_transform_coeff_cabac_done_rsc_dat;
    wire       encode_transform_coeff_cabac_done_rsc_rdy;
    wire       encode_transform_coeff_cabac_done_rsc_vld;
    wire [78:0] encode_transform_coeff_cabac_main_config_rsc_dat;
    wire       encode_transform_coeff_cabac_main_config_rsc_rdy;
    wire       encode_transform_coeff_cabac_main_config_rsc_vld;
    wire [35:0] encode_transform_coeff_cabac_write_rsc_dat;
    wire       encode_transform_coeff_cabac_write_rsc_rdy;
    wire       encode_transform_coeff_cabac_write_rsc_vld;
    wire       encode_transform_coeff_clk;
    wire       encode_transform_coeff_clk_cabac_main;
    wire       encode_transform_coeff_clk_cabac_main_arst_n;
    wire [114:0] encode_transform_coeff_config_in_rsc_dat;
    wire       encode_transform_coeff_config_in_rsc_rdy;
    wire       encode_transform_coeff_config_in_rsc_vld;
    wire [7:0] encode_transform_coeff_lcu_left_rsc_adr;
    wire [7:0] encode_transform_coeff_lcu_left_rsc_d;
    wire [7:0] encode_transform_coeff_lcu_left_rsc_q;
    wire       encode_transform_coeff_lcu_left_rsc_we;
    wire [11:0] encode_transform_coeff_lcu_rsc_adr;
    wire [31:0] encode_transform_coeff_lcu_rsc_d;
    wire [31:0] encode_transform_coeff_lcu_rsc_q;
    wire       encode_transform_coeff_lcu_rsc_we;
    wire [7:0] encode_transform_coeff_lcu_top_rsc_adr;
    wire [7:0] encode_transform_coeff_lcu_top_rsc_d;
    wire [7:0] encode_transform_coeff_lcu_top_rsc_q;
    wire       encode_transform_coeff_lcu_top_rsc_we;
    // kvz_encode_coding_tree_hier port wires:
    wire       kvz_encode_coding_tree_hier_arst_n;
    wire [7:0] kvz_encode_coding_tree_hier_bits_left_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_buffered_byte_rsc_dat;
    wire [3:0] kvz_encode_coding_tree_hier_cabac_metas_rsc_adr;
    wire [127:0] kvz_encode_coding_tree_hier_cabac_metas_rsc_d;
    wire [127:0] kvz_encode_coding_tree_hier_cabac_metas_rsc_q;
    wire       kvz_encode_coding_tree_hier_cabac_metas_rsc_we;
    wire       kvz_encode_coding_tree_hier_clk;
    wire [31:0] kvz_encode_coding_tree_hier_config_in_rsc_dat;
    wire       kvz_encode_coding_tree_hier_config_in_rsc_rdy;
    wire       kvz_encode_coding_tree_hier_config_in_rsc_vld;
    wire [115:0] kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_dat;
    wire       kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_rdy;
    wire       kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_vld;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_left_rsc_adr;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_left_rsc_d;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_left_rsc_q;
    wire       kvz_encode_coding_tree_hier_lcu_left_rsc_we;
    wire [11:0] kvz_encode_coding_tree_hier_lcu_rsc_adr;
    wire [31:0] kvz_encode_coding_tree_hier_lcu_rsc_d;
    wire [31:0] kvz_encode_coding_tree_hier_lcu_rsc_q;
    wire       kvz_encode_coding_tree_hier_lcu_rsc_we;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_top_rsc_adr;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_top_rsc_d;
    wire [7:0] kvz_encode_coding_tree_hier_lcu_top_rsc_q;
    wire       kvz_encode_coding_tree_hier_lcu_top_rsc_we;
    wire [31:0] kvz_encode_coding_tree_hier_low_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_num_buffered_bytes_rsc_dat;
    wire [15:0] kvz_encode_coding_tree_hier_range_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_stream_cur_bit_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_stream_data_rsc_dat;
    wire [7:0] kvz_encode_coding_tree_hier_stream_zercount_rsc_dat;
    // mux_channel port wires:
    wire       mux_channel_arst_n;
    wire [35:0] mux_channel_cabac_write_rsc_dat;
    wire       mux_channel_cabac_write_rsc_rdy;
    wire       mux_channel_cabac_write_rsc_vld;
    wire       mux_channel_clk;
    wire [115:0] mux_channel_encode_intra_config_and_cabac_write_rsc_dat;
    wire       mux_channel_encode_intra_config_and_cabac_write_rsc_rdy;
    wire       mux_channel_encode_intra_config_and_cabac_write_rsc_vld;
    wire [114:0] mux_channel_encode_intra_config_rsc_dat;
    wire       mux_channel_encode_intra_config_rsc_rdy;
    wire       mux_channel_encode_intra_config_rsc_vld;

    // Assignments for the ports of the encompassing component:
    assign bin_arbiter_arst_n_to_arst_n_arst_n = arst_n;
    assign bitstream_last_data_rsc_adr_1 = bin_coding_bitstream_last_data_rsc_to_bus_1_ADDR;
    assign bitstream_last_data_rsc_d_1 = bin_coding_bitstream_last_data_rsc_to_bus_1_WDATA;
    assign bin_coding_bitstream_last_data_rsc_to_bus_1_RDATA = bitstream_last_data_rsc_q_1;
    assign bitstream_last_data_rsc_we_1 = bin_coding_bitstream_last_data_rsc_to_bus_1_WREN;
    assign cabac_metas_rsc_adr = kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_ADDR;
    assign cabac_metas_rsc_adr_1 = bin_coding_cabac_metas_rsc_to_cabac_metas_push_ADDR;
    assign cabac_metas_rsc_d = kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_WDATA;
    assign cabac_metas_rsc_d_1 = bin_coding_cabac_metas_rsc_to_cabac_metas_push_WDATA;
    assign kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_RDATA = cabac_metas_rsc_q;
    assign bin_coding_cabac_metas_rsc_to_cabac_metas_push_RDATA = cabac_metas_rsc_q_1;
    assign cabac_metas_rsc_we = kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_WREN;
    assign cabac_metas_rsc_we_1 = bin_coding_cabac_metas_rsc_to_cabac_metas_push_WREN;
    assign cabac_states_rsc_adr = bin_coding_cabac_states_rsc_to_bus_ADDR;
    assign cabac_states_rsc_d = bin_coding_cabac_states_rsc_to_bus_WDATA;
    assign bin_coding_cabac_states_rsc_to_bus_RDATA = cabac_states_rsc_q;
    assign cabac_states_rsc_we = bin_coding_cabac_states_rsc_to_bus_WREN;
    assign kvz_encode_coding_tree_hier_clk_to_clk_base_CLK = clk_base;
    assign bin_arbiter_clk_cabac_state_to_clk_bin_coding_CLK = clk_bin_coding;
    assign binarization_clk_binarization_to_clk_binarization_CLK = clk_binarization;
    assign coeff_rsc_adr_1 = binarization_coeff_rsc_to_bus_2_ADDR;
    assign coeff_rsc_d_1 = binarization_coeff_rsc_to_bus_2_WDATA;
    assign binarization_coeff_rsc_to_bus_2_RDATA = coeff_rsc_q_1;
    assign coeff_rsc_we_1 = binarization_coeff_rsc_to_bus_2_WREN;
    assign kvz_encode_coding_tree_hier_config_in_rsc_to_bus_DAT = config_in_rsc_dat;
    assign config_in_rsc_rdy = kvz_encode_coding_tree_hier_config_in_rsc_to_bus_RDY;
    assign kvz_encode_coding_tree_hier_config_in_rsc_to_bus_VLD = config_in_rsc_vld;
    assign ctu_done_rsc_dat = bin_coding_ctu_done_rsc_to_bus_DAT;
    assign bin_coding_ctu_done_rsc_to_bus_RDY = ctu_done_rsc_rdy;
    assign ctu_done_rsc_vld = bin_coding_ctu_done_rsc_to_bus_VLD;
    assign lcu_left_rsc_adr = kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_ADDR;
    assign lcu_left_rsc_adr_1 = encode_transform_coeff_lcu_left_rsc_to_bus_ADDR;
    assign lcu_left_rsc_d = kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_WDATA;
    assign lcu_left_rsc_d_1 = encode_transform_coeff_lcu_left_rsc_to_bus_WDATA;
    assign kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_RDATA = lcu_left_rsc_q;
    assign encode_transform_coeff_lcu_left_rsc_to_bus_RDATA = lcu_left_rsc_q_1;
    assign lcu_left_rsc_we = kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_WREN;
    assign lcu_left_rsc_we_1 = encode_transform_coeff_lcu_left_rsc_to_bus_WREN;
    assign lcu_rsc_adr = kvz_encode_coding_tree_hier_lcu_rsc_to_bus_ADDR;
    assign lcu_rsc_adr_1 = encode_transform_coeff_lcu_rsc_to_bus_1_ADDR;
    assign lcu_rsc_d = kvz_encode_coding_tree_hier_lcu_rsc_to_bus_WDATA;
    assign lcu_rsc_d_1 = encode_transform_coeff_lcu_rsc_to_bus_1_WDATA;
    assign kvz_encode_coding_tree_hier_lcu_rsc_to_bus_RDATA = lcu_rsc_q;
    assign encode_transform_coeff_lcu_rsc_to_bus_1_RDATA = lcu_rsc_q_1;
    assign lcu_rsc_we = kvz_encode_coding_tree_hier_lcu_rsc_to_bus_WREN;
    assign lcu_rsc_we_1 = encode_transform_coeff_lcu_rsc_to_bus_1_WREN;
    assign lcu_top_rsc_adr = kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_ADDR;
    assign lcu_top_rsc_adr_1 = encode_transform_coeff_lcu_top_rsc_to_bus_2_ADDR;
    assign lcu_top_rsc_d = kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_WDATA;
    assign lcu_top_rsc_d_1 = encode_transform_coeff_lcu_top_rsc_to_bus_2_WDATA;
    assign kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_RDATA = lcu_top_rsc_q;
    assign encode_transform_coeff_lcu_top_rsc_to_bus_2_RDATA = lcu_top_rsc_q_1;
    assign lcu_top_rsc_we = kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_WREN;
    assign lcu_top_rsc_we_1 = encode_transform_coeff_lcu_top_rsc_to_bus_2_WREN;

    // FiFo assignments:
    assign FiFo_aclr_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign FiFo_clk = kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    assign FiFo_d = binarization_done_rsc_to_FiFo_data_in_DAT;
    assign binarization_done_rsc_to_FiFo_data_in_RDY = FiFo_d_rdy;
    assign FiFo_d_vld = binarization_done_rsc_to_FiFo_data_in_VLD;
    assign FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_DAT = FiFo_q;
    assign FiFo_q_rdy = FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_RDY;
    assign FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_VLD = FiFo_q_vld;
    // OR3_1 assignments:
    assign OR3_1_input1 = OR3_1_input1_to_encode_transform_coeff_active_rsc_dat;
    assign OR3_1_input2 = mux_channel_encode_intra_config_rsc_vld_to_OR3_1_input2;
    assign OR3_1_input3 = OR3_1_input3_to_binarization_cabac_write_out_rsc_vld;
    assign OR3_1_output1_to_bin_arbiter_stall_coding_tree_rsc_dat = OR3_1_output1;
    // bin_arbiter assignments:
    assign bin_arbiter_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign bin_arbiter_cabac_write_coding_tree_rsc_dat = bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_DAT;
    assign bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_RDY = bin_arbiter_cabac_write_coding_tree_rsc_rdy;
    assign bin_arbiter_cabac_write_coding_tree_rsc_vld = bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_VLD;
    assign bin_arbiter_cabac_write_encode_rsc_dat = encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_DAT;
    assign encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_RDY = bin_arbiter_cabac_write_encode_rsc_rdy;
    assign bin_arbiter_cabac_write_encode_rsc_vld = encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_VLD;
    assign bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_DAT = bin_arbiter_cabac_write_out_rsc_dat;
    assign bin_arbiter_cabac_write_out_rsc_rdy = bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_RDY;
    assign bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_VLD = bin_arbiter_cabac_write_out_rsc_vld;
    assign bin_arbiter_cabac_write_rsc_dat = binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_DAT;
    assign binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_RDY = bin_arbiter_cabac_write_rsc_rdy;
    assign bin_arbiter_cabac_write_rsc_vld = binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_VLD;
    assign bin_arbiter_clk = kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    assign bin_arbiter_clk_cabac_main = binarization_clk_binarization_to_clk_binarization_CLK;
    assign bin_arbiter_clk_cabac_main_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign bin_arbiter_clk_cabac_state = bin_arbiter_clk_cabac_state_to_clk_bin_coding_CLK;
    assign bin_arbiter_clk_cabac_state_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign bin_arbiter_stall_coding_tree_rsc_dat = OR3_1_output1_to_bin_arbiter_stall_coding_tree_rsc_dat;
    // bin_coding assignments:
    assign bin_coding_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign bin_coding_bits_left_rsc_dat = bin_coding_bits_left_rsc_dat_to_kvz_encode_coding_tree_hier_bits_left_rsc_dat;
    assign bin_coding_bitstream_last_data_rsc_to_bus_1_ADDR = bin_coding_bitstream_last_data_rsc_adr;
    assign bin_coding_bitstream_last_data_rsc_to_bus_1_WDATA = bin_coding_bitstream_last_data_rsc_d;
    assign bin_coding_bitstream_last_data_rsc_q = bin_coding_bitstream_last_data_rsc_to_bus_1_RDATA;
    assign bin_coding_bitstream_last_data_rsc_to_bus_1_WREN = bin_coding_bitstream_last_data_rsc_we;
    assign bin_coding_buffered_byte_rsc_dat = kvz_encode_coding_tree_hier_buffered_byte_rsc_dat_to_bin_coding_buffered_byte_rsc_dat;
    assign bin_coding_cabac_metas_rsc_to_cabac_metas_push_ADDR = bin_coding_cabac_metas_rsc_adr;
    assign bin_coding_cabac_metas_rsc_to_cabac_metas_push_WDATA = bin_coding_cabac_metas_rsc_d;
    assign bin_coding_cabac_metas_rsc_q = bin_coding_cabac_metas_rsc_to_cabac_metas_push_RDATA;
    assign bin_coding_cabac_metas_rsc_to_cabac_metas_push_WREN = bin_coding_cabac_metas_rsc_we;
    assign bin_coding_cabac_states_rsc_to_bus_ADDR = bin_coding_cabac_states_rsc_adr;
    assign bin_coding_cabac_states_rsc_to_bus_WDATA = bin_coding_cabac_states_rsc_d;
    assign bin_coding_cabac_states_rsc_q = bin_coding_cabac_states_rsc_to_bus_RDATA;
    assign bin_coding_cabac_states_rsc_to_bus_WREN = bin_coding_cabac_states_rsc_we;
    assign bin_coding_cabac_write_rsc_dat = bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_DAT;
    assign bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_RDY = bin_coding_cabac_write_rsc_rdy;
    assign bin_coding_cabac_write_rsc_vld = bin_arbiter_cabac_write_out_rsc_to_bin_coding_cabac_write_rsc_VLD;
    assign bin_coding_clk = bin_arbiter_clk_cabac_state_to_clk_bin_coding_CLK;
    assign bin_coding_ctu_done_rsc_to_bus_DAT = bin_coding_ctu_done_rsc_dat;
    assign bin_coding_ctu_done_rsc_rdy = bin_coding_ctu_done_rsc_to_bus_RDY;
    assign bin_coding_ctu_done_rsc_to_bus_VLD = bin_coding_ctu_done_rsc_vld;
    assign bin_coding_low_rsc_dat = bin_coding_low_rsc_dat_to_kvz_encode_coding_tree_hier_low_rsc_dat;
    assign bin_coding_num_buffered_bytes_rsc_dat = bin_coding_num_buffered_bytes_rsc_dat_to_kvz_encode_coding_tree_hier_num_buffered_bytes_rsc_dat;
    assign bin_coding_range_rsc_dat = kvz_encode_coding_tree_hier_range_rsc_dat_to_bin_coding_range_rsc_dat;
    assign bin_coding_stream_cur_bit_rsc_dat = bin_coding_stream_cur_bit_rsc_dat_to_kvz_encode_coding_tree_hier_stream_cur_bit_rsc_dat;
    assign bin_coding_stream_data_rsc_dat = kvz_encode_coding_tree_hier_stream_data_rsc_dat_to_bin_coding_stream_data_rsc_dat;
    assign bin_coding_stream_zercount_rsc_dat = kvz_encode_coding_tree_hier_stream_zercount_rsc_dat_to_bin_coding_stream_zercount_rsc_dat;
    // binarization assignments:
    assign binarization_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_DAT = binarization_cabac_write_out_rsc_dat;
    assign binarization_cabac_write_out_rsc_rdy = binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_RDY;
    assign OR3_1_input3_to_binarization_cabac_write_out_rsc_vld = binarization_cabac_write_out_rsc_vld;
    assign binarization_cabac_write_out_to_bin_arbiter_cabac_write_rsc_VLD = binarization_cabac_write_out_rsc_vld;
    assign binarization_clk = kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    assign binarization_clk_cabac_main = binarization_clk_binarization_to_clk_binarization_CLK;
    assign binarization_coeff_rsc_to_bus_2_ADDR = binarization_coeff_rsc_adr;
    assign binarization_coeff_rsc_to_bus_2_WDATA = binarization_coeff_rsc_d_1;
    assign binarization_coeff_rsc_q = binarization_coeff_rsc_to_bus_2_RDATA;
    assign binarization_coeff_rsc_to_bus_2_WREN = binarization_coeff_rsc_we_1;
    assign binarization_conf_in_rsc_dat = encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_DAT;
    assign encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_RDY = binarization_conf_in_rsc_rdy;
    assign binarization_conf_in_rsc_vld = encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_VLD;
    assign binarization_done_rsc_to_FiFo_data_in_DAT = binarization_done_rsc_dat;
    assign binarization_done_rsc_rdy = binarization_done_rsc_to_FiFo_data_in_RDY;
    assign binarization_done_rsc_to_FiFo_data_in_VLD = binarization_done_rsc_vld;
    // encode_transform_coeff assignments:
    assign OR3_1_input1_to_encode_transform_coeff_active_rsc_dat = encode_transform_coeff_active_rsc_dat;
    assign encode_transform_coeff_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign encode_transform_coeff_cabac_done_rsc_dat = FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_DAT;
    assign FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_RDY = encode_transform_coeff_cabac_done_rsc_rdy;
    assign encode_transform_coeff_cabac_done_rsc_vld = FiFo_data_out_to_encode_transform_coeff_cabac_done_rsc_VLD;
    assign encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_DAT = encode_transform_coeff_cabac_main_config_rsc_dat;
    assign encode_transform_coeff_cabac_main_config_rsc_rdy = encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_RDY;
    assign encode_transform_coeff_cabac_main_config_rsc_to_binarization_conf_in_rsc_VLD = encode_transform_coeff_cabac_main_config_rsc_vld;
    assign encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_DAT = encode_transform_coeff_cabac_write_rsc_dat;
    assign encode_transform_coeff_cabac_write_rsc_rdy = encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_RDY;
    assign encode_transform_coeff_cabac_write_rsc_to_bin_arbiter_cabac_write_encode_rsc_VLD = encode_transform_coeff_cabac_write_rsc_vld;
    assign encode_transform_coeff_clk = kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    assign encode_transform_coeff_clk_cabac_main = binarization_clk_binarization_to_clk_binarization_CLK;
    assign encode_transform_coeff_clk_cabac_main_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign encode_transform_coeff_config_in_rsc_dat = mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_DAT;
    assign mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_RDY = encode_transform_coeff_config_in_rsc_rdy;
    assign encode_transform_coeff_config_in_rsc_vld = mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_VLD;
    assign encode_transform_coeff_lcu_left_rsc_to_bus_ADDR = encode_transform_coeff_lcu_left_rsc_adr;
    assign encode_transform_coeff_lcu_left_rsc_to_bus_WDATA = encode_transform_coeff_lcu_left_rsc_d;
    assign encode_transform_coeff_lcu_left_rsc_q = encode_transform_coeff_lcu_left_rsc_to_bus_RDATA;
    assign encode_transform_coeff_lcu_left_rsc_to_bus_WREN = encode_transform_coeff_lcu_left_rsc_we;
    assign encode_transform_coeff_lcu_rsc_to_bus_1_ADDR = encode_transform_coeff_lcu_rsc_adr;
    assign encode_transform_coeff_lcu_rsc_to_bus_1_WDATA = encode_transform_coeff_lcu_rsc_d;
    assign encode_transform_coeff_lcu_rsc_q = encode_transform_coeff_lcu_rsc_to_bus_1_RDATA;
    assign encode_transform_coeff_lcu_rsc_to_bus_1_WREN = encode_transform_coeff_lcu_rsc_we;
    assign encode_transform_coeff_lcu_top_rsc_to_bus_2_ADDR = encode_transform_coeff_lcu_top_rsc_adr;
    assign encode_transform_coeff_lcu_top_rsc_to_bus_2_WDATA = encode_transform_coeff_lcu_top_rsc_d;
    assign encode_transform_coeff_lcu_top_rsc_q = encode_transform_coeff_lcu_top_rsc_to_bus_2_RDATA;
    assign encode_transform_coeff_lcu_top_rsc_to_bus_2_WREN = encode_transform_coeff_lcu_top_rsc_we;
    // kvz_encode_coding_tree_hier assignments:
    assign kvz_encode_coding_tree_hier_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign bin_coding_bits_left_rsc_dat_to_kvz_encode_coding_tree_hier_bits_left_rsc_dat = kvz_encode_coding_tree_hier_bits_left_rsc_dat;
    assign kvz_encode_coding_tree_hier_buffered_byte_rsc_dat_to_bin_coding_buffered_byte_rsc_dat = kvz_encode_coding_tree_hier_buffered_byte_rsc_dat;
    assign kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_ADDR = kvz_encode_coding_tree_hier_cabac_metas_rsc_adr;
    assign kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_WDATA = kvz_encode_coding_tree_hier_cabac_metas_rsc_d;
    assign kvz_encode_coding_tree_hier_cabac_metas_rsc_q = kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_RDATA;
    assign kvz_encode_coding_tree_hier_cabac_metas_to_cabac_metas_pull_WREN = kvz_encode_coding_tree_hier_cabac_metas_rsc_we;
    assign kvz_encode_coding_tree_hier_clk = kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    assign kvz_encode_coding_tree_hier_config_in_rsc_dat = kvz_encode_coding_tree_hier_config_in_rsc_to_bus_DAT;
    assign kvz_encode_coding_tree_hier_config_in_rsc_to_bus_RDY = kvz_encode_coding_tree_hier_config_in_rsc_rdy;
    assign kvz_encode_coding_tree_hier_config_in_rsc_vld = kvz_encode_coding_tree_hier_config_in_rsc_to_bus_VLD;
    assign mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_DAT = kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_dat;
    assign kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_rdy = mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_RDY;
    assign mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_VLD = kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_vld;
    assign kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_ADDR = kvz_encode_coding_tree_hier_lcu_left_rsc_adr;
    assign kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_WDATA = kvz_encode_coding_tree_hier_lcu_left_rsc_d;
    assign kvz_encode_coding_tree_hier_lcu_left_rsc_q = kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_RDATA;
    assign kvz_encode_coding_tree_hier_lcu_left_rsc_to_bus_1_WREN = kvz_encode_coding_tree_hier_lcu_left_rsc_we;
    assign kvz_encode_coding_tree_hier_lcu_rsc_to_bus_ADDR = kvz_encode_coding_tree_hier_lcu_rsc_adr;
    assign kvz_encode_coding_tree_hier_lcu_rsc_to_bus_WDATA = kvz_encode_coding_tree_hier_lcu_rsc_d;
    assign kvz_encode_coding_tree_hier_lcu_rsc_q = kvz_encode_coding_tree_hier_lcu_rsc_to_bus_RDATA;
    assign kvz_encode_coding_tree_hier_lcu_rsc_to_bus_WREN = kvz_encode_coding_tree_hier_lcu_rsc_we;
    assign kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_ADDR = kvz_encode_coding_tree_hier_lcu_top_rsc_adr;
    assign kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_WDATA = kvz_encode_coding_tree_hier_lcu_top_rsc_d;
    assign kvz_encode_coding_tree_hier_lcu_top_rsc_q = kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_RDATA;
    assign kvz_encode_coding_tree_hier_lcu_top_rsc_to_bus_WREN = kvz_encode_coding_tree_hier_lcu_top_rsc_we;
    assign bin_coding_low_rsc_dat_to_kvz_encode_coding_tree_hier_low_rsc_dat = kvz_encode_coding_tree_hier_low_rsc_dat;
    assign bin_coding_num_buffered_bytes_rsc_dat_to_kvz_encode_coding_tree_hier_num_buffered_bytes_rsc_dat = kvz_encode_coding_tree_hier_num_buffered_bytes_rsc_dat;
    assign kvz_encode_coding_tree_hier_range_rsc_dat_to_bin_coding_range_rsc_dat = kvz_encode_coding_tree_hier_range_rsc_dat;
    assign bin_coding_stream_cur_bit_rsc_dat_to_kvz_encode_coding_tree_hier_stream_cur_bit_rsc_dat = kvz_encode_coding_tree_hier_stream_cur_bit_rsc_dat;
    assign kvz_encode_coding_tree_hier_stream_data_rsc_dat_to_bin_coding_stream_data_rsc_dat = kvz_encode_coding_tree_hier_stream_data_rsc_dat;
    assign kvz_encode_coding_tree_hier_stream_zercount_rsc_dat_to_bin_coding_stream_zercount_rsc_dat = kvz_encode_coding_tree_hier_stream_zercount_rsc_dat;
    // mux_channel assignments:
    assign mux_channel_arst_n = bin_arbiter_arst_n_to_arst_n_arst_n;
    assign bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_DAT = mux_channel_cabac_write_rsc_dat;
    assign mux_channel_cabac_write_rsc_rdy = bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_RDY;
    assign bin_arbiter_cabac_write_coding_tree_rsc_to_mux_channel_cabac_write_rsc_VLD = mux_channel_cabac_write_rsc_vld;
    assign mux_channel_clk = kvz_encode_coding_tree_hier_clk_to_clk_base_CLK;
    assign mux_channel_encode_intra_config_and_cabac_write_rsc_dat = mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_DAT;
    assign mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_RDY = mux_channel_encode_intra_config_and_cabac_write_rsc_rdy;
    assign mux_channel_encode_intra_config_and_cabac_write_rsc_vld = mux_channel_encode_intra_config_and_cabac_write_rsc_to_kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_VLD;
    assign mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_DAT = mux_channel_encode_intra_config_rsc_dat;
    assign mux_channel_encode_intra_config_rsc_rdy = mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_RDY;
    assign mux_channel_encode_intra_config_rsc_to_encode_transform_coeff_config_in_rsc_VLD = mux_channel_encode_intra_config_rsc_vld;
    assign mux_channel_encode_intra_config_rsc_vld_to_OR3_1_input2 = mux_channel_encode_intra_config_rsc_vld;

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (1),
        .size_g              (3),
        .use_memory_g        ("OFF"))
    FiFo(
        // Interface: aclr_n
        .aclr_n              (FiFo_aclr_n),
        // Interface: clk
        .clk                 (FiFo_clk),
        // Interface: data_in
        .d                   (FiFo_d),
        .d_vld               (FiFo_d_vld),
        .d_rdy               (FiFo_d_rdy),
        // Interface: data_out
        .q_rdy               (FiFo_q_rdy),
        .q                   (FiFo_q),
        .q_vld               (FiFo_q_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OR3:1.0
    Combinatorial_OR3     OR3_1(
        // These ports are not in any interface
        .input1              (OR3_1_input1),
        .input2              (OR3_1_input2),
        .input3              (OR3_1_input3),
        .output1             (OR3_1_output1));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:bin_arbiter:1.0
    bin_arbiter bin_arbiter(
        // Interface: arst_n
        .arst_n              (bin_arbiter_arst_n),
        // Interface: cabac_write_coding_tree_rsc
        .cabac_write_coding_tree_rsc_dat(bin_arbiter_cabac_write_coding_tree_rsc_dat),
        .cabac_write_coding_tree_rsc_vld(bin_arbiter_cabac_write_coding_tree_rsc_vld),
        .cabac_write_coding_tree_rsc_rdy(bin_arbiter_cabac_write_coding_tree_rsc_rdy),
        // Interface: cabac_write_encode_rsc
        .cabac_write_encode_rsc_dat(bin_arbiter_cabac_write_encode_rsc_dat),
        .cabac_write_encode_rsc_vld(bin_arbiter_cabac_write_encode_rsc_vld),
        .cabac_write_encode_rsc_rdy(bin_arbiter_cabac_write_encode_rsc_rdy),
        // Interface: cabac_write_out_rsc
        .cabac_write_out_rsc_rdy(bin_arbiter_cabac_write_out_rsc_rdy),
        .cabac_write_out_rsc_dat(bin_arbiter_cabac_write_out_rsc_dat),
        .cabac_write_out_rsc_vld(bin_arbiter_cabac_write_out_rsc_vld),
        // Interface: cabac_write_rsc
        .cabac_write_rsc_dat (bin_arbiter_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (bin_arbiter_cabac_write_rsc_vld),
        .cabac_write_rsc_rdy (bin_arbiter_cabac_write_rsc_rdy),
        // Interface: clk
        .clk                 (bin_arbiter_clk),
        // Interface: clk_cabac_main
        .clk_cabac_main      (bin_arbiter_clk_cabac_main),
        // Interface: clk_cabac_main_arst_n
        .clk_cabac_main_arst_n(bin_arbiter_clk_cabac_main_arst_n),
        // Interface: clk_cabac_state
        .clk_cabac_state     (bin_arbiter_clk_cabac_state),
        // Interface: clk_cabac_state_arst_n
        .clk_cabac_state_arst_n(bin_arbiter_clk_cabac_state_arst_n),
        // These ports are not in any interface
        .stall_coding_tree_rsc_dat(bin_arbiter_stall_coding_tree_rsc_dat));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:bin_coding:1.0
    bin_coding bin_coding(
        // Interface: arst_n
        .arst_n              (bin_coding_arst_n),
        // Interface: bitstream_last_data_rsc
        .bitstream_last_data_rsc_q(bin_coding_bitstream_last_data_rsc_q),
        .bitstream_last_data_rsc_adr(bin_coding_bitstream_last_data_rsc_adr),
        .bitstream_last_data_rsc_d(bin_coding_bitstream_last_data_rsc_d),
        .bitstream_last_data_rsc_we(bin_coding_bitstream_last_data_rsc_we),
        // Interface: cabac_metas_rsc
        .cabac_metas_rsc_q   (bin_coding_cabac_metas_rsc_q),
        .cabac_metas_rsc_adr (bin_coding_cabac_metas_rsc_adr),
        .cabac_metas_rsc_d   (bin_coding_cabac_metas_rsc_d),
        .cabac_metas_rsc_we  (bin_coding_cabac_metas_rsc_we),
        // Interface: cabac_states_rsc
        .cabac_states_rsc_q  (bin_coding_cabac_states_rsc_q),
        .cabac_states_rsc_adr(bin_coding_cabac_states_rsc_adr),
        .cabac_states_rsc_d  (bin_coding_cabac_states_rsc_d),
        .cabac_states_rsc_we (bin_coding_cabac_states_rsc_we),
        // Interface: cabac_write_rsc
        .cabac_write_rsc_dat (bin_coding_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (bin_coding_cabac_write_rsc_vld),
        .cabac_write_rsc_rdy (bin_coding_cabac_write_rsc_rdy),
        // Interface: clk
        .clk                 (bin_coding_clk),
        // Interface: ctu_done_rsc
        .ctu_done_rsc_rdy    (bin_coding_ctu_done_rsc_rdy),
        .ctu_done_rsc_dat    (bin_coding_ctu_done_rsc_dat),
        .ctu_done_rsc_vld    (bin_coding_ctu_done_rsc_vld),
        // These ports are not in any interface
        .bits_left_rsc_dat   (bin_coding_bits_left_rsc_dat),
        .buffered_byte_rsc_dat(bin_coding_buffered_byte_rsc_dat),
        .low_rsc_dat         (bin_coding_low_rsc_dat),
        .num_buffered_bytes_rsc_dat(bin_coding_num_buffered_bytes_rsc_dat),
        .range_rsc_dat       (bin_coding_range_rsc_dat),
        .stream_cur_bit_rsc_dat(bin_coding_stream_cur_bit_rsc_dat),
        .stream_data_rsc_dat (bin_coding_stream_data_rsc_dat),
        .stream_zercount_rsc_dat(bin_coding_stream_zercount_rsc_dat));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:binarization:1.0
    binarization_0 binarization(
        // Interface: arst_n
        .arst_n              (binarization_arst_n),
        // Interface: cabac_write_out
        .cabac_write_out_rsc_rdy(binarization_cabac_write_out_rsc_rdy),
        .cabac_write_out_rsc_dat(binarization_cabac_write_out_rsc_dat),
        .cabac_write_out_rsc_vld(binarization_cabac_write_out_rsc_vld),
        // Interface: clk
        .clk                 (binarization_clk),
        // Interface: clk_binarization
        .clk_cabac_main      (binarization_clk_cabac_main),
        // Interface: coeff_rsc
        .coeff_rsc_q         (binarization_coeff_rsc_q),
        .coeff_rsc_adr       (binarization_coeff_rsc_adr),
        .coeff_rsc_d_1       (binarization_coeff_rsc_d_1),
        .coeff_rsc_we_1      (binarization_coeff_rsc_we_1),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (binarization_conf_in_rsc_dat),
        .conf_in_rsc_vld     (binarization_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (binarization_conf_in_rsc_rdy),
        // Interface: done_rsc
        .done_rsc_rdy        (binarization_done_rsc_rdy),
        .done_rsc_dat        (binarization_done_rsc_dat),
        .done_rsc_vld        (binarization_done_rsc_vld));

    // IP-XACT VLNV:
    // tuni.fi:KvazaarCabac:encode_intra_coding_unit_and_transform_coeff:1.0
    encode_intra_coding_unit_and_transform_coeff encode_transform_coeff(
        // Interface: arst_n
        .arst_n              (encode_transform_coeff_arst_n),
        // Interface: cabac_done_rsc
        .cabac_done_rsc_dat  (encode_transform_coeff_cabac_done_rsc_dat),
        .cabac_done_rsc_vld  (encode_transform_coeff_cabac_done_rsc_vld),
        .cabac_done_rsc_rdy  (encode_transform_coeff_cabac_done_rsc_rdy),
        // Interface: cabac_main_config_rsc
        .cabac_main_config_rsc_rdy(encode_transform_coeff_cabac_main_config_rsc_rdy),
        .cabac_main_config_rsc_dat(encode_transform_coeff_cabac_main_config_rsc_dat),
        .cabac_main_config_rsc_vld(encode_transform_coeff_cabac_main_config_rsc_vld),
        // Interface: cabac_write_rsc
        .cabac_write_rsc_rdy (encode_transform_coeff_cabac_write_rsc_rdy),
        .cabac_write_rsc_dat (encode_transform_coeff_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (encode_transform_coeff_cabac_write_rsc_vld),
        // Interface: clk
        .clk                 (encode_transform_coeff_clk),
        // Interface: clk_cabac_main
        .clk_cabac_main      (encode_transform_coeff_clk_cabac_main),
        // Interface: clk_cabac_main_arst_n
        .clk_cabac_main_arst_n(encode_transform_coeff_clk_cabac_main_arst_n),
        // Interface: config_in_rsc
        .config_in_rsc_dat   (encode_transform_coeff_config_in_rsc_dat),
        .config_in_rsc_vld   (encode_transform_coeff_config_in_rsc_vld),
        .config_in_rsc_rdy   (encode_transform_coeff_config_in_rsc_rdy),
        // Interface: lcu_left_rsc
        .lcu_left_rsc_q      (encode_transform_coeff_lcu_left_rsc_q),
        .lcu_left_rsc_adr    (encode_transform_coeff_lcu_left_rsc_adr),
        .lcu_left_rsc_d      (encode_transform_coeff_lcu_left_rsc_d),
        .lcu_left_rsc_we     (encode_transform_coeff_lcu_left_rsc_we),
        // Interface: lcu_rsc
        .lcu_rsc_q           (encode_transform_coeff_lcu_rsc_q),
        .lcu_rsc_adr         (encode_transform_coeff_lcu_rsc_adr),
        .lcu_rsc_d           (encode_transform_coeff_lcu_rsc_d),
        .lcu_rsc_we          (encode_transform_coeff_lcu_rsc_we),
        // Interface: lcu_top_rsc
        .lcu_top_rsc_q       (encode_transform_coeff_lcu_top_rsc_q),
        .lcu_top_rsc_adr     (encode_transform_coeff_lcu_top_rsc_adr),
        .lcu_top_rsc_d       (encode_transform_coeff_lcu_top_rsc_d),
        .lcu_top_rsc_we      (encode_transform_coeff_lcu_top_rsc_we),
        // These ports are not in any interface
        .active_rsc_dat      (encode_transform_coeff_active_rsc_dat));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:kvz_encode_coding_tree_hier:1.0
    kvz_encode_coding_tree_hier kvz_encode_coding_tree_hier(
        // Interface: arst_n
        .arst_n              (kvz_encode_coding_tree_hier_arst_n),
        // Interface: cabac_metas
        .cabac_metas_rsc_q   (kvz_encode_coding_tree_hier_cabac_metas_rsc_q),
        .cabac_metas_rsc_adr (kvz_encode_coding_tree_hier_cabac_metas_rsc_adr),
        .cabac_metas_rsc_d   (kvz_encode_coding_tree_hier_cabac_metas_rsc_d),
        .cabac_metas_rsc_we  (kvz_encode_coding_tree_hier_cabac_metas_rsc_we),
        // Interface: clk
        .clk                 (kvz_encode_coding_tree_hier_clk),
        // Interface: config_in_rsc
        .config_in_rsc_dat   (kvz_encode_coding_tree_hier_config_in_rsc_dat),
        .config_in_rsc_vld   (kvz_encode_coding_tree_hier_config_in_rsc_vld),
        .config_in_rsc_rdy   (kvz_encode_coding_tree_hier_config_in_rsc_rdy),
        // Interface: encode_intra_config_and_cabac_write_rsc
        .encode_intra_config_and_cabac_write_rsc_rdy(kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_rdy),
        .encode_intra_config_and_cabac_write_rsc_dat(kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_dat),
        .encode_intra_config_and_cabac_write_rsc_vld(kvz_encode_coding_tree_hier_encode_intra_config_and_cabac_write_rsc_vld),
        // Interface: lcu_left_rsc
        .lcu_left_rsc_q      (kvz_encode_coding_tree_hier_lcu_left_rsc_q),
        .lcu_left_rsc_adr    (kvz_encode_coding_tree_hier_lcu_left_rsc_adr),
        .lcu_left_rsc_d      (kvz_encode_coding_tree_hier_lcu_left_rsc_d),
        .lcu_left_rsc_we     (kvz_encode_coding_tree_hier_lcu_left_rsc_we),
        // Interface: lcu_rsc
        .lcu_rsc_q           (kvz_encode_coding_tree_hier_lcu_rsc_q),
        .lcu_rsc_adr         (kvz_encode_coding_tree_hier_lcu_rsc_adr),
        .lcu_rsc_d           (kvz_encode_coding_tree_hier_lcu_rsc_d),
        .lcu_rsc_we          (kvz_encode_coding_tree_hier_lcu_rsc_we),
        // Interface: lcu_top_rsc
        .lcu_top_rsc_q       (kvz_encode_coding_tree_hier_lcu_top_rsc_q),
        .lcu_top_rsc_adr     (kvz_encode_coding_tree_hier_lcu_top_rsc_adr),
        .lcu_top_rsc_d       (kvz_encode_coding_tree_hier_lcu_top_rsc_d),
        .lcu_top_rsc_we      (kvz_encode_coding_tree_hier_lcu_top_rsc_we),
        // These ports are not in any interface
        .bits_left_rsc_dat   (kvz_encode_coding_tree_hier_bits_left_rsc_dat),
        .buffered_byte_rsc_dat(kvz_encode_coding_tree_hier_buffered_byte_rsc_dat),
        .low_rsc_dat         (kvz_encode_coding_tree_hier_low_rsc_dat),
        .num_buffered_bytes_rsc_dat(kvz_encode_coding_tree_hier_num_buffered_bytes_rsc_dat),
        .range_rsc_dat       (kvz_encode_coding_tree_hier_range_rsc_dat),
        .stream_cur_bit_rsc_dat(kvz_encode_coding_tree_hier_stream_cur_bit_rsc_dat),
        .stream_data_rsc_dat (kvz_encode_coding_tree_hier_stream_data_rsc_dat),
        .stream_zercount_rsc_dat(kvz_encode_coding_tree_hier_stream_zercount_rsc_dat));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:mux_channel:1.0
    mux_channel mux_channel(
        // Interface: arst_n
        .arst_n              (mux_channel_arst_n),
        // Interface: cabac_write_rsc
        .cabac_write_rsc_rdy (mux_channel_cabac_write_rsc_rdy),
        .cabac_write_rsc_dat (mux_channel_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (mux_channel_cabac_write_rsc_vld),
        // Interface: clk
        .clk                 (mux_channel_clk),
        // Interface: encode_intra_config_and_cabac_write_rsc
        .encode_intra_config_and_cabac_write_rsc_dat(mux_channel_encode_intra_config_and_cabac_write_rsc_dat),
        .encode_intra_config_and_cabac_write_rsc_vld(mux_channel_encode_intra_config_and_cabac_write_rsc_vld),
        .encode_intra_config_and_cabac_write_rsc_rdy(mux_channel_encode_intra_config_and_cabac_write_rsc_rdy),
        // Interface: encode_intra_config_rsc
        .encode_intra_config_rsc_rdy(mux_channel_encode_intra_config_rsc_rdy),
        .encode_intra_config_rsc_dat(mux_channel_encode_intra_config_rsc_dat),
        .encode_intra_config_rsc_vld(mux_channel_encode_intra_config_rsc_vld));


endmodule
