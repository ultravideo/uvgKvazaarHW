
module indexer_0(
    // Interface: arst_n
    input                               arst_n,

    // Interface: bitstream_btm
    input                [127:0]        bitstream_last_data_rsc_q,
    output               [9:0]          bitstream_last_data_rsc_adr,
    output               [127:0]        bitstream_last_data_rsc_d,
    output                              bitstream_last_data_rsc_we,

    // Interface: bitstream_top
    input                [127:0]        bitstream_last_data_top_rsc_q,
    output               [9:0]          bitstream_last_data_top_rsc_adr,
    output               [127:0]        bitstream_last_data_top_rsc_d,
    output                              bitstream_last_data_top_rsc_we,

    // Interface: cabac
    output               [12:0]         out_adr_5,
    output               [15:0]         out_byte_enable_5,
    output               [127:0]        out_d_5,
    output                              out_we_5,

    // Interface: cabac_metas_pull_btm
    output               [12:0]         out_adr_6,
    output               [15:0]         out_byte_enable_6,
    output               [127:0]        out_d_6,
    output                              out_we_6,

    // Interface: cabac_metas_pull_top
    output               [12:0]         out_adr_7,
    output               [15:0]         out_byte_enable_7,
    output               [127:0]        out_d_7,
    output                              out_we_7,

    // Interface: cabac_metas_push_btm
    input                [127:0]        cabac_metas2_rsc_q,
    output               [3:0]          cabac_metas2_rsc_adr,
    output               [127:0]        cabac_metas2_rsc_d,
    output                              cabac_metas2_rsc_we,

    // Interface: cabac_metas_push_top
    input                [127:0]        cabac_metas2_top_rsc_q,
    output               [3:0]          cabac_metas2_top_rsc_adr,
    output               [127:0]        cabac_metas2_top_rsc_d,
    output                              cabac_metas2_top_rsc_we,

    // Interface: cabac_states_btm
    input                [127:0]        cabac_states_rsc_q,
    output               [6:0]          cabac_states_rsc_adr,
    output               [127:0]        cabac_states_rsc_d,
    output                              cabac_states_rsc_we,

    // Interface: cabac_states_top
    input                [127:0]        cabac_states_top_rsc_q,
    output               [6:0]          cabac_states_top_rsc_adr,
    output               [127:0]        cabac_states_top_rsc_d,
    output                              cabac_states_top_rsc_we,

    // Interface: clk
    input                               clk,

    // Interface: cu_info
    input                [127:0]        cu_info_rsc_q,
    output               [9:0]          cu_info_rsc_adr,
    output               [127:0]        cu_info_rsc_d,
    output                              cu_info_rsc_we,

    // Interface: cu_info1_hor_btm
    output               [12:0]         out_adr_9,
    output               [15:0]         out_byte_enable_9,
    output               [127:0]        out_d_9,
    output                              out_we_9,

    // Interface: cu_info1_hor_top
    output               [12:0]         out_adr_10,
    output               [15:0]         out_byte_enable_10,
    output               [127:0]        out_d_10,
    output                              out_we_10,

    // Interface: cu_info1_ver_btm
    output               [12:0]         out_adr_11,
    output               [15:0]         out_byte_enable_11,
    output               [127:0]        out_d_11,
    output                              out_we_11,

    // Interface: cu_info1_ver_top
    output               [12:0]         out_adr_12,
    output               [15:0]         out_byte_enable_12,
    output               [127:0]        out_d_12,
    output                              out_we_12,

    // Interface: cu_info2_hor_btm
    output               [12:0]         out_adr_13,
    output               [15:0]         out_byte_enable_13,
    output               [127:0]        out_d_13,
    output                              out_we_13,

    // Interface: cu_info2_hor_top
    output               [12:0]         out_adr_14,
    output               [15:0]         out_byte_enable_14,
    output               [127:0]        out_d_14,
    output                              out_we_14,

    // Interface: cu_info2_ver_btm
    output               [12:0]         out_adr_15,
    output               [15:0]         out_byte_enable_15,
    output               [127:0]        out_d_15,
    output                              out_we_15,

    // Interface: cu_info2_ver_top
    output               [12:0]         out_adr_16,
    output               [15:0]         out_byte_enable_16,
    output               [127:0]        out_d_16,
    output                              out_we_16,

    // Interface: cu_info_hor
    output               [12:0]         out_adr_3,
    output               [15:0]         out_byte_enable_3,
    output               [127:0]        out_d_3,
    output                              out_we_3,

    // Interface: cu_info_hor_str
    output               [12:0]         out_adr_8,
    output               [15:0]         out_byte_enable_8,
    output               [127:0]        out_d_8,
    output                              out_we_8,

    // Interface: cu_info_ver
    output               [12:0]         out_adr_4,
    output               [15:0]         out_byte_enable_4,
    output               [127:0]        out_d_4,
    output                              out_we_4,

    // Interface: data_in
    input                [155:0]        data_in_rsc_dat,
    input                               data_in_rsc_vld,
    output                              data_in_rsc_rdy,

    // Interface: data_out
    input                               data_out_rsc_rdy,
    output               [127:0]        data_out_rsc_dat,
    output                              data_out_rsc_vld,

    // Interface: data_req
    input                [3:0]          data_req_rsc_dat_1,
    input                               data_req_rsc_vld_1,
    output                              data_req_rsc_rdy_1,

    // Interface: left_border
    output               [12:0]         out_adr_2,
    output               [15:0]         out_byte_enable_2,
    output               [127:0]        out_d_2,
    output                              out_we_2,

    // Interface: rec
    input                [127:0]        rec_rsc_q,
    output               [12:0]         rec_rsc_adr,
    output               [127:0]        rec_rsc_d,
    output                              rec_rsc_we,

    // Interface: ref
    output               [12:0]         out_adr,
    output               [15:0]         out_byte_enable,
    output               [127:0]        out_d,
    output                              out_we,

    // Interface: top_border
    output               [12:0]         out_adr_1,
    output               [15:0]         out_byte_enable_1,
    output               [127:0]        out_d_1,
    output                              out_we_1
);

    // indexer_core_clk_to_clk wires:
    wire       indexer_core_clk_to_clk_CLK;
    // indexer_core_arst_n_to_arst_n wires:
    wire       indexer_core_arst_n_to_arst_n_arst_n;
    // indexer_core_data_in_to_data_in wires:
    wire [155:0] indexer_core_data_in_to_data_in_DAT;
    wire       indexer_core_data_in_to_data_in_RDY;
    wire       indexer_core_data_in_to_data_in_VLD;
    // indexer_core_data_out_to_data_out wires:
    wire [127:0] indexer_core_data_out_to_data_out_DAT;
    wire       indexer_core_data_out_to_data_out_RDY;
    wire       indexer_core_data_out_to_data_out_VLD;
    // indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm wires:
    wire [3:0] indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_ADDR;
    wire [127:0] indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_RDATA;
    wire [127:0] indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_WDATA;
    wire       indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_WREN;
    // indexer_core_cabac_metas_push_top_to_cabac_metas_push_top wires:
    wire [3:0] indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_ADDR;
    wire [127:0] indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_RDATA;
    wire [127:0] indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_WDATA;
    wire       indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_WREN;
    // indexer_core_cabac_states_btm_to_cabac_states_btm wires:
    wire [6:0] indexer_core_cabac_states_btm_to_cabac_states_btm_ADDR;
    wire [127:0] indexer_core_cabac_states_btm_to_cabac_states_btm_RDATA;
    wire [127:0] indexer_core_cabac_states_btm_to_cabac_states_btm_WDATA;
    wire       indexer_core_cabac_states_btm_to_cabac_states_btm_WREN;
    // indexer_core_bitstream_btm_to_bitstream_btm wires:
    wire [9:0] indexer_core_bitstream_btm_to_bitstream_btm_ADDR;
    wire [127:0] indexer_core_bitstream_btm_to_bitstream_btm_RDATA;
    wire [127:0] indexer_core_bitstream_btm_to_bitstream_btm_WDATA;
    wire       indexer_core_bitstream_btm_to_bitstream_btm_WREN;
    // indexer_core_cabac_states_top_to_cabac_states_top wires:
    wire [6:0] indexer_core_cabac_states_top_to_cabac_states_top_ADDR;
    wire [127:0] indexer_core_cabac_states_top_to_cabac_states_top_RDATA;
    wire [127:0] indexer_core_cabac_states_top_to_cabac_states_top_WDATA;
    wire       indexer_core_cabac_states_top_to_cabac_states_top_WREN;
    // indexer_core_bitstream_top_to_bitstream_top wires:
    wire [9:0] indexer_core_bitstream_top_to_bitstream_top_ADDR;
    wire [127:0] indexer_core_bitstream_top_to_bitstream_top_RDATA;
    wire [127:0] indexer_core_bitstream_top_to_bitstream_top_WDATA;
    wire       indexer_core_bitstream_top_to_bitstream_top_WREN;
    // indexer_core_cu_info_to_cu_info wires:
    wire [9:0] indexer_core_cu_info_to_cu_info_ADDR;
    wire [127:0] indexer_core_cu_info_to_cu_info_RDATA;
    wire [127:0] indexer_core_cu_info_to_cu_info_WDATA;
    wire       indexer_core_cu_info_to_cu_info_WREN;
    // indexer_core_rec_to_rec wires:
    wire [12:0] indexer_core_rec_to_rec_ADDR;
    wire [127:0] indexer_core_rec_to_rec_RDATA;
    wire [127:0] indexer_core_rec_to_rec_WDATA;
    wire       indexer_core_rec_to_rec_WREN;
    // indexer_core_mem_out_top_to_indexer_we_adapter_0_in wires:
    wire [12:0] indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    wire [136:0] indexer_core_mem_out_top_to_indexer_we_adapter_0_in_RDATA;
    wire [136:0] indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    wire       indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    // indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in wires:
    wire [12:0] indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    wire [133:0] indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_RDATA;
    wire [133:0] indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA;
    wire       indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    // indexer_core_data_req_to_bus wires:
    wire [3:0] indexer_core_data_req_to_bus_DAT;
    wire       indexer_core_data_req_to_bus_RDY;
    wire       indexer_core_data_req_to_bus_VLD;
    // indexer_we_adapter_0_out_to_ref wires:
    wire [12:0] indexer_we_adapter_0_out_to_ref_ADDR;
    wire [15:0] indexer_we_adapter_0_out_to_ref_BYTEEN;
    wire [127:0] indexer_we_adapter_0_out_to_ref_WDATA;
    wire       indexer_we_adapter_0_out_to_ref_WREN;
    // indexer_we_adapter_1_out_to_top_border wires:
    wire [12:0] indexer_we_adapter_1_out_to_top_border_ADDR;
    wire [15:0] indexer_we_adapter_1_out_to_top_border_BYTEEN;
    wire [127:0] indexer_we_adapter_1_out_to_top_border_WDATA;
    wire       indexer_we_adapter_1_out_to_top_border_WREN;
    // indexer_we_adapter_2_out_to_left_border wires:
    wire [12:0] indexer_we_adapter_2_out_to_left_border_ADDR;
    wire [15:0] indexer_we_adapter_2_out_to_left_border_BYTEEN;
    wire [127:0] indexer_we_adapter_2_out_to_left_border_WDATA;
    wire       indexer_we_adapter_2_out_to_left_border_WREN;
    // indexer_we_adapter_3_out_to_cu_info_hor wires:
    wire [12:0] indexer_we_adapter_3_out_to_cu_info_hor_ADDR;
    wire [15:0] indexer_we_adapter_3_out_to_cu_info_hor_BYTEEN;
    wire [127:0] indexer_we_adapter_3_out_to_cu_info_hor_WDATA;
    wire       indexer_we_adapter_3_out_to_cu_info_hor_WREN;
    // indexer_we_adapter_4_out_to_cu_info_ver wires:
    wire [12:0] indexer_we_adapter_4_out_to_cu_info_ver_ADDR;
    wire [15:0] indexer_we_adapter_4_out_to_cu_info_ver_BYTEEN;
    wire [127:0] indexer_we_adapter_4_out_to_cu_info_ver_WDATA;
    wire       indexer_we_adapter_4_out_to_cu_info_ver_WREN;
    // indexer_we_adapter_5_out_to_cabac wires:
    wire [12:0] indexer_we_adapter_5_out_to_cabac_ADDR;
    wire [15:0] indexer_we_adapter_5_out_to_cabac_BYTEEN;
    wire [127:0] indexer_we_adapter_5_out_to_cabac_WDATA;
    wire       indexer_we_adapter_5_out_to_cabac_WREN;
    // indexer_we_adapter_6_out_to_cabac_metas_pull_btm wires:
    wire [12:0] indexer_we_adapter_6_out_to_cabac_metas_pull_btm_ADDR;
    wire [15:0] indexer_we_adapter_6_out_to_cabac_metas_pull_btm_BYTEEN;
    wire [127:0] indexer_we_adapter_6_out_to_cabac_metas_pull_btm_WDATA;
    wire       indexer_we_adapter_6_out_to_cabac_metas_pull_btm_WREN;
    // indexer_we_adapter_7_out_to_cabac_metas_pull_top wires:
    wire [12:0] indexer_we_adapter_7_out_to_cabac_metas_pull_top_ADDR;
    wire [15:0] indexer_we_adapter_7_out_to_cabac_metas_pull_top_BYTEEN;
    wire [127:0] indexer_we_adapter_7_out_to_cabac_metas_pull_top_WDATA;
    wire       indexer_we_adapter_7_out_to_cabac_metas_pull_top_WREN;
    // indexer_we_adapter_8_out_to_cu_info_hor_str wires:
    wire [12:0] indexer_we_adapter_8_out_to_cu_info_hor_str_ADDR;
    wire [15:0] indexer_we_adapter_8_out_to_cu_info_hor_str_BYTEEN;
    wire [127:0] indexer_we_adapter_8_out_to_cu_info_hor_str_WDATA;
    wire       indexer_we_adapter_8_out_to_cu_info_hor_str_WREN;
    // indexer_we_adapter_9_out_to_cu_info1_hor_btm wires:
    wire [12:0] indexer_we_adapter_9_out_to_cu_info1_hor_btm_ADDR;
    wire [15:0] indexer_we_adapter_9_out_to_cu_info1_hor_btm_BYTEEN;
    wire [127:0] indexer_we_adapter_9_out_to_cu_info1_hor_btm_WDATA;
    wire       indexer_we_adapter_9_out_to_cu_info1_hor_btm_WREN;
    // indexer_we_adapter_10_out_to_cu_info1_hor_top wires:
    wire [12:0] indexer_we_adapter_10_out_to_cu_info1_hor_top_ADDR;
    wire [15:0] indexer_we_adapter_10_out_to_cu_info1_hor_top_BYTEEN;
    wire [127:0] indexer_we_adapter_10_out_to_cu_info1_hor_top_WDATA;
    wire       indexer_we_adapter_10_out_to_cu_info1_hor_top_WREN;
    // indexer_we_adapter_11_out_to_cu_info1_ver_btm wires:
    wire [12:0] indexer_we_adapter_11_out_to_cu_info1_ver_btm_ADDR;
    wire [15:0] indexer_we_adapter_11_out_to_cu_info1_ver_btm_BYTEEN;
    wire [127:0] indexer_we_adapter_11_out_to_cu_info1_ver_btm_WDATA;
    wire       indexer_we_adapter_11_out_to_cu_info1_ver_btm_WREN;
    // indexer_we_adapter_12_out_to_cu_info1_ver_top wires:
    wire [12:0] indexer_we_adapter_12_out_to_cu_info1_ver_top_ADDR;
    wire [15:0] indexer_we_adapter_12_out_to_cu_info1_ver_top_BYTEEN;
    wire [127:0] indexer_we_adapter_12_out_to_cu_info1_ver_top_WDATA;
    wire       indexer_we_adapter_12_out_to_cu_info1_ver_top_WREN;
    // indexer_we_adapter_13_out_to_cu_info2_hor_btm wires:
    wire [12:0] indexer_we_adapter_13_out_to_cu_info2_hor_btm_ADDR;
    wire [15:0] indexer_we_adapter_13_out_to_cu_info2_hor_btm_BYTEEN;
    wire [127:0] indexer_we_adapter_13_out_to_cu_info2_hor_btm_WDATA;
    wire       indexer_we_adapter_13_out_to_cu_info2_hor_btm_WREN;
    // indexer_we_adapter_14_out_to_cu_info2_hor_top wires:
    wire [12:0] indexer_we_adapter_14_out_to_cu_info2_hor_top_ADDR;
    wire [15:0] indexer_we_adapter_14_out_to_cu_info2_hor_top_BYTEEN;
    wire [127:0] indexer_we_adapter_14_out_to_cu_info2_hor_top_WDATA;
    wire       indexer_we_adapter_14_out_to_cu_info2_hor_top_WREN;
    // indexer_we_adapter_15_out_to_cu_info2_ver_btm wires:
    wire [12:0] indexer_we_adapter_15_out_to_cu_info2_ver_btm_ADDR;
    wire [15:0] indexer_we_adapter_15_out_to_cu_info2_ver_btm_BYTEEN;
    wire [127:0] indexer_we_adapter_15_out_to_cu_info2_ver_btm_WDATA;
    wire       indexer_we_adapter_15_out_to_cu_info2_ver_btm_WREN;
    // indexer_we_adapter_16_out_to_cu_info2_ver_top wires:
    wire [12:0] indexer_we_adapter_16_out_to_cu_info2_ver_top_ADDR;
    wire [15:0] indexer_we_adapter_16_out_to_cu_info2_ver_top_BYTEEN;
    wire [127:0] indexer_we_adapter_16_out_to_cu_info2_ver_top_WDATA;
    wire       indexer_we_adapter_16_out_to_cu_info2_ver_top_WREN;

    // indexer_core port wires:
    wire       indexer_core_arst_n;
    wire [9:0] indexer_core_bitstream_last_data_rsc_adr;
    wire [127:0] indexer_core_bitstream_last_data_rsc_d;
    wire [127:0] indexer_core_bitstream_last_data_rsc_q;
    wire       indexer_core_bitstream_last_data_rsc_we;
    wire [9:0] indexer_core_bitstream_last_data_top_rsc_adr;
    wire [127:0] indexer_core_bitstream_last_data_top_rsc_d;
    wire [127:0] indexer_core_bitstream_last_data_top_rsc_q;
    wire       indexer_core_bitstream_last_data_top_rsc_we;
    wire [3:0] indexer_core_cabac_metas2_rsc_adr;
    wire [127:0] indexer_core_cabac_metas2_rsc_d;
    wire [127:0] indexer_core_cabac_metas2_rsc_q;
    wire       indexer_core_cabac_metas2_rsc_we;
    wire [3:0] indexer_core_cabac_metas2_top_rsc_adr;
    wire [127:0] indexer_core_cabac_metas2_top_rsc_d;
    wire [127:0] indexer_core_cabac_metas2_top_rsc_q;
    wire       indexer_core_cabac_metas2_top_rsc_we;
    wire [6:0] indexer_core_cabac_states_rsc_adr;
    wire [127:0] indexer_core_cabac_states_rsc_d;
    wire [127:0] indexer_core_cabac_states_rsc_q;
    wire       indexer_core_cabac_states_rsc_we;
    wire [6:0] indexer_core_cabac_states_top_rsc_adr;
    wire [127:0] indexer_core_cabac_states_top_rsc_d;
    wire [127:0] indexer_core_cabac_states_top_rsc_q;
    wire       indexer_core_cabac_states_top_rsc_we;
    wire       indexer_core_clk;
    wire [9:0] indexer_core_cu_info_rsc_adr;
    wire [127:0] indexer_core_cu_info_rsc_d;
    wire [127:0] indexer_core_cu_info_rsc_q;
    wire       indexer_core_cu_info_rsc_we;
    wire [155:0] indexer_core_data_in_rsc_dat;
    wire       indexer_core_data_in_rsc_rdy;
    wire       indexer_core_data_in_rsc_vld;
    wire [127:0] indexer_core_data_out_rsc_dat;
    wire       indexer_core_data_out_rsc_rdy;
    wire       indexer_core_data_out_rsc_vld;
    wire [3:0] indexer_core_data_req_rsc_dat;
    wire       indexer_core_data_req_rsc_rdy;
    wire       indexer_core_data_req_rsc_vld;
    wire [12:0] indexer_core_mem_out_btm_top_rsc_adr;
    wire [133:0] indexer_core_mem_out_btm_top_rsc_d;
    wire [133:0] indexer_core_mem_out_btm_top_rsc_q;
    wire       indexer_core_mem_out_btm_top_rsc_we;
    wire [12:0] indexer_core_mem_out_rsc_adr;
    wire [136:0] indexer_core_mem_out_rsc_d;
    wire [136:0] indexer_core_mem_out_rsc_q;
    wire       indexer_core_mem_out_rsc_we;
    wire [12:0] indexer_core_rec_rsc_adr;
    wire [127:0] indexer_core_rec_rsc_d;
    wire [127:0] indexer_core_rec_rsc_q;
    wire       indexer_core_rec_rsc_we;
    // indexer_we_adapter_0 port wires:
    wire [12:0] indexer_we_adapter_0_in_adr;
    wire [136:0] indexer_we_adapter_0_in_d;
    wire       indexer_we_adapter_0_in_we;
    wire [12:0] indexer_we_adapter_0_out_adr;
    wire [15:0] indexer_we_adapter_0_out_byte_enable;
    wire [127:0] indexer_we_adapter_0_out_d;
    wire       indexer_we_adapter_0_out_we;
    // indexer_we_adapter_1 port wires:
    wire [12:0] indexer_we_adapter_1_in_adr;
    wire [136:0] indexer_we_adapter_1_in_d;
    wire       indexer_we_adapter_1_in_we;
    wire [12:0] indexer_we_adapter_1_out_adr;
    wire [15:0] indexer_we_adapter_1_out_byte_enable;
    wire [127:0] indexer_we_adapter_1_out_d;
    wire       indexer_we_adapter_1_out_we;
    // indexer_we_adapter_10 port wires:
    wire [12:0] indexer_we_adapter_10_in_adr;
    wire [131:0] indexer_we_adapter_10_in_d;
    wire       indexer_we_adapter_10_in_we;
    wire [12:0] indexer_we_adapter_10_out_adr;
    wire [15:0] indexer_we_adapter_10_out_byte_enable;
    wire [127:0] indexer_we_adapter_10_out_d;
    wire       indexer_we_adapter_10_out_we;
    // indexer_we_adapter_11 port wires:
    wire [12:0] indexer_we_adapter_11_in_adr;
    wire [131:0] indexer_we_adapter_11_in_d;
    wire       indexer_we_adapter_11_in_we;
    wire [12:0] indexer_we_adapter_11_out_adr;
    wire [15:0] indexer_we_adapter_11_out_byte_enable;
    wire [127:0] indexer_we_adapter_11_out_d;
    wire       indexer_we_adapter_11_out_we;
    // indexer_we_adapter_12 port wires:
    wire [12:0] indexer_we_adapter_12_in_adr;
    wire [131:0] indexer_we_adapter_12_in_d;
    wire       indexer_we_adapter_12_in_we;
    wire [12:0] indexer_we_adapter_12_out_adr;
    wire [15:0] indexer_we_adapter_12_out_byte_enable;
    wire [127:0] indexer_we_adapter_12_out_d;
    wire       indexer_we_adapter_12_out_we;
    // indexer_we_adapter_13 port wires:
    wire [12:0] indexer_we_adapter_13_in_adr;
    wire [131:0] indexer_we_adapter_13_in_d;
    wire       indexer_we_adapter_13_in_we;
    wire [12:0] indexer_we_adapter_13_out_adr;
    wire [15:0] indexer_we_adapter_13_out_byte_enable;
    wire [127:0] indexer_we_adapter_13_out_d;
    wire       indexer_we_adapter_13_out_we;
    // indexer_we_adapter_14 port wires:
    wire [12:0] indexer_we_adapter_14_in_adr;
    wire [131:0] indexer_we_adapter_14_in_d;
    wire       indexer_we_adapter_14_in_we;
    wire [12:0] indexer_we_adapter_14_out_adr;
    wire [15:0] indexer_we_adapter_14_out_byte_enable;
    wire [127:0] indexer_we_adapter_14_out_d;
    wire       indexer_we_adapter_14_out_we;
    // indexer_we_adapter_15 port wires:
    wire [12:0] indexer_we_adapter_15_in_adr;
    wire [131:0] indexer_we_adapter_15_in_d;
    wire       indexer_we_adapter_15_in_we;
    wire [12:0] indexer_we_adapter_15_out_adr;
    wire [15:0] indexer_we_adapter_15_out_byte_enable;
    wire [127:0] indexer_we_adapter_15_out_d;
    wire       indexer_we_adapter_15_out_we;
    // indexer_we_adapter_16 port wires:
    wire [12:0] indexer_we_adapter_16_in_adr;
    wire [131:0] indexer_we_adapter_16_in_d;
    wire       indexer_we_adapter_16_in_we;
    wire [12:0] indexer_we_adapter_16_out_adr;
    wire [15:0] indexer_we_adapter_16_out_byte_enable;
    wire [127:0] indexer_we_adapter_16_out_d;
    wire       indexer_we_adapter_16_out_we;
    // indexer_we_adapter_2 port wires:
    wire [12:0] indexer_we_adapter_2_in_adr;
    wire [136:0] indexer_we_adapter_2_in_d;
    wire       indexer_we_adapter_2_in_we;
    wire [12:0] indexer_we_adapter_2_out_adr;
    wire [15:0] indexer_we_adapter_2_out_byte_enable;
    wire [127:0] indexer_we_adapter_2_out_d;
    wire       indexer_we_adapter_2_out_we;
    // indexer_we_adapter_3 port wires:
    wire [12:0] indexer_we_adapter_3_in_adr;
    wire [136:0] indexer_we_adapter_3_in_d;
    wire       indexer_we_adapter_3_in_we;
    wire [12:0] indexer_we_adapter_3_out_adr;
    wire [15:0] indexer_we_adapter_3_out_byte_enable;
    wire [127:0] indexer_we_adapter_3_out_d;
    wire       indexer_we_adapter_3_out_we;
    // indexer_we_adapter_4 port wires:
    wire [12:0] indexer_we_adapter_4_in_adr;
    wire [136:0] indexer_we_adapter_4_in_d;
    wire       indexer_we_adapter_4_in_we;
    wire [12:0] indexer_we_adapter_4_out_adr;
    wire [15:0] indexer_we_adapter_4_out_byte_enable;
    wire [127:0] indexer_we_adapter_4_out_d;
    wire       indexer_we_adapter_4_out_we;
    // indexer_we_adapter_5 port wires:
    wire [12:0] indexer_we_adapter_5_in_adr;
    wire [136:0] indexer_we_adapter_5_in_d;
    wire       indexer_we_adapter_5_in_we;
    wire [12:0] indexer_we_adapter_5_out_adr;
    wire [15:0] indexer_we_adapter_5_out_byte_enable;
    wire [127:0] indexer_we_adapter_5_out_d;
    wire       indexer_we_adapter_5_out_we;
    // indexer_we_adapter_6 port wires:
    wire [12:0] indexer_we_adapter_6_in_adr;
    wire [136:0] indexer_we_adapter_6_in_d;
    wire       indexer_we_adapter_6_in_we;
    wire [12:0] indexer_we_adapter_6_out_adr;
    wire [15:0] indexer_we_adapter_6_out_byte_enable;
    wire [127:0] indexer_we_adapter_6_out_d;
    wire       indexer_we_adapter_6_out_we;
    // indexer_we_adapter_7 port wires:
    wire [12:0] indexer_we_adapter_7_in_adr;
    wire [136:0] indexer_we_adapter_7_in_d;
    wire       indexer_we_adapter_7_in_we;
    wire [12:0] indexer_we_adapter_7_out_adr;
    wire [15:0] indexer_we_adapter_7_out_byte_enable;
    wire [127:0] indexer_we_adapter_7_out_d;
    wire       indexer_we_adapter_7_out_we;
    // indexer_we_adapter_8 port wires:
    wire [12:0] indexer_we_adapter_8_in_adr;
    wire [136:0] indexer_we_adapter_8_in_d;
    wire       indexer_we_adapter_8_in_we;
    wire [12:0] indexer_we_adapter_8_out_adr;
    wire [15:0] indexer_we_adapter_8_out_byte_enable;
    wire [127:0] indexer_we_adapter_8_out_d;
    wire       indexer_we_adapter_8_out_we;
    // indexer_we_adapter_9 port wires:
    wire [12:0] indexer_we_adapter_9_in_adr;
    wire [131:0] indexer_we_adapter_9_in_d;
    wire       indexer_we_adapter_9_in_we;
    wire [12:0] indexer_we_adapter_9_out_adr;
    wire [15:0] indexer_we_adapter_9_out_byte_enable;
    wire [127:0] indexer_we_adapter_9_out_d;
    wire       indexer_we_adapter_9_out_we;

    // Assignments for the ports of the encompassing component:
    assign indexer_core_arst_n_to_arst_n_arst_n = arst_n;
    assign bitstream_last_data_rsc_adr = indexer_core_bitstream_btm_to_bitstream_btm_ADDR;
    assign bitstream_last_data_rsc_d = indexer_core_bitstream_btm_to_bitstream_btm_WDATA;
    assign indexer_core_bitstream_btm_to_bitstream_btm_RDATA = bitstream_last_data_rsc_q;
    assign bitstream_last_data_rsc_we = indexer_core_bitstream_btm_to_bitstream_btm_WREN;
    assign bitstream_last_data_top_rsc_adr = indexer_core_bitstream_top_to_bitstream_top_ADDR;
    assign bitstream_last_data_top_rsc_d = indexer_core_bitstream_top_to_bitstream_top_WDATA;
    assign indexer_core_bitstream_top_to_bitstream_top_RDATA = bitstream_last_data_top_rsc_q;
    assign bitstream_last_data_top_rsc_we = indexer_core_bitstream_top_to_bitstream_top_WREN;
    assign cabac_metas2_rsc_adr = indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_ADDR;
    assign cabac_metas2_rsc_d = indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_WDATA;
    assign indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_RDATA = cabac_metas2_rsc_q;
    assign cabac_metas2_rsc_we = indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_WREN;
    assign cabac_metas2_top_rsc_adr = indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_ADDR;
    assign cabac_metas2_top_rsc_d = indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_WDATA;
    assign indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_RDATA = cabac_metas2_top_rsc_q;
    assign cabac_metas2_top_rsc_we = indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_WREN;
    assign cabac_states_rsc_adr = indexer_core_cabac_states_btm_to_cabac_states_btm_ADDR;
    assign cabac_states_rsc_d = indexer_core_cabac_states_btm_to_cabac_states_btm_WDATA;
    assign indexer_core_cabac_states_btm_to_cabac_states_btm_RDATA = cabac_states_rsc_q;
    assign cabac_states_rsc_we = indexer_core_cabac_states_btm_to_cabac_states_btm_WREN;
    assign cabac_states_top_rsc_adr = indexer_core_cabac_states_top_to_cabac_states_top_ADDR;
    assign cabac_states_top_rsc_d = indexer_core_cabac_states_top_to_cabac_states_top_WDATA;
    assign indexer_core_cabac_states_top_to_cabac_states_top_RDATA = cabac_states_top_rsc_q;
    assign cabac_states_top_rsc_we = indexer_core_cabac_states_top_to_cabac_states_top_WREN;
    assign indexer_core_clk_to_clk_CLK = clk;
    assign cu_info_rsc_adr = indexer_core_cu_info_to_cu_info_ADDR;
    assign cu_info_rsc_d = indexer_core_cu_info_to_cu_info_WDATA;
    assign indexer_core_cu_info_to_cu_info_RDATA = cu_info_rsc_q;
    assign cu_info_rsc_we = indexer_core_cu_info_to_cu_info_WREN;
    assign indexer_core_data_in_to_data_in_DAT = data_in_rsc_dat;
    assign data_in_rsc_rdy = indexer_core_data_in_to_data_in_RDY;
    assign indexer_core_data_in_to_data_in_VLD = data_in_rsc_vld;
    assign data_out_rsc_dat = indexer_core_data_out_to_data_out_DAT;
    assign indexer_core_data_out_to_data_out_RDY = data_out_rsc_rdy;
    assign data_out_rsc_vld = indexer_core_data_out_to_data_out_VLD;
    assign indexer_core_data_req_to_bus_DAT = data_req_rsc_dat_1;
    assign data_req_rsc_rdy_1 = indexer_core_data_req_to_bus_RDY;
    assign indexer_core_data_req_to_bus_VLD = data_req_rsc_vld_1;
    assign out_adr = indexer_we_adapter_0_out_to_ref_ADDR;
    assign out_adr_1 = indexer_we_adapter_1_out_to_top_border_ADDR;
    assign out_adr_10 = indexer_we_adapter_10_out_to_cu_info1_hor_top_ADDR;
    assign out_adr_11 = indexer_we_adapter_11_out_to_cu_info1_ver_btm_ADDR;
    assign out_adr_12 = indexer_we_adapter_12_out_to_cu_info1_ver_top_ADDR;
    assign out_adr_13 = indexer_we_adapter_13_out_to_cu_info2_hor_btm_ADDR;
    assign out_adr_14 = indexer_we_adapter_14_out_to_cu_info2_hor_top_ADDR;
    assign out_adr_15 = indexer_we_adapter_15_out_to_cu_info2_ver_btm_ADDR;
    assign out_adr_16 = indexer_we_adapter_16_out_to_cu_info2_ver_top_ADDR;
    assign out_adr_2 = indexer_we_adapter_2_out_to_left_border_ADDR;
    assign out_adr_3 = indexer_we_adapter_3_out_to_cu_info_hor_ADDR;
    assign out_adr_4 = indexer_we_adapter_4_out_to_cu_info_ver_ADDR;
    assign out_adr_5 = indexer_we_adapter_5_out_to_cabac_ADDR;
    assign out_adr_6 = indexer_we_adapter_6_out_to_cabac_metas_pull_btm_ADDR;
    assign out_adr_7 = indexer_we_adapter_7_out_to_cabac_metas_pull_top_ADDR;
    assign out_adr_8 = indexer_we_adapter_8_out_to_cu_info_hor_str_ADDR;
    assign out_adr_9 = indexer_we_adapter_9_out_to_cu_info1_hor_btm_ADDR;
    assign out_byte_enable = indexer_we_adapter_0_out_to_ref_BYTEEN;
    assign out_byte_enable_1 = indexer_we_adapter_1_out_to_top_border_BYTEEN;
    assign out_byte_enable_10 = indexer_we_adapter_10_out_to_cu_info1_hor_top_BYTEEN;
    assign out_byte_enable_11 = indexer_we_adapter_11_out_to_cu_info1_ver_btm_BYTEEN;
    assign out_byte_enable_12 = indexer_we_adapter_12_out_to_cu_info1_ver_top_BYTEEN;
    assign out_byte_enable_13 = indexer_we_adapter_13_out_to_cu_info2_hor_btm_BYTEEN;
    assign out_byte_enable_14 = indexer_we_adapter_14_out_to_cu_info2_hor_top_BYTEEN;
    assign out_byte_enable_15 = indexer_we_adapter_15_out_to_cu_info2_ver_btm_BYTEEN;
    assign out_byte_enable_16 = indexer_we_adapter_16_out_to_cu_info2_ver_top_BYTEEN;
    assign out_byte_enable_2 = indexer_we_adapter_2_out_to_left_border_BYTEEN;
    assign out_byte_enable_3 = indexer_we_adapter_3_out_to_cu_info_hor_BYTEEN;
    assign out_byte_enable_4 = indexer_we_adapter_4_out_to_cu_info_ver_BYTEEN;
    assign out_byte_enable_5 = indexer_we_adapter_5_out_to_cabac_BYTEEN;
    assign out_byte_enable_6 = indexer_we_adapter_6_out_to_cabac_metas_pull_btm_BYTEEN;
    assign out_byte_enable_7 = indexer_we_adapter_7_out_to_cabac_metas_pull_top_BYTEEN;
    assign out_byte_enable_8 = indexer_we_adapter_8_out_to_cu_info_hor_str_BYTEEN;
    assign out_byte_enable_9 = indexer_we_adapter_9_out_to_cu_info1_hor_btm_BYTEEN;
    assign out_d = indexer_we_adapter_0_out_to_ref_WDATA;
    assign out_d_1 = indexer_we_adapter_1_out_to_top_border_WDATA;
    assign out_d_10 = indexer_we_adapter_10_out_to_cu_info1_hor_top_WDATA;
    assign out_d_11 = indexer_we_adapter_11_out_to_cu_info1_ver_btm_WDATA;
    assign out_d_12 = indexer_we_adapter_12_out_to_cu_info1_ver_top_WDATA;
    assign out_d_13 = indexer_we_adapter_13_out_to_cu_info2_hor_btm_WDATA;
    assign out_d_14 = indexer_we_adapter_14_out_to_cu_info2_hor_top_WDATA;
    assign out_d_15 = indexer_we_adapter_15_out_to_cu_info2_ver_btm_WDATA;
    assign out_d_16 = indexer_we_adapter_16_out_to_cu_info2_ver_top_WDATA;
    assign out_d_2 = indexer_we_adapter_2_out_to_left_border_WDATA;
    assign out_d_3 = indexer_we_adapter_3_out_to_cu_info_hor_WDATA;
    assign out_d_4 = indexer_we_adapter_4_out_to_cu_info_ver_WDATA;
    assign out_d_5 = indexer_we_adapter_5_out_to_cabac_WDATA;
    assign out_d_6 = indexer_we_adapter_6_out_to_cabac_metas_pull_btm_WDATA;
    assign out_d_7 = indexer_we_adapter_7_out_to_cabac_metas_pull_top_WDATA;
    assign out_d_8 = indexer_we_adapter_8_out_to_cu_info_hor_str_WDATA;
    assign out_d_9 = indexer_we_adapter_9_out_to_cu_info1_hor_btm_WDATA;
    assign out_we = indexer_we_adapter_0_out_to_ref_WREN;
    assign out_we_1 = indexer_we_adapter_1_out_to_top_border_WREN;
    assign out_we_10 = indexer_we_adapter_10_out_to_cu_info1_hor_top_WREN;
    assign out_we_11 = indexer_we_adapter_11_out_to_cu_info1_ver_btm_WREN;
    assign out_we_12 = indexer_we_adapter_12_out_to_cu_info1_ver_top_WREN;
    assign out_we_13 = indexer_we_adapter_13_out_to_cu_info2_hor_btm_WREN;
    assign out_we_14 = indexer_we_adapter_14_out_to_cu_info2_hor_top_WREN;
    assign out_we_15 = indexer_we_adapter_15_out_to_cu_info2_ver_btm_WREN;
    assign out_we_16 = indexer_we_adapter_16_out_to_cu_info2_ver_top_WREN;
    assign out_we_2 = indexer_we_adapter_2_out_to_left_border_WREN;
    assign out_we_3 = indexer_we_adapter_3_out_to_cu_info_hor_WREN;
    assign out_we_4 = indexer_we_adapter_4_out_to_cu_info_ver_WREN;
    assign out_we_5 = indexer_we_adapter_5_out_to_cabac_WREN;
    assign out_we_6 = indexer_we_adapter_6_out_to_cabac_metas_pull_btm_WREN;
    assign out_we_7 = indexer_we_adapter_7_out_to_cabac_metas_pull_top_WREN;
    assign out_we_8 = indexer_we_adapter_8_out_to_cu_info_hor_str_WREN;
    assign out_we_9 = indexer_we_adapter_9_out_to_cu_info1_hor_btm_WREN;
    assign rec_rsc_adr = indexer_core_rec_to_rec_ADDR;
    assign rec_rsc_d = indexer_core_rec_to_rec_WDATA;
    assign indexer_core_rec_to_rec_RDATA = rec_rsc_q;
    assign rec_rsc_we = indexer_core_rec_to_rec_WREN;

    // indexer_core assignments:
    assign indexer_core_arst_n = indexer_core_arst_n_to_arst_n_arst_n;
    assign indexer_core_bitstream_btm_to_bitstream_btm_ADDR = indexer_core_bitstream_last_data_rsc_adr;
    assign indexer_core_bitstream_btm_to_bitstream_btm_WDATA = indexer_core_bitstream_last_data_rsc_d;
    assign indexer_core_bitstream_last_data_rsc_q = indexer_core_bitstream_btm_to_bitstream_btm_RDATA;
    assign indexer_core_bitstream_btm_to_bitstream_btm_WREN = indexer_core_bitstream_last_data_rsc_we;
    assign indexer_core_bitstream_top_to_bitstream_top_ADDR = indexer_core_bitstream_last_data_top_rsc_adr;
    assign indexer_core_bitstream_top_to_bitstream_top_WDATA = indexer_core_bitstream_last_data_top_rsc_d;
    assign indexer_core_bitstream_last_data_top_rsc_q = indexer_core_bitstream_top_to_bitstream_top_RDATA;
    assign indexer_core_bitstream_top_to_bitstream_top_WREN = indexer_core_bitstream_last_data_top_rsc_we;
    assign indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_ADDR = indexer_core_cabac_metas2_rsc_adr;
    assign indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_WDATA = indexer_core_cabac_metas2_rsc_d;
    assign indexer_core_cabac_metas2_rsc_q = indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_RDATA;
    assign indexer_core_cabac_metas_push_btm_to_cabac_metas_push_btm_WREN = indexer_core_cabac_metas2_rsc_we;
    assign indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_ADDR = indexer_core_cabac_metas2_top_rsc_adr;
    assign indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_WDATA = indexer_core_cabac_metas2_top_rsc_d;
    assign indexer_core_cabac_metas2_top_rsc_q = indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_RDATA;
    assign indexer_core_cabac_metas_push_top_to_cabac_metas_push_top_WREN = indexer_core_cabac_metas2_top_rsc_we;
    assign indexer_core_cabac_states_btm_to_cabac_states_btm_ADDR = indexer_core_cabac_states_rsc_adr;
    assign indexer_core_cabac_states_btm_to_cabac_states_btm_WDATA = indexer_core_cabac_states_rsc_d;
    assign indexer_core_cabac_states_rsc_q = indexer_core_cabac_states_btm_to_cabac_states_btm_RDATA;
    assign indexer_core_cabac_states_btm_to_cabac_states_btm_WREN = indexer_core_cabac_states_rsc_we;
    assign indexer_core_cabac_states_top_to_cabac_states_top_ADDR = indexer_core_cabac_states_top_rsc_adr;
    assign indexer_core_cabac_states_top_to_cabac_states_top_WDATA = indexer_core_cabac_states_top_rsc_d;
    assign indexer_core_cabac_states_top_rsc_q = indexer_core_cabac_states_top_to_cabac_states_top_RDATA;
    assign indexer_core_cabac_states_top_to_cabac_states_top_WREN = indexer_core_cabac_states_top_rsc_we;
    assign indexer_core_clk = indexer_core_clk_to_clk_CLK;
    assign indexer_core_cu_info_to_cu_info_ADDR = indexer_core_cu_info_rsc_adr;
    assign indexer_core_cu_info_to_cu_info_WDATA = indexer_core_cu_info_rsc_d;
    assign indexer_core_cu_info_rsc_q = indexer_core_cu_info_to_cu_info_RDATA;
    assign indexer_core_cu_info_to_cu_info_WREN = indexer_core_cu_info_rsc_we;
    assign indexer_core_data_in_rsc_dat = indexer_core_data_in_to_data_in_DAT;
    assign indexer_core_data_in_to_data_in_RDY = indexer_core_data_in_rsc_rdy;
    assign indexer_core_data_in_rsc_vld = indexer_core_data_in_to_data_in_VLD;
    assign indexer_core_data_out_to_data_out_DAT = indexer_core_data_out_rsc_dat;
    assign indexer_core_data_out_rsc_rdy = indexer_core_data_out_to_data_out_RDY;
    assign indexer_core_data_out_to_data_out_VLD = indexer_core_data_out_rsc_vld;
    assign indexer_core_data_req_rsc_dat = indexer_core_data_req_to_bus_DAT;
    assign indexer_core_data_req_to_bus_RDY = indexer_core_data_req_rsc_rdy;
    assign indexer_core_data_req_rsc_vld = indexer_core_data_req_to_bus_VLD;
    assign indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR = indexer_core_mem_out_btm_top_rsc_adr;
    assign indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA = indexer_core_mem_out_btm_top_rsc_d;
    assign indexer_core_mem_out_btm_top_rsc_q = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_RDATA;
    assign indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN = indexer_core_mem_out_btm_top_rsc_we;
    assign indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR = indexer_core_mem_out_rsc_adr;
    assign indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA = indexer_core_mem_out_rsc_d;
    assign indexer_core_mem_out_rsc_q = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_RDATA;
    assign indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN = indexer_core_mem_out_rsc_we;
    assign indexer_core_rec_to_rec_ADDR = indexer_core_rec_rsc_adr;
    assign indexer_core_rec_to_rec_WDATA = indexer_core_rec_rsc_d;
    assign indexer_core_rec_rsc_q = indexer_core_rec_to_rec_RDATA;
    assign indexer_core_rec_to_rec_WREN = indexer_core_rec_rsc_we;
    // indexer_we_adapter_0 assignments:
    assign indexer_we_adapter_0_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_0_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_0_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_0_out_to_ref_ADDR = indexer_we_adapter_0_out_adr;
    assign indexer_we_adapter_0_out_to_ref_BYTEEN = indexer_we_adapter_0_out_byte_enable;
    assign indexer_we_adapter_0_out_to_ref_WDATA = indexer_we_adapter_0_out_d;
    assign indexer_we_adapter_0_out_to_ref_WREN = indexer_we_adapter_0_out_we;
    // indexer_we_adapter_1 assignments:
    assign indexer_we_adapter_1_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_1_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_1_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_1_out_to_top_border_ADDR = indexer_we_adapter_1_out_adr;
    assign indexer_we_adapter_1_out_to_top_border_BYTEEN = indexer_we_adapter_1_out_byte_enable;
    assign indexer_we_adapter_1_out_to_top_border_WDATA = indexer_we_adapter_1_out_d;
    assign indexer_we_adapter_1_out_to_top_border_WREN = indexer_we_adapter_1_out_we;
    // indexer_we_adapter_10 assignments:
    assign indexer_we_adapter_10_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_10_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_10_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_10_out_to_cu_info1_hor_top_ADDR = indexer_we_adapter_10_out_adr;
    assign indexer_we_adapter_10_out_to_cu_info1_hor_top_BYTEEN = indexer_we_adapter_10_out_byte_enable;
    assign indexer_we_adapter_10_out_to_cu_info1_hor_top_WDATA = indexer_we_adapter_10_out_d;
    assign indexer_we_adapter_10_out_to_cu_info1_hor_top_WREN = indexer_we_adapter_10_out_we;
    // indexer_we_adapter_11 assignments:
    assign indexer_we_adapter_11_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_11_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_11_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_11_out_to_cu_info1_ver_btm_ADDR = indexer_we_adapter_11_out_adr;
    assign indexer_we_adapter_11_out_to_cu_info1_ver_btm_BYTEEN = indexer_we_adapter_11_out_byte_enable;
    assign indexer_we_adapter_11_out_to_cu_info1_ver_btm_WDATA = indexer_we_adapter_11_out_d;
    assign indexer_we_adapter_11_out_to_cu_info1_ver_btm_WREN = indexer_we_adapter_11_out_we;
    // indexer_we_adapter_12 assignments:
    assign indexer_we_adapter_12_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_12_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_12_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_12_out_to_cu_info1_ver_top_ADDR = indexer_we_adapter_12_out_adr;
    assign indexer_we_adapter_12_out_to_cu_info1_ver_top_BYTEEN = indexer_we_adapter_12_out_byte_enable;
    assign indexer_we_adapter_12_out_to_cu_info1_ver_top_WDATA = indexer_we_adapter_12_out_d;
    assign indexer_we_adapter_12_out_to_cu_info1_ver_top_WREN = indexer_we_adapter_12_out_we;
    // indexer_we_adapter_13 assignments:
    assign indexer_we_adapter_13_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_13_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_13_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_13_out_to_cu_info2_hor_btm_ADDR = indexer_we_adapter_13_out_adr;
    assign indexer_we_adapter_13_out_to_cu_info2_hor_btm_BYTEEN = indexer_we_adapter_13_out_byte_enable;
    assign indexer_we_adapter_13_out_to_cu_info2_hor_btm_WDATA = indexer_we_adapter_13_out_d;
    assign indexer_we_adapter_13_out_to_cu_info2_hor_btm_WREN = indexer_we_adapter_13_out_we;
    // indexer_we_adapter_14 assignments:
    assign indexer_we_adapter_14_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_14_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_14_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_14_out_to_cu_info2_hor_top_ADDR = indexer_we_adapter_14_out_adr;
    assign indexer_we_adapter_14_out_to_cu_info2_hor_top_BYTEEN = indexer_we_adapter_14_out_byte_enable;
    assign indexer_we_adapter_14_out_to_cu_info2_hor_top_WDATA = indexer_we_adapter_14_out_d;
    assign indexer_we_adapter_14_out_to_cu_info2_hor_top_WREN = indexer_we_adapter_14_out_we;
    // indexer_we_adapter_15 assignments:
    assign indexer_we_adapter_15_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_15_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_15_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_15_out_to_cu_info2_ver_btm_ADDR = indexer_we_adapter_15_out_adr;
    assign indexer_we_adapter_15_out_to_cu_info2_ver_btm_BYTEEN = indexer_we_adapter_15_out_byte_enable;
    assign indexer_we_adapter_15_out_to_cu_info2_ver_btm_WDATA = indexer_we_adapter_15_out_d;
    assign indexer_we_adapter_15_out_to_cu_info2_ver_btm_WREN = indexer_we_adapter_15_out_we;
    // indexer_we_adapter_16 assignments:
    assign indexer_we_adapter_16_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_16_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_16_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_16_out_to_cu_info2_ver_top_ADDR = indexer_we_adapter_16_out_adr;
    assign indexer_we_adapter_16_out_to_cu_info2_ver_top_BYTEEN = indexer_we_adapter_16_out_byte_enable;
    assign indexer_we_adapter_16_out_to_cu_info2_ver_top_WDATA = indexer_we_adapter_16_out_d;
    assign indexer_we_adapter_16_out_to_cu_info2_ver_top_WREN = indexer_we_adapter_16_out_we;
    // indexer_we_adapter_2 assignments:
    assign indexer_we_adapter_2_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_2_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_2_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_2_out_to_left_border_ADDR = indexer_we_adapter_2_out_adr;
    assign indexer_we_adapter_2_out_to_left_border_BYTEEN = indexer_we_adapter_2_out_byte_enable;
    assign indexer_we_adapter_2_out_to_left_border_WDATA = indexer_we_adapter_2_out_d;
    assign indexer_we_adapter_2_out_to_left_border_WREN = indexer_we_adapter_2_out_we;
    // indexer_we_adapter_3 assignments:
    assign indexer_we_adapter_3_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_3_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_3_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_3_out_to_cu_info_hor_ADDR = indexer_we_adapter_3_out_adr;
    assign indexer_we_adapter_3_out_to_cu_info_hor_BYTEEN = indexer_we_adapter_3_out_byte_enable;
    assign indexer_we_adapter_3_out_to_cu_info_hor_WDATA = indexer_we_adapter_3_out_d;
    assign indexer_we_adapter_3_out_to_cu_info_hor_WREN = indexer_we_adapter_3_out_we;
    // indexer_we_adapter_4 assignments:
    assign indexer_we_adapter_4_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_4_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_4_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_4_out_to_cu_info_ver_ADDR = indexer_we_adapter_4_out_adr;
    assign indexer_we_adapter_4_out_to_cu_info_ver_BYTEEN = indexer_we_adapter_4_out_byte_enable;
    assign indexer_we_adapter_4_out_to_cu_info_ver_WDATA = indexer_we_adapter_4_out_d;
    assign indexer_we_adapter_4_out_to_cu_info_ver_WREN = indexer_we_adapter_4_out_we;
    // indexer_we_adapter_5 assignments:
    assign indexer_we_adapter_5_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_5_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_5_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_5_out_to_cabac_ADDR = indexer_we_adapter_5_out_adr;
    assign indexer_we_adapter_5_out_to_cabac_BYTEEN = indexer_we_adapter_5_out_byte_enable;
    assign indexer_we_adapter_5_out_to_cabac_WDATA = indexer_we_adapter_5_out_d;
    assign indexer_we_adapter_5_out_to_cabac_WREN = indexer_we_adapter_5_out_we;
    // indexer_we_adapter_6 assignments:
    assign indexer_we_adapter_6_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_6_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_6_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_6_out_to_cabac_metas_pull_btm_ADDR = indexer_we_adapter_6_out_adr;
    assign indexer_we_adapter_6_out_to_cabac_metas_pull_btm_BYTEEN = indexer_we_adapter_6_out_byte_enable;
    assign indexer_we_adapter_6_out_to_cabac_metas_pull_btm_WDATA = indexer_we_adapter_6_out_d;
    assign indexer_we_adapter_6_out_to_cabac_metas_pull_btm_WREN = indexer_we_adapter_6_out_we;
    // indexer_we_adapter_7 assignments:
    assign indexer_we_adapter_7_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_7_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_7_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_7_out_to_cabac_metas_pull_top_ADDR = indexer_we_adapter_7_out_adr;
    assign indexer_we_adapter_7_out_to_cabac_metas_pull_top_BYTEEN = indexer_we_adapter_7_out_byte_enable;
    assign indexer_we_adapter_7_out_to_cabac_metas_pull_top_WDATA = indexer_we_adapter_7_out_d;
    assign indexer_we_adapter_7_out_to_cabac_metas_pull_top_WREN = indexer_we_adapter_7_out_we;
    // indexer_we_adapter_8 assignments:
    assign indexer_we_adapter_8_in_adr = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_ADDR;
    assign indexer_we_adapter_8_in_d = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WDATA;
    assign indexer_we_adapter_8_in_we = indexer_core_mem_out_top_to_indexer_we_adapter_0_in_WREN;
    assign indexer_we_adapter_8_out_to_cu_info_hor_str_ADDR = indexer_we_adapter_8_out_adr;
    assign indexer_we_adapter_8_out_to_cu_info_hor_str_BYTEEN = indexer_we_adapter_8_out_byte_enable;
    assign indexer_we_adapter_8_out_to_cu_info_hor_str_WDATA = indexer_we_adapter_8_out_d;
    assign indexer_we_adapter_8_out_to_cu_info_hor_str_WREN = indexer_we_adapter_8_out_we;
    // indexer_we_adapter_9 assignments:
    assign indexer_we_adapter_9_in_adr = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_ADDR;
    assign indexer_we_adapter_9_in_d = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WDATA[131:0];
    assign indexer_we_adapter_9_in_we = indexer_core_mem_out_btm_top_to_indexer_we_adapter_9_in_WREN;
    assign indexer_we_adapter_9_out_to_cu_info1_hor_btm_ADDR = indexer_we_adapter_9_out_adr;
    assign indexer_we_adapter_9_out_to_cu_info1_hor_btm_BYTEEN = indexer_we_adapter_9_out_byte_enable;
    assign indexer_we_adapter_9_out_to_cu_info1_hor_btm_WDATA = indexer_we_adapter_9_out_d;
    assign indexer_we_adapter_9_out_to_cu_info1_hor_btm_WREN = indexer_we_adapter_9_out_we;

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_core:1.0
    main_indexer_top indexer_core(
        // Interface: arst_n
        .arst_n              (indexer_core_arst_n),
        // Interface: bitstream_btm
        .bitstream_last_data_rsc_q(indexer_core_bitstream_last_data_rsc_q),
        .bitstream_last_data_rsc_adr(indexer_core_bitstream_last_data_rsc_adr),
        .bitstream_last_data_rsc_d(indexer_core_bitstream_last_data_rsc_d),
        .bitstream_last_data_rsc_we(indexer_core_bitstream_last_data_rsc_we),
        // Interface: bitstream_top
        .bitstream_last_data_top_rsc_q(indexer_core_bitstream_last_data_top_rsc_q),
        .bitstream_last_data_top_rsc_adr(indexer_core_bitstream_last_data_top_rsc_adr),
        .bitstream_last_data_top_rsc_d(indexer_core_bitstream_last_data_top_rsc_d),
        .bitstream_last_data_top_rsc_we(indexer_core_bitstream_last_data_top_rsc_we),
        // Interface: cabac_metas_push_btm
        .cabac_metas2_rsc_q  (indexer_core_cabac_metas2_rsc_q),
        .cabac_metas2_rsc_adr(indexer_core_cabac_metas2_rsc_adr),
        .cabac_metas2_rsc_d  (indexer_core_cabac_metas2_rsc_d),
        .cabac_metas2_rsc_we (indexer_core_cabac_metas2_rsc_we),
        // Interface: cabac_metas_push_top
        .cabac_metas2_top_rsc_q(indexer_core_cabac_metas2_top_rsc_q),
        .cabac_metas2_top_rsc_adr(indexer_core_cabac_metas2_top_rsc_adr),
        .cabac_metas2_top_rsc_d(indexer_core_cabac_metas2_top_rsc_d),
        .cabac_metas2_top_rsc_we(indexer_core_cabac_metas2_top_rsc_we),
        // Interface: cabac_states_btm
        .cabac_states_rsc_q  (indexer_core_cabac_states_rsc_q),
        .cabac_states_rsc_adr(indexer_core_cabac_states_rsc_adr),
        .cabac_states_rsc_d  (indexer_core_cabac_states_rsc_d),
        .cabac_states_rsc_we (indexer_core_cabac_states_rsc_we),
        // Interface: cabac_states_top
        .cabac_states_top_rsc_q(indexer_core_cabac_states_top_rsc_q),
        .cabac_states_top_rsc_adr(indexer_core_cabac_states_top_rsc_adr),
        .cabac_states_top_rsc_d(indexer_core_cabac_states_top_rsc_d),
        .cabac_states_top_rsc_we(indexer_core_cabac_states_top_rsc_we),
        // Interface: clk
        .clk                 (indexer_core_clk),
        // Interface: cu_info
        .cu_info_rsc_q       (indexer_core_cu_info_rsc_q),
        .cu_info_rsc_adr     (indexer_core_cu_info_rsc_adr),
        .cu_info_rsc_d       (indexer_core_cu_info_rsc_d),
        .cu_info_rsc_we      (indexer_core_cu_info_rsc_we),
        // Interface: data_in
        .data_in_rsc_dat     (indexer_core_data_in_rsc_dat),
        .data_in_rsc_vld     (indexer_core_data_in_rsc_vld),
        .data_in_rsc_rdy     (indexer_core_data_in_rsc_rdy),
        // Interface: data_out
        .data_out_rsc_rdy    (indexer_core_data_out_rsc_rdy),
        .data_out_rsc_dat    (indexer_core_data_out_rsc_dat),
        .data_out_rsc_vld    (indexer_core_data_out_rsc_vld),
        // Interface: data_req
        .data_req_rsc_dat    (indexer_core_data_req_rsc_dat),
        .data_req_rsc_vld    (indexer_core_data_req_rsc_vld),
        .data_req_rsc_rdy    (indexer_core_data_req_rsc_rdy),
        // Interface: mem_out_btm_top
        .mem_out_btm_top_rsc_q(indexer_core_mem_out_btm_top_rsc_q),
        .mem_out_btm_top_rsc_adr(indexer_core_mem_out_btm_top_rsc_adr),
        .mem_out_btm_top_rsc_d(indexer_core_mem_out_btm_top_rsc_d),
        .mem_out_btm_top_rsc_we(indexer_core_mem_out_btm_top_rsc_we),
        // Interface: mem_out_top
        .mem_out_rsc_q       (indexer_core_mem_out_rsc_q),
        .mem_out_rsc_adr     (indexer_core_mem_out_rsc_adr),
        .mem_out_rsc_d       (indexer_core_mem_out_rsc_d),
        .mem_out_rsc_we      (indexer_core_mem_out_rsc_we),
        // Interface: rec
        .rec_rsc_q           (indexer_core_rec_rsc_q),
        .rec_rsc_adr         (indexer_core_rec_rsc_adr),
        .rec_rsc_d           (indexer_core_rec_rsc_d),
        .rec_rsc_we          (indexer_core_rec_rsc_we));

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (128))
    indexer_we_adapter_0(
        // Interface: in
        .in_adr              (indexer_we_adapter_0_in_adr),
        .in_d                (indexer_we_adapter_0_in_d),
        .in_we               (indexer_we_adapter_0_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_0_out_adr),
        .out_byte_enable     (indexer_we_adapter_0_out_byte_enable),
        .out_d               (indexer_we_adapter_0_out_d),
        .out_we              (indexer_we_adapter_0_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (129))
    indexer_we_adapter_1(
        // Interface: in
        .in_adr              (indexer_we_adapter_1_in_adr),
        .in_d                (indexer_we_adapter_1_in_d),
        .in_we               (indexer_we_adapter_1_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_1_out_adr),
        .out_byte_enable     (indexer_we_adapter_1_out_byte_enable),
        .out_d               (indexer_we_adapter_1_out_d),
        .out_we              (indexer_we_adapter_1_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (131))
    indexer_we_adapter_10(
        // Interface: in
        .in_adr              (indexer_we_adapter_10_in_adr),
        .in_d                (indexer_we_adapter_10_in_d),
        .in_we               (indexer_we_adapter_10_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_10_out_adr),
        .out_byte_enable     (indexer_we_adapter_10_out_byte_enable),
        .out_d               (indexer_we_adapter_10_out_d),
        .out_we              (indexer_we_adapter_10_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (128))
    indexer_we_adapter_11(
        // Interface: in
        .in_adr              (indexer_we_adapter_11_in_adr),
        .in_d                (indexer_we_adapter_11_in_d),
        .in_we               (indexer_we_adapter_11_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_11_out_adr),
        .out_byte_enable     (indexer_we_adapter_11_out_byte_enable),
        .out_d               (indexer_we_adapter_11_out_d),
        .out_we              (indexer_we_adapter_11_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (129))
    indexer_we_adapter_12(
        // Interface: in
        .in_adr              (indexer_we_adapter_12_in_adr),
        .in_d                (indexer_we_adapter_12_in_d),
        .in_we               (indexer_we_adapter_12_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_12_out_adr),
        .out_byte_enable     (indexer_we_adapter_12_out_byte_enable),
        .out_d               (indexer_we_adapter_12_out_d),
        .out_we              (indexer_we_adapter_12_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (130))
    indexer_we_adapter_13(
        // Interface: in
        .in_adr              (indexer_we_adapter_13_in_adr),
        .in_d                (indexer_we_adapter_13_in_d),
        .in_we               (indexer_we_adapter_13_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_13_out_adr),
        .out_byte_enable     (indexer_we_adapter_13_out_byte_enable),
        .out_d               (indexer_we_adapter_13_out_d),
        .out_we              (indexer_we_adapter_13_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (131))
    indexer_we_adapter_14(
        // Interface: in
        .in_adr              (indexer_we_adapter_14_in_adr),
        .in_d                (indexer_we_adapter_14_in_d),
        .in_we               (indexer_we_adapter_14_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_14_out_adr),
        .out_byte_enable     (indexer_we_adapter_14_out_byte_enable),
        .out_d               (indexer_we_adapter_14_out_d),
        .out_we              (indexer_we_adapter_14_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (128))
    indexer_we_adapter_15(
        // Interface: in
        .in_adr              (indexer_we_adapter_15_in_adr),
        .in_d                (indexer_we_adapter_15_in_d),
        .in_we               (indexer_we_adapter_15_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_15_out_adr),
        .out_byte_enable     (indexer_we_adapter_15_out_byte_enable),
        .out_d               (indexer_we_adapter_15_out_d),
        .out_we              (indexer_we_adapter_15_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (129))
    indexer_we_adapter_16(
        // Interface: in
        .in_adr              (indexer_we_adapter_16_in_adr),
        .in_d                (indexer_we_adapter_16_in_d),
        .in_we               (indexer_we_adapter_16_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_16_out_adr),
        .out_byte_enable     (indexer_we_adapter_16_out_byte_enable),
        .out_d               (indexer_we_adapter_16_out_d),
        .out_we              (indexer_we_adapter_16_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (130))
    indexer_we_adapter_2(
        // Interface: in
        .in_adr              (indexer_we_adapter_2_in_adr),
        .in_d                (indexer_we_adapter_2_in_d),
        .in_we               (indexer_we_adapter_2_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_2_out_adr),
        .out_byte_enable     (indexer_we_adapter_2_out_byte_enable),
        .out_d               (indexer_we_adapter_2_out_d),
        .out_we              (indexer_we_adapter_2_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (132))
    indexer_we_adapter_3(
        // Interface: in
        .in_adr              (indexer_we_adapter_3_in_adr),
        .in_d                (indexer_we_adapter_3_in_d),
        .in_we               (indexer_we_adapter_3_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_3_out_adr),
        .out_byte_enable     (indexer_we_adapter_3_out_byte_enable),
        .out_d               (indexer_we_adapter_3_out_d),
        .out_we              (indexer_we_adapter_3_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (131))
    indexer_we_adapter_4(
        // Interface: in
        .in_adr              (indexer_we_adapter_4_in_adr),
        .in_d                (indexer_we_adapter_4_in_d),
        .in_we               (indexer_we_adapter_4_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_4_out_adr),
        .out_byte_enable     (indexer_we_adapter_4_out_byte_enable),
        .out_d               (indexer_we_adapter_4_out_d),
        .out_we              (indexer_we_adapter_4_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (134))
    indexer_we_adapter_5(
        // Interface: in
        .in_adr              (indexer_we_adapter_5_in_adr),
        .in_d                (indexer_we_adapter_5_in_d),
        .in_we               (indexer_we_adapter_5_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_5_out_adr),
        .out_byte_enable     (indexer_we_adapter_5_out_byte_enable),
        .out_d               (indexer_we_adapter_5_out_d),
        .out_we              (indexer_we_adapter_5_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (135))
    indexer_we_adapter_6(
        // Interface: in
        .in_adr              (indexer_we_adapter_6_in_adr),
        .in_d                (indexer_we_adapter_6_in_d),
        .in_we               (indexer_we_adapter_6_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_6_out_adr),
        .out_byte_enable     (indexer_we_adapter_6_out_byte_enable),
        .out_d               (indexer_we_adapter_6_out_d),
        .out_we              (indexer_we_adapter_6_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (136))
    indexer_we_adapter_7(
        // Interface: in
        .in_adr              (indexer_we_adapter_7_in_adr),
        .in_d                (indexer_we_adapter_7_in_d),
        .in_we               (indexer_we_adapter_7_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_7_out_adr),
        .out_byte_enable     (indexer_we_adapter_7_out_byte_enable),
        .out_d               (indexer_we_adapter_7_out_d),
        .out_we              (indexer_we_adapter_7_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (9),
        .DATA_WIDTH          (128),
        .WE_SELECT           (133))
    indexer_we_adapter_8(
        // Interface: in
        .in_adr              (indexer_we_adapter_8_in_adr),
        .in_d                (indexer_we_adapter_8_in_d),
        .in_we               (indexer_we_adapter_8_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_8_out_adr),
        .out_byte_enable     (indexer_we_adapter_8_out_byte_enable),
        .out_d               (indexer_we_adapter_8_out_d),
        .out_we              (indexer_we_adapter_8_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:indexer_we_adapter:1.0
    Indexer_we_adapter #(
        .ADDR_WIDTH          (13),
        .WRITE_ENABLES       (4),
        .DATA_WIDTH          (128),
        .WE_SELECT           (130))
    indexer_we_adapter_9(
        // Interface: in
        .in_adr              (indexer_we_adapter_9_in_adr),
        .in_d                (indexer_we_adapter_9_in_d),
        .in_we               (indexer_we_adapter_9_in_we),
        // Interface: out
        .out_adr             (indexer_we_adapter_9_out_adr),
        .out_byte_enable     (indexer_we_adapter_9_out_byte_enable),
        .out_d               (indexer_we_adapter_9_out_d),
        .out_we              (indexer_we_adapter_9_out_we),
        // These ports are not in any interface
        .out_q               (),
        .in_q                ());


endmodule
