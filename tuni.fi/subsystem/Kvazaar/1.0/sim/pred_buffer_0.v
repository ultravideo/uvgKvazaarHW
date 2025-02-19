
module pred_buffer_0(
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: conf_in_rsc
    input                [31:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: intra_mode_in
    input                [7:0]          intra_mode_in_rsc_dat,
    input                               intra_mode_in_rsc_vld,
    output                              intra_mode_in_rsc_rdy,

    // Interface: pred_in_rsc
    input                [1152:0]       pred_in_rsc_dat,
    input                               pred_in_rsc_vld,
    output                              pred_in_rsc_rdy,

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

    // pred_buffer_push_arst_n_to_arst_n wires:
    wire       pred_buffer_push_arst_n_to_arst_n_arst_n;
    // pred_buffer_pull_clk_to_clk wires:
    wire       pred_buffer_pull_clk_to_clk_CLK;
    // pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc wires:
    wire [255:0] pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_DAT;
    wire       pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_RDY;
    wire       pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_VLD;
    // pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc wires:
    wire [255:0] pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_DAT;
    wire       pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_RDY;
    wire       pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_VLD;
    // pred_fifo_data_in_to_pred_in_rsc wires:
    wire [1152:0] pred_fifo_data_in_to_pred_in_rsc_DAT;
    wire       pred_fifo_data_in_to_pred_in_rsc_RDY;
    wire       pred_fifo_data_in_to_pred_in_rsc_VLD;
    // pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc wires:
    wire [1152:0] pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_DAT;
    wire       pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_RDY;
    wire       pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_VLD;
    // pred_buffer_push_intra_mode_in_to_bus wires:
    wire [7:0] pred_buffer_push_intra_mode_in_to_bus_DAT;
    wire       pred_buffer_push_intra_mode_in_to_bus_RDY;
    wire       pred_buffer_push_intra_mode_in_to_bus_VLD;
    // conf_fifo_data_in_to_conf_in_rsc wires:
    wire [31:0] conf_fifo_data_in_to_conf_in_rsc_DAT;
    wire       conf_fifo_data_in_to_conf_in_rsc_RDY;
    wire       conf_fifo_data_in_to_conf_in_rsc_VLD;
    // conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc wires:
    wire [31:0] conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_DAT;
    wire       conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_RDY;
    wire       conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_VLD;
    // intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc wires:
    wire [7:0] intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_DAT;
    wire       intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_RDY;
    wire       intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_VLD;
    // pred_buffer_pull_pred_out_rsc_to_bus_1 wires:
    wire [255:0] pred_buffer_pull_pred_out_rsc_to_bus_1_DAT;
    wire       pred_buffer_pull_pred_out_rsc_to_bus_1_RDY;
    wire       pred_buffer_pull_pred_out_rsc_to_bus_1_VLD;
    // pred_buffer_pull_resid_out_rsc_to_bus_2 wires:
    wire [287:0] pred_buffer_pull_resid_out_rsc_to_bus_2_DAT;
    wire       pred_buffer_pull_resid_out_rsc_to_bus_2_RDY;
    wire       pred_buffer_pull_resid_out_rsc_to_bus_2_VLD;
    // pred_buffer_pull_ref_out_rsc_to_bus wires:
    wire [255:0] pred_buffer_pull_ref_out_rsc_to_bus_DAT;
    wire       pred_buffer_pull_ref_out_rsc_to_bus_RDY;
    wire       pred_buffer_pull_ref_out_rsc_to_bus_VLD;

    // Ad-hoc wires:
    wire [7:0] intra_mode_fifo_d_to_intra_mode_in_rsc_dat;
    wire       AND2_1_input2_to_intra_mode_in_rsc_vld;
    wire       intra_mode_fifo_d_vld_to_AND2_1_output1;
    wire       pred_buffer_push_intra_mode_in_rsc_rdy_to_AND2_1_input1;

    // AND2_1 port wires:
    wire       AND2_1_input1;
    wire       AND2_1_input2;
    wire       AND2_1_output1;
    // conf_fifo port wires:
    wire       conf_fifo_aclr_n;
    wire       conf_fifo_clk;
    wire [31:0] conf_fifo_d;
    wire       conf_fifo_d_rdy;
    wire       conf_fifo_d_vld;
    wire [31:0] conf_fifo_q;
    wire       conf_fifo_q_rdy;
    wire       conf_fifo_q_vld;
    // intra_mode_fifo port wires:
    wire       intra_mode_fifo_aclr_n;
    wire       intra_mode_fifo_clk;
    wire [7:0] intra_mode_fifo_d;
    wire       intra_mode_fifo_d_vld;
    wire [7:0] intra_mode_fifo_q;
    wire       intra_mode_fifo_q_rdy;
    wire       intra_mode_fifo_q_vld;
    // pred_buffer_pull port wires:
    wire       pred_buffer_pull_arst_n;
    wire       pred_buffer_pull_clk;
    wire [31:0] pred_buffer_pull_conf_in_rsc_dat;
    wire       pred_buffer_pull_conf_in_rsc_rdy;
    wire       pred_buffer_pull_conf_in_rsc_vld;
    wire [7:0] pred_buffer_pull_intra_mode_in_rsc_dat;
    wire       pred_buffer_pull_intra_mode_in_rsc_rdy;
    wire       pred_buffer_pull_intra_mode_in_rsc_vld;
    wire [255:0] pred_buffer_pull_pred_in_rsc_dat;
    wire       pred_buffer_pull_pred_in_rsc_rdy;
    wire       pred_buffer_pull_pred_in_rsc_vld;
    wire [255:0] pred_buffer_pull_pred_out_rsc_dat;
    wire       pred_buffer_pull_pred_out_rsc_rdy;
    wire       pred_buffer_pull_pred_out_rsc_vld;
    wire [255:0] pred_buffer_pull_ref_in_rsc_dat;
    wire       pred_buffer_pull_ref_in_rsc_rdy;
    wire       pred_buffer_pull_ref_in_rsc_vld;
    wire [255:0] pred_buffer_pull_ref_out_rsc_dat;
    wire       pred_buffer_pull_ref_out_rsc_rdy;
    wire       pred_buffer_pull_ref_out_rsc_vld;
    wire [287:0] pred_buffer_pull_resid_out_rsc_dat;
    wire       pred_buffer_pull_resid_out_rsc_rdy;
    wire       pred_buffer_pull_resid_out_rsc_vld;
    // pred_buffer_push port wires:
    wire       pred_buffer_push_arst_n;
    wire       pred_buffer_push_clk;
    wire [7:0] pred_buffer_push_intra_mode_in_rsc_dat;
    wire       pred_buffer_push_intra_mode_in_rsc_rdy;
    wire       pred_buffer_push_intra_mode_in_rsc_vld;
    wire [1152:0] pred_buffer_push_pred_in_rsc_dat;
    wire       pred_buffer_push_pred_in_rsc_rdy;
    wire       pred_buffer_push_pred_in_rsc_vld;
    wire [255:0] pred_buffer_push_pred_out_rsc_dat;
    wire       pred_buffer_push_pred_out_rsc_rdy;
    wire       pred_buffer_push_pred_out_rsc_vld;
    wire [255:0] pred_buffer_push_ref_out_rsc_dat;
    wire       pred_buffer_push_ref_out_rsc_rdy;
    wire       pred_buffer_push_ref_out_rsc_vld;
    // pred_fifo port wires:
    wire       pred_fifo_aclr_n;
    wire       pred_fifo_clk;
    wire [1152:0] pred_fifo_d;
    wire       pred_fifo_d_rdy;
    wire       pred_fifo_d_vld;
    wire [1152:0] pred_fifo_q;
    wire       pred_fifo_q_rdy;
    wire       pred_fifo_q_vld;

    // Assignments for the ports of the encompassing component:
    assign pred_buffer_push_arst_n_to_arst_n_arst_n = arst_n;
    assign pred_buffer_pull_clk_to_clk_CLK = clk;
    assign conf_fifo_data_in_to_conf_in_rsc_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = conf_fifo_data_in_to_conf_in_rsc_RDY;
    assign conf_fifo_data_in_to_conf_in_rsc_VLD = conf_in_rsc_vld;
    assign pred_buffer_push_intra_mode_in_to_bus_DAT = intra_mode_in_rsc_dat;
    assign intra_mode_fifo_d_to_intra_mode_in_rsc_dat = intra_mode_in_rsc_dat;
    assign intra_mode_in_rsc_rdy = pred_buffer_push_intra_mode_in_to_bus_RDY;
    assign AND2_1_input2_to_intra_mode_in_rsc_vld = intra_mode_in_rsc_vld;
    assign pred_buffer_push_intra_mode_in_to_bus_VLD = intra_mode_in_rsc_vld;
    assign pred_fifo_data_in_to_pred_in_rsc_DAT = pred_in_rsc_dat;
    assign pred_in_rsc_rdy = pred_fifo_data_in_to_pred_in_rsc_RDY;
    assign pred_fifo_data_in_to_pred_in_rsc_VLD = pred_in_rsc_vld;
    assign pred_out_rsc_dat = pred_buffer_pull_pred_out_rsc_to_bus_1_DAT;
    assign pred_buffer_pull_pred_out_rsc_to_bus_1_RDY = pred_out_rsc_rdy;
    assign pred_out_rsc_vld = pred_buffer_pull_pred_out_rsc_to_bus_1_VLD;
    assign ref_out_rsc_dat = pred_buffer_pull_ref_out_rsc_to_bus_DAT;
    assign pred_buffer_pull_ref_out_rsc_to_bus_RDY = ref_out_rsc_rdy;
    assign ref_out_rsc_vld = pred_buffer_pull_ref_out_rsc_to_bus_VLD;
    assign resid_out_rsc_dat = pred_buffer_pull_resid_out_rsc_to_bus_2_DAT;
    assign pred_buffer_pull_resid_out_rsc_to_bus_2_RDY = resid_out_rsc_rdy;
    assign resid_out_rsc_vld = pred_buffer_pull_resid_out_rsc_to_bus_2_VLD;

    // AND2_1 assignments:
    assign AND2_1_input1 = pred_buffer_push_intra_mode_in_rsc_rdy_to_AND2_1_input1;
    assign AND2_1_input2 = AND2_1_input2_to_intra_mode_in_rsc_vld;
    assign intra_mode_fifo_d_vld_to_AND2_1_output1 = AND2_1_output1;
    // conf_fifo assignments:
    assign conf_fifo_aclr_n = pred_buffer_push_arst_n_to_arst_n_arst_n;
    assign conf_fifo_clk = pred_buffer_pull_clk_to_clk_CLK;
    assign conf_fifo_d = conf_fifo_data_in_to_conf_in_rsc_DAT;
    assign conf_fifo_data_in_to_conf_in_rsc_RDY = conf_fifo_d_rdy;
    assign conf_fifo_d_vld = conf_fifo_data_in_to_conf_in_rsc_VLD;
    assign conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_DAT = conf_fifo_q;
    assign conf_fifo_q_rdy = conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_RDY;
    assign conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_VLD = conf_fifo_q_vld;
    // intra_mode_fifo assignments:
    assign intra_mode_fifo_aclr_n = pred_buffer_push_arst_n_to_arst_n_arst_n;
    assign intra_mode_fifo_clk = pred_buffer_pull_clk_to_clk_CLK;
    assign intra_mode_fifo_d = intra_mode_fifo_d_to_intra_mode_in_rsc_dat;
    assign intra_mode_fifo_d_vld = intra_mode_fifo_d_vld_to_AND2_1_output1;
    assign intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_DAT = intra_mode_fifo_q;
    assign intra_mode_fifo_q_rdy = intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_RDY;
    assign intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_VLD = intra_mode_fifo_q_vld;
    // pred_buffer_pull assignments:
    assign pred_buffer_pull_arst_n = pred_buffer_push_arst_n_to_arst_n_arst_n;
    assign pred_buffer_pull_clk = pred_buffer_pull_clk_to_clk_CLK;
    assign pred_buffer_pull_conf_in_rsc_dat = conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_DAT;
    assign conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_RDY = pred_buffer_pull_conf_in_rsc_rdy;
    assign pred_buffer_pull_conf_in_rsc_vld = conf_fifo_data_out_to_pred_buffer_pull_conf_in_rsc_VLD;
    assign pred_buffer_pull_intra_mode_in_rsc_dat = intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_DAT;
    assign intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_RDY = pred_buffer_pull_intra_mode_in_rsc_rdy;
    assign pred_buffer_pull_intra_mode_in_rsc_vld = intra_mode_fifo_data_out_to_pred_buffer_pull_intra_mode_in_rsc_VLD;
    assign pred_buffer_pull_pred_in_rsc_dat = pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_DAT;
    assign pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_RDY = pred_buffer_pull_pred_in_rsc_rdy;
    assign pred_buffer_pull_pred_in_rsc_vld = pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_VLD;
    assign pred_buffer_pull_pred_out_rsc_to_bus_1_DAT = pred_buffer_pull_pred_out_rsc_dat;
    assign pred_buffer_pull_pred_out_rsc_rdy = pred_buffer_pull_pred_out_rsc_to_bus_1_RDY;
    assign pred_buffer_pull_pred_out_rsc_to_bus_1_VLD = pred_buffer_pull_pred_out_rsc_vld;
    assign pred_buffer_pull_ref_in_rsc_dat = pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_DAT;
    assign pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_RDY = pred_buffer_pull_ref_in_rsc_rdy;
    assign pred_buffer_pull_ref_in_rsc_vld = pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_VLD;
    assign pred_buffer_pull_ref_out_rsc_to_bus_DAT = pred_buffer_pull_ref_out_rsc_dat;
    assign pred_buffer_pull_ref_out_rsc_rdy = pred_buffer_pull_ref_out_rsc_to_bus_RDY;
    assign pred_buffer_pull_ref_out_rsc_to_bus_VLD = pred_buffer_pull_ref_out_rsc_vld;
    assign pred_buffer_pull_resid_out_rsc_to_bus_2_DAT = pred_buffer_pull_resid_out_rsc_dat;
    assign pred_buffer_pull_resid_out_rsc_rdy = pred_buffer_pull_resid_out_rsc_to_bus_2_RDY;
    assign pred_buffer_pull_resid_out_rsc_to_bus_2_VLD = pred_buffer_pull_resid_out_rsc_vld;
    // pred_buffer_push assignments:
    assign pred_buffer_push_arst_n = pred_buffer_push_arst_n_to_arst_n_arst_n;
    assign pred_buffer_push_clk = pred_buffer_pull_clk_to_clk_CLK;
    assign pred_buffer_push_intra_mode_in_rsc_dat = pred_buffer_push_intra_mode_in_to_bus_DAT;
    assign pred_buffer_push_intra_mode_in_to_bus_RDY = pred_buffer_push_intra_mode_in_rsc_rdy;
    assign pred_buffer_push_intra_mode_in_rsc_rdy_to_AND2_1_input1 = pred_buffer_push_intra_mode_in_rsc_rdy;
    assign pred_buffer_push_intra_mode_in_rsc_vld = pred_buffer_push_intra_mode_in_to_bus_VLD;
    assign pred_buffer_push_pred_in_rsc_dat = pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_DAT;
    assign pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_RDY = pred_buffer_push_pred_in_rsc_rdy;
    assign pred_buffer_push_pred_in_rsc_vld = pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_VLD;
    assign pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_DAT = pred_buffer_push_pred_out_rsc_dat;
    assign pred_buffer_push_pred_out_rsc_rdy = pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_RDY;
    assign pred_buffer_push_pred_out_rsc_to_pred_buffer_pull_pred_in_rsc_VLD = pred_buffer_push_pred_out_rsc_vld;
    assign pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_DAT = pred_buffer_push_ref_out_rsc_dat;
    assign pred_buffer_push_ref_out_rsc_rdy = pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_RDY;
    assign pred_buffer_push_ref_out_rsc_to_pred_buffer_pull_ref_in_rsc_VLD = pred_buffer_push_ref_out_rsc_vld;
    // pred_fifo assignments:
    assign pred_fifo_aclr_n = pred_buffer_push_arst_n_to_arst_n_arst_n;
    assign pred_fifo_clk = pred_buffer_pull_clk_to_clk_CLK;
    assign pred_fifo_d = pred_fifo_data_in_to_pred_in_rsc_DAT;
    assign pred_fifo_data_in_to_pred_in_rsc_RDY = pred_fifo_d_rdy;
    assign pred_fifo_d_vld = pred_fifo_data_in_to_pred_in_rsc_VLD;
    assign pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_DAT = pred_fifo_q;
    assign pred_fifo_q_rdy = pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_RDY;
    assign pred_fifo_data_out_to_pred_buffer_push_pred_in_rsc_VLD = pred_fifo_q_vld;

    // IP-XACT VLNV: tuni.fi:Kvazaar:AND2:1.0
    Combinatorial_AND2 #(
        .WIDTH               (1))
    AND2_1(
        // These ports are not in any interface
        .input1              (AND2_1_input1),
        .input2              (AND2_1_input2),
        .output1             (AND2_1_output1));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (32),
        .size_g              (2),
        .use_memory_g        ("ON"))
    conf_fifo(
        // Interface: aclr_n
        .aclr_n              (conf_fifo_aclr_n),
        // Interface: clk
        .clk                 (conf_fifo_clk),
        // Interface: data_in
        .d                   (conf_fifo_d),
        .d_vld               (conf_fifo_d_vld),
        .d_rdy               (conf_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (conf_fifo_q_rdy),
        .q                   (conf_fifo_q),
        .q_vld               (conf_fifo_q_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (8),
        .size_g              (16),
        .use_memory_g        ("ON"))
    intra_mode_fifo(
        // Interface: aclr_n
        .aclr_n              (intra_mode_fifo_aclr_n),
        // Interface: clk
        .clk                 (intra_mode_fifo_clk),
        // Interface: data_in
        .d                   (intra_mode_fifo_d),
        .d_vld               (intra_mode_fifo_d_vld),
        .d_rdy               (),
        // Interface: data_out
        .q_rdy               (intra_mode_fifo_q_rdy),
        .q                   (intra_mode_fifo_q),
        .q_vld               (intra_mode_fifo_q_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:pred_pull:1.0
    pred_buffer_pull pred_buffer_pull(
        // Interface: arst_n
        .arst_n              (pred_buffer_pull_arst_n),
        // Interface: clk
        .clk                 (pred_buffer_pull_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (pred_buffer_pull_conf_in_rsc_dat),
        .conf_in_rsc_vld     (pred_buffer_pull_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (pred_buffer_pull_conf_in_rsc_rdy),
        // Interface: intra_mode_in_rsc
        .intra_mode_in_rsc_dat(pred_buffer_pull_intra_mode_in_rsc_dat),
        .intra_mode_in_rsc_vld(pred_buffer_pull_intra_mode_in_rsc_vld),
        .intra_mode_in_rsc_rdy(pred_buffer_pull_intra_mode_in_rsc_rdy),
        // Interface: pred_in_rsc
        .pred_in_rsc_dat     (pred_buffer_pull_pred_in_rsc_dat),
        .pred_in_rsc_vld     (pred_buffer_pull_pred_in_rsc_vld),
        .pred_in_rsc_rdy     (pred_buffer_pull_pred_in_rsc_rdy),
        // Interface: pred_out_rsc
        .pred_out_rsc_rdy    (pred_buffer_pull_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (pred_buffer_pull_pred_out_rsc_dat),
        .pred_out_rsc_vld    (pred_buffer_pull_pred_out_rsc_vld),
        // Interface: ref_in_rsc
        .ref_in_rsc_dat      (pred_buffer_pull_ref_in_rsc_dat),
        .ref_in_rsc_vld      (pred_buffer_pull_ref_in_rsc_vld),
        .ref_in_rsc_rdy      (pred_buffer_pull_ref_in_rsc_rdy),
        // Interface: ref_out_rsc
        .ref_out_rsc_rdy     (pred_buffer_pull_ref_out_rsc_rdy),
        .ref_out_rsc_dat     (pred_buffer_pull_ref_out_rsc_dat),
        .ref_out_rsc_vld     (pred_buffer_pull_ref_out_rsc_vld),
        // Interface: resid_out_rsc
        .resid_out_rsc_rdy   (pred_buffer_pull_resid_out_rsc_rdy),
        .resid_out_rsc_dat   (pred_buffer_pull_resid_out_rsc_dat),
        .resid_out_rsc_vld   (pred_buffer_pull_resid_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:pred_push:1.0
    pred_buffer_push pred_buffer_push(
        // Interface: arst_n
        .arst_n              (pred_buffer_push_arst_n),
        // Interface: clk
        .clk                 (pred_buffer_push_clk),
        // Interface: intra_mode_in
        .intra_mode_in_rsc_dat(pred_buffer_push_intra_mode_in_rsc_dat),
        .intra_mode_in_rsc_vld(pred_buffer_push_intra_mode_in_rsc_vld),
        .intra_mode_in_rsc_rdy(pred_buffer_push_intra_mode_in_rsc_rdy),
        // Interface: pred_in_rsc
        .pred_in_rsc_dat     (pred_buffer_push_pred_in_rsc_dat),
        .pred_in_rsc_vld     (pred_buffer_push_pred_in_rsc_vld),
        .pred_in_rsc_rdy     (pred_buffer_push_pred_in_rsc_rdy),
        // Interface: pred_out_rsc
        .pred_out_rsc_rdy    (pred_buffer_push_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (pred_buffer_push_pred_out_rsc_dat),
        .pred_out_rsc_vld    (pred_buffer_push_pred_out_rsc_vld),
        // Interface: ref_out_rsc
        .ref_out_rsc_rdy     (pred_buffer_push_ref_out_rsc_rdy),
        .ref_out_rsc_dat     (pred_buffer_push_ref_out_rsc_dat),
        .ref_out_rsc_vld     (pred_buffer_push_ref_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (1153),
        .size_g              (256),
        .use_memory_g        ("ON"))
    pred_fifo(
        // Interface: aclr_n
        .aclr_n              (pred_fifo_aclr_n),
        // Interface: clk
        .clk                 (pred_fifo_clk),
        // Interface: data_in
        .d                   (pred_fifo_d),
        .d_vld               (pred_fifo_d_vld),
        .d_rdy               (pred_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (pred_fifo_q_rdy),
        .q                   (pred_fifo_q),
        .q_vld               (pred_fifo_q_vld));


endmodule
