
module intra_prediction_0(
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: clk_base
    input                               clk_base,

    // Interface: ip_config_in
    input                [87:0]         d,
    input                               d_vld,
    output                              d_rdy,

    // Interface: lcu_ref_rsc
    input                [31:0]         lcu_ref_rsc_q,
    output               [14:0]         lcu_ref_rsc_adr,
    output               [31:0]         lcu_ref_rsc_d,
    output                              lcu_ref_rsc_we,

    // Interface: pred_out_rsc
    input                               pred_out_rsc_rdy,
    output               [255:0]        pred_out_rsc_dat,
    output                              pred_out_rsc_vld,

    // Interface: ref_out_rsc
    input                               ref_out_rsc_rdy,
    output               [255:0]        ref_out_rsc_dat,
    output                              ref_out_rsc_vld,

    // Interface: resid_out_rsc
    input                               resid_out_rsc_rdy,
    output               [287:0]        resid_out_rsc_dat,
    output                              resid_out_rsc_vld
);

    // sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc wires:
    wire [63:0] sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_DAT;
    wire       sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_RDY;
    wire       sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_VLD;
    // sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in wires:
    wire [7:0] sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_DAT;
    wire       sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_RDY;
    wire       sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_VLD;
    // ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc wires:
    wire [19:0] ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_DAT;
    wire       ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_RDY;
    wire       ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_VLD;
    // ip_ctrl_ref0_rsc_to_ip_get_planar_ref wires:
    wire [5:0] ip_ctrl_ref0_rsc_to_ip_get_planar_ref_ADDR;
    wire [31:0] ip_ctrl_ref0_rsc_to_ip_get_planar_ref_RDATA;
    wire [31:0] ip_ctrl_ref0_rsc_to_ip_get_planar_ref_WDATA;
    wire       ip_ctrl_ref0_rsc_to_ip_get_planar_ref_WREN;
    // ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc wires:
    wire [12:0] ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_DAT;
    wire       ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_RDY;
    wire       ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_VLD;
    // ip_get_dc_ref_to_ip_ctrl_ref1_rsc wires:
    wire [5:0] ip_get_dc_ref_to_ip_ctrl_ref1_rsc_ADDR;
    wire [31:0] ip_get_dc_ref_to_ip_ctrl_ref1_rsc_RDATA;
    wire [31:0] ip_get_dc_ref_to_ip_ctrl_ref1_rsc_WDATA;
    wire       ip_get_dc_ref_to_ip_ctrl_ref1_rsc_WREN;
    // sad_parallel_in_rsc_0_to_ip_get_planar_pred_out wires:
    wire [31:0] sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_DAT;
    wire       sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_RDY;
    wire       sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_VLD;
    // ip_get_dc_pred_out_to_sad_parallel_in_rsc_1 wires:
    wire [31:0] ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_DAT;
    wire       ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_RDY;
    wire       ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_VLD;
    // ip_get_planar_clk_to_clk wires:
    wire       ip_get_planar_clk_to_clk_CLK;
    // ip_get_planar_arst_n_to_arst_n wires:
    wire       ip_get_planar_arst_n_to_arst_n_arst_n;
    // ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc wires:
    wire [87:0] ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_DAT;
    wire       ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_RDY;
    wire       ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_VLD;
    // ip_config_dc_fifo_data_in_to_ip_config_in wires:
    wire [87:0] ip_config_dc_fifo_data_in_to_ip_config_in_DAT;
    wire       ip_config_dc_fifo_data_in_to_ip_config_in_RDY;
    wire       ip_config_dc_fifo_data_in_to_ip_config_in_VLD;
    // sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc wires:
    wire [63:0] sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_DAT;
    wire       sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_RDY;
    wire       sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_VLD;
    // ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref wires:
    wire [6:0] ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_ADDR;
    wire [31:0] ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_RDATA;
    wire [31:0] ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_WDATA;
    wire       ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_WREN;
    // ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_VLD;
    // ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_VLD;
    // ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref wires:
    wire [6:0] ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_ADDR;
    wire [31:0] ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_RDATA;
    wire [31:0] ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_WDATA;
    wire       ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_WREN;
    // ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_VLD;
    // ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref wires:
    wire [6:0] ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_ADDR;
    wire [31:0] ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_RDATA;
    wire [31:0] ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_WDATA;
    wire       ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_WREN;
    // ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_VLD;
    // ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref wires:
    wire [6:0] ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_ADDR;
    wire [31:0] ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_RDATA;
    wire [31:0] ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_WDATA;
    wire       ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_WREN;
    // ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_VLD;
    // ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc wires:
    wire [6:0] ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_ADDR;
    wire [31:0] ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_RDATA;
    wire [31:0] ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_WDATA;
    wire       ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_WREN;
    // ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_VLD;
    // ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc wires:
    wire [6:0] ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_ADDR;
    wire [31:0] ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_RDATA;
    wire [31:0] ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_WDATA;
    wire       ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_WREN;
    // ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_VLD;
    // ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref wires:
    wire [6:0] ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_ADDR;
    wire [31:0] ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_RDATA;
    wire [31:0] ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_WDATA;
    wire       ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_WREN;
    // ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in wires:
    wire [9:0] ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_DAT;
    wire       ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_RDY;
    wire       ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_VLD;
    // ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc wires:
    wire [6:0] ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_ADDR;
    wire [31:0] ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_RDATA;
    wire [31:0] ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_WDATA;
    wire       ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_WREN;
    // ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in wires:
    wire [12:0] ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_DAT;
    wire       ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_RDY;
    wire       ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_VLD;
    // ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc wires:
    wire [5:0] ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_ADDR;
    wire [31:0] ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_RDATA;
    wire [31:0] ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_WDATA;
    wire       ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_WREN;
    // ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_VLD;
    // ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc wires:
    wire [5:0] ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_ADDR;
    wire [31:0] ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_RDATA;
    wire [31:0] ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_WDATA;
    wire       ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_WREN;
    // ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_VLD;
    // ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc wires:
    wire [5:0] ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_ADDR;
    wire [31:0] ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_RDATA;
    wire [31:0] ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_WDATA;
    wire       ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_WREN;
    // ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_VLD;
    // ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc wires:
    wire [5:0] ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_ADDR;
    wire [31:0] ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_RDATA;
    wire [31:0] ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_WDATA;
    wire       ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_WREN;
    // ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_VLD;
    // ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc wires:
    wire [5:0] ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_ADDR;
    wire [31:0] ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_RDATA;
    wire [31:0] ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_WDATA;
    wire       ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_WREN;
    // ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_VLD;
    // ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc wires:
    wire [5:0] ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_ADDR;
    wire [31:0] ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_RDATA;
    wire [31:0] ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_WDATA;
    wire       ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_WREN;
    // ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_VLD;
    // ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc wires:
    wire [5:0] ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_ADDR;
    wire [31:0] ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_RDATA;
    wire [31:0] ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_WDATA;
    wire       ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_WREN;
    // ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_VLD;
    // ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc wires:
    wire [5:0] ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_ADDR;
    wire [31:0] ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_RDATA;
    wire [31:0] ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_WDATA;
    wire       ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_WREN;
    // ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in wires:
    wire [21:0] ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_DAT;
    wire       ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_RDY;
    wire       ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_VLD;
    // ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc wires:
    wire [5:0] ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_ADDR;
    wire [31:0] ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_RDATA;
    wire [31:0] ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_WDATA;
    wire       ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_WREN;
    // ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2 wires:
    wire [31:0] ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_DAT;
    wire       ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_RDY;
    wire       ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_VLD;
    // sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_DAT;
    wire       sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_RDY;
    wire       sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_VLD;
    // ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33 wires:
    wire [31:0] ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_DAT;
    wire       ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_RDY;
    wire       ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_VLD;
    // sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out wires:
    wire [31:0] sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_DAT;
    wire       sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_RDY;
    wire       sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_VLD;
    // ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4 wires:
    wire [31:0] ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_DAT;
    wire       ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_RDY;
    wire       ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_VLD;
    // sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_DAT;
    wire       sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_RDY;
    wire       sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_VLD;
    // ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5 wires:
    wire [31:0] ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_DAT;
    wire       ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_RDY;
    wire       ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_VLD;
    // sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_DAT;
    wire       sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_RDY;
    wire       sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_VLD;
    // ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6 wires:
    wire [31:0] ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_DAT;
    wire       ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_RDY;
    wire       ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_VLD;
    // sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_DAT;
    wire       sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_RDY;
    wire       sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_VLD;
    // ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7 wires:
    wire [31:0] ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_DAT;
    wire       ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_RDY;
    wire       ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_VLD;
    // sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_DAT;
    wire       sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_RDY;
    wire       sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_VLD;
    // ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8 wires:
    wire [31:0] ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_DAT;
    wire       ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_RDY;
    wire       ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_VLD;
    // sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_DAT;
    wire       sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_RDY;
    wire       sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_VLD;
    // ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9 wires:
    wire [31:0] ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_DAT;
    wire       ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_RDY;
    wire       ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_VLD;
    // sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_DAT;
    wire       sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_RDY;
    wire       sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_VLD;
    // ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10 wires:
    wire [31:0] ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_DAT;
    wire       ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_RDY;
    wire       ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_VLD;
    // sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_DAT;
    wire       sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_RDY;
    wire       sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_VLD;
    // ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11 wires:
    wire [31:0] ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_DAT;
    wire       ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_RDY;
    wire       ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_VLD;
    // sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_DAT;
    wire       sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_RDY;
    wire       sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_VLD;
    // ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12 wires:
    wire [31:0] ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_DAT;
    wire       ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_RDY;
    wire       ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_VLD;
    // sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_DAT;
    wire       sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_RDY;
    wire       sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_VLD;
    // ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13 wires:
    wire [31:0] ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_DAT;
    wire       ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_RDY;
    wire       ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_VLD;
    // sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_DAT;
    wire       sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_RDY;
    wire       sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_VLD;
    // ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14 wires:
    wire [31:0] ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_DAT;
    wire       ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_RDY;
    wire       ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_VLD;
    // sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_DAT;
    wire       sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_RDY;
    wire       sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_VLD;
    // ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16 wires:
    wire [31:0] ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_DAT;
    wire       ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_RDY;
    wire       ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_VLD;
    // sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_DAT;
    wire       sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_RDY;
    wire       sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_VLD;
    // ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17 wires:
    wire [31:0] ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_DAT;
    wire       ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_RDY;
    wire       ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_VLD;
    // sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out wires:
    wire [31:0] sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_DAT;
    wire       sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_RDY;
    wire       sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_VLD;
    // ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18 wires:
    wire [31:0] ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_DAT;
    wire       ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_RDY;
    wire       ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_VLD;
    // sad_parallel_lcu_ref_rsc_to_bus wires:
    wire [14:0] sad_parallel_lcu_ref_rsc_to_bus_ADDR;
    wire [31:0] sad_parallel_lcu_ref_rsc_to_bus_RDATA;
    wire [31:0] sad_parallel_lcu_ref_rsc_to_bus_WDATA;
    wire       sad_parallel_lcu_ref_rsc_to_bus_WREN;
    // sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc wires:
    wire [1152:0] sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_DAT;
    wire       sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_RDY;
    wire       sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_VLD;
    // ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in wires:
    wire [63:0] ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_DAT;
    wire       ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_RDY;
    wire       ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_VLD;
    // pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in wires:
    wire [255:0] pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_DAT;
    wire       pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_RDY;
    wire       pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_VLD;
    // pred_dc_fifo_data_out_to_pred_out_rsc wires:
    wire [255:0] pred_dc_fifo_data_out_to_pred_out_rsc_DAT;
    wire       pred_dc_fifo_data_out_to_pred_out_rsc_RDY;
    wire       pred_dc_fifo_data_out_to_pred_out_rsc_VLD;
    // pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in wires:
    wire [287:0] pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_DAT;
    wire       pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_RDY;
    wire       pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_VLD;
    // resid_dc_fifo_data_out_to_resid_out_rsc wires:
    wire [287:0] resid_dc_fifo_data_out_to_resid_out_rsc_DAT;
    wire       resid_dc_fifo_data_out_to_resid_out_rsc_RDY;
    wire       resid_dc_fifo_data_out_to_resid_out_rsc_VLD;
    // pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in wires:
    wire [255:0] pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_DAT;
    wire       pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_RDY;
    wire       pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_VLD;
    // ref_dc_fifo_data_out_to_ref_out_rsc wires:
    wire [255:0] ref_dc_fifo_data_out_to_ref_out_rsc_DAT;
    wire       ref_dc_fifo_data_out_to_ref_out_rsc_RDY;
    wire       ref_dc_fifo_data_out_to_ref_out_rsc_VLD;
    // ip_config_dc_fifo_in_clk_to_clk_base wires:
    wire       ip_config_dc_fifo_in_clk_to_clk_base_CLK;
    // ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21 wires:
    wire [31:0] ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_DAT;
    wire       ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_RDY;
    wire       ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_VLD;
    // ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15 wires:
    wire [31:0] ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_DAT;
    wire       ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_RDY;
    wire       ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_VLD;

    // ip_config_dc_fifo port wires:
    wire       ip_config_dc_fifo_aclr_n;
    wire [87:0] ip_config_dc_fifo_d;
    wire       ip_config_dc_fifo_d_rdy;
    wire       ip_config_dc_fifo_d_vld;
    wire [87:0] ip_config_dc_fifo_q;
    wire       ip_config_dc_fifo_q_rdy;
    wire       ip_config_dc_fifo_q_vld;
    wire       ip_config_dc_fifo_rclk;
    wire       ip_config_dc_fifo_wclk;
    // ip_ctrl port wires:
    wire [21:0] ip_ctrl_ang_neg_out11_rsc_dat;
    wire       ip_ctrl_ang_neg_out11_rsc_rdy;
    wire       ip_ctrl_ang_neg_out11_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out12_rsc_dat;
    wire       ip_ctrl_ang_neg_out12_rsc_rdy;
    wire       ip_ctrl_ang_neg_out12_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out13_rsc_dat;
    wire       ip_ctrl_ang_neg_out13_rsc_rdy;
    wire       ip_ctrl_ang_neg_out13_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out14_rsc_dat;
    wire       ip_ctrl_ang_neg_out14_rsc_rdy;
    wire       ip_ctrl_ang_neg_out14_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out15_rsc_dat;
    wire       ip_ctrl_ang_neg_out15_rsc_rdy;
    wire       ip_ctrl_ang_neg_out15_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out16_rsc_dat;
    wire       ip_ctrl_ang_neg_out16_rsc_rdy;
    wire       ip_ctrl_ang_neg_out16_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out17_rsc_dat;
    wire       ip_ctrl_ang_neg_out17_rsc_rdy;
    wire       ip_ctrl_ang_neg_out17_rsc_vld;
    wire [21:0] ip_ctrl_ang_neg_out18_rsc_dat;
    wire       ip_ctrl_ang_neg_out18_rsc_rdy;
    wire       ip_ctrl_ang_neg_out18_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out2_rsc_dat;
    wire       ip_ctrl_ang_pos_out2_rsc_rdy;
    wire       ip_ctrl_ang_pos_out2_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out3_rsc_dat;
    wire       ip_ctrl_ang_pos_out3_rsc_rdy;
    wire       ip_ctrl_ang_pos_out3_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out4_rsc_dat;
    wire       ip_ctrl_ang_pos_out4_rsc_rdy;
    wire       ip_ctrl_ang_pos_out4_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out5_rsc_dat;
    wire       ip_ctrl_ang_pos_out5_rsc_rdy;
    wire       ip_ctrl_ang_pos_out5_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out6_rsc_dat;
    wire       ip_ctrl_ang_pos_out6_rsc_rdy;
    wire       ip_ctrl_ang_pos_out6_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out7_rsc_dat;
    wire       ip_ctrl_ang_pos_out7_rsc_rdy;
    wire       ip_ctrl_ang_pos_out7_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out8_rsc_dat;
    wire       ip_ctrl_ang_pos_out8_rsc_rdy;
    wire       ip_ctrl_ang_pos_out8_rsc_vld;
    wire [9:0] ip_ctrl_ang_pos_out9_rsc_dat;
    wire       ip_ctrl_ang_pos_out9_rsc_rdy;
    wire       ip_ctrl_ang_pos_out9_rsc_vld;
    wire [12:0] ip_ctrl_ang_zero_out_rsc_dat;
    wire       ip_ctrl_ang_zero_out_rsc_rdy;
    wire       ip_ctrl_ang_zero_out_rsc_vld;
    wire       ip_ctrl_arst_n;
    wire       ip_ctrl_clk;
    wire [87:0] ip_ctrl_conf_in_rsc_dat;
    wire       ip_ctrl_conf_in_rsc_rdy;
    wire       ip_ctrl_conf_in_rsc_vld;
    wire [12:0] ip_ctrl_dc_out_rsc_dat;
    wire       ip_ctrl_dc_out_rsc_rdy;
    wire       ip_ctrl_dc_out_rsc_vld;
    wire [19:0] ip_ctrl_planar_out_rsc_dat;
    wire       ip_ctrl_planar_out_rsc_rdy;
    wire       ip_ctrl_planar_out_rsc_vld;
    wire [5:0] ip_ctrl_ref0_rsc_adr;
    wire [31:0] ip_ctrl_ref0_rsc_d;
    wire       ip_ctrl_ref0_rsc_we;
    wire [5:0] ip_ctrl_ref10_rsc_adr;
    wire [31:0] ip_ctrl_ref10_rsc_d;
    wire       ip_ctrl_ref10_rsc_we;
    wire [5:0] ip_ctrl_ref11_rsc_adr;
    wire [31:0] ip_ctrl_ref11_rsc_d;
    wire       ip_ctrl_ref11_rsc_we;
    wire [5:0] ip_ctrl_ref12_rsc_adr;
    wire [31:0] ip_ctrl_ref12_rsc_d;
    wire       ip_ctrl_ref12_rsc_we;
    wire [5:0] ip_ctrl_ref13_rsc_adr;
    wire [31:0] ip_ctrl_ref13_rsc_d;
    wire       ip_ctrl_ref13_rsc_we;
    wire [5:0] ip_ctrl_ref14_rsc_adr;
    wire [31:0] ip_ctrl_ref14_rsc_d;
    wire       ip_ctrl_ref14_rsc_we;
    wire [5:0] ip_ctrl_ref15_rsc_adr;
    wire [31:0] ip_ctrl_ref15_rsc_d;
    wire       ip_ctrl_ref15_rsc_we;
    wire [5:0] ip_ctrl_ref16_rsc_adr;
    wire [31:0] ip_ctrl_ref16_rsc_d;
    wire       ip_ctrl_ref16_rsc_we;
    wire [5:0] ip_ctrl_ref17_rsc_adr;
    wire [31:0] ip_ctrl_ref17_rsc_d;
    wire       ip_ctrl_ref17_rsc_we;
    wire [5:0] ip_ctrl_ref18_rsc_adr;
    wire [31:0] ip_ctrl_ref18_rsc_d;
    wire       ip_ctrl_ref18_rsc_we;
    wire [5:0] ip_ctrl_ref1_rsc_adr;
    wire [31:0] ip_ctrl_ref1_rsc_d;
    wire       ip_ctrl_ref1_rsc_we;
    wire [6:0] ip_ctrl_ref2_rsc_adr;
    wire [31:0] ip_ctrl_ref2_rsc_d;
    wire       ip_ctrl_ref2_rsc_we;
    wire [6:0] ip_ctrl_ref3_rsc_adr;
    wire [31:0] ip_ctrl_ref3_rsc_d;
    wire       ip_ctrl_ref3_rsc_we;
    wire [6:0] ip_ctrl_ref4_rsc_adr;
    wire [31:0] ip_ctrl_ref4_rsc_d;
    wire       ip_ctrl_ref4_rsc_we;
    wire [6:0] ip_ctrl_ref5_rsc_adr;
    wire [31:0] ip_ctrl_ref5_rsc_d;
    wire       ip_ctrl_ref5_rsc_we;
    wire [6:0] ip_ctrl_ref6_rsc_adr;
    wire [31:0] ip_ctrl_ref6_rsc_d;
    wire       ip_ctrl_ref6_rsc_we;
    wire [6:0] ip_ctrl_ref7_rsc_adr;
    wire [31:0] ip_ctrl_ref7_rsc_d;
    wire       ip_ctrl_ref7_rsc_we;
    wire [6:0] ip_ctrl_ref8_rsc_adr;
    wire [31:0] ip_ctrl_ref8_rsc_d;
    wire       ip_ctrl_ref8_rsc_we;
    wire [6:0] ip_ctrl_ref9_rsc_adr;
    wire [31:0] ip_ctrl_ref9_rsc_d;
    wire       ip_ctrl_ref9_rsc_we;
    wire [63:0] ip_ctrl_sad_config_rsc_dat;
    wire       ip_ctrl_sad_config_rsc_rdy;
    wire       ip_ctrl_sad_config_rsc_vld;
    // ip_get_dc port wires:
    wire       ip_get_dc_arst_n;
    wire       ip_get_dc_clk;
    wire [12:0] ip_get_dc_conf_in_rsc_dat;
    wire       ip_get_dc_conf_in_rsc_rdy;
    wire       ip_get_dc_conf_in_rsc_vld;
    wire [31:0] ip_get_dc_pred_out_rsc_dat;
    wire       ip_get_dc_pred_out_rsc_rdy;
    wire       ip_get_dc_pred_out_rsc_vld;
    wire [31:0] ip_get_dc_wdata;
    wire [5:0] ip_get_dc_wraddress;
    wire       ip_get_dc_wren;
    // ip_get_neg_0 port wires:
    wire       ip_get_neg_0_arst_n;
    wire       ip_get_neg_0_clk;
    wire [21:0] ip_get_neg_0_conf_in_rsc_dat;
    wire       ip_get_neg_0_conf_in_rsc_rdy;
    wire       ip_get_neg_0_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_0_hor_out_rsc_dat;
    wire       ip_get_neg_0_hor_out_rsc_rdy;
    wire       ip_get_neg_0_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_0_ver_out_rsc_dat;
    wire       ip_get_neg_0_ver_out_rsc_rdy;
    wire       ip_get_neg_0_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_0_wdata;
    wire [5:0] ip_get_neg_0_wraddress;
    wire       ip_get_neg_0_wren;
    // ip_get_neg_1 port wires:
    wire       ip_get_neg_1_arst_n;
    wire       ip_get_neg_1_clk;
    wire [21:0] ip_get_neg_1_conf_in_rsc_dat;
    wire       ip_get_neg_1_conf_in_rsc_rdy;
    wire       ip_get_neg_1_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_1_hor_out_rsc_dat;
    wire       ip_get_neg_1_hor_out_rsc_rdy;
    wire       ip_get_neg_1_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_1_ver_out_rsc_dat;
    wire       ip_get_neg_1_ver_out_rsc_rdy;
    wire       ip_get_neg_1_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_1_wdata;
    wire [5:0] ip_get_neg_1_wraddress;
    wire       ip_get_neg_1_wren;
    // ip_get_neg_2 port wires:
    wire       ip_get_neg_2_arst_n;
    wire       ip_get_neg_2_clk;
    wire [21:0] ip_get_neg_2_conf_in_rsc_dat;
    wire       ip_get_neg_2_conf_in_rsc_rdy;
    wire       ip_get_neg_2_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_2_hor_out_rsc_dat;
    wire       ip_get_neg_2_hor_out_rsc_rdy;
    wire       ip_get_neg_2_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_2_ver_out_rsc_dat;
    wire       ip_get_neg_2_ver_out_rsc_rdy;
    wire       ip_get_neg_2_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_2_wdata;
    wire [5:0] ip_get_neg_2_wraddress;
    wire       ip_get_neg_2_wren;
    // ip_get_neg_3 port wires:
    wire       ip_get_neg_3_arst_n;
    wire       ip_get_neg_3_clk;
    wire [21:0] ip_get_neg_3_conf_in_rsc_dat;
    wire       ip_get_neg_3_conf_in_rsc_rdy;
    wire       ip_get_neg_3_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_3_hor_out_rsc_dat;
    wire       ip_get_neg_3_hor_out_rsc_rdy;
    wire       ip_get_neg_3_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_3_ver_out_rsc_dat;
    wire       ip_get_neg_3_ver_out_rsc_rdy;
    wire       ip_get_neg_3_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_3_wdata;
    wire [5:0] ip_get_neg_3_wraddress;
    wire       ip_get_neg_3_wren;
    // ip_get_neg_4 port wires:
    wire       ip_get_neg_4_arst_n;
    wire       ip_get_neg_4_clk;
    wire [21:0] ip_get_neg_4_conf_in_rsc_dat;
    wire       ip_get_neg_4_conf_in_rsc_rdy;
    wire       ip_get_neg_4_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_4_hor_out_rsc_dat;
    wire       ip_get_neg_4_hor_out_rsc_rdy;
    wire       ip_get_neg_4_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_4_ver_out_rsc_dat;
    wire       ip_get_neg_4_ver_out_rsc_rdy;
    wire       ip_get_neg_4_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_4_wdata;
    wire [5:0] ip_get_neg_4_wraddress;
    wire       ip_get_neg_4_wren;
    // ip_get_neg_5 port wires:
    wire       ip_get_neg_5_arst_n;
    wire       ip_get_neg_5_clk;
    wire [21:0] ip_get_neg_5_conf_in_rsc_dat;
    wire       ip_get_neg_5_conf_in_rsc_rdy;
    wire       ip_get_neg_5_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_5_hor_out_rsc_dat;
    wire       ip_get_neg_5_hor_out_rsc_rdy;
    wire       ip_get_neg_5_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_5_ver_out_rsc_dat;
    wire       ip_get_neg_5_ver_out_rsc_rdy;
    wire       ip_get_neg_5_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_5_wdata;
    wire [5:0] ip_get_neg_5_wraddress;
    wire       ip_get_neg_5_wren;
    // ip_get_neg_6 port wires:
    wire       ip_get_neg_6_arst_n;
    wire       ip_get_neg_6_clk;
    wire [21:0] ip_get_neg_6_conf_in_rsc_dat;
    wire       ip_get_neg_6_conf_in_rsc_rdy;
    wire       ip_get_neg_6_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_6_hor_out_rsc_dat;
    wire       ip_get_neg_6_hor_out_rsc_rdy;
    wire       ip_get_neg_6_hor_out_rsc_vld;
    wire [31:0] ip_get_neg_6_ver_out_rsc_dat;
    wire       ip_get_neg_6_ver_out_rsc_rdy;
    wire       ip_get_neg_6_ver_out_rsc_vld;
    wire [31:0] ip_get_neg_6_wdata;
    wire [5:0] ip_get_neg_6_wraddress;
    wire       ip_get_neg_6_wren;
    // ip_get_neg_7 port wires:
    wire       ip_get_neg_7_arst_n;
    wire       ip_get_neg_7_clk;
    wire [21:0] ip_get_neg_7_conf_in_rsc_dat;
    wire       ip_get_neg_7_conf_in_rsc_rdy;
    wire       ip_get_neg_7_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_7_hor_out_rsc_dat;
    wire       ip_get_neg_7_hor_out_rsc_rdy;
    wire       ip_get_neg_7_hor_out_rsc_vld;
    wire       ip_get_neg_7_ver_out_rsc_rdy;
    wire [31:0] ip_get_neg_7_wdata;
    wire [5:0] ip_get_neg_7_wraddress;
    wire       ip_get_neg_7_wren;
    // ip_get_planar port wires:
    wire       ip_get_planar_arst_n;
    wire       ip_get_planar_clk;
    wire [19:0] ip_get_planar_conf_in_rsc_dat;
    wire       ip_get_planar_conf_in_rsc_rdy;
    wire       ip_get_planar_conf_in_rsc_vld;
    wire [31:0] ip_get_planar_pred_out_rsc_dat;
    wire       ip_get_planar_pred_out_rsc_rdy;
    wire       ip_get_planar_pred_out_rsc_vld;
    wire [31:0] ip_get_planar_wdata;
    wire [5:0] ip_get_planar_wraddress;
    wire       ip_get_planar_wren;
    // ip_get_pos_0 port wires:
    wire       ip_get_pos_0_arst_n;
    wire       ip_get_pos_0_clk;
    wire [9:0] ip_get_pos_0_conf_in_rsc_dat;
    wire       ip_get_pos_0_conf_in_rsc_rdy;
    wire       ip_get_pos_0_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_0_hor_out_rsc_dat;
    wire       ip_get_pos_0_hor_out_rsc_rdy;
    wire       ip_get_pos_0_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_0_ver_out_rsc_dat;
    wire       ip_get_pos_0_ver_out_rsc_rdy;
    wire       ip_get_pos_0_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_0_wdata;
    wire [6:0] ip_get_pos_0_wraddress;
    wire       ip_get_pos_0_wren;
    // ip_get_pos_1 port wires:
    wire       ip_get_pos_1_arst_n;
    wire       ip_get_pos_1_clk;
    wire [9:0] ip_get_pos_1_conf_in_rsc_dat;
    wire       ip_get_pos_1_conf_in_rsc_rdy;
    wire       ip_get_pos_1_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_1_hor_out_rsc_dat;
    wire       ip_get_pos_1_hor_out_rsc_rdy;
    wire       ip_get_pos_1_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_1_ver_out_rsc_dat;
    wire       ip_get_pos_1_ver_out_rsc_rdy;
    wire       ip_get_pos_1_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_1_wdata;
    wire [6:0] ip_get_pos_1_wraddress;
    wire       ip_get_pos_1_wren;
    // ip_get_pos_2 port wires:
    wire       ip_get_pos_2_arst_n;
    wire       ip_get_pos_2_clk;
    wire [9:0] ip_get_pos_2_conf_in_rsc_dat;
    wire       ip_get_pos_2_conf_in_rsc_rdy;
    wire       ip_get_pos_2_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_2_hor_out_rsc_dat;
    wire       ip_get_pos_2_hor_out_rsc_rdy;
    wire       ip_get_pos_2_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_2_ver_out_rsc_dat;
    wire       ip_get_pos_2_ver_out_rsc_rdy;
    wire       ip_get_pos_2_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_2_wdata;
    wire [6:0] ip_get_pos_2_wraddress;
    wire       ip_get_pos_2_wren;
    // ip_get_pos_3 port wires:
    wire       ip_get_pos_3_arst_n;
    wire       ip_get_pos_3_clk;
    wire [9:0] ip_get_pos_3_conf_in_rsc_dat;
    wire       ip_get_pos_3_conf_in_rsc_rdy;
    wire       ip_get_pos_3_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_3_hor_out_rsc_dat;
    wire       ip_get_pos_3_hor_out_rsc_rdy;
    wire       ip_get_pos_3_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_3_ver_out_rsc_dat;
    wire       ip_get_pos_3_ver_out_rsc_rdy;
    wire       ip_get_pos_3_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_3_wdata;
    wire [6:0] ip_get_pos_3_wraddress;
    wire       ip_get_pos_3_wren;
    // ip_get_pos_4 port wires:
    wire       ip_get_pos_4_arst_n;
    wire       ip_get_pos_4_clk;
    wire [9:0] ip_get_pos_4_conf_in_rsc_dat;
    wire       ip_get_pos_4_conf_in_rsc_rdy;
    wire       ip_get_pos_4_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_4_hor_out_rsc_dat;
    wire       ip_get_pos_4_hor_out_rsc_rdy;
    wire       ip_get_pos_4_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_4_ver_out_rsc_dat;
    wire       ip_get_pos_4_ver_out_rsc_rdy;
    wire       ip_get_pos_4_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_4_wdata;
    wire [6:0] ip_get_pos_4_wraddress;
    wire       ip_get_pos_4_wren;
    // ip_get_pos_5 port wires:
    wire       ip_get_pos_5_arst_n;
    wire       ip_get_pos_5_clk;
    wire [9:0] ip_get_pos_5_conf_in_rsc_dat;
    wire       ip_get_pos_5_conf_in_rsc_rdy;
    wire       ip_get_pos_5_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_5_hor_out_rsc_dat;
    wire       ip_get_pos_5_hor_out_rsc_rdy;
    wire       ip_get_pos_5_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_5_ver_out_rsc_dat;
    wire       ip_get_pos_5_ver_out_rsc_rdy;
    wire       ip_get_pos_5_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_5_wdata;
    wire [6:0] ip_get_pos_5_wraddress;
    wire       ip_get_pos_5_wren;
    // ip_get_pos_6 port wires:
    wire       ip_get_pos_6_arst_n;
    wire       ip_get_pos_6_clk;
    wire [9:0] ip_get_pos_6_conf_in_rsc_dat;
    wire       ip_get_pos_6_conf_in_rsc_rdy;
    wire       ip_get_pos_6_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_6_hor_out_rsc_dat;
    wire       ip_get_pos_6_hor_out_rsc_rdy;
    wire       ip_get_pos_6_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_6_ver_out_rsc_dat;
    wire       ip_get_pos_6_ver_out_rsc_rdy;
    wire       ip_get_pos_6_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_6_wdata;
    wire [6:0] ip_get_pos_6_wraddress;
    wire       ip_get_pos_6_wren;
    // ip_get_pos_7 port wires:
    wire       ip_get_pos_7_arst_n;
    wire       ip_get_pos_7_clk;
    wire [9:0] ip_get_pos_7_conf_in_rsc_dat;
    wire       ip_get_pos_7_conf_in_rsc_rdy;
    wire       ip_get_pos_7_conf_in_rsc_vld;
    wire [31:0] ip_get_pos_7_hor_out_rsc_dat;
    wire       ip_get_pos_7_hor_out_rsc_rdy;
    wire       ip_get_pos_7_hor_out_rsc_vld;
    wire [31:0] ip_get_pos_7_ver_out_rsc_dat;
    wire       ip_get_pos_7_ver_out_rsc_rdy;
    wire       ip_get_pos_7_ver_out_rsc_vld;
    wire [31:0] ip_get_pos_7_wdata;
    wire [6:0] ip_get_pos_7_wraddress;
    wire       ip_get_pos_7_wren;
    // ip_get_zero_0 port wires:
    wire       ip_get_zero_0_arst_n;
    wire       ip_get_zero_0_clk;
    wire [12:0] ip_get_zero_0_conf_in_rsc_dat;
    wire       ip_get_zero_0_conf_in_rsc_rdy;
    wire       ip_get_zero_0_conf_in_rsc_vld;
    wire [31:0] ip_get_zero_0_hor_out_rsc_dat;
    wire       ip_get_zero_0_hor_out_rsc_rdy;
    wire       ip_get_zero_0_hor_out_rsc_vld;
    wire [31:0] ip_get_zero_0_ver_out_rsc_dat;
    wire       ip_get_zero_0_ver_out_rsc_rdy;
    wire       ip_get_zero_0_ver_out_rsc_vld;
    wire [31:0] ip_get_zero_0_wdata;
    wire [5:0] ip_get_zero_0_wraddress;
    wire       ip_get_zero_0_wren;
    // pred_buffer port wires:
    wire       pred_buffer_arst_n;
    wire       pred_buffer_clk;
    wire [31:0] pred_buffer_conf_in_rsc_dat;
    wire       pred_buffer_conf_in_rsc_rdy;
    wire       pred_buffer_conf_in_rsc_vld;
    wire [7:0] pred_buffer_intra_mode_in_rsc_dat;
    wire       pred_buffer_intra_mode_in_rsc_rdy;
    wire       pred_buffer_intra_mode_in_rsc_vld;
    wire [1152:0] pred_buffer_pred_in_rsc_dat;
    wire       pred_buffer_pred_in_rsc_rdy;
    wire       pred_buffer_pred_in_rsc_vld;
    wire [255:0] pred_buffer_pred_out_rsc_dat;
    wire       pred_buffer_pred_out_rsc_rdy;
    wire       pred_buffer_pred_out_rsc_vld;
    wire [255:0] pred_buffer_ref_out_rsc_dat;
    wire       pred_buffer_ref_out_rsc_rdy;
    wire       pred_buffer_ref_out_rsc_vld;
    wire [287:0] pred_buffer_resid_out_rsc_dat;
    wire       pred_buffer_resid_out_rsc_rdy;
    wire       pred_buffer_resid_out_rsc_vld;
    // pred_dc_fifo port wires:
    wire       pred_dc_fifo_aclr_n;
    wire [255:0] pred_dc_fifo_d;
    wire       pred_dc_fifo_d_rdy;
    wire       pred_dc_fifo_d_vld;
    wire [255:0] pred_dc_fifo_q;
    wire       pred_dc_fifo_q_rdy;
    wire       pred_dc_fifo_q_vld;
    wire       pred_dc_fifo_rclk;
    wire       pred_dc_fifo_wclk;
    // ref_dc_fifo port wires:
    wire       ref_dc_fifo_aclr_n;
    wire [255:0] ref_dc_fifo_d;
    wire       ref_dc_fifo_d_rdy;
    wire       ref_dc_fifo_d_vld;
    wire [255:0] ref_dc_fifo_q;
    wire       ref_dc_fifo_q_rdy;
    wire       ref_dc_fifo_q_vld;
    wire       ref_dc_fifo_rclk;
    wire       ref_dc_fifo_wclk;
    // resid_dc_fifo port wires:
    wire       resid_dc_fifo_aclr_n;
    wire [287:0] resid_dc_fifo_d;
    wire       resid_dc_fifo_d_rdy;
    wire       resid_dc_fifo_d_vld;
    wire [287:0] resid_dc_fifo_q;
    wire       resid_dc_fifo_q_rdy;
    wire       resid_dc_fifo_q_vld;
    wire       resid_dc_fifo_rclk;
    wire       resid_dc_fifo_wclk;
    // sad_conf_fifo port wires:
    wire       sad_conf_fifo_aclr_n;
    wire       sad_conf_fifo_clk;
    wire [63:0] sad_conf_fifo_d;
    wire       sad_conf_fifo_d_rdy;
    wire       sad_conf_fifo_d_vld;
    wire [63:0] sad_conf_fifo_q;
    wire       sad_conf_fifo_q_rdy;
    wire       sad_conf_fifo_q_vld;
    // sad_parallel port wires:
    wire       sad_parallel_arst_n;
    wire       sad_parallel_clk;
    wire [63:0] sad_parallel_conf_in_rsc_dat;
    wire       sad_parallel_conf_in_rsc_rdy;
    wire       sad_parallel_conf_in_rsc_vld;
    wire [63:0] sad_parallel_conf_out_rsc_dat;
    wire       sad_parallel_conf_out_rsc_rdy;
    wire       sad_parallel_conf_out_rsc_vld;
    wire [31:0] sad_parallel_in0_rsc_dat;
    wire       sad_parallel_in0_rsc_rdy;
    wire       sad_parallel_in0_rsc_vld;
    wire [31:0] sad_parallel_in10_rsc_dat;
    wire       sad_parallel_in10_rsc_rdy;
    wire       sad_parallel_in10_rsc_vld;
    wire [31:0] sad_parallel_in11_rsc_dat;
    wire       sad_parallel_in11_rsc_rdy;
    wire       sad_parallel_in11_rsc_vld;
    wire [31:0] sad_parallel_in12_rsc_dat;
    wire       sad_parallel_in12_rsc_rdy;
    wire       sad_parallel_in12_rsc_vld;
    wire [31:0] sad_parallel_in13_rsc_dat;
    wire       sad_parallel_in13_rsc_rdy;
    wire       sad_parallel_in13_rsc_vld;
    wire [31:0] sad_parallel_in14_rsc_dat;
    wire       sad_parallel_in14_rsc_rdy;
    wire       sad_parallel_in14_rsc_vld;
    wire [31:0] sad_parallel_in15_rsc_dat;
    wire       sad_parallel_in15_rsc_rdy;
    wire       sad_parallel_in15_rsc_vld;
    wire [31:0] sad_parallel_in16_rsc_dat;
    wire       sad_parallel_in16_rsc_rdy;
    wire       sad_parallel_in16_rsc_vld;
    wire [31:0] sad_parallel_in17_rsc_dat;
    wire       sad_parallel_in17_rsc_rdy;
    wire       sad_parallel_in17_rsc_vld;
    wire [31:0] sad_parallel_in18_rsc_dat;
    wire       sad_parallel_in18_rsc_rdy;
    wire       sad_parallel_in18_rsc_vld;
    wire [31:0] sad_parallel_in19_rsc_dat;
    wire       sad_parallel_in19_rsc_rdy;
    wire       sad_parallel_in19_rsc_vld;
    wire [31:0] sad_parallel_in1_rsc_dat;
    wire       sad_parallel_in1_rsc_rdy;
    wire       sad_parallel_in1_rsc_vld;
    wire [31:0] sad_parallel_in20_rsc_dat;
    wire       sad_parallel_in20_rsc_rdy;
    wire       sad_parallel_in20_rsc_vld;
    wire [31:0] sad_parallel_in21_rsc_dat;
    wire       sad_parallel_in21_rsc_rdy;
    wire       sad_parallel_in21_rsc_vld;
    wire [31:0] sad_parallel_in22_rsc_dat;
    wire       sad_parallel_in22_rsc_rdy;
    wire       sad_parallel_in22_rsc_vld;
    wire [31:0] sad_parallel_in23_rsc_dat;
    wire       sad_parallel_in23_rsc_rdy;
    wire       sad_parallel_in23_rsc_vld;
    wire [31:0] sad_parallel_in24_rsc_dat;
    wire       sad_parallel_in24_rsc_rdy;
    wire       sad_parallel_in24_rsc_vld;
    wire [31:0] sad_parallel_in25_rsc_dat;
    wire       sad_parallel_in25_rsc_rdy;
    wire       sad_parallel_in25_rsc_vld;
    wire [31:0] sad_parallel_in26_rsc_dat;
    wire       sad_parallel_in26_rsc_rdy;
    wire       sad_parallel_in26_rsc_vld;
    wire [31:0] sad_parallel_in27_rsc_dat;
    wire       sad_parallel_in27_rsc_rdy;
    wire       sad_parallel_in27_rsc_vld;
    wire [31:0] sad_parallel_in28_rsc_dat;
    wire       sad_parallel_in28_rsc_rdy;
    wire       sad_parallel_in28_rsc_vld;
    wire [31:0] sad_parallel_in29_rsc_dat;
    wire       sad_parallel_in29_rsc_rdy;
    wire       sad_parallel_in29_rsc_vld;
    wire [31:0] sad_parallel_in2_rsc_dat;
    wire       sad_parallel_in2_rsc_rdy;
    wire       sad_parallel_in2_rsc_vld;
    wire [31:0] sad_parallel_in30_rsc_dat;
    wire       sad_parallel_in30_rsc_rdy;
    wire       sad_parallel_in30_rsc_vld;
    wire [31:0] sad_parallel_in31_rsc_dat;
    wire       sad_parallel_in31_rsc_rdy;
    wire       sad_parallel_in31_rsc_vld;
    wire [31:0] sad_parallel_in32_rsc_dat;
    wire       sad_parallel_in32_rsc_rdy;
    wire       sad_parallel_in32_rsc_vld;
    wire [31:0] sad_parallel_in33_rsc_dat;
    wire       sad_parallel_in33_rsc_rdy;
    wire       sad_parallel_in33_rsc_vld;
    wire [31:0] sad_parallel_in34_rsc_dat;
    wire       sad_parallel_in34_rsc_rdy;
    wire       sad_parallel_in34_rsc_vld;
    wire [31:0] sad_parallel_in3_rsc_dat;
    wire       sad_parallel_in3_rsc_rdy;
    wire       sad_parallel_in3_rsc_vld;
    wire [31:0] sad_parallel_in4_rsc_dat;
    wire       sad_parallel_in4_rsc_rdy;
    wire       sad_parallel_in4_rsc_vld;
    wire [31:0] sad_parallel_in5_rsc_dat;
    wire       sad_parallel_in5_rsc_rdy;
    wire       sad_parallel_in5_rsc_vld;
    wire [31:0] sad_parallel_in6_rsc_dat;
    wire       sad_parallel_in6_rsc_rdy;
    wire       sad_parallel_in6_rsc_vld;
    wire [31:0] sad_parallel_in7_rsc_dat;
    wire       sad_parallel_in7_rsc_rdy;
    wire       sad_parallel_in7_rsc_vld;
    wire [31:0] sad_parallel_in8_rsc_dat;
    wire       sad_parallel_in8_rsc_rdy;
    wire       sad_parallel_in8_rsc_vld;
    wire [31:0] sad_parallel_in9_rsc_dat;
    wire       sad_parallel_in9_rsc_rdy;
    wire       sad_parallel_in9_rsc_vld;
    wire [7:0] sad_parallel_intra_mode_out_rsc_dat;
    wire       sad_parallel_intra_mode_out_rsc_rdy;
    wire       sad_parallel_intra_mode_out_rsc_vld;
    wire [14:0] sad_parallel_lcu_ref_rsc_adr;
    wire [31:0] sad_parallel_lcu_ref_rsc_d;
    wire [31:0] sad_parallel_lcu_ref_rsc_q;
    wire       sad_parallel_lcu_ref_rsc_we;
    wire [1152:0] sad_parallel_pred_out_rsc_dat;
    wire       sad_parallel_pred_out_rsc_rdy;
    wire       sad_parallel_pred_out_rsc_vld;

    // Assignments for the ports of the encompassing component:
    assign ip_get_planar_arst_n_to_arst_n_arst_n = arst_n;
    assign ip_get_planar_clk_to_clk_CLK = clk;
    assign ip_config_dc_fifo_in_clk_to_clk_base_CLK = clk_base;
    assign ip_config_dc_fifo_data_in_to_ip_config_in_DAT = d;
    assign d_rdy = ip_config_dc_fifo_data_in_to_ip_config_in_RDY;
    assign ip_config_dc_fifo_data_in_to_ip_config_in_VLD = d_vld;
    assign lcu_ref_rsc_adr = sad_parallel_lcu_ref_rsc_to_bus_ADDR;
    assign lcu_ref_rsc_d = sad_parallel_lcu_ref_rsc_to_bus_WDATA;
    assign sad_parallel_lcu_ref_rsc_to_bus_RDATA = lcu_ref_rsc_q;
    assign lcu_ref_rsc_we = sad_parallel_lcu_ref_rsc_to_bus_WREN;
    assign pred_out_rsc_dat = pred_dc_fifo_data_out_to_pred_out_rsc_DAT;
    assign pred_dc_fifo_data_out_to_pred_out_rsc_RDY = pred_out_rsc_rdy;
    assign pred_out_rsc_vld = pred_dc_fifo_data_out_to_pred_out_rsc_VLD;
    assign ref_out_rsc_dat = ref_dc_fifo_data_out_to_ref_out_rsc_DAT;
    assign ref_dc_fifo_data_out_to_ref_out_rsc_RDY = ref_out_rsc_rdy;
    assign ref_out_rsc_vld = ref_dc_fifo_data_out_to_ref_out_rsc_VLD;
    assign resid_out_rsc_dat = resid_dc_fifo_data_out_to_resid_out_rsc_DAT;
    assign resid_dc_fifo_data_out_to_resid_out_rsc_RDY = resid_out_rsc_rdy;
    assign resid_out_rsc_vld = resid_dc_fifo_data_out_to_resid_out_rsc_VLD;

    // ip_config_dc_fifo assignments:
    assign ip_config_dc_fifo_aclr_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_config_dc_fifo_d = ip_config_dc_fifo_data_in_to_ip_config_in_DAT;
    assign ip_config_dc_fifo_data_in_to_ip_config_in_RDY = ip_config_dc_fifo_d_rdy;
    assign ip_config_dc_fifo_d_vld = ip_config_dc_fifo_data_in_to_ip_config_in_VLD;
    assign ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_DAT = ip_config_dc_fifo_q;
    assign ip_config_dc_fifo_q_rdy = ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_RDY;
    assign ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_VLD = ip_config_dc_fifo_q_vld;
    assign ip_config_dc_fifo_rclk = ip_get_planar_clk_to_clk_CLK;
    assign ip_config_dc_fifo_wclk = ip_config_dc_fifo_in_clk_to_clk_base_CLK;
    // ip_ctrl assignments:
    assign ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_DAT = ip_ctrl_ang_neg_out11_rsc_dat;
    assign ip_ctrl_ang_neg_out11_rsc_rdy = ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_VLD = ip_ctrl_ang_neg_out11_rsc_vld;
    assign ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_DAT = ip_ctrl_ang_neg_out12_rsc_dat;
    assign ip_ctrl_ang_neg_out12_rsc_rdy = ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_VLD = ip_ctrl_ang_neg_out12_rsc_vld;
    assign ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_DAT = ip_ctrl_ang_neg_out13_rsc_dat;
    assign ip_ctrl_ang_neg_out13_rsc_rdy = ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_VLD = ip_ctrl_ang_neg_out13_rsc_vld;
    assign ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_DAT = ip_ctrl_ang_neg_out14_rsc_dat;
    assign ip_ctrl_ang_neg_out14_rsc_rdy = ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_VLD = ip_ctrl_ang_neg_out14_rsc_vld;
    assign ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_DAT = ip_ctrl_ang_neg_out15_rsc_dat;
    assign ip_ctrl_ang_neg_out15_rsc_rdy = ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_VLD = ip_ctrl_ang_neg_out15_rsc_vld;
    assign ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_DAT = ip_ctrl_ang_neg_out16_rsc_dat;
    assign ip_ctrl_ang_neg_out16_rsc_rdy = ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_VLD = ip_ctrl_ang_neg_out16_rsc_vld;
    assign ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_DAT = ip_ctrl_ang_neg_out17_rsc_dat;
    assign ip_ctrl_ang_neg_out17_rsc_rdy = ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_VLD = ip_ctrl_ang_neg_out17_rsc_vld;
    assign ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_DAT = ip_ctrl_ang_neg_out18_rsc_dat;
    assign ip_ctrl_ang_neg_out18_rsc_rdy = ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_RDY;
    assign ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_VLD = ip_ctrl_ang_neg_out18_rsc_vld;
    assign ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_DAT = ip_ctrl_ang_pos_out2_rsc_dat;
    assign ip_ctrl_ang_pos_out2_rsc_rdy = ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_RDY;
    assign ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_VLD = ip_ctrl_ang_pos_out2_rsc_vld;
    assign ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_DAT = ip_ctrl_ang_pos_out3_rsc_dat;
    assign ip_ctrl_ang_pos_out3_rsc_rdy = ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_RDY;
    assign ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_VLD = ip_ctrl_ang_pos_out3_rsc_vld;
    assign ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_DAT = ip_ctrl_ang_pos_out4_rsc_dat;
    assign ip_ctrl_ang_pos_out4_rsc_rdy = ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_RDY;
    assign ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_VLD = ip_ctrl_ang_pos_out4_rsc_vld;
    assign ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_DAT = ip_ctrl_ang_pos_out5_rsc_dat;
    assign ip_ctrl_ang_pos_out5_rsc_rdy = ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_RDY;
    assign ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_VLD = ip_ctrl_ang_pos_out5_rsc_vld;
    assign ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_DAT = ip_ctrl_ang_pos_out6_rsc_dat;
    assign ip_ctrl_ang_pos_out6_rsc_rdy = ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_RDY;
    assign ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_VLD = ip_ctrl_ang_pos_out6_rsc_vld;
    assign ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_DAT = ip_ctrl_ang_pos_out7_rsc_dat;
    assign ip_ctrl_ang_pos_out7_rsc_rdy = ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_RDY;
    assign ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_VLD = ip_ctrl_ang_pos_out7_rsc_vld;
    assign ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_DAT = ip_ctrl_ang_pos_out8_rsc_dat;
    assign ip_ctrl_ang_pos_out8_rsc_rdy = ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_RDY;
    assign ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_VLD = ip_ctrl_ang_pos_out8_rsc_vld;
    assign ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_DAT = ip_ctrl_ang_pos_out9_rsc_dat;
    assign ip_ctrl_ang_pos_out9_rsc_rdy = ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_RDY;
    assign ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_VLD = ip_ctrl_ang_pos_out9_rsc_vld;
    assign ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_DAT = ip_ctrl_ang_zero_out_rsc_dat;
    assign ip_ctrl_ang_zero_out_rsc_rdy = ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_RDY;
    assign ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_VLD = ip_ctrl_ang_zero_out_rsc_vld;
    assign ip_ctrl_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_ctrl_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_ctrl_conf_in_rsc_dat = ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_DAT;
    assign ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_RDY = ip_ctrl_conf_in_rsc_rdy;
    assign ip_ctrl_conf_in_rsc_vld = ip_config_dc_fifo_data_out_to_ip_ctrl_conf_in_rsc_VLD;
    assign ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_DAT = ip_ctrl_dc_out_rsc_dat;
    assign ip_ctrl_dc_out_rsc_rdy = ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_RDY;
    assign ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_VLD = ip_ctrl_dc_out_rsc_vld;
    assign ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_DAT = ip_ctrl_planar_out_rsc_dat;
    assign ip_ctrl_planar_out_rsc_rdy = ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_RDY;
    assign ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_VLD = ip_ctrl_planar_out_rsc_vld;
    assign ip_ctrl_ref0_rsc_to_ip_get_planar_ref_ADDR = ip_ctrl_ref0_rsc_adr;
    assign ip_ctrl_ref0_rsc_to_ip_get_planar_ref_WDATA = ip_ctrl_ref0_rsc_d;
    assign ip_ctrl_ref0_rsc_to_ip_get_planar_ref_WREN = ip_ctrl_ref0_rsc_we;
    assign ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_ADDR = ip_ctrl_ref10_rsc_adr;
    assign ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_WDATA = ip_ctrl_ref10_rsc_d;
    assign ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_WREN = ip_ctrl_ref10_rsc_we;
    assign ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_ADDR = ip_ctrl_ref11_rsc_adr;
    assign ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_WDATA = ip_ctrl_ref11_rsc_d;
    assign ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_WREN = ip_ctrl_ref11_rsc_we;
    assign ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_ADDR = ip_ctrl_ref12_rsc_adr;
    assign ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_WDATA = ip_ctrl_ref12_rsc_d;
    assign ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_WREN = ip_ctrl_ref12_rsc_we;
    assign ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_ADDR = ip_ctrl_ref13_rsc_adr;
    assign ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_WDATA = ip_ctrl_ref13_rsc_d;
    assign ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_WREN = ip_ctrl_ref13_rsc_we;
    assign ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_ADDR = ip_ctrl_ref14_rsc_adr;
    assign ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_WDATA = ip_ctrl_ref14_rsc_d;
    assign ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_WREN = ip_ctrl_ref14_rsc_we;
    assign ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_ADDR = ip_ctrl_ref15_rsc_adr;
    assign ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_WDATA = ip_ctrl_ref15_rsc_d;
    assign ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_WREN = ip_ctrl_ref15_rsc_we;
    assign ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_ADDR = ip_ctrl_ref16_rsc_adr;
    assign ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_WDATA = ip_ctrl_ref16_rsc_d;
    assign ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_WREN = ip_ctrl_ref16_rsc_we;
    assign ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_ADDR = ip_ctrl_ref17_rsc_adr;
    assign ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_WDATA = ip_ctrl_ref17_rsc_d;
    assign ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_WREN = ip_ctrl_ref17_rsc_we;
    assign ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_ADDR = ip_ctrl_ref18_rsc_adr;
    assign ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_WDATA = ip_ctrl_ref18_rsc_d;
    assign ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_WREN = ip_ctrl_ref18_rsc_we;
    assign ip_get_dc_ref_to_ip_ctrl_ref1_rsc_ADDR = ip_ctrl_ref1_rsc_adr;
    assign ip_get_dc_ref_to_ip_ctrl_ref1_rsc_WDATA = ip_ctrl_ref1_rsc_d;
    assign ip_get_dc_ref_to_ip_ctrl_ref1_rsc_WREN = ip_ctrl_ref1_rsc_we;
    assign ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_ADDR = ip_ctrl_ref2_rsc_adr;
    assign ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_WDATA = ip_ctrl_ref2_rsc_d;
    assign ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_WREN = ip_ctrl_ref2_rsc_we;
    assign ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_ADDR = ip_ctrl_ref3_rsc_adr;
    assign ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_WDATA = ip_ctrl_ref3_rsc_d;
    assign ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_WREN = ip_ctrl_ref3_rsc_we;
    assign ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_ADDR = ip_ctrl_ref4_rsc_adr;
    assign ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_WDATA = ip_ctrl_ref4_rsc_d;
    assign ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_WREN = ip_ctrl_ref4_rsc_we;
    assign ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_ADDR = ip_ctrl_ref5_rsc_adr;
    assign ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_WDATA = ip_ctrl_ref5_rsc_d;
    assign ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_WREN = ip_ctrl_ref5_rsc_we;
    assign ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_ADDR = ip_ctrl_ref6_rsc_adr;
    assign ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_WDATA = ip_ctrl_ref6_rsc_d;
    assign ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_WREN = ip_ctrl_ref6_rsc_we;
    assign ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_ADDR = ip_ctrl_ref7_rsc_adr;
    assign ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_WDATA = ip_ctrl_ref7_rsc_d;
    assign ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_WREN = ip_ctrl_ref7_rsc_we;
    assign ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_ADDR = ip_ctrl_ref8_rsc_adr;
    assign ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_WDATA = ip_ctrl_ref8_rsc_d;
    assign ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_WREN = ip_ctrl_ref8_rsc_we;
    assign ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_ADDR = ip_ctrl_ref9_rsc_adr;
    assign ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_WDATA = ip_ctrl_ref9_rsc_d;
    assign ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_WREN = ip_ctrl_ref9_rsc_we;
    assign ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_DAT = ip_ctrl_sad_config_rsc_dat;
    assign ip_ctrl_sad_config_rsc_rdy = ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_RDY;
    assign ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_VLD = ip_ctrl_sad_config_rsc_vld;
    // ip_get_dc assignments:
    assign ip_get_dc_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_dc_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_dc_conf_in_rsc_dat = ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_DAT;
    assign ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_RDY = ip_get_dc_conf_in_rsc_rdy;
    assign ip_get_dc_conf_in_rsc_vld = ip_get_dc_conf_in_to_ip_ctrl_dc_out_rsc_VLD;
    assign ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_DAT = ip_get_dc_pred_out_rsc_dat;
    assign ip_get_dc_pred_out_rsc_rdy = ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_RDY;
    assign ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_VLD = ip_get_dc_pred_out_rsc_vld;
    assign ip_get_dc_wdata = ip_get_dc_ref_to_ip_ctrl_ref1_rsc_WDATA;
    assign ip_get_dc_wraddress = ip_get_dc_ref_to_ip_ctrl_ref1_rsc_ADDR;
    assign ip_get_dc_wren = ip_get_dc_ref_to_ip_ctrl_ref1_rsc_WREN;
    // ip_get_neg_0 assignments:
    assign ip_get_neg_0_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_0_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_0_conf_in_rsc_dat = ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_RDY = ip_get_neg_0_conf_in_rsc_rdy;
    assign ip_get_neg_0_conf_in_rsc_vld = ip_ctrl_ang_neg_out_11_rsc_to_ip_get_neg_0_conf_in_VLD;
    assign ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_DAT = ip_get_neg_0_hor_out_rsc_dat;
    assign ip_get_neg_0_hor_out_rsc_rdy = ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_RDY;
    assign ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_VLD = ip_get_neg_0_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_DAT = ip_get_neg_0_ver_out_rsc_dat;
    assign ip_get_neg_0_ver_out_rsc_rdy = sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_RDY;
    assign sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_VLD = ip_get_neg_0_ver_out_rsc_vld;
    assign ip_get_neg_0_wdata = ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_WDATA;
    assign ip_get_neg_0_wraddress = ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_ADDR;
    assign ip_get_neg_0_wren = ip_get_neg_0_ref_to_ip_ctrl_ref11_rsc_WREN;
    // ip_get_neg_1 assignments:
    assign ip_get_neg_1_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_1_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_1_conf_in_rsc_dat = ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_RDY = ip_get_neg_1_conf_in_rsc_rdy;
    assign ip_get_neg_1_conf_in_rsc_vld = ip_ctrl_ang_neg_out_12_rsc_to_ip_get_neg_1_conf_in_VLD;
    assign ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_DAT = ip_get_neg_1_hor_out_rsc_dat;
    assign ip_get_neg_1_hor_out_rsc_rdy = ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_RDY;
    assign ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_VLD = ip_get_neg_1_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_DAT = ip_get_neg_1_ver_out_rsc_dat;
    assign ip_get_neg_1_ver_out_rsc_rdy = sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_RDY;
    assign sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_VLD = ip_get_neg_1_ver_out_rsc_vld;
    assign ip_get_neg_1_wdata = ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_WDATA;
    assign ip_get_neg_1_wraddress = ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_ADDR;
    assign ip_get_neg_1_wren = ip_get_neg_1_ref_to_ip_ctrl_ref12_rsc_WREN;
    // ip_get_neg_2 assignments:
    assign ip_get_neg_2_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_2_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_2_conf_in_rsc_dat = ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_RDY = ip_get_neg_2_conf_in_rsc_rdy;
    assign ip_get_neg_2_conf_in_rsc_vld = ip_ctrl_ang_neg_out_13_rsc_to_ip_get_neg_2_conf_in_VLD;
    assign ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_DAT = ip_get_neg_2_hor_out_rsc_dat;
    assign ip_get_neg_2_hor_out_rsc_rdy = ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_RDY;
    assign ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_VLD = ip_get_neg_2_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_DAT = ip_get_neg_2_ver_out_rsc_dat;
    assign ip_get_neg_2_ver_out_rsc_rdy = sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_RDY;
    assign sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_VLD = ip_get_neg_2_ver_out_rsc_vld;
    assign ip_get_neg_2_wdata = ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_WDATA;
    assign ip_get_neg_2_wraddress = ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_ADDR;
    assign ip_get_neg_2_wren = ip_get_neg_2_ref_to_ip_ctrl_ref13_rsc_WREN;
    // ip_get_neg_3 assignments:
    assign ip_get_neg_3_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_3_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_3_conf_in_rsc_dat = ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_RDY = ip_get_neg_3_conf_in_rsc_rdy;
    assign ip_get_neg_3_conf_in_rsc_vld = ip_ctrl_ang_neg_out_14_rsc_to_ip_get_neg_3_conf_in_VLD;
    assign ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_DAT = ip_get_neg_3_hor_out_rsc_dat;
    assign ip_get_neg_3_hor_out_rsc_rdy = ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_RDY;
    assign ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_VLD = ip_get_neg_3_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_DAT = ip_get_neg_3_ver_out_rsc_dat;
    assign ip_get_neg_3_ver_out_rsc_rdy = sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_RDY;
    assign sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_VLD = ip_get_neg_3_ver_out_rsc_vld;
    assign ip_get_neg_3_wdata = ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_WDATA;
    assign ip_get_neg_3_wraddress = ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_ADDR;
    assign ip_get_neg_3_wren = ip_get_neg_3_ref_to_ip_ctrl_ref14_rsc_WREN;
    // ip_get_neg_4 assignments:
    assign ip_get_neg_4_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_4_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_4_conf_in_rsc_dat = ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_RDY = ip_get_neg_4_conf_in_rsc_rdy;
    assign ip_get_neg_4_conf_in_rsc_vld = ip_ctrl_ang_neg_out_15_rsc_to_ip_get_neg_4_conf_in_VLD;
    assign ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_DAT = ip_get_neg_4_hor_out_rsc_dat;
    assign ip_get_neg_4_hor_out_rsc_rdy = ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_RDY;
    assign ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_VLD = ip_get_neg_4_hor_out_rsc_vld;
    assign ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_DAT = ip_get_neg_4_ver_out_rsc_dat;
    assign ip_get_neg_4_ver_out_rsc_rdy = ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_RDY;
    assign ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_VLD = ip_get_neg_4_ver_out_rsc_vld;
    assign ip_get_neg_4_wdata = ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_WDATA;
    assign ip_get_neg_4_wraddress = ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_ADDR;
    assign ip_get_neg_4_wren = ip_get_neg_4_ref_to_ip_ctrl_ref15_rsc_WREN;
    // ip_get_neg_5 assignments:
    assign ip_get_neg_5_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_5_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_5_conf_in_rsc_dat = ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_RDY = ip_get_neg_5_conf_in_rsc_rdy;
    assign ip_get_neg_5_conf_in_rsc_vld = ip_ctrl_ang_neg_out_16_rsc_to_ip_get_neg_5_conf_in_VLD;
    assign ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_DAT = ip_get_neg_5_hor_out_rsc_dat;
    assign ip_get_neg_5_hor_out_rsc_rdy = ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_RDY;
    assign ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_VLD = ip_get_neg_5_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_DAT = ip_get_neg_5_ver_out_rsc_dat;
    assign ip_get_neg_5_ver_out_rsc_rdy = sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_RDY;
    assign sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_VLD = ip_get_neg_5_ver_out_rsc_vld;
    assign ip_get_neg_5_wdata = ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_WDATA;
    assign ip_get_neg_5_wraddress = ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_ADDR;
    assign ip_get_neg_5_wren = ip_get_neg_5_ref_to_ip_ctrl_ref16_rsc_WREN;
    // ip_get_neg_6 assignments:
    assign ip_get_neg_6_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_6_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_6_conf_in_rsc_dat = ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_RDY = ip_get_neg_6_conf_in_rsc_rdy;
    assign ip_get_neg_6_conf_in_rsc_vld = ip_ctrl_ang_neg_out_17_rsc_to_ip_get_neg_6_conf_in_VLD;
    assign ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_DAT = ip_get_neg_6_hor_out_rsc_dat;
    assign ip_get_neg_6_hor_out_rsc_rdy = ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_RDY;
    assign ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_VLD = ip_get_neg_6_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_DAT = ip_get_neg_6_ver_out_rsc_dat;
    assign ip_get_neg_6_ver_out_rsc_rdy = sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_RDY;
    assign sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_VLD = ip_get_neg_6_ver_out_rsc_vld;
    assign ip_get_neg_6_wdata = ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_WDATA;
    assign ip_get_neg_6_wraddress = ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_ADDR;
    assign ip_get_neg_6_wren = ip_get_neg_6_ref_to_ip_ctrl_ref17_rsc_WREN;
    // ip_get_neg_7 assignments:
    assign ip_get_neg_7_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_neg_7_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_neg_7_conf_in_rsc_dat = ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_DAT;
    assign ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_RDY = ip_get_neg_7_conf_in_rsc_rdy;
    assign ip_get_neg_7_conf_in_rsc_vld = ip_ctrl_ang_neg_out_18_rsc_to_ip_get_neg_7_conf_in_VLD;
    assign ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_DAT = ip_get_neg_7_hor_out_rsc_dat;
    assign ip_get_neg_7_hor_out_rsc_rdy = ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_RDY;
    assign ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_VLD = ip_get_neg_7_hor_out_rsc_vld;
    assign ip_get_neg_7_ver_out_rsc_rdy = 1;
    assign ip_get_neg_7_wdata = ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_WDATA;
    assign ip_get_neg_7_wraddress = ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_ADDR;
    assign ip_get_neg_7_wren = ip_get_neg_7_ref_to_ip_ctrl_ref18_rsc_WREN;
    // ip_get_planar assignments:
    assign ip_get_planar_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_planar_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_planar_conf_in_rsc_dat = ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_DAT;
    assign ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_RDY = ip_get_planar_conf_in_rsc_rdy;
    assign ip_get_planar_conf_in_rsc_vld = ip_get_planar_conf_in_to_ip_ctrl_planar_out_rsc_VLD;
    assign sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_DAT = ip_get_planar_pred_out_rsc_dat;
    assign ip_get_planar_pred_out_rsc_rdy = sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_RDY;
    assign sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_VLD = ip_get_planar_pred_out_rsc_vld;
    assign ip_get_planar_wdata = ip_ctrl_ref0_rsc_to_ip_get_planar_ref_WDATA;
    assign ip_get_planar_wraddress = ip_ctrl_ref0_rsc_to_ip_get_planar_ref_ADDR;
    assign ip_get_planar_wren = ip_ctrl_ref0_rsc_to_ip_get_planar_ref_WREN;
    // ip_get_pos_0 assignments:
    assign ip_get_pos_0_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_0_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_0_conf_in_rsc_dat = ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_DAT;
    assign ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_RDY = ip_get_pos_0_conf_in_rsc_rdy;
    assign ip_get_pos_0_conf_in_rsc_vld = ip_ctrl_ang_pos_out2_rsc_to_ip_get_pos_0_conf_in_VLD;
    assign ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_DAT = ip_get_pos_0_hor_out_rsc_dat;
    assign ip_get_pos_0_hor_out_rsc_rdy = ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_RDY;
    assign ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_VLD = ip_get_pos_0_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_DAT = ip_get_pos_0_ver_out_rsc_dat;
    assign ip_get_pos_0_ver_out_rsc_rdy = sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_RDY;
    assign sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_VLD = ip_get_pos_0_ver_out_rsc_vld;
    assign ip_get_pos_0_wdata = ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_WDATA;
    assign ip_get_pos_0_wraddress = ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_ADDR;
    assign ip_get_pos_0_wren = ip_ctrl_ref2_rsc_to_ip_get_pos_0_ref_WREN;
    // ip_get_pos_1 assignments:
    assign ip_get_pos_1_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_1_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_1_conf_in_rsc_dat = ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_DAT;
    assign ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_RDY = ip_get_pos_1_conf_in_rsc_rdy;
    assign ip_get_pos_1_conf_in_rsc_vld = ip_ctrl_ang_pos_out3_rsc_to_ip_get_pos_1_conf_in_VLD;
    assign sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_DAT = ip_get_pos_1_hor_out_rsc_dat;
    assign ip_get_pos_1_hor_out_rsc_rdy = sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_RDY;
    assign sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_VLD = ip_get_pos_1_hor_out_rsc_vld;
    assign ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_DAT = ip_get_pos_1_ver_out_rsc_dat;
    assign ip_get_pos_1_ver_out_rsc_rdy = ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_RDY;
    assign ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_VLD = ip_get_pos_1_ver_out_rsc_vld;
    assign ip_get_pos_1_wdata = ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_WDATA;
    assign ip_get_pos_1_wraddress = ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_ADDR;
    assign ip_get_pos_1_wren = ip_ctrl_ref3_rsc_to_ip_get_pos_1_ref_WREN;
    // ip_get_pos_2 assignments:
    assign ip_get_pos_2_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_2_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_2_conf_in_rsc_dat = ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_DAT;
    assign ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_RDY = ip_get_pos_2_conf_in_rsc_rdy;
    assign ip_get_pos_2_conf_in_rsc_vld = ip_ctrl_ang_pos_out4_rsc_to_ip_get_pos_2_conf_in_VLD;
    assign ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_DAT = ip_get_pos_2_hor_out_rsc_dat;
    assign ip_get_pos_2_hor_out_rsc_rdy = ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_RDY;
    assign ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_VLD = ip_get_pos_2_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_DAT = ip_get_pos_2_ver_out_rsc_dat;
    assign ip_get_pos_2_ver_out_rsc_rdy = sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_RDY;
    assign sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_VLD = ip_get_pos_2_ver_out_rsc_vld;
    assign ip_get_pos_2_wdata = ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_WDATA;
    assign ip_get_pos_2_wraddress = ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_ADDR;
    assign ip_get_pos_2_wren = ip_ctrl_ref4_rsc_to_ip_get_pos_2_ref_WREN;
    // ip_get_pos_3 assignments:
    assign ip_get_pos_3_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_3_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_3_conf_in_rsc_dat = ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_DAT;
    assign ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_RDY = ip_get_pos_3_conf_in_rsc_rdy;
    assign ip_get_pos_3_conf_in_rsc_vld = ip_ctrl_ang_pos_out5_rsc_to_ip_get_pos_3_conf_in_VLD;
    assign ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_DAT = ip_get_pos_3_hor_out_rsc_dat;
    assign ip_get_pos_3_hor_out_rsc_rdy = ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_RDY;
    assign ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_VLD = ip_get_pos_3_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_DAT = ip_get_pos_3_ver_out_rsc_dat;
    assign ip_get_pos_3_ver_out_rsc_rdy = sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_RDY;
    assign sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_VLD = ip_get_pos_3_ver_out_rsc_vld;
    assign ip_get_pos_3_wdata = ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_WDATA;
    assign ip_get_pos_3_wraddress = ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_ADDR;
    assign ip_get_pos_3_wren = ip_ctrl_ref5_rsc_to_ip_get_pos_3_ref_WREN;
    // ip_get_pos_4 assignments:
    assign ip_get_pos_4_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_4_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_4_conf_in_rsc_dat = ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_DAT;
    assign ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_RDY = ip_get_pos_4_conf_in_rsc_rdy;
    assign ip_get_pos_4_conf_in_rsc_vld = ip_ctrl_ang_pos_out6_rsc_to_ip_get_pos_4_conf_in_VLD;
    assign ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_DAT = ip_get_pos_4_hor_out_rsc_dat;
    assign ip_get_pos_4_hor_out_rsc_rdy = ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_RDY;
    assign ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_VLD = ip_get_pos_4_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_DAT = ip_get_pos_4_ver_out_rsc_dat;
    assign ip_get_pos_4_ver_out_rsc_rdy = sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_RDY;
    assign sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_VLD = ip_get_pos_4_ver_out_rsc_vld;
    assign ip_get_pos_4_wdata = ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_WDATA;
    assign ip_get_pos_4_wraddress = ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_ADDR;
    assign ip_get_pos_4_wren = ip_get_pos_4_ref_to_ip_ctrl_ref6_rsc_WREN;
    // ip_get_pos_5 assignments:
    assign ip_get_pos_5_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_5_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_5_conf_in_rsc_dat = ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_DAT;
    assign ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_RDY = ip_get_pos_5_conf_in_rsc_rdy;
    assign ip_get_pos_5_conf_in_rsc_vld = ip_ctrl_ang_pos_out7_rsc_to_ip_get_pos_5_conf_in_VLD;
    assign ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_DAT = ip_get_pos_5_hor_out_rsc_dat;
    assign ip_get_pos_5_hor_out_rsc_rdy = ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_RDY;
    assign ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_VLD = ip_get_pos_5_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_DAT = ip_get_pos_5_ver_out_rsc_dat;
    assign ip_get_pos_5_ver_out_rsc_rdy = sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_RDY;
    assign sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_VLD = ip_get_pos_5_ver_out_rsc_vld;
    assign ip_get_pos_5_wdata = ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_WDATA;
    assign ip_get_pos_5_wraddress = ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_ADDR;
    assign ip_get_pos_5_wren = ip_get_pos_5_ref_to_ip_ctrl_ref7_rsc_WREN;
    // ip_get_pos_6 assignments:
    assign ip_get_pos_6_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_6_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_6_conf_in_rsc_dat = ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_DAT;
    assign ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_RDY = ip_get_pos_6_conf_in_rsc_rdy;
    assign ip_get_pos_6_conf_in_rsc_vld = ip_ctrl_ang_pos_out8_rsc_to_ip_get_pos_6_conf_in_VLD;
    assign ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_DAT = ip_get_pos_6_hor_out_rsc_dat;
    assign ip_get_pos_6_hor_out_rsc_rdy = ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_RDY;
    assign ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_VLD = ip_get_pos_6_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_DAT = ip_get_pos_6_ver_out_rsc_dat;
    assign ip_get_pos_6_ver_out_rsc_rdy = sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_RDY;
    assign sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_VLD = ip_get_pos_6_ver_out_rsc_vld;
    assign ip_get_pos_6_wdata = ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_WDATA;
    assign ip_get_pos_6_wraddress = ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_ADDR;
    assign ip_get_pos_6_wren = ip_ctrl_ref8_rsc_to_ip_get_pos_6_ref_WREN;
    // ip_get_pos_7 assignments:
    assign ip_get_pos_7_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_pos_7_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_pos_7_conf_in_rsc_dat = ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_DAT;
    assign ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_RDY = ip_get_pos_7_conf_in_rsc_rdy;
    assign ip_get_pos_7_conf_in_rsc_vld = ip_ctrl_ang_pos_out9_rsc_to_ip_get_pos_7_conf_in_VLD;
    assign ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_DAT = ip_get_pos_7_hor_out_rsc_dat;
    assign ip_get_pos_7_hor_out_rsc_rdy = ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_RDY;
    assign ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_VLD = ip_get_pos_7_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_DAT = ip_get_pos_7_ver_out_rsc_dat;
    assign ip_get_pos_7_ver_out_rsc_rdy = sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_RDY;
    assign sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_VLD = ip_get_pos_7_ver_out_rsc_vld;
    assign ip_get_pos_7_wdata = ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_WDATA;
    assign ip_get_pos_7_wraddress = ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_ADDR;
    assign ip_get_pos_7_wren = ip_get_pos_7_ref_to_ip_ctrl_ref9_rsc_WREN;
    // ip_get_zero_0 assignments:
    assign ip_get_zero_0_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ip_get_zero_0_clk = ip_get_planar_clk_to_clk_CLK;
    assign ip_get_zero_0_conf_in_rsc_dat = ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_DAT;
    assign ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_RDY = ip_get_zero_0_conf_in_rsc_rdy;
    assign ip_get_zero_0_conf_in_rsc_vld = ip_ctrl_ang_zero_out_rsc_to_ip_get_zero_0_conf_in_VLD;
    assign ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_DAT = ip_get_zero_0_hor_out_rsc_dat;
    assign ip_get_zero_0_hor_out_rsc_rdy = ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_RDY;
    assign ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_VLD = ip_get_zero_0_hor_out_rsc_vld;
    assign sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_DAT = ip_get_zero_0_ver_out_rsc_dat;
    assign ip_get_zero_0_ver_out_rsc_rdy = sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_RDY;
    assign sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_VLD = ip_get_zero_0_ver_out_rsc_vld;
    assign ip_get_zero_0_wdata = ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_WDATA;
    assign ip_get_zero_0_wraddress = ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_ADDR;
    assign ip_get_zero_0_wren = ip_get_zero_0_ref_to_ip_ctrl_ref10_rsc_WREN;
    // pred_buffer assignments:
    assign pred_buffer_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign pred_buffer_clk = ip_get_planar_clk_to_clk_CLK;
    assign pred_buffer_conf_in_rsc_dat = sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_DAT[31:0];
    assign sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_RDY = pred_buffer_conf_in_rsc_rdy;
    assign pred_buffer_conf_in_rsc_vld = sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_VLD;
    assign pred_buffer_intra_mode_in_rsc_dat = sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_DAT;
    assign sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_RDY = pred_buffer_intra_mode_in_rsc_rdy;
    assign pred_buffer_intra_mode_in_rsc_vld = sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_VLD;
    assign pred_buffer_pred_in_rsc_dat = sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_DAT;
    assign sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_RDY = pred_buffer_pred_in_rsc_rdy;
    assign pred_buffer_pred_in_rsc_vld = sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_VLD;
    assign pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_DAT = pred_buffer_pred_out_rsc_dat;
    assign pred_buffer_pred_out_rsc_rdy = pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_RDY;
    assign pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_VLD = pred_buffer_pred_out_rsc_vld;
    assign pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_DAT = pred_buffer_ref_out_rsc_dat;
    assign pred_buffer_ref_out_rsc_rdy = pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_RDY;
    assign pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_VLD = pred_buffer_ref_out_rsc_vld;
    assign pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_DAT = pred_buffer_resid_out_rsc_dat;
    assign pred_buffer_resid_out_rsc_rdy = pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_RDY;
    assign pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_VLD = pred_buffer_resid_out_rsc_vld;
    // pred_dc_fifo assignments:
    assign pred_dc_fifo_aclr_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign pred_dc_fifo_d = pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_DAT;
    assign pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_RDY = pred_dc_fifo_d_rdy;
    assign pred_dc_fifo_d_vld = pred_buffer_pred_out_rsc_to_pred_dc_fifo_data_in_VLD;
    assign pred_dc_fifo_data_out_to_pred_out_rsc_DAT = pred_dc_fifo_q;
    assign pred_dc_fifo_q_rdy = pred_dc_fifo_data_out_to_pred_out_rsc_RDY;
    assign pred_dc_fifo_data_out_to_pred_out_rsc_VLD = pred_dc_fifo_q_vld;
    assign pred_dc_fifo_rclk = ip_config_dc_fifo_in_clk_to_clk_base_CLK;
    assign pred_dc_fifo_wclk = ip_get_planar_clk_to_clk_CLK;
    // ref_dc_fifo assignments:
    assign ref_dc_fifo_aclr_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign ref_dc_fifo_d = pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_DAT;
    assign pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_RDY = ref_dc_fifo_d_rdy;
    assign ref_dc_fifo_d_vld = pred_buffer_ref_out_rsc_to_ref_dc_fifo_data_in_VLD;
    assign ref_dc_fifo_data_out_to_ref_out_rsc_DAT = ref_dc_fifo_q;
    assign ref_dc_fifo_q_rdy = ref_dc_fifo_data_out_to_ref_out_rsc_RDY;
    assign ref_dc_fifo_data_out_to_ref_out_rsc_VLD = ref_dc_fifo_q_vld;
    assign ref_dc_fifo_rclk = ip_config_dc_fifo_in_clk_to_clk_base_CLK;
    assign ref_dc_fifo_wclk = ip_get_planar_clk_to_clk_CLK;
    // resid_dc_fifo assignments:
    assign resid_dc_fifo_aclr_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign resid_dc_fifo_d = pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_DAT;
    assign pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_RDY = resid_dc_fifo_d_rdy;
    assign resid_dc_fifo_d_vld = pred_buffer_resid_out_rsc_to_resid_dc_fifo_data_in_VLD;
    assign resid_dc_fifo_data_out_to_resid_out_rsc_DAT = resid_dc_fifo_q;
    assign resid_dc_fifo_q_rdy = resid_dc_fifo_data_out_to_resid_out_rsc_RDY;
    assign resid_dc_fifo_data_out_to_resid_out_rsc_VLD = resid_dc_fifo_q_vld;
    assign resid_dc_fifo_rclk = ip_config_dc_fifo_in_clk_to_clk_base_CLK;
    assign resid_dc_fifo_wclk = ip_get_planar_clk_to_clk_CLK;
    // sad_conf_fifo assignments:
    assign sad_conf_fifo_aclr_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign sad_conf_fifo_clk = ip_get_planar_clk_to_clk_CLK;
    assign sad_conf_fifo_d = ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_DAT;
    assign ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_RDY = sad_conf_fifo_d_rdy;
    assign sad_conf_fifo_d_vld = ip_ctrl_sad_config_rsc_to_sad_conf_fifo_data_in_VLD;
    assign sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_DAT = sad_conf_fifo_q;
    assign sad_conf_fifo_q_rdy = sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_RDY;
    assign sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_VLD = sad_conf_fifo_q_vld;
    // sad_parallel assignments:
    assign sad_parallel_arst_n = ip_get_planar_arst_n_to_arst_n_arst_n;
    assign sad_parallel_clk = ip_get_planar_clk_to_clk_CLK;
    assign sad_parallel_conf_in_rsc_dat = sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_DAT;
    assign sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_RDY = sad_parallel_conf_in_rsc_rdy;
    assign sad_parallel_conf_in_rsc_vld = sad_conf_fifo_data_out_to_sad_parallel_conf_in_rsc_VLD;
    assign sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_DAT = sad_parallel_conf_out_rsc_dat;
    assign sad_parallel_conf_out_rsc_rdy = sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_RDY;
    assign sad_parallel_conf_out_rsc_to_pred_buffer_conf_in_rsc_VLD = sad_parallel_conf_out_rsc_vld;
    assign sad_parallel_in0_rsc_dat = sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_DAT;
    assign sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_RDY = sad_parallel_in0_rsc_rdy;
    assign sad_parallel_in0_rsc_vld = sad_parallel_in_rsc_0_to_ip_get_planar_pred_out_VLD;
    assign sad_parallel_in10_rsc_dat = ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_DAT;
    assign ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_RDY = sad_parallel_in10_rsc_rdy;
    assign sad_parallel_in10_rsc_vld = ip_get_zero_0_hor_out_to_sad_parallel_in_rsc_10_VLD;
    assign sad_parallel_in11_rsc_dat = ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_DAT;
    assign ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_RDY = sad_parallel_in11_rsc_rdy;
    assign sad_parallel_in11_rsc_vld = ip_get_neg_0_hor_out_to_sad_parallel_in_rsc_11_VLD;
    assign sad_parallel_in12_rsc_dat = ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_DAT;
    assign ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_RDY = sad_parallel_in12_rsc_rdy;
    assign sad_parallel_in12_rsc_vld = ip_get_neg_1_hor_out_to_sad_parallel_in_rsc_12_VLD;
    assign sad_parallel_in13_rsc_dat = ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_DAT;
    assign ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_RDY = sad_parallel_in13_rsc_rdy;
    assign sad_parallel_in13_rsc_vld = ip_get_neg_2_hor_out_to_sad_parallel_in_rsc_13_VLD;
    assign sad_parallel_in14_rsc_dat = ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_DAT;
    assign ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_RDY = sad_parallel_in14_rsc_rdy;
    assign sad_parallel_in14_rsc_vld = ip_get_neg_3_hor_out_to_sad_parallel_in_rsc_14_VLD;
    assign sad_parallel_in15_rsc_dat = ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_DAT;
    assign ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_RDY = sad_parallel_in15_rsc_rdy;
    assign sad_parallel_in15_rsc_vld = ip_get_neg_4_hor_out_to_sad_parallel_in_rsc_15_VLD;
    assign sad_parallel_in16_rsc_dat = ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_DAT;
    assign ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_RDY = sad_parallel_in16_rsc_rdy;
    assign sad_parallel_in16_rsc_vld = ip_get_neg_5_hor_out_to_sad_parallel_in_rsc_16_VLD;
    assign sad_parallel_in17_rsc_dat = ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_DAT;
    assign ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_RDY = sad_parallel_in17_rsc_rdy;
    assign sad_parallel_in17_rsc_vld = ip_get_neg_6_hor_out_to_sad_parallel_in_rsc_17_VLD;
    assign sad_parallel_in18_rsc_dat = ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_DAT;
    assign ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_RDY = sad_parallel_in18_rsc_rdy;
    assign sad_parallel_in18_rsc_vld = ip_get_neg_7_hor_out_to_sad_parallel_in_rsc_18_VLD;
    assign sad_parallel_in19_rsc_dat = sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_DAT;
    assign sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_RDY = sad_parallel_in19_rsc_rdy;
    assign sad_parallel_in19_rsc_vld = sad_parallel_in_rsc_19_to_ip_get_neg_6_ver_out_VLD;
    assign sad_parallel_in1_rsc_dat = ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_DAT;
    assign ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_RDY = sad_parallel_in1_rsc_rdy;
    assign sad_parallel_in1_rsc_vld = ip_get_dc_pred_out_to_sad_parallel_in_rsc_1_VLD;
    assign sad_parallel_in20_rsc_dat = sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_DAT;
    assign sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_RDY = sad_parallel_in20_rsc_rdy;
    assign sad_parallel_in20_rsc_vld = sad_parallel_in_rsc_20_to_ip_get_neg_5_ver_out_VLD;
    assign sad_parallel_in21_rsc_dat = ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_DAT;
    assign ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_RDY = sad_parallel_in21_rsc_rdy;
    assign sad_parallel_in21_rsc_vld = ip_get_neg_4_ver_out_to_sad_parallel_in_rsc_21_VLD;
    assign sad_parallel_in22_rsc_dat = sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_DAT;
    assign sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_RDY = sad_parallel_in22_rsc_rdy;
    assign sad_parallel_in22_rsc_vld = sad_parallel_in_rsc_22_to_ip_get_neg_3_ver_out_VLD;
    assign sad_parallel_in23_rsc_dat = sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_DAT;
    assign sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_RDY = sad_parallel_in23_rsc_rdy;
    assign sad_parallel_in23_rsc_vld = sad_parallel_in_rsc_23_to_ip_get_neg_2_ver_out_VLD;
    assign sad_parallel_in24_rsc_dat = sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_DAT;
    assign sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_RDY = sad_parallel_in24_rsc_rdy;
    assign sad_parallel_in24_rsc_vld = sad_parallel_in_rsc_24_to_ip_get_neg_1_ver_out_VLD;
    assign sad_parallel_in25_rsc_dat = sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_DAT;
    assign sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_RDY = sad_parallel_in25_rsc_rdy;
    assign sad_parallel_in25_rsc_vld = sad_parallel_in_rsc_25_to_ip_get_neg_0_ver_out_VLD;
    assign sad_parallel_in26_rsc_dat = sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_DAT;
    assign sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_RDY = sad_parallel_in26_rsc_rdy;
    assign sad_parallel_in26_rsc_vld = sad_parallel_in_rsc_26_to_ip_get_zero_0_ver_out_VLD;
    assign sad_parallel_in27_rsc_dat = sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_DAT;
    assign sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_RDY = sad_parallel_in27_rsc_rdy;
    assign sad_parallel_in27_rsc_vld = sad_parallel_in_rsc_27_to_ip_get_pos_7_ver_out_VLD;
    assign sad_parallel_in28_rsc_dat = sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_DAT;
    assign sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_RDY = sad_parallel_in28_rsc_rdy;
    assign sad_parallel_in28_rsc_vld = sad_parallel_in_rsc_28_to_ip_get_pos_6_ver_out_VLD;
    assign sad_parallel_in29_rsc_dat = sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_DAT;
    assign sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_RDY = sad_parallel_in29_rsc_rdy;
    assign sad_parallel_in29_rsc_vld = sad_parallel_in_rsc_29_to_ip_get_pos_5_ver_out_VLD;
    assign sad_parallel_in2_rsc_dat = ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_DAT;
    assign ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_RDY = sad_parallel_in2_rsc_rdy;
    assign sad_parallel_in2_rsc_vld = ip_get_pos_0_hor_out_to_sad_parallel_in_rsc_2_VLD;
    assign sad_parallel_in30_rsc_dat = sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_DAT;
    assign sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_RDY = sad_parallel_in30_rsc_rdy;
    assign sad_parallel_in30_rsc_vld = sad_parallel_in_rsc_30_to_ip_get_pos_4_ver_out_VLD;
    assign sad_parallel_in31_rsc_dat = sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_DAT;
    assign sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_RDY = sad_parallel_in31_rsc_rdy;
    assign sad_parallel_in31_rsc_vld = sad_parallel_in_rsc_31_to_ip_get_pos_3_ver_out_VLD;
    assign sad_parallel_in32_rsc_dat = sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_DAT;
    assign sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_RDY = sad_parallel_in32_rsc_rdy;
    assign sad_parallel_in32_rsc_vld = sad_parallel_in_rsc_32_to_ip_get_pos_2_ver_out_VLD;
    assign sad_parallel_in33_rsc_dat = ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_DAT;
    assign ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_RDY = sad_parallel_in33_rsc_rdy;
    assign sad_parallel_in33_rsc_vld = ip_get_pos_1_ver_out_to_sad_parallel_in_rsc_33_VLD;
    assign sad_parallel_in34_rsc_dat = sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_DAT;
    assign sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_RDY = sad_parallel_in34_rsc_rdy;
    assign sad_parallel_in34_rsc_vld = sad_parallel_in_rsc_34_to_ip_get_pos_0_ver_out_VLD;
    assign sad_parallel_in3_rsc_dat = sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_DAT;
    assign sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_RDY = sad_parallel_in3_rsc_rdy;
    assign sad_parallel_in3_rsc_vld = sad_parallel_in_rsc_3_to_ip_get_pos_1_hor_out_VLD;
    assign sad_parallel_in4_rsc_dat = ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_DAT;
    assign ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_RDY = sad_parallel_in4_rsc_rdy;
    assign sad_parallel_in4_rsc_vld = ip_get_pos_2_hor_out_to_sad_parallel_in_rsc_4_VLD;
    assign sad_parallel_in5_rsc_dat = ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_DAT;
    assign ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_RDY = sad_parallel_in5_rsc_rdy;
    assign sad_parallel_in5_rsc_vld = ip_get_pos_3_hor_out_to_sad_parallel_in_rsc_5_VLD;
    assign sad_parallel_in6_rsc_dat = ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_DAT;
    assign ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_RDY = sad_parallel_in6_rsc_rdy;
    assign sad_parallel_in6_rsc_vld = ip_get_pos_4_hor_out_to_sad_parallel_in_rsc_6_VLD;
    assign sad_parallel_in7_rsc_dat = ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_DAT;
    assign ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_RDY = sad_parallel_in7_rsc_rdy;
    assign sad_parallel_in7_rsc_vld = ip_get_pos_5_hor_out_to_sad_parallel_in_rsc_7_VLD;
    assign sad_parallel_in8_rsc_dat = ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_DAT;
    assign ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_RDY = sad_parallel_in8_rsc_rdy;
    assign sad_parallel_in8_rsc_vld = ip_get_pos_6_hor_out_to_sad_parallel_in_rsc_8_VLD;
    assign sad_parallel_in9_rsc_dat = ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_DAT;
    assign ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_RDY = sad_parallel_in9_rsc_rdy;
    assign sad_parallel_in9_rsc_vld = ip_get_pos_7_hor_out_to_sad_parallel_in_rsc_9_VLD;
    assign sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_DAT = sad_parallel_intra_mode_out_rsc_dat;
    assign sad_parallel_intra_mode_out_rsc_rdy = sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_RDY;
    assign sad_parallel_intra_mode_out_to_pred_buffer_intra_mode_in_VLD = sad_parallel_intra_mode_out_rsc_vld;
    assign sad_parallel_lcu_ref_rsc_to_bus_ADDR = sad_parallel_lcu_ref_rsc_adr;
    assign sad_parallel_lcu_ref_rsc_to_bus_WDATA = sad_parallel_lcu_ref_rsc_d;
    assign sad_parallel_lcu_ref_rsc_q = sad_parallel_lcu_ref_rsc_to_bus_RDATA;
    assign sad_parallel_lcu_ref_rsc_to_bus_WREN = sad_parallel_lcu_ref_rsc_we;
    assign sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_DAT = sad_parallel_pred_out_rsc_dat;
    assign sad_parallel_pred_out_rsc_rdy = sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_RDY;
    assign sad_parallel_pred_out_rsc_to_pred_buffer_pred_in_rsc_VLD = sad_parallel_pred_out_rsc_vld;

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (88),
        .width_out_g         (88),
        .size_g              (256),
        .use_memory_g        ("ON"))
    ip_config_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (ip_config_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (ip_config_dc_fifo_d),
        .d_vld               (ip_config_dc_fifo_d_vld),
        .d_rdy               (ip_config_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (ip_config_dc_fifo_q_rdy),
        .q                   (ip_config_dc_fifo_q),
        .q_vld               (ip_config_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (ip_config_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (ip_config_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:main_ip_ctrl:1.0
    main_ip_ctrl ip_ctrl(
        // Interface: ang_neg_out_11_rsc
        .ang_neg_out11_rsc_rdy(ip_ctrl_ang_neg_out11_rsc_rdy),
        .ang_neg_out11_rsc_dat(ip_ctrl_ang_neg_out11_rsc_dat),
        .ang_neg_out11_rsc_vld(ip_ctrl_ang_neg_out11_rsc_vld),
        // Interface: ang_neg_out_12_rsc
        .ang_neg_out12_rsc_rdy(ip_ctrl_ang_neg_out12_rsc_rdy),
        .ang_neg_out12_rsc_dat(ip_ctrl_ang_neg_out12_rsc_dat),
        .ang_neg_out12_rsc_vld(ip_ctrl_ang_neg_out12_rsc_vld),
        // Interface: ang_neg_out_13_rsc
        .ang_neg_out13_rsc_rdy(ip_ctrl_ang_neg_out13_rsc_rdy),
        .ang_neg_out13_rsc_dat(ip_ctrl_ang_neg_out13_rsc_dat),
        .ang_neg_out13_rsc_vld(ip_ctrl_ang_neg_out13_rsc_vld),
        // Interface: ang_neg_out_14_rsc
        .ang_neg_out14_rsc_rdy(ip_ctrl_ang_neg_out14_rsc_rdy),
        .ang_neg_out14_rsc_dat(ip_ctrl_ang_neg_out14_rsc_dat),
        .ang_neg_out14_rsc_vld(ip_ctrl_ang_neg_out14_rsc_vld),
        // Interface: ang_neg_out_15_rsc
        .ang_neg_out15_rsc_rdy(ip_ctrl_ang_neg_out15_rsc_rdy),
        .ang_neg_out15_rsc_dat(ip_ctrl_ang_neg_out15_rsc_dat),
        .ang_neg_out15_rsc_vld(ip_ctrl_ang_neg_out15_rsc_vld),
        // Interface: ang_neg_out_16_rsc
        .ang_neg_out16_rsc_rdy(ip_ctrl_ang_neg_out16_rsc_rdy),
        .ang_neg_out16_rsc_dat(ip_ctrl_ang_neg_out16_rsc_dat),
        .ang_neg_out16_rsc_vld(ip_ctrl_ang_neg_out16_rsc_vld),
        // Interface: ang_neg_out_17_rsc
        .ang_neg_out17_rsc_rdy(ip_ctrl_ang_neg_out17_rsc_rdy),
        .ang_neg_out17_rsc_dat(ip_ctrl_ang_neg_out17_rsc_dat),
        .ang_neg_out17_rsc_vld(ip_ctrl_ang_neg_out17_rsc_vld),
        // Interface: ang_neg_out_18_rsc
        .ang_neg_out18_rsc_rdy(ip_ctrl_ang_neg_out18_rsc_rdy),
        .ang_neg_out18_rsc_dat(ip_ctrl_ang_neg_out18_rsc_dat),
        .ang_neg_out18_rsc_vld(ip_ctrl_ang_neg_out18_rsc_vld),
        // Interface: ang_pos_out2_rsc
        .ang_pos_out2_rsc_rdy(ip_ctrl_ang_pos_out2_rsc_rdy),
        .ang_pos_out2_rsc_dat(ip_ctrl_ang_pos_out2_rsc_dat),
        .ang_pos_out2_rsc_vld(ip_ctrl_ang_pos_out2_rsc_vld),
        // Interface: ang_pos_out3_rsc
        .ang_pos_out3_rsc_rdy(ip_ctrl_ang_pos_out3_rsc_rdy),
        .ang_pos_out3_rsc_dat(ip_ctrl_ang_pos_out3_rsc_dat),
        .ang_pos_out3_rsc_vld(ip_ctrl_ang_pos_out3_rsc_vld),
        // Interface: ang_pos_out4_rsc
        .ang_pos_out4_rsc_rdy(ip_ctrl_ang_pos_out4_rsc_rdy),
        .ang_pos_out4_rsc_dat(ip_ctrl_ang_pos_out4_rsc_dat),
        .ang_pos_out4_rsc_vld(ip_ctrl_ang_pos_out4_rsc_vld),
        // Interface: ang_pos_out5_rsc
        .ang_pos_out5_rsc_rdy(ip_ctrl_ang_pos_out5_rsc_rdy),
        .ang_pos_out5_rsc_dat(ip_ctrl_ang_pos_out5_rsc_dat),
        .ang_pos_out5_rsc_vld(ip_ctrl_ang_pos_out5_rsc_vld),
        // Interface: ang_pos_out6_rsc
        .ang_pos_out6_rsc_rdy(ip_ctrl_ang_pos_out6_rsc_rdy),
        .ang_pos_out6_rsc_dat(ip_ctrl_ang_pos_out6_rsc_dat),
        .ang_pos_out6_rsc_vld(ip_ctrl_ang_pos_out6_rsc_vld),
        // Interface: ang_pos_out7_rsc
        .ang_pos_out7_rsc_rdy(ip_ctrl_ang_pos_out7_rsc_rdy),
        .ang_pos_out7_rsc_dat(ip_ctrl_ang_pos_out7_rsc_dat),
        .ang_pos_out7_rsc_vld(ip_ctrl_ang_pos_out7_rsc_vld),
        // Interface: ang_pos_out8_rsc
        .ang_pos_out8_rsc_rdy(ip_ctrl_ang_pos_out8_rsc_rdy),
        .ang_pos_out8_rsc_dat(ip_ctrl_ang_pos_out8_rsc_dat),
        .ang_pos_out8_rsc_vld(ip_ctrl_ang_pos_out8_rsc_vld),
        // Interface: ang_pos_out9_rsc
        .ang_pos_out9_rsc_rdy(ip_ctrl_ang_pos_out9_rsc_rdy),
        .ang_pos_out9_rsc_dat(ip_ctrl_ang_pos_out9_rsc_dat),
        .ang_pos_out9_rsc_vld(ip_ctrl_ang_pos_out9_rsc_vld),
        // Interface: ang_zero_out_rsc
        .ang_zero_out_rsc_rdy(ip_ctrl_ang_zero_out_rsc_rdy),
        .ang_zero_out_rsc_dat(ip_ctrl_ang_zero_out_rsc_dat),
        .ang_zero_out_rsc_vld(ip_ctrl_ang_zero_out_rsc_vld),
        // Interface: arst_n
        .arst_n              (ip_ctrl_arst_n),
        // Interface: clk
        .clk                 (ip_ctrl_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (ip_ctrl_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_ctrl_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_ctrl_conf_in_rsc_rdy),
        // Interface: dc_out_rsc
        .dc_out_rsc_rdy      (ip_ctrl_dc_out_rsc_rdy),
        .dc_out_rsc_dat      (ip_ctrl_dc_out_rsc_dat),
        .dc_out_rsc_vld      (ip_ctrl_dc_out_rsc_vld),
        // Interface: planar_out_rsc
        .planar_out_rsc_rdy  (ip_ctrl_planar_out_rsc_rdy),
        .planar_out_rsc_dat  (ip_ctrl_planar_out_rsc_dat),
        .planar_out_rsc_vld  (ip_ctrl_planar_out_rsc_vld),
        // Interface: ref0_rsc
        .ref0_rsc_q          (),
        .ref0_rsc_adr        (ip_ctrl_ref0_rsc_adr),
        .ref0_rsc_d          (ip_ctrl_ref0_rsc_d),
        .ref0_rsc_we         (ip_ctrl_ref0_rsc_we),
        // Interface: ref10_rsc
        .ref10_rsc_q         (),
        .ref10_rsc_adr       (ip_ctrl_ref10_rsc_adr),
        .ref10_rsc_d         (ip_ctrl_ref10_rsc_d),
        .ref10_rsc_we        (ip_ctrl_ref10_rsc_we),
        // Interface: ref11_rsc
        .ref11_rsc_q         (),
        .ref11_rsc_adr       (ip_ctrl_ref11_rsc_adr),
        .ref11_rsc_d         (ip_ctrl_ref11_rsc_d),
        .ref11_rsc_we        (ip_ctrl_ref11_rsc_we),
        // Interface: ref12_rsc
        .ref12_rsc_q         (),
        .ref12_rsc_adr       (ip_ctrl_ref12_rsc_adr),
        .ref12_rsc_d         (ip_ctrl_ref12_rsc_d),
        .ref12_rsc_we        (ip_ctrl_ref12_rsc_we),
        // Interface: ref13_rsc
        .ref13_rsc_q         (),
        .ref13_rsc_adr       (ip_ctrl_ref13_rsc_adr),
        .ref13_rsc_d         (ip_ctrl_ref13_rsc_d),
        .ref13_rsc_we        (ip_ctrl_ref13_rsc_we),
        // Interface: ref14_rsc
        .ref14_rsc_q         (),
        .ref14_rsc_adr       (ip_ctrl_ref14_rsc_adr),
        .ref14_rsc_d         (ip_ctrl_ref14_rsc_d),
        .ref14_rsc_we        (ip_ctrl_ref14_rsc_we),
        // Interface: ref15_rsc
        .ref15_rsc_q         (),
        .ref15_rsc_adr       (ip_ctrl_ref15_rsc_adr),
        .ref15_rsc_d         (ip_ctrl_ref15_rsc_d),
        .ref15_rsc_we        (ip_ctrl_ref15_rsc_we),
        // Interface: ref16_rsc
        .ref16_rsc_q         (),
        .ref16_rsc_adr       (ip_ctrl_ref16_rsc_adr),
        .ref16_rsc_d         (ip_ctrl_ref16_rsc_d),
        .ref16_rsc_we        (ip_ctrl_ref16_rsc_we),
        // Interface: ref17_rsc
        .ref17_rsc_q         (),
        .ref17_rsc_adr       (ip_ctrl_ref17_rsc_adr),
        .ref17_rsc_d         (ip_ctrl_ref17_rsc_d),
        .ref17_rsc_we        (ip_ctrl_ref17_rsc_we),
        // Interface: ref18_rsc
        .ref18_rsc_q         (),
        .ref18_rsc_adr       (ip_ctrl_ref18_rsc_adr),
        .ref18_rsc_d         (ip_ctrl_ref18_rsc_d),
        .ref18_rsc_we        (ip_ctrl_ref18_rsc_we),
        // Interface: ref1_rsc
        .ref1_rsc_q          (),
        .ref1_rsc_adr        (ip_ctrl_ref1_rsc_adr),
        .ref1_rsc_d          (ip_ctrl_ref1_rsc_d),
        .ref1_rsc_we         (ip_ctrl_ref1_rsc_we),
        // Interface: ref2_rsc
        .ref2_rsc_q          (),
        .ref2_rsc_adr        (ip_ctrl_ref2_rsc_adr),
        .ref2_rsc_d          (ip_ctrl_ref2_rsc_d),
        .ref2_rsc_we         (ip_ctrl_ref2_rsc_we),
        // Interface: ref3_rsc
        .ref3_rsc_q          (),
        .ref3_rsc_adr        (ip_ctrl_ref3_rsc_adr),
        .ref3_rsc_d          (ip_ctrl_ref3_rsc_d),
        .ref3_rsc_we         (ip_ctrl_ref3_rsc_we),
        // Interface: ref4_rsc
        .ref4_rsc_q          (),
        .ref4_rsc_adr        (ip_ctrl_ref4_rsc_adr),
        .ref4_rsc_d          (ip_ctrl_ref4_rsc_d),
        .ref4_rsc_we         (ip_ctrl_ref4_rsc_we),
        // Interface: ref5_rsc
        .ref5_rsc_q          (),
        .ref5_rsc_adr        (ip_ctrl_ref5_rsc_adr),
        .ref5_rsc_d          (ip_ctrl_ref5_rsc_d),
        .ref5_rsc_we         (ip_ctrl_ref5_rsc_we),
        // Interface: ref6_rsc
        .ref6_rsc_q          (),
        .ref6_rsc_adr        (ip_ctrl_ref6_rsc_adr),
        .ref6_rsc_d          (ip_ctrl_ref6_rsc_d),
        .ref6_rsc_we         (ip_ctrl_ref6_rsc_we),
        // Interface: ref7_rsc
        .ref7_rsc_q          (),
        .ref7_rsc_adr        (ip_ctrl_ref7_rsc_adr),
        .ref7_rsc_d          (ip_ctrl_ref7_rsc_d),
        .ref7_rsc_we         (ip_ctrl_ref7_rsc_we),
        // Interface: ref8_rsc
        .ref8_rsc_q          (),
        .ref8_rsc_adr        (ip_ctrl_ref8_rsc_adr),
        .ref8_rsc_d          (ip_ctrl_ref8_rsc_d),
        .ref8_rsc_we         (ip_ctrl_ref8_rsc_we),
        // Interface: ref9_rsc
        .ref9_rsc_q          (),
        .ref9_rsc_adr        (ip_ctrl_ref9_rsc_adr),
        .ref9_rsc_d          (ip_ctrl_ref9_rsc_d),
        .ref9_rsc_we         (ip_ctrl_ref9_rsc_we),
        // Interface: sad_config_rsc
        .sad_config_rsc_rdy  (ip_ctrl_sad_config_rsc_rdy),
        .sad_config_rsc_dat  (ip_ctrl_sad_config_rsc_dat),
        .sad_config_rsc_vld  (ip_ctrl_sad_config_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_dc:1.0
    ip_get_dc_0 ip_get_dc(
        // Interface: arst_n
        .arst_n              (ip_get_dc_arst_n),
        // Interface: clk
        .clk                 (ip_get_dc_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_dc_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_dc_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_dc_conf_in_rsc_rdy),
        // Interface: pred_out
        .pred_out_rsc_rdy    (ip_get_dc_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (ip_get_dc_pred_out_rsc_dat),
        .pred_out_rsc_vld    (ip_get_dc_pred_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_dc_wdata),
        .wraddress           (ip_get_dc_wraddress),
        .wren                (ip_get_dc_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_0 ip_get_neg_0(
        // Interface: arst_n
        .arst_n              (ip_get_neg_0_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_0_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_0_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_0_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_0_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_0_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_0_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_0_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_0_wdata),
        .wraddress           (ip_get_neg_0_wraddress),
        .wren                (ip_get_neg_0_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_0_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_0_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_0_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_1 ip_get_neg_1(
        // Interface: arst_n
        .arst_n              (ip_get_neg_1_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_1_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_1_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_1_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_1_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_1_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_1_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_1_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_1_wdata),
        .wraddress           (ip_get_neg_1_wraddress),
        .wren                (ip_get_neg_1_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_1_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_1_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_1_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_2 ip_get_neg_2(
        // Interface: arst_n
        .arst_n              (ip_get_neg_2_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_2_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_2_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_2_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_2_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_2_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_2_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_2_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_2_wdata),
        .wraddress           (ip_get_neg_2_wraddress),
        .wren                (ip_get_neg_2_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_2_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_2_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_2_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_3 ip_get_neg_3(
        // Interface: arst_n
        .arst_n              (ip_get_neg_3_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_3_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_3_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_3_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_3_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_3_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_3_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_3_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_3_wdata),
        .wraddress           (ip_get_neg_3_wraddress),
        .wren                (ip_get_neg_3_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_3_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_3_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_3_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_4 ip_get_neg_4(
        // Interface: arst_n
        .arst_n              (ip_get_neg_4_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_4_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_4_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_4_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_4_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_4_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_4_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_4_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_4_wdata),
        .wraddress           (ip_get_neg_4_wraddress),
        .wren                (ip_get_neg_4_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_4_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_4_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_4_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_5 ip_get_neg_5(
        // Interface: arst_n
        .arst_n              (ip_get_neg_5_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_5_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_5_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_5_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_5_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_5_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_5_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_5_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_5_wdata),
        .wraddress           (ip_get_neg_5_wraddress),
        .wren                (ip_get_neg_5_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_5_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_5_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_5_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_6 ip_get_neg_6(
        // Interface: arst_n
        .arst_n              (ip_get_neg_6_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_6_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_6_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_6_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_6_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_6_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_6_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_6_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_6_wdata),
        .wraddress           (ip_get_neg_6_wraddress),
        .wren                (ip_get_neg_6_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_6_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_6_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_6_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg:1.0
    ip_get_neg_7 ip_get_neg_7(
        // Interface: arst_n
        .arst_n              (ip_get_neg_7_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_7_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_7_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_7_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_7_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_7_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_7_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_7_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_neg_7_wdata),
        .wraddress           (ip_get_neg_7_wraddress),
        .wren                (ip_get_neg_7_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_7_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (),
        .ver_out_rsc_vld     ());

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_planar:1.0
    ip_get_planar_0 ip_get_planar(
        // Interface: arst_n
        .arst_n              (ip_get_planar_arst_n),
        // Interface: clk
        .clk                 (ip_get_planar_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_planar_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_planar_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_planar_conf_in_rsc_rdy),
        // Interface: pred_out
        .pred_out_rsc_rdy    (ip_get_planar_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (ip_get_planar_pred_out_rsc_dat),
        .pred_out_rsc_vld    (ip_get_planar_pred_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_planar_wdata),
        .wraddress           (ip_get_planar_wraddress),
        .wren                (ip_get_planar_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_0 ip_get_pos_0(
        // Interface: arst_n
        .arst_n              (ip_get_pos_0_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_0_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_0_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_0_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_0_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_0_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_0_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_0_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_0_wdata),
        .wraddress           (ip_get_pos_0_wraddress),
        .wren                (ip_get_pos_0_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_0_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_0_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_0_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_1 ip_get_pos_1(
        // Interface: arst_n
        .arst_n              (ip_get_pos_1_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_1_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_1_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_1_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_1_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_1_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_1_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_1_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_1_wdata),
        .wraddress           (ip_get_pos_1_wraddress),
        .wren                (ip_get_pos_1_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_1_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_1_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_1_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_2 ip_get_pos_2(
        // Interface: arst_n
        .arst_n              (ip_get_pos_2_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_2_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_2_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_2_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_2_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_2_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_2_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_2_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_2_wdata),
        .wraddress           (ip_get_pos_2_wraddress),
        .wren                (ip_get_pos_2_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_2_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_2_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_2_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_3 ip_get_pos_3(
        // Interface: arst_n
        .arst_n              (ip_get_pos_3_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_3_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_3_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_3_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_3_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_3_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_3_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_3_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_3_wdata),
        .wraddress           (ip_get_pos_3_wraddress),
        .wren                (ip_get_pos_3_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_3_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_3_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_3_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_4 ip_get_pos_4(
        // Interface: arst_n
        .arst_n              (ip_get_pos_4_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_4_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_4_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_4_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_4_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_4_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_4_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_4_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_4_wdata),
        .wraddress           (ip_get_pos_4_wraddress),
        .wren                (ip_get_pos_4_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_4_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_4_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_4_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_5 ip_get_pos_5(
        // Interface: arst_n
        .arst_n              (ip_get_pos_5_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_5_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_5_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_5_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_5_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_5_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_5_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_5_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_5_wdata),
        .wraddress           (ip_get_pos_5_wraddress),
        .wren                (ip_get_pos_5_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_5_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_5_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_5_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_6 ip_get_pos_6(
        // Interface: arst_n
        .arst_n              (ip_get_pos_6_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_6_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_6_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_6_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_6_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_6_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_6_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_6_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_6_wdata),
        .wraddress           (ip_get_pos_6_wraddress),
        .wren                (ip_get_pos_6_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_6_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_6_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_6_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_pos:1.0
    ip_get_pos_7 ip_get_pos_7(
        // Interface: arst_n
        .arst_n              (ip_get_pos_7_arst_n),
        // Interface: clk
        .clk                 (ip_get_pos_7_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_pos_7_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_pos_7_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_pos_7_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_pos_7_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_pos_7_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_pos_7_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_pos_7_wdata),
        .wraddress           (ip_get_pos_7_wraddress),
        .wren                (ip_get_pos_7_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_pos_7_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_pos_7_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_pos_7_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_zero:1.0
    ip_get_zero_0 ip_get_zero_0(
        // Interface: arst_n
        .arst_n              (ip_get_zero_0_arst_n),
        // Interface: clk
        .clk                 (ip_get_zero_0_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_zero_0_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_zero_0_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_zero_0_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_zero_0_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_zero_0_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_zero_0_hor_out_rsc_vld),
        // Interface: ref
        .wdata               (ip_get_zero_0_wdata),
        .wraddress           (ip_get_zero_0_wraddress),
        .wren                (ip_get_zero_0_wren),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_zero_0_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_zero_0_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_zero_0_ver_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:pred_buffer:1.0
    pred_buffer_0 pred_buffer(
        // Interface: arst_n
        .arst_n              (pred_buffer_arst_n),
        // Interface: clk
        .clk                 (pred_buffer_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (pred_buffer_conf_in_rsc_dat),
        .conf_in_rsc_vld     (pred_buffer_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (pred_buffer_conf_in_rsc_rdy),
        // Interface: intra_mode_in
        .intra_mode_in_rsc_dat(pred_buffer_intra_mode_in_rsc_dat),
        .intra_mode_in_rsc_vld(pred_buffer_intra_mode_in_rsc_vld),
        .intra_mode_in_rsc_rdy(pred_buffer_intra_mode_in_rsc_rdy),
        // Interface: pred_in_rsc
        .pred_in_rsc_dat     (pred_buffer_pred_in_rsc_dat),
        .pred_in_rsc_vld     (pred_buffer_pred_in_rsc_vld),
        .pred_in_rsc_rdy     (pred_buffer_pred_in_rsc_rdy),
        // Interface: pred_out_rsc
        .pred_out_rsc_rdy    (pred_buffer_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (pred_buffer_pred_out_rsc_dat),
        .pred_out_rsc_vld    (pred_buffer_pred_out_rsc_vld),
        // Interface: ref_out_rsc
        .ref_out_rsc_rdy     (pred_buffer_ref_out_rsc_rdy),
        .ref_out_rsc_dat     (pred_buffer_ref_out_rsc_dat),
        .ref_out_rsc_vld     (pred_buffer_ref_out_rsc_vld),
        // Interface: resid_out_rsc
        .resid_out_rsc_rdy   (pred_buffer_resid_out_rsc_rdy),
        .resid_out_rsc_dat   (pred_buffer_resid_out_rsc_dat),
        .resid_out_rsc_vld   (pred_buffer_resid_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (256),
        .width_out_g         (256),
        .size_g              (128),
        .use_memory_g        ("ON"))
    pred_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (pred_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (pred_dc_fifo_d),
        .d_vld               (pred_dc_fifo_d_vld),
        .d_rdy               (pred_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (pred_dc_fifo_q_rdy),
        .q                   (pred_dc_fifo_q),
        .q_vld               (pred_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (pred_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (pred_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (256),
        .width_out_g         (256),
        .size_g              (128),
        .use_memory_g        ("ON"))
    ref_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (ref_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (ref_dc_fifo_d),
        .d_vld               (ref_dc_fifo_d_vld),
        .d_rdy               (ref_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (ref_dc_fifo_q_rdy),
        .q                   (ref_dc_fifo_q),
        .q_vld               (ref_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (ref_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (ref_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:dc_fifo:1.0
    dc_fifo #(
        .width_in_g          (288),
        .width_out_g         (288),
        .size_g              (8),
        .use_memory_g        ("ON"))
    resid_dc_fifo(
        // Interface: aclr_n
        .aclr_n              (resid_dc_fifo_aclr_n),
        // Interface: data_in
        .d                   (resid_dc_fifo_d),
        .d_vld               (resid_dc_fifo_d_vld),
        .d_rdy               (resid_dc_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (resid_dc_fifo_q_rdy),
        .q                   (resid_dc_fifo_q),
        .q_vld               (resid_dc_fifo_q_vld),
        // Interface: in_clk
        .wclk                (resid_dc_fifo_wclk),
        // Interface: out_clk
        .rclk                (resid_dc_fifo_rclk),
        // These ports are not in any interface
        .rdused              ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (64),
        .size_g              (4),
        .use_memory_g        ("OFF"))
    sad_conf_fifo(
        // Interface: aclr_n
        .aclr_n              (sad_conf_fifo_aclr_n),
        // Interface: clk
        .clk                 (sad_conf_fifo_clk),
        // Interface: data_in
        .d                   (sad_conf_fifo_d),
        .d_vld               (sad_conf_fifo_d_vld),
        .d_rdy               (sad_conf_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (sad_conf_fifo_q_rdy),
        .q                   (sad_conf_fifo_q),
        .q_vld               (sad_conf_fifo_q_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:sad_parallel:1.0
    main_sad_parallel     sad_parallel(
        // Interface: arst_n
        .arst_n              (sad_parallel_arst_n),
        // Interface: clk
        .clk                 (sad_parallel_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (sad_parallel_conf_in_rsc_dat),
        .conf_in_rsc_vld     (sad_parallel_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (sad_parallel_conf_in_rsc_rdy),
        // Interface: conf_out_rsc
        .conf_out_rsc_rdy    (sad_parallel_conf_out_rsc_rdy),
        .conf_out_rsc_dat    (sad_parallel_conf_out_rsc_dat),
        .conf_out_rsc_vld    (sad_parallel_conf_out_rsc_vld),
        // Interface: in_rsc_0
        .in0_rsc_dat         (sad_parallel_in0_rsc_dat),
        .in0_rsc_vld         (sad_parallel_in0_rsc_vld),
        .in0_rsc_rdy         (sad_parallel_in0_rsc_rdy),
        // Interface: in_rsc_1
        .in1_rsc_dat         (sad_parallel_in1_rsc_dat),
        .in1_rsc_vld         (sad_parallel_in1_rsc_vld),
        .in1_rsc_rdy         (sad_parallel_in1_rsc_rdy),
        // Interface: in_rsc_10
        .in10_rsc_dat        (sad_parallel_in10_rsc_dat),
        .in10_rsc_vld        (sad_parallel_in10_rsc_vld),
        .in10_rsc_rdy        (sad_parallel_in10_rsc_rdy),
        // Interface: in_rsc_11
        .in11_rsc_dat        (sad_parallel_in11_rsc_dat),
        .in11_rsc_vld        (sad_parallel_in11_rsc_vld),
        .in11_rsc_rdy        (sad_parallel_in11_rsc_rdy),
        // Interface: in_rsc_12
        .in12_rsc_dat        (sad_parallel_in12_rsc_dat),
        .in12_rsc_vld        (sad_parallel_in12_rsc_vld),
        .in12_rsc_rdy        (sad_parallel_in12_rsc_rdy),
        // Interface: in_rsc_13
        .in13_rsc_dat        (sad_parallel_in13_rsc_dat),
        .in13_rsc_vld        (sad_parallel_in13_rsc_vld),
        .in13_rsc_rdy        (sad_parallel_in13_rsc_rdy),
        // Interface: in_rsc_14
        .in14_rsc_dat        (sad_parallel_in14_rsc_dat),
        .in14_rsc_vld        (sad_parallel_in14_rsc_vld),
        .in14_rsc_rdy        (sad_parallel_in14_rsc_rdy),
        // Interface: in_rsc_15
        .in15_rsc_dat        (sad_parallel_in15_rsc_dat),
        .in15_rsc_vld        (sad_parallel_in15_rsc_vld),
        .in15_rsc_rdy        (sad_parallel_in15_rsc_rdy),
        // Interface: in_rsc_16
        .in16_rsc_dat        (sad_parallel_in16_rsc_dat),
        .in16_rsc_vld        (sad_parallel_in16_rsc_vld),
        .in16_rsc_rdy        (sad_parallel_in16_rsc_rdy),
        // Interface: in_rsc_17
        .in17_rsc_dat        (sad_parallel_in17_rsc_dat),
        .in17_rsc_vld        (sad_parallel_in17_rsc_vld),
        .in17_rsc_rdy        (sad_parallel_in17_rsc_rdy),
        // Interface: in_rsc_18
        .in18_rsc_dat        (sad_parallel_in18_rsc_dat),
        .in18_rsc_vld        (sad_parallel_in18_rsc_vld),
        .in18_rsc_rdy        (sad_parallel_in18_rsc_rdy),
        // Interface: in_rsc_19
        .in19_rsc_dat        (sad_parallel_in19_rsc_dat),
        .in19_rsc_vld        (sad_parallel_in19_rsc_vld),
        .in19_rsc_rdy        (sad_parallel_in19_rsc_rdy),
        // Interface: in_rsc_2
        .in2_rsc_dat         (sad_parallel_in2_rsc_dat),
        .in2_rsc_vld         (sad_parallel_in2_rsc_vld),
        .in2_rsc_rdy         (sad_parallel_in2_rsc_rdy),
        // Interface: in_rsc_20
        .in20_rsc_dat        (sad_parallel_in20_rsc_dat),
        .in20_rsc_vld        (sad_parallel_in20_rsc_vld),
        .in20_rsc_rdy        (sad_parallel_in20_rsc_rdy),
        // Interface: in_rsc_21
        .in21_rsc_dat        (sad_parallel_in21_rsc_dat),
        .in21_rsc_vld        (sad_parallel_in21_rsc_vld),
        .in21_rsc_rdy        (sad_parallel_in21_rsc_rdy),
        // Interface: in_rsc_22
        .in22_rsc_dat        (sad_parallel_in22_rsc_dat),
        .in22_rsc_vld        (sad_parallel_in22_rsc_vld),
        .in22_rsc_rdy        (sad_parallel_in22_rsc_rdy),
        // Interface: in_rsc_23
        .in23_rsc_dat        (sad_parallel_in23_rsc_dat),
        .in23_rsc_vld        (sad_parallel_in23_rsc_vld),
        .in23_rsc_rdy        (sad_parallel_in23_rsc_rdy),
        // Interface: in_rsc_24
        .in24_rsc_dat        (sad_parallel_in24_rsc_dat),
        .in24_rsc_vld        (sad_parallel_in24_rsc_vld),
        .in24_rsc_rdy        (sad_parallel_in24_rsc_rdy),
        // Interface: in_rsc_25
        .in25_rsc_dat        (sad_parallel_in25_rsc_dat),
        .in25_rsc_vld        (sad_parallel_in25_rsc_vld),
        .in25_rsc_rdy        (sad_parallel_in25_rsc_rdy),
        // Interface: in_rsc_26
        .in26_rsc_dat        (sad_parallel_in26_rsc_dat),
        .in26_rsc_vld        (sad_parallel_in26_rsc_vld),
        .in26_rsc_rdy        (sad_parallel_in26_rsc_rdy),
        // Interface: in_rsc_27
        .in27_rsc_dat        (sad_parallel_in27_rsc_dat),
        .in27_rsc_vld        (sad_parallel_in27_rsc_vld),
        .in27_rsc_rdy        (sad_parallel_in27_rsc_rdy),
        // Interface: in_rsc_28
        .in28_rsc_dat        (sad_parallel_in28_rsc_dat),
        .in28_rsc_vld        (sad_parallel_in28_rsc_vld),
        .in28_rsc_rdy        (sad_parallel_in28_rsc_rdy),
        // Interface: in_rsc_29
        .in29_rsc_dat        (sad_parallel_in29_rsc_dat),
        .in29_rsc_vld        (sad_parallel_in29_rsc_vld),
        .in29_rsc_rdy        (sad_parallel_in29_rsc_rdy),
        // Interface: in_rsc_3
        .in3_rsc_dat         (sad_parallel_in3_rsc_dat),
        .in3_rsc_vld         (sad_parallel_in3_rsc_vld),
        .in3_rsc_rdy         (sad_parallel_in3_rsc_rdy),
        // Interface: in_rsc_30
        .in30_rsc_dat        (sad_parallel_in30_rsc_dat),
        .in30_rsc_vld        (sad_parallel_in30_rsc_vld),
        .in30_rsc_rdy        (sad_parallel_in30_rsc_rdy),
        // Interface: in_rsc_31
        .in31_rsc_dat        (sad_parallel_in31_rsc_dat),
        .in31_rsc_vld        (sad_parallel_in31_rsc_vld),
        .in31_rsc_rdy        (sad_parallel_in31_rsc_rdy),
        // Interface: in_rsc_32
        .in32_rsc_dat        (sad_parallel_in32_rsc_dat),
        .in32_rsc_vld        (sad_parallel_in32_rsc_vld),
        .in32_rsc_rdy        (sad_parallel_in32_rsc_rdy),
        // Interface: in_rsc_33
        .in33_rsc_dat        (sad_parallel_in33_rsc_dat),
        .in33_rsc_vld        (sad_parallel_in33_rsc_vld),
        .in33_rsc_rdy        (sad_parallel_in33_rsc_rdy),
        // Interface: in_rsc_34
        .in34_rsc_dat        (sad_parallel_in34_rsc_dat),
        .in34_rsc_vld        (sad_parallel_in34_rsc_vld),
        .in34_rsc_rdy        (sad_parallel_in34_rsc_rdy),
        // Interface: in_rsc_4
        .in4_rsc_dat         (sad_parallel_in4_rsc_dat),
        .in4_rsc_vld         (sad_parallel_in4_rsc_vld),
        .in4_rsc_rdy         (sad_parallel_in4_rsc_rdy),
        // Interface: in_rsc_5
        .in5_rsc_dat         (sad_parallel_in5_rsc_dat),
        .in5_rsc_vld         (sad_parallel_in5_rsc_vld),
        .in5_rsc_rdy         (sad_parallel_in5_rsc_rdy),
        // Interface: in_rsc_6
        .in6_rsc_dat         (sad_parallel_in6_rsc_dat),
        .in6_rsc_vld         (sad_parallel_in6_rsc_vld),
        .in6_rsc_rdy         (sad_parallel_in6_rsc_rdy),
        // Interface: in_rsc_7
        .in7_rsc_dat         (sad_parallel_in7_rsc_dat),
        .in7_rsc_vld         (sad_parallel_in7_rsc_vld),
        .in7_rsc_rdy         (sad_parallel_in7_rsc_rdy),
        // Interface: in_rsc_8
        .in8_rsc_dat         (sad_parallel_in8_rsc_dat),
        .in8_rsc_vld         (sad_parallel_in8_rsc_vld),
        .in8_rsc_rdy         (sad_parallel_in8_rsc_rdy),
        // Interface: in_rsc_9
        .in9_rsc_dat         (sad_parallel_in9_rsc_dat),
        .in9_rsc_vld         (sad_parallel_in9_rsc_vld),
        .in9_rsc_rdy         (sad_parallel_in9_rsc_rdy),
        // Interface: intra_mode_out
        .intra_mode_out_rsc_rdy(sad_parallel_intra_mode_out_rsc_rdy),
        .intra_mode_out_rsc_dat(sad_parallel_intra_mode_out_rsc_dat),
        .intra_mode_out_rsc_vld(sad_parallel_intra_mode_out_rsc_vld),
        // Interface: lcu_ref_rsc
        .lcu_ref_rsc_q       (sad_parallel_lcu_ref_rsc_q),
        .lcu_ref_rsc_adr     (sad_parallel_lcu_ref_rsc_adr),
        .lcu_ref_rsc_d       (sad_parallel_lcu_ref_rsc_d),
        .lcu_ref_rsc_we      (sad_parallel_lcu_ref_rsc_we),
        // Interface: pred_out_rsc
        .pred_out_rsc_rdy    (sad_parallel_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (sad_parallel_pred_out_rsc_dat),
        .pred_out_rsc_vld    (sad_parallel_pred_out_rsc_vld));


endmodule
