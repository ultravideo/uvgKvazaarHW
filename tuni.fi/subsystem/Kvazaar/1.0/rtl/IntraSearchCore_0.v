
module IntraSearchCore_0(
    // Interface: cabac_rsc
    input                [127:0]        cabac_rsc_q,
    output               [3:0]          cabac_rsc_adr,
    output               [127:0]        cabac_rsc_d,
    output                              cabac_rsc_we,

    // Interface: clk_base
    input                               clk_base,

    // Interface: clk_intra
    input                               clk_intra,

    // Interface: conf_in_rsc
    input                [31:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: cu_info_hor
    input                [7:0]          cu_cu_hor_cu_info_rsc_q,
    output               [7:0]          cu_cu_hor_cu_info_rsc_adr_1,
    output               [7:0]          cu_cu_hor_cu_info_rsc_d,
    output                              cu_cu_hor_cu_info_rsc_we_1,

    // Interface: cu_info_hor_str
    input                [7:0]          cu_cu_cu_info_rsc_q_1,
    output               [7:0]          cu_cu_cu_info_rsc_d_1,
    output               [7:0]          cu_cu_hor_cu_info_rsc_adr,
    output                              cu_cu_hor_cu_info_rsc_we,

    // Interface: cu_info_rsc
    input                [31:0]         cu_cu_cu_info_rsc_q,
    output               [11:0]         cu_cu_cu_info_rsc_adr,
    output               [31:0]         cu_cu_cu_info_rsc_d,
    output                              cu_cu_cu_info_rsc_we,

    // Interface: cu_info_ver
    input                [7:0]          cu_cu_ver_cu_info_rsc_q,
    output               [7:0]          cu_cu_ver_cu_info_rsc_adr,
    output               [7:0]          cu_cu_ver_cu_info_rsc_d,
    output                              cu_cu_ver_cu_info_rsc_we,

    // Interface: lcu_border_left
    input                [31:0]         lcu_border_left_rsc_q,
    output               [9:0]          lcu_border_left_rsc_adr,
    output               [31:0]         lcu_border_left_rsc_d,
    output                              lcu_border_left_rsc_we,

    // Interface: lcu_border_top
    input                [31:0]         lcu_border_top_rsc_q,
    output               [9:0]          lcu_border_top_rsc_adr,
    output               [31:0]         lcu_border_top_rsc_d,
    output                              lcu_border_top_rsc_we,

    // Interface: lcu_coeff_rsc
    input                [513:0]        lcu_coeff_rsc_q_1,
    output               [11:0]         lcu_coeff_rsc_adr,
    output               [513:0]        lcu_coeff_rsc_d,
    output                              lcu_coeff_rsc_we,

    // Interface: lcu_poll
    output               [15:0]         irq_rsc_dat,

    // Interface: lcu_rec_rsc
    input                [287:0]        lcu_rec_rsc_q,
    output               [11:0]         lcu_rec_rsc_adr,
    output               [287:0]        lcu_rec_rsc_d,
    output                              lcu_rec_rsc_we,

    // Interface: lcu_ref_rsc
    input                [31:0]         lcu_ref_rsc_q,
    output               [14:0]         lcu_ref_rsc_adr,
    output               [31:0]         lcu_ref_rsc_d,
    output                              lcu_ref_rsc_we,

    // Interface: reset
    input                               arst_n
);

    // intra_search_prediction_arst_n_to_reset wires:
    wire       intra_search_prediction_arst_n_to_reset_arst_n;
    // intra_search_control_conf_in_rsc_to_bus wires:
    wire [31:0] intra_search_control_conf_in_rsc_to_bus_DAT;
    wire       intra_search_control_conf_in_rsc_to_bus_RDY;
    wire       intra_search_control_conf_in_rsc_to_bus_VLD;
    // intra_search_control_cu_info_hor_to_bus wires:
    wire [7:0] intra_search_control_cu_info_hor_to_bus_ADDR;
    wire [7:0] intra_search_control_cu_info_hor_to_bus_RDATA;
    wire [7:0] intra_search_control_cu_info_hor_to_bus_WDATA;
    wire       intra_search_control_cu_info_hor_to_bus_WREN;
    // intra_search_control_lcu_border_top_to_bus wires:
    wire [9:0] intra_search_control_lcu_border_top_to_bus_ADDR;
    wire [31:0] intra_search_control_lcu_border_top_to_bus_RDATA;
    wire [31:0] intra_search_control_lcu_border_top_to_bus_WDATA;
    wire       intra_search_control_lcu_border_top_to_bus_WREN;
    // intra_search_control_cu_info_hor_str_to_bus wires:
    wire [7:0] intra_search_control_cu_info_hor_str_to_bus_ADDR;
    wire [7:0] intra_search_control_cu_info_hor_str_to_bus_RDATA;
    wire [7:0] intra_search_control_cu_info_hor_str_to_bus_WDATA;
    wire       intra_search_control_cu_info_hor_str_to_bus_WREN;
    // intra_search_control_cu_info_ver_to_bus wires:
    wire [7:0] intra_search_control_cu_info_ver_to_bus_ADDR;
    wire [7:0] intra_search_control_cu_info_ver_to_bus_RDATA;
    wire [7:0] intra_search_control_cu_info_ver_to_bus_WDATA;
    wire       intra_search_control_cu_info_ver_to_bus_WREN;
    // intra_search_control_lcu_border_left_to_bus wires:
    wire [9:0] intra_search_control_lcu_border_left_to_bus_ADDR;
    wire [31:0] intra_search_control_lcu_border_left_to_bus_RDATA;
    wire [31:0] intra_search_control_lcu_border_left_to_bus_WDATA;
    wire       intra_search_control_lcu_border_left_to_bus_WREN;
    // intra_search_control_cu_info_rsc_to_bus_1 wires:
    wire [11:0] intra_search_control_cu_info_rsc_to_bus_1_ADDR;
    wire [31:0] intra_search_control_cu_info_rsc_to_bus_1_RDATA;
    wire [31:0] intra_search_control_cu_info_rsc_to_bus_1_WDATA;
    wire       intra_search_control_cu_info_rsc_to_bus_1_WREN;
    // intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in wires:
    wire [287:0] intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_DAT;
    wire       intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_RDY;
    wire       intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_VLD;
    // intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in wires:
    wire [255:0] intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_DAT;
    wire       intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_RDY;
    wire       intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_VLD;
    // intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in wires:
    wire [255:0] intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_DAT;
    wire       intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_RDY;
    wire       intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_VLD;
    // intra_search_prediction_lcu_ref_rsc_to_bus wires:
    wire [14:0] intra_search_prediction_lcu_ref_rsc_to_bus_ADDR;
    wire [31:0] intra_search_prediction_lcu_ref_rsc_to_bus_RDATA;
    wire [31:0] intra_search_prediction_lcu_ref_rsc_to_bus_WDATA;
    wire       intra_search_prediction_lcu_ref_rsc_to_bus_WREN;
    // intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc wires:
    wire [255:0] intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_DAT;
    wire       intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_RDY;
    wire       intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_VLD;
    // intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out wires:
    wire [511:0] intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_DAT;
    wire       intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_RDY;
    wire       intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_VLD;
    // intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in wires:
    wire [87:0] intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_DAT;
    wire       intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_RDY;
    wire       intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_VLD;
    // intra_search_control_cabac_rsc_to_bus_1 wires:
    wire [3:0] intra_search_control_cabac_rsc_to_bus_1_ADDR;
    wire [127:0] intra_search_control_cabac_rsc_to_bus_1_RDATA;
    wire [127:0] intra_search_control_cabac_rsc_to_bus_1_WDATA;
    wire       intra_search_control_cabac_rsc_to_bus_1_WREN;
    // intra_search_control_lcu_poll_to_bus wires:
    wire [15:0] intra_search_control_lcu_poll_to_bus_DAT;
    // intra_search_control_lcu_rec_rsc_to_bus wires:
    wire [11:0] intra_search_control_lcu_rec_rsc_to_bus_ADDR;
    wire [31:0] intra_search_control_lcu_rec_rsc_to_bus_BYTEEN;
    wire [287:0] intra_search_control_lcu_rec_rsc_to_bus_RDATA;
    wire [255:0] intra_search_control_lcu_rec_rsc_to_bus_WDATA;
    wire       intra_search_control_lcu_rec_rsc_to_bus_WREN;
    // intra_search_control_lcu_coeff_rsc_to_bus_1 wires:
    wire [11:0] intra_search_control_lcu_coeff_rsc_to_bus_1_ADDR;
    wire [63:0] intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN;
    wire [513:0] intra_search_control_lcu_coeff_rsc_to_bus_1_RDATA;
    wire [511:0] intra_search_control_lcu_coeff_rsc_to_bus_1_WDATA;
    wire       intra_search_control_lcu_coeff_rsc_to_bus_1_WREN;
    // intra_search_prediction_clk_to_clk_intra wires:
    wire       intra_search_prediction_clk_to_clk_intra_CLK;
    // intra_search_control_clk_to_clk_base wires:
    wire       intra_search_control_clk_to_clk_base_CLK;

    // intra_search_control port wires:
    wire       intra_search_control_arst_n;
    wire [3:0] intra_search_control_cabac_rsc_adr;
    wire [127:0] intra_search_control_cabac_rsc_d;
    wire [127:0] intra_search_control_cabac_rsc_q;
    wire       intra_search_control_cabac_rsc_we;
    wire       intra_search_control_clk;
    wire [511:0] intra_search_control_coeff_in_rsc_dat;
    wire       intra_search_control_coeff_in_rsc_rdy;
    wire       intra_search_control_coeff_in_rsc_vld;
    wire [31:0] intra_search_control_conf_in_rsc_dat;
    wire       intra_search_control_conf_in_rsc_rdy;
    wire       intra_search_control_conf_in_rsc_vld;
    wire [87:0] intra_search_control_conf_out_rsc_dat;
    wire       intra_search_control_conf_out_rsc_rdy;
    wire       intra_search_control_conf_out_rsc_vld;
    wire [11:0] intra_search_control_cu_cu_cu_info_rsc_adr;
    wire [31:0] intra_search_control_cu_cu_cu_info_rsc_d;
    wire [7:0] intra_search_control_cu_cu_cu_info_rsc_d_1;
    wire [31:0] intra_search_control_cu_cu_cu_info_rsc_q;
    wire [7:0] intra_search_control_cu_cu_cu_info_rsc_q_1;
    wire       intra_search_control_cu_cu_cu_info_rsc_we;
    wire [7:0] intra_search_control_cu_cu_hor_cu_info_rsc_adr;
    wire [7:0] intra_search_control_cu_cu_hor_cu_info_rsc_adr_1;
    wire [7:0] intra_search_control_cu_cu_hor_cu_info_rsc_d;
    wire [7:0] intra_search_control_cu_cu_hor_cu_info_rsc_q;
    wire       intra_search_control_cu_cu_hor_cu_info_rsc_we;
    wire       intra_search_control_cu_cu_hor_cu_info_rsc_we_1;
    wire [7:0] intra_search_control_cu_cu_ver_cu_info_rsc_adr;
    wire [7:0] intra_search_control_cu_cu_ver_cu_info_rsc_d;
    wire [7:0] intra_search_control_cu_cu_ver_cu_info_rsc_q;
    wire       intra_search_control_cu_cu_ver_cu_info_rsc_we;
    wire [15:0] intra_search_control_irq_rsc_dat;
    wire [9:0] intra_search_control_lcu_border_left_rsc_adr;
    wire [31:0] intra_search_control_lcu_border_left_rsc_d;
    wire [31:0] intra_search_control_lcu_border_left_rsc_q;
    wire       intra_search_control_lcu_border_left_rsc_we;
    wire [9:0] intra_search_control_lcu_border_top_rsc_adr;
    wire [31:0] intra_search_control_lcu_border_top_rsc_d;
    wire [31:0] intra_search_control_lcu_border_top_rsc_q;
    wire       intra_search_control_lcu_border_top_rsc_we;
    wire [11:0] intra_search_control_lcu_coeff_rsc_adr;
    wire [513:0] intra_search_control_lcu_coeff_rsc_d;
    wire [513:0] intra_search_control_lcu_coeff_rsc_q_1;
    wire       intra_search_control_lcu_coeff_rsc_we;
    wire [11:0] intra_search_control_lcu_rec_rsc_adr;
    wire [287:0] intra_search_control_lcu_rec_rsc_d;
    wire [287:0] intra_search_control_lcu_rec_rsc_q;
    wire       intra_search_control_lcu_rec_rsc_we;
    wire [255:0] intra_search_control_rec_in_rsc_dat;
    wire       intra_search_control_rec_in_rsc_rdy;
    wire       intra_search_control_rec_in_rsc_vld;
    // intra_search_prediction port wires:
    wire       intra_search_prediction_arst_n;
    wire       intra_search_prediction_clk;
    wire       intra_search_prediction_clk_base;
    wire [87:0] intra_search_prediction_d;
    wire       intra_search_prediction_d_rdy;
    wire       intra_search_prediction_d_vld;
    wire [14:0] intra_search_prediction_lcu_ref_rsc_adr;
    wire [31:0] intra_search_prediction_lcu_ref_rsc_d;
    wire [31:0] intra_search_prediction_lcu_ref_rsc_q;
    wire       intra_search_prediction_lcu_ref_rsc_we;
    wire [255:0] intra_search_prediction_pred_out_rsc_dat;
    wire       intra_search_prediction_pred_out_rsc_rdy;
    wire       intra_search_prediction_pred_out_rsc_vld;
    wire [255:0] intra_search_prediction_ref_out_rsc_dat;
    wire       intra_search_prediction_ref_out_rsc_rdy;
    wire       intra_search_prediction_ref_out_rsc_vld;
    wire [287:0] intra_search_prediction_resid_out_rsc_dat;
    wire       intra_search_prediction_resid_out_rsc_rdy;
    wire       intra_search_prediction_resid_out_rsc_vld;
    // intra_search_transform port wires:
    wire       intra_search_transform_arst_n;
    wire       intra_search_transform_clk;
    wire [511:0] intra_search_transform_coeff_out_rsc_dat;
    wire       intra_search_transform_coeff_out_rsc_rdy;
    wire       intra_search_transform_coeff_out_rsc_vld;
    wire [255:0] intra_search_transform_pred_in_rsc_dat;
    wire       intra_search_transform_pred_in_rsc_rdy;
    wire       intra_search_transform_pred_in_rsc_vld;
    wire [255:0] intra_search_transform_rec_out_rsc_dat;
    wire       intra_search_transform_rec_out_rsc_rdy;
    wire       intra_search_transform_rec_out_rsc_vld;
    wire [255:0] intra_search_transform_ref_in_rsc_dat;
    wire       intra_search_transform_ref_in_rsc_rdy;
    wire       intra_search_transform_ref_in_rsc_vld;
    wire [287:0] intra_search_transform_resid_in_rsc_dat;
    wire       intra_search_transform_resid_in_rsc_rdy;
    wire       intra_search_transform_resid_in_rsc_vld;

    // Assignments for the ports of the encompassing component:
    assign intra_search_prediction_arst_n_to_reset_arst_n = arst_n;
    assign cabac_rsc_adr = intra_search_control_cabac_rsc_to_bus_1_ADDR;
    assign cabac_rsc_d = intra_search_control_cabac_rsc_to_bus_1_WDATA;
    assign intra_search_control_cabac_rsc_to_bus_1_RDATA = cabac_rsc_q;
    assign cabac_rsc_we = intra_search_control_cabac_rsc_to_bus_1_WREN;
    assign intra_search_control_clk_to_clk_base_CLK = clk_base;
    assign intra_search_prediction_clk_to_clk_intra_CLK = clk_intra;
    assign intra_search_control_conf_in_rsc_to_bus_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = intra_search_control_conf_in_rsc_to_bus_RDY;
    assign intra_search_control_conf_in_rsc_to_bus_VLD = conf_in_rsc_vld;
    assign cu_cu_cu_info_rsc_adr = intra_search_control_cu_info_rsc_to_bus_1_ADDR;
    assign cu_cu_cu_info_rsc_d = intra_search_control_cu_info_rsc_to_bus_1_WDATA;
    assign cu_cu_cu_info_rsc_d_1 = intra_search_control_cu_info_hor_str_to_bus_WDATA;
    assign intra_search_control_cu_info_rsc_to_bus_1_RDATA = cu_cu_cu_info_rsc_q;
    assign intra_search_control_cu_info_hor_str_to_bus_RDATA = cu_cu_cu_info_rsc_q_1;
    assign cu_cu_cu_info_rsc_we = intra_search_control_cu_info_rsc_to_bus_1_WREN;
    assign cu_cu_hor_cu_info_rsc_adr = intra_search_control_cu_info_hor_str_to_bus_ADDR;
    assign cu_cu_hor_cu_info_rsc_adr_1 = intra_search_control_cu_info_hor_to_bus_ADDR;
    assign cu_cu_hor_cu_info_rsc_d = intra_search_control_cu_info_hor_to_bus_WDATA;
    assign intra_search_control_cu_info_hor_to_bus_RDATA = cu_cu_hor_cu_info_rsc_q;
    assign cu_cu_hor_cu_info_rsc_we = intra_search_control_cu_info_hor_str_to_bus_WREN;
    assign cu_cu_hor_cu_info_rsc_we_1 = intra_search_control_cu_info_hor_to_bus_WREN;
    assign cu_cu_ver_cu_info_rsc_adr = intra_search_control_cu_info_ver_to_bus_ADDR;
    assign cu_cu_ver_cu_info_rsc_d = intra_search_control_cu_info_ver_to_bus_WDATA;
    assign intra_search_control_cu_info_ver_to_bus_RDATA = cu_cu_ver_cu_info_rsc_q;
    assign cu_cu_ver_cu_info_rsc_we = intra_search_control_cu_info_ver_to_bus_WREN;
    assign irq_rsc_dat = intra_search_control_lcu_poll_to_bus_DAT;
    assign lcu_border_left_rsc_adr = intra_search_control_lcu_border_left_to_bus_ADDR;
    assign lcu_border_left_rsc_d = intra_search_control_lcu_border_left_to_bus_WDATA;
    assign intra_search_control_lcu_border_left_to_bus_RDATA = lcu_border_left_rsc_q;
    assign lcu_border_left_rsc_we = intra_search_control_lcu_border_left_to_bus_WREN;
    assign lcu_border_top_rsc_adr = intra_search_control_lcu_border_top_to_bus_ADDR;
    assign lcu_border_top_rsc_d = intra_search_control_lcu_border_top_to_bus_WDATA;
    assign intra_search_control_lcu_border_top_to_bus_RDATA = lcu_border_top_rsc_q;
    assign lcu_border_top_rsc_we = intra_search_control_lcu_border_top_to_bus_WREN;
    assign lcu_coeff_rsc_adr = intra_search_control_lcu_coeff_rsc_to_bus_1_ADDR;
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[9];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[10];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[11];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[12];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[13];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[14];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[15];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[16];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[17];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[18];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[19];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[20];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[21];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[22];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[23];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[24];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[25];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[26];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[27];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[28];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[29];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[30];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[31];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[8];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[7];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[6];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[3];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[4];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[5];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[0];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[1];
    assign lcu_coeff_rsc_d[512] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[2];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[35];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[36];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[37];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[38];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[39];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[40];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[41];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[42];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[43];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[44];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[45];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[46];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[47];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[48];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[49];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[50];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[51];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[52];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[53];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[54];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[55];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[56];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[57];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[58];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[59];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[60];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[61];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[62];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[63];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[34];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[32];
    assign lcu_coeff_rsc_d[513] = intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[33];
    assign lcu_coeff_rsc_d[511:0] = intra_search_control_lcu_coeff_rsc_to_bus_1_WDATA;
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_RDATA = lcu_coeff_rsc_q_1;
    assign lcu_coeff_rsc_we = intra_search_control_lcu_coeff_rsc_to_bus_1_WREN;
    assign lcu_rec_rsc_adr = intra_search_control_lcu_rec_rsc_to_bus_ADDR;
    assign lcu_rec_rsc_d[287:256] = intra_search_control_lcu_rec_rsc_to_bus_BYTEEN;
    assign lcu_rec_rsc_d[255:0] = intra_search_control_lcu_rec_rsc_to_bus_WDATA;
    assign intra_search_control_lcu_rec_rsc_to_bus_RDATA = lcu_rec_rsc_q;
    assign lcu_rec_rsc_we = intra_search_control_lcu_rec_rsc_to_bus_WREN;
    assign lcu_ref_rsc_adr = intra_search_prediction_lcu_ref_rsc_to_bus_ADDR;
    assign lcu_ref_rsc_d = intra_search_prediction_lcu_ref_rsc_to_bus_WDATA;
    assign intra_search_prediction_lcu_ref_rsc_to_bus_RDATA = lcu_ref_rsc_q;
    assign lcu_ref_rsc_we = intra_search_prediction_lcu_ref_rsc_to_bus_WREN;

    // intra_search_control assignments:
    assign intra_search_control_arst_n = intra_search_prediction_arst_n_to_reset_arst_n;
    assign intra_search_control_cabac_rsc_to_bus_1_ADDR = intra_search_control_cabac_rsc_adr;
    assign intra_search_control_cabac_rsc_to_bus_1_WDATA = intra_search_control_cabac_rsc_d;
    assign intra_search_control_cabac_rsc_q = intra_search_control_cabac_rsc_to_bus_1_RDATA;
    assign intra_search_control_cabac_rsc_to_bus_1_WREN = intra_search_control_cabac_rsc_we;
    assign intra_search_control_clk = intra_search_control_clk_to_clk_base_CLK;
    assign intra_search_control_coeff_in_rsc_dat = intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_DAT;
    assign intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_RDY = intra_search_control_coeff_in_rsc_rdy;
    assign intra_search_control_coeff_in_rsc_vld = intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_VLD;
    assign intra_search_control_conf_in_rsc_dat = intra_search_control_conf_in_rsc_to_bus_DAT;
    assign intra_search_control_conf_in_rsc_to_bus_RDY = intra_search_control_conf_in_rsc_rdy;
    assign intra_search_control_conf_in_rsc_vld = intra_search_control_conf_in_rsc_to_bus_VLD;
    assign intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_DAT = intra_search_control_conf_out_rsc_dat;
    assign intra_search_control_conf_out_rsc_rdy = intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_RDY;
    assign intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_VLD = intra_search_control_conf_out_rsc_vld;
    assign intra_search_control_cu_info_rsc_to_bus_1_ADDR = intra_search_control_cu_cu_cu_info_rsc_adr;
    assign intra_search_control_cu_info_rsc_to_bus_1_WDATA = intra_search_control_cu_cu_cu_info_rsc_d;
    assign intra_search_control_cu_info_hor_str_to_bus_WDATA = intra_search_control_cu_cu_cu_info_rsc_d_1;
    assign intra_search_control_cu_cu_cu_info_rsc_q = intra_search_control_cu_info_rsc_to_bus_1_RDATA;
    assign intra_search_control_cu_cu_cu_info_rsc_q_1 = intra_search_control_cu_info_hor_str_to_bus_RDATA;
    assign intra_search_control_cu_info_rsc_to_bus_1_WREN = intra_search_control_cu_cu_cu_info_rsc_we;
    assign intra_search_control_cu_info_hor_str_to_bus_ADDR = intra_search_control_cu_cu_hor_cu_info_rsc_adr;
    assign intra_search_control_cu_info_hor_to_bus_ADDR = intra_search_control_cu_cu_hor_cu_info_rsc_adr_1;
    assign intra_search_control_cu_info_hor_to_bus_WDATA = intra_search_control_cu_cu_hor_cu_info_rsc_d;
    assign intra_search_control_cu_cu_hor_cu_info_rsc_q = intra_search_control_cu_info_hor_to_bus_RDATA;
    assign intra_search_control_cu_info_hor_str_to_bus_WREN = intra_search_control_cu_cu_hor_cu_info_rsc_we;
    assign intra_search_control_cu_info_hor_to_bus_WREN = intra_search_control_cu_cu_hor_cu_info_rsc_we_1;
    assign intra_search_control_cu_info_ver_to_bus_ADDR = intra_search_control_cu_cu_ver_cu_info_rsc_adr;
    assign intra_search_control_cu_info_ver_to_bus_WDATA = intra_search_control_cu_cu_ver_cu_info_rsc_d;
    assign intra_search_control_cu_cu_ver_cu_info_rsc_q = intra_search_control_cu_info_ver_to_bus_RDATA;
    assign intra_search_control_cu_info_ver_to_bus_WREN = intra_search_control_cu_cu_ver_cu_info_rsc_we;
    assign intra_search_control_lcu_poll_to_bus_DAT = intra_search_control_irq_rsc_dat;
    assign intra_search_control_lcu_border_left_to_bus_ADDR = intra_search_control_lcu_border_left_rsc_adr;
    assign intra_search_control_lcu_border_left_to_bus_WDATA = intra_search_control_lcu_border_left_rsc_d;
    assign intra_search_control_lcu_border_left_rsc_q = intra_search_control_lcu_border_left_to_bus_RDATA;
    assign intra_search_control_lcu_border_left_to_bus_WREN = intra_search_control_lcu_border_left_rsc_we;
    assign intra_search_control_lcu_border_top_to_bus_ADDR = intra_search_control_lcu_border_top_rsc_adr;
    assign intra_search_control_lcu_border_top_to_bus_WDATA = intra_search_control_lcu_border_top_rsc_d;
    assign intra_search_control_lcu_border_top_rsc_q = intra_search_control_lcu_border_top_to_bus_RDATA;
    assign intra_search_control_lcu_border_top_to_bus_WREN = intra_search_control_lcu_border_top_rsc_we;
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_ADDR = intra_search_control_lcu_coeff_rsc_adr;
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[9] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[10] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[11] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[12] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[13] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[14] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[15] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[16] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[17] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[18] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[19] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[20] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[21] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[22] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[23] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[24] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[25] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[26] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[27] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[28] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[29] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[30] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[31] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[8] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[7] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[6] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[3] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[4] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[5] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[0] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[1] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[2] = intra_search_control_lcu_coeff_rsc_d[512];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[35] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[36] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[37] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[38] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[39] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[40] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[41] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[42] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[43] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[44] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[45] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[46] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[47] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[48] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[49] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[50] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[51] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[52] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[53] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[54] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[55] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[56] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[57] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[58] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[59] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[60] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[61] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[62] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[63] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[34] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[32] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_BYTEEN[33] = intra_search_control_lcu_coeff_rsc_d[513];
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_WDATA = intra_search_control_lcu_coeff_rsc_d[511:0];
    assign intra_search_control_lcu_coeff_rsc_q_1 = intra_search_control_lcu_coeff_rsc_to_bus_1_RDATA;
    assign intra_search_control_lcu_coeff_rsc_to_bus_1_WREN = intra_search_control_lcu_coeff_rsc_we;
    assign intra_search_control_lcu_rec_rsc_to_bus_ADDR = intra_search_control_lcu_rec_rsc_adr;
    assign intra_search_control_lcu_rec_rsc_to_bus_BYTEEN = intra_search_control_lcu_rec_rsc_d[287:256];
    assign intra_search_control_lcu_rec_rsc_to_bus_WDATA = intra_search_control_lcu_rec_rsc_d[255:0];
    assign intra_search_control_lcu_rec_rsc_q = intra_search_control_lcu_rec_rsc_to_bus_RDATA;
    assign intra_search_control_lcu_rec_rsc_to_bus_WREN = intra_search_control_lcu_rec_rsc_we;
    assign intra_search_control_rec_in_rsc_dat = intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_DAT;
    assign intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_RDY = intra_search_control_rec_in_rsc_rdy;
    assign intra_search_control_rec_in_rsc_vld = intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_VLD;
    // intra_search_prediction assignments:
    assign intra_search_prediction_arst_n = intra_search_prediction_arst_n_to_reset_arst_n;
    assign intra_search_prediction_clk = intra_search_prediction_clk_to_clk_intra_CLK;
    assign intra_search_prediction_clk_base = intra_search_control_clk_to_clk_base_CLK;
    assign intra_search_prediction_d = intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_DAT;
    assign intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_RDY = intra_search_prediction_d_rdy;
    assign intra_search_prediction_d_vld = intra_search_control_conf_out_rsc_to_intra_search_prediction_ip_config_in_VLD;
    assign intra_search_prediction_lcu_ref_rsc_to_bus_ADDR = intra_search_prediction_lcu_ref_rsc_adr;
    assign intra_search_prediction_lcu_ref_rsc_to_bus_WDATA = intra_search_prediction_lcu_ref_rsc_d;
    assign intra_search_prediction_lcu_ref_rsc_q = intra_search_prediction_lcu_ref_rsc_to_bus_RDATA;
    assign intra_search_prediction_lcu_ref_rsc_to_bus_WREN = intra_search_prediction_lcu_ref_rsc_we;
    assign intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_DAT = intra_search_prediction_pred_out_rsc_dat;
    assign intra_search_prediction_pred_out_rsc_rdy = intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_RDY;
    assign intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_VLD = intra_search_prediction_pred_out_rsc_vld;
    assign intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_DAT = intra_search_prediction_ref_out_rsc_dat;
    assign intra_search_prediction_ref_out_rsc_rdy = intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_RDY;
    assign intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_VLD = intra_search_prediction_ref_out_rsc_vld;
    assign intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_DAT = intra_search_prediction_resid_out_rsc_dat;
    assign intra_search_prediction_resid_out_rsc_rdy = intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_RDY;
    assign intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_VLD = intra_search_prediction_resid_out_rsc_vld;
    // intra_search_transform assignments:
    assign intra_search_transform_arst_n = intra_search_prediction_arst_n_to_reset_arst_n;
    assign intra_search_transform_clk = intra_search_control_clk_to_clk_base_CLK;
    assign intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_DAT = intra_search_transform_coeff_out_rsc_dat;
    assign intra_search_transform_coeff_out_rsc_rdy = intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_RDY;
    assign intra_search_control_coeff_in_rsc_to_intra_search_transform_coeff_out_VLD = intra_search_transform_coeff_out_rsc_vld;
    assign intra_search_transform_pred_in_rsc_dat = intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_DAT;
    assign intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_RDY = intra_search_transform_pred_in_rsc_rdy;
    assign intra_search_transform_pred_in_rsc_vld = intra_search_prediction_pred_out_rsc_to_intra_search_transform_pred_in_VLD;
    assign intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_DAT = intra_search_transform_rec_out_rsc_dat;
    assign intra_search_transform_rec_out_rsc_rdy = intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_RDY;
    assign intra_search_transform_rec_out_to_intra_search_control_rec_in_rsc_VLD = intra_search_transform_rec_out_rsc_vld;
    assign intra_search_transform_ref_in_rsc_dat = intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_DAT;
    assign intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_RDY = intra_search_transform_ref_in_rsc_rdy;
    assign intra_search_transform_ref_in_rsc_vld = intra_search_prediction_ref_out_rsc_to_intra_search_transform_ref_in_VLD;
    assign intra_search_transform_resid_in_rsc_dat = intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_DAT;
    assign intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_RDY = intra_search_transform_resid_in_rsc_rdy;
    assign intra_search_transform_resid_in_rsc_vld = intra_search_prediction_resid_out_rsc_to_intra_search_transform_resid_in_VLD;

    // IP-XACT VLNV: tuni.fi:KvazaarControl:IntraSearchControl:1.0
    IntraSearchControl_0     intra_search_control(
        // Interface: arst_n
        .arst_n              (intra_search_control_arst_n),
        // Interface: cabac_rsc
        .cabac_rsc_q         (intra_search_control_cabac_rsc_q),
        .cabac_rsc_adr       (intra_search_control_cabac_rsc_adr),
        .cabac_rsc_d         (intra_search_control_cabac_rsc_d),
        .cabac_rsc_we        (intra_search_control_cabac_rsc_we),
        // Interface: clk
        .clk                 (intra_search_control_clk),
        // Interface: coeff_in_rsc
        .coeff_in_rsc_dat    (intra_search_control_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (intra_search_control_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (intra_search_control_coeff_in_rsc_rdy),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (intra_search_control_conf_in_rsc_dat),
        .conf_in_rsc_vld     (intra_search_control_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (intra_search_control_conf_in_rsc_rdy),
        // Interface: conf_out_rsc
        .conf_out_rsc_rdy    (intra_search_control_conf_out_rsc_rdy),
        .conf_out_rsc_dat    (intra_search_control_conf_out_rsc_dat),
        .conf_out_rsc_vld    (intra_search_control_conf_out_rsc_vld),
        // Interface: cu_info_hor
        .cu_cu_hor_cu_info_rsc_q(intra_search_control_cu_cu_hor_cu_info_rsc_q),
        .cu_cu_hor_cu_info_rsc_adr_1(intra_search_control_cu_cu_hor_cu_info_rsc_adr_1),
        .cu_cu_hor_cu_info_rsc_d(intra_search_control_cu_cu_hor_cu_info_rsc_d),
        .cu_cu_hor_cu_info_rsc_we_1(intra_search_control_cu_cu_hor_cu_info_rsc_we_1),
        // Interface: cu_info_hor_str
        .cu_cu_cu_info_rsc_q_1(intra_search_control_cu_cu_cu_info_rsc_q_1),
        .cu_cu_cu_info_rsc_d_1(intra_search_control_cu_cu_cu_info_rsc_d_1),
        .cu_cu_hor_cu_info_rsc_adr(intra_search_control_cu_cu_hor_cu_info_rsc_adr),
        .cu_cu_hor_cu_info_rsc_we(intra_search_control_cu_cu_hor_cu_info_rsc_we),
        // Interface: cu_info_rsc
        .cu_cu_cu_info_rsc_q (intra_search_control_cu_cu_cu_info_rsc_q),
        .cu_cu_cu_info_rsc_adr(intra_search_control_cu_cu_cu_info_rsc_adr),
        .cu_cu_cu_info_rsc_d (intra_search_control_cu_cu_cu_info_rsc_d),
        .cu_cu_cu_info_rsc_we(intra_search_control_cu_cu_cu_info_rsc_we),
        // Interface: cu_info_ver
        .cu_cu_ver_cu_info_rsc_q(intra_search_control_cu_cu_ver_cu_info_rsc_q),
        .cu_cu_ver_cu_info_rsc_adr(intra_search_control_cu_cu_ver_cu_info_rsc_adr),
        .cu_cu_ver_cu_info_rsc_d(intra_search_control_cu_cu_ver_cu_info_rsc_d),
        .cu_cu_ver_cu_info_rsc_we(intra_search_control_cu_cu_ver_cu_info_rsc_we),
        // Interface: lcu_border_left
        .lcu_border_left_rsc_q(intra_search_control_lcu_border_left_rsc_q),
        .lcu_border_left_rsc_adr(intra_search_control_lcu_border_left_rsc_adr),
        .lcu_border_left_rsc_d(intra_search_control_lcu_border_left_rsc_d),
        .lcu_border_left_rsc_we(intra_search_control_lcu_border_left_rsc_we),
        // Interface: lcu_border_top
        .lcu_border_top_rsc_q(intra_search_control_lcu_border_top_rsc_q),
        .lcu_border_top_rsc_adr(intra_search_control_lcu_border_top_rsc_adr),
        .lcu_border_top_rsc_d(intra_search_control_lcu_border_top_rsc_d),
        .lcu_border_top_rsc_we(intra_search_control_lcu_border_top_rsc_we),
        // Interface: lcu_coeff_rsc
        .lcu_coeff_rsc_q_1   (intra_search_control_lcu_coeff_rsc_q_1),
        .lcu_coeff_rsc_adr   (intra_search_control_lcu_coeff_rsc_adr),
        .lcu_coeff_rsc_d     (intra_search_control_lcu_coeff_rsc_d),
        .lcu_coeff_rsc_we    (intra_search_control_lcu_coeff_rsc_we),
        // Interface: lcu_poll
        .irq_rsc_dat         (intra_search_control_irq_rsc_dat),
        // Interface: lcu_rec_rsc
        .lcu_rec_rsc_q       (intra_search_control_lcu_rec_rsc_q),
        .lcu_rec_rsc_adr     (intra_search_control_lcu_rec_rsc_adr),
        .lcu_rec_rsc_d       (intra_search_control_lcu_rec_rsc_d),
        .lcu_rec_rsc_we      (intra_search_control_lcu_rec_rsc_we),
        // Interface: rec_in_rsc
        .rec_in_rsc_dat      (intra_search_control_rec_in_rsc_dat),
        .rec_in_rsc_vld      (intra_search_control_rec_in_rsc_vld),
        .rec_in_rsc_rdy      (intra_search_control_rec_in_rsc_rdy),
        // These ports are not in any interface
        .lcu_coeff_rsc_q     ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:intra_prediction:1.0
    intra_prediction_0 intra_search_prediction(
        // Interface: arst_n
        .arst_n              (intra_search_prediction_arst_n),
        // Interface: clk
        .clk                 (intra_search_prediction_clk),
        // Interface: clk_base
        .clk_base            (intra_search_prediction_clk_base),
        // Interface: ip_config_in
        .d                   (intra_search_prediction_d),
        .d_vld               (intra_search_prediction_d_vld),
        .d_rdy               (intra_search_prediction_d_rdy),
        // Interface: lcu_ref_rsc
        .lcu_ref_rsc_q       (intra_search_prediction_lcu_ref_rsc_q),
        .lcu_ref_rsc_adr     (intra_search_prediction_lcu_ref_rsc_adr),
        .lcu_ref_rsc_d       (intra_search_prediction_lcu_ref_rsc_d),
        .lcu_ref_rsc_we      (intra_search_prediction_lcu_ref_rsc_we),
        // Interface: pred_out_rsc
        .pred_out_rsc_rdy    (intra_search_prediction_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (intra_search_prediction_pred_out_rsc_dat),
        .pred_out_rsc_vld    (intra_search_prediction_pred_out_rsc_vld),
        // Interface: ref_out_rsc
        .ref_out_rsc_rdy     (intra_search_prediction_ref_out_rsc_rdy),
        .ref_out_rsc_dat     (intra_search_prediction_ref_out_rsc_dat),
        .ref_out_rsc_vld     (intra_search_prediction_ref_out_rsc_vld),
        // Interface: resid_out_rsc
        .resid_out_rsc_rdy   (intra_search_prediction_resid_out_rsc_rdy),
        .resid_out_rsc_dat   (intra_search_prediction_resid_out_rsc_dat),
        .resid_out_rsc_vld   (intra_search_prediction_resid_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:IntraSearchTransform:1.0
    IntraSearchTransform_0     intra_search_transform(
        // Interface: arst_n
        .arst_n              (intra_search_transform_arst_n),
        // Interface: clk
        .clk                 (intra_search_transform_clk),
        // Interface: coeff_out
        .coeff_out_rsc_rdy   (intra_search_transform_coeff_out_rsc_rdy),
        .coeff_out_rsc_dat   (intra_search_transform_coeff_out_rsc_dat),
        .coeff_out_rsc_vld   (intra_search_transform_coeff_out_rsc_vld),
        // Interface: pred_in
        .pred_in_rsc_dat     (intra_search_transform_pred_in_rsc_dat),
        .pred_in_rsc_vld     (intra_search_transform_pred_in_rsc_vld),
        .pred_in_rsc_rdy     (intra_search_transform_pred_in_rsc_rdy),
        // Interface: rec_out
        .rec_out_rsc_rdy     (intra_search_transform_rec_out_rsc_rdy),
        .rec_out_rsc_dat     (intra_search_transform_rec_out_rsc_dat),
        .rec_out_rsc_vld     (intra_search_transform_rec_out_rsc_vld),
        // Interface: ref_in
        .ref_in_rsc_dat      (intra_search_transform_ref_in_rsc_dat),
        .ref_in_rsc_vld      (intra_search_transform_ref_in_rsc_vld),
        .ref_in_rsc_rdy      (intra_search_transform_ref_in_rsc_rdy),
        // Interface: resid_in
        .resid_in_rsc_dat    (intra_search_transform_resid_in_rsc_dat),
        .resid_in_rsc_vld    (intra_search_transform_resid_in_rsc_vld),
        .resid_in_rsc_rdy    (intra_search_transform_resid_in_rsc_rdy));


endmodule
