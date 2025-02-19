
module IntraSearchTransform_0 #(
    parameter                              width_g          = 32
) (
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: coeff_out
    input                               coeff_out_rsc_rdy,
    output               [511:0]        coeff_out_rsc_dat,
    output                              coeff_out_rsc_vld,

    // Interface: pred_in
    input                [255:0]        pred_in_rsc_dat,
    input                               pred_in_rsc_vld,
    output                              pred_in_rsc_rdy,

    // Interface: rec_out
    input                               rec_out_rsc_rdy,
    output               [255:0]        rec_out_rsc_dat,
    output                              rec_out_rsc_vld,

    // Interface: ref_in
    input                [255:0]        ref_in_rsc_dat,
    input                               ref_in_rsc_vld,
    output                              ref_in_rsc_rdy,

    // Interface: resid_in
    input                [287:0]        resid_in_rsc_dat,
    input                               resid_in_rsc_vld,
    output                              resid_in_rsc_rdy
);

    // t2d_coeff_out_to_main_quant_coeff_in_rsc wires:
    wire [511:0] t2d_coeff_out_to_main_quant_coeff_in_rsc_DAT;
    wire       t2d_coeff_out_to_main_quant_coeff_in_rsc_RDY;
    wire       t2d_coeff_out_to_main_quant_coeff_in_rsc_VLD;
    // t2d_arst_n_to_arst_n wires:
    wire       t2d_arst_n_to_arst_n_arst_n;
    // t2d_clk_to_clk wires:
    wire       t2d_clk_to_clk_CLK;
    // main_quant_quant_out_rsc_to_coeff_cost_coeff_in wires:
    wire [511:0] main_quant_quant_out_rsc_to_coeff_cost_coeff_in_DAT;
    wire       main_quant_quant_out_rsc_to_coeff_cost_coeff_in_RDY;
    wire       main_quant_quant_out_rsc_to_coeff_cost_coeff_in_VLD;
    // coeff_cost_coeff_out_to_bus wires:
    wire [511:0] coeff_cost_coeff_out_to_bus_DAT;
    wire       coeff_cost_coeff_out_to_bus_RDY;
    wire       coeff_cost_coeff_out_to_bus_VLD;
    // main_quant_coeff_out_rsc_to_it2d_coeff_in wires:
    wire [511:0] main_quant_coeff_out_rsc_to_it2d_coeff_in_DAT;
    wire       main_quant_coeff_out_rsc_to_it2d_coeff_in_RDY;
    wire       main_quant_coeff_out_rsc_to_it2d_coeff_in_VLD;
    // t2d_resid_in_to_bus wires:
    wire [287:0] t2d_resid_in_to_bus_DAT;
    wire       t2d_resid_in_to_bus_RDY;
    wire       t2d_resid_in_to_bus_VLD;
    // main_reconstruct_ref_in_rsc_to_ref_in wires:
    wire [255:0] main_reconstruct_ref_in_rsc_to_ref_in_DAT;
    wire       main_reconstruct_ref_in_rsc_to_ref_in_RDY;
    wire       main_reconstruct_ref_in_rsc_to_ref_in_VLD;
    // main_reconstruct_rec_out_rsc_to_rec_out wires:
    wire [255:0] main_reconstruct_rec_out_rsc_to_rec_out_DAT;
    wire       main_reconstruct_rec_out_rsc_to_rec_out_RDY;
    wire       main_reconstruct_rec_out_rsc_to_rec_out_VLD;
    // main_reconstruct_pred_in_rsc_to_pred_in wires:
    wire [255:0] main_reconstruct_pred_in_rsc_to_pred_in_DAT;
    wire       main_reconstruct_pred_in_rsc_to_pred_in_RDY;
    wire       main_reconstruct_pred_in_rsc_to_pred_in_VLD;
    // it2d_coeff_out_to_main_reconstruct_resid_in_rsc wires:
    wire [511:0] it2d_coeff_out_to_main_reconstruct_resid_in_rsc_DAT;
    wire       it2d_coeff_out_to_main_reconstruct_resid_in_rsc_RDY;
    wire       it2d_coeff_out_to_main_reconstruct_resid_in_rsc_VLD;

    // coeff_cost port wires:
    wire       coeff_cost_arst_n;
    wire       coeff_cost_clk;
    wire [511:0] coeff_cost_coeff_in_rsc_dat;
    wire       coeff_cost_coeff_in_rsc_rdy;
    wire       coeff_cost_coeff_in_rsc_vld;
    wire [511:0] coeff_cost_coeff_out_rsc_dat;
    wire       coeff_cost_coeff_out_rsc_rdy;
    wire       coeff_cost_coeff_out_rsc_vld;
    // it2d port wires:
    wire       it2d_arst_n;
    wire       it2d_clk;
    wire [511:0] it2d_coeff_in_rsc_dat;
    wire       it2d_coeff_in_rsc_rdy;
    wire       it2d_coeff_in_rsc_vld;
    wire [511:0] it2d_coeff_out_rsc_dat;
    wire       it2d_coeff_out_rsc_rdy;
    wire       it2d_coeff_out_rsc_vld;
    // main_quant port wires:
    wire       main_quant_arst_n;
    wire       main_quant_clk;
    wire [511:0] main_quant_coeff_in_rsc_dat;
    wire       main_quant_coeff_in_rsc_rdy;
    wire       main_quant_coeff_in_rsc_vld;
    wire [511:0] main_quant_coeff_out_rsc_dat;
    wire       main_quant_coeff_out_rsc_rdy;
    wire       main_quant_coeff_out_rsc_vld;
    wire [511:0] main_quant_quant_out_rsc_dat;
    wire       main_quant_quant_out_rsc_rdy;
    wire       main_quant_quant_out_rsc_vld;
    // main_reconstruct port wires:
    wire       main_reconstruct_arst_n;
    wire       main_reconstruct_clk;
    wire [255:0] main_reconstruct_pred_in_rsc_dat;
    wire       main_reconstruct_pred_in_rsc_rdy;
    wire       main_reconstruct_pred_in_rsc_vld;
    wire [255:0] main_reconstruct_rec_out_rsc_dat;
    wire       main_reconstruct_rec_out_rsc_rdy;
    wire       main_reconstruct_rec_out_rsc_vld;
    wire [255:0] main_reconstruct_ref_in_rsc_dat;
    wire       main_reconstruct_ref_in_rsc_rdy;
    wire       main_reconstruct_ref_in_rsc_vld;
    wire [511:0] main_reconstruct_resid_in_rsc_dat;
    wire       main_reconstruct_resid_in_rsc_rdy;
    wire       main_reconstruct_resid_in_rsc_vld;
    // t2d port wires:
    wire       t2d_arst_n;
    wire       t2d_clk;
    wire [511:0] t2d_coeff_out_rsc_dat;
    wire       t2d_coeff_out_rsc_rdy;
    wire       t2d_coeff_out_rsc_vld;
    wire [287:0] t2d_resid_in_rsc_dat;
    wire       t2d_resid_in_rsc_rdy;
    wire       t2d_resid_in_rsc_vld;

    // Assignments for the ports of the encompassing component:
    assign t2d_arst_n_to_arst_n_arst_n = arst_n;
    assign t2d_clk_to_clk_CLK = clk;
    assign coeff_out_rsc_dat = coeff_cost_coeff_out_to_bus_DAT;
    assign coeff_cost_coeff_out_to_bus_RDY = coeff_out_rsc_rdy;
    assign coeff_out_rsc_vld = coeff_cost_coeff_out_to_bus_VLD;
    assign main_reconstruct_pred_in_rsc_to_pred_in_DAT = pred_in_rsc_dat;
    assign pred_in_rsc_rdy = main_reconstruct_pred_in_rsc_to_pred_in_RDY;
    assign main_reconstruct_pred_in_rsc_to_pred_in_VLD = pred_in_rsc_vld;
    assign rec_out_rsc_dat = main_reconstruct_rec_out_rsc_to_rec_out_DAT;
    assign main_reconstruct_rec_out_rsc_to_rec_out_RDY = rec_out_rsc_rdy;
    assign rec_out_rsc_vld = main_reconstruct_rec_out_rsc_to_rec_out_VLD;
    assign main_reconstruct_ref_in_rsc_to_ref_in_DAT = ref_in_rsc_dat;
    assign ref_in_rsc_rdy = main_reconstruct_ref_in_rsc_to_ref_in_RDY;
    assign main_reconstruct_ref_in_rsc_to_ref_in_VLD = ref_in_rsc_vld;
    assign t2d_resid_in_to_bus_DAT = resid_in_rsc_dat;
    assign resid_in_rsc_rdy = t2d_resid_in_to_bus_RDY;
    assign t2d_resid_in_to_bus_VLD = resid_in_rsc_vld;

    // coeff_cost assignments:
    assign coeff_cost_arst_n = t2d_arst_n_to_arst_n_arst_n;
    assign coeff_cost_clk = t2d_clk_to_clk_CLK;
    assign coeff_cost_coeff_in_rsc_dat = main_quant_quant_out_rsc_to_coeff_cost_coeff_in_DAT;
    assign main_quant_quant_out_rsc_to_coeff_cost_coeff_in_RDY = coeff_cost_coeff_in_rsc_rdy;
    assign coeff_cost_coeff_in_rsc_vld = main_quant_quant_out_rsc_to_coeff_cost_coeff_in_VLD;
    assign coeff_cost_coeff_out_to_bus_DAT = coeff_cost_coeff_out_rsc_dat;
    assign coeff_cost_coeff_out_rsc_rdy = coeff_cost_coeff_out_to_bus_RDY;
    assign coeff_cost_coeff_out_to_bus_VLD = coeff_cost_coeff_out_rsc_vld;
    // it2d assignments:
    assign it2d_arst_n = t2d_arst_n_to_arst_n_arst_n;
    assign it2d_clk = t2d_clk_to_clk_CLK;
    assign it2d_coeff_in_rsc_dat = main_quant_coeff_out_rsc_to_it2d_coeff_in_DAT;
    assign main_quant_coeff_out_rsc_to_it2d_coeff_in_RDY = it2d_coeff_in_rsc_rdy;
    assign it2d_coeff_in_rsc_vld = main_quant_coeff_out_rsc_to_it2d_coeff_in_VLD;
    assign it2d_coeff_out_to_main_reconstruct_resid_in_rsc_DAT = it2d_coeff_out_rsc_dat;
    assign it2d_coeff_out_rsc_rdy = it2d_coeff_out_to_main_reconstruct_resid_in_rsc_RDY;
    assign it2d_coeff_out_to_main_reconstruct_resid_in_rsc_VLD = it2d_coeff_out_rsc_vld;
    // main_quant assignments:
    assign main_quant_arst_n = t2d_arst_n_to_arst_n_arst_n;
    assign main_quant_clk = t2d_clk_to_clk_CLK;
    assign main_quant_coeff_in_rsc_dat = t2d_coeff_out_to_main_quant_coeff_in_rsc_DAT;
    assign t2d_coeff_out_to_main_quant_coeff_in_rsc_RDY = main_quant_coeff_in_rsc_rdy;
    assign main_quant_coeff_in_rsc_vld = t2d_coeff_out_to_main_quant_coeff_in_rsc_VLD;
    assign main_quant_coeff_out_rsc_to_it2d_coeff_in_DAT = main_quant_coeff_out_rsc_dat;
    assign main_quant_coeff_out_rsc_rdy = main_quant_coeff_out_rsc_to_it2d_coeff_in_RDY;
    assign main_quant_coeff_out_rsc_to_it2d_coeff_in_VLD = main_quant_coeff_out_rsc_vld;
    assign main_quant_quant_out_rsc_to_coeff_cost_coeff_in_DAT = main_quant_quant_out_rsc_dat;
    assign main_quant_quant_out_rsc_rdy = main_quant_quant_out_rsc_to_coeff_cost_coeff_in_RDY;
    assign main_quant_quant_out_rsc_to_coeff_cost_coeff_in_VLD = main_quant_quant_out_rsc_vld;
    // main_reconstruct assignments:
    assign main_reconstruct_arst_n = t2d_arst_n_to_arst_n_arst_n;
    assign main_reconstruct_clk = t2d_clk_to_clk_CLK;
    assign main_reconstruct_pred_in_rsc_dat = main_reconstruct_pred_in_rsc_to_pred_in_DAT;
    assign main_reconstruct_pred_in_rsc_to_pred_in_RDY = main_reconstruct_pred_in_rsc_rdy;
    assign main_reconstruct_pred_in_rsc_vld = main_reconstruct_pred_in_rsc_to_pred_in_VLD;
    assign main_reconstruct_rec_out_rsc_to_rec_out_DAT = main_reconstruct_rec_out_rsc_dat;
    assign main_reconstruct_rec_out_rsc_rdy = main_reconstruct_rec_out_rsc_to_rec_out_RDY;
    assign main_reconstruct_rec_out_rsc_to_rec_out_VLD = main_reconstruct_rec_out_rsc_vld;
    assign main_reconstruct_ref_in_rsc_dat = main_reconstruct_ref_in_rsc_to_ref_in_DAT;
    assign main_reconstruct_ref_in_rsc_to_ref_in_RDY = main_reconstruct_ref_in_rsc_rdy;
    assign main_reconstruct_ref_in_rsc_vld = main_reconstruct_ref_in_rsc_to_ref_in_VLD;
    assign main_reconstruct_resid_in_rsc_dat = it2d_coeff_out_to_main_reconstruct_resid_in_rsc_DAT;
    assign it2d_coeff_out_to_main_reconstruct_resid_in_rsc_RDY = main_reconstruct_resid_in_rsc_rdy;
    assign main_reconstruct_resid_in_rsc_vld = it2d_coeff_out_to_main_reconstruct_resid_in_rsc_VLD;
    // t2d assignments:
    assign t2d_arst_n = t2d_arst_n_to_arst_n_arst_n;
    assign t2d_clk = t2d_clk_to_clk_CLK;
    assign t2d_coeff_out_to_main_quant_coeff_in_rsc_DAT = t2d_coeff_out_rsc_dat;
    assign t2d_coeff_out_rsc_rdy = t2d_coeff_out_to_main_quant_coeff_in_rsc_RDY;
    assign t2d_coeff_out_to_main_quant_coeff_in_rsc_VLD = t2d_coeff_out_rsc_vld;
    assign t2d_resid_in_rsc_dat = t2d_resid_in_to_bus_DAT;
    assign t2d_resid_in_to_bus_RDY = t2d_resid_in_rsc_rdy;
    assign t2d_resid_in_rsc_vld = t2d_resid_in_to_bus_VLD;

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:coeff_cost:1.0
    coeff_cost_0 coeff_cost(
        // Interface: arst_n
        .arst_n              (coeff_cost_arst_n),
        // Interface: clk
        .clk                 (coeff_cost_clk),
        // Interface: coeff_in
        .coeff_in_rsc_dat    (coeff_cost_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (coeff_cost_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (coeff_cost_coeff_in_rsc_rdy),
        // Interface: coeff_out
        .coeff_out_rsc_rdy   (coeff_cost_coeff_out_rsc_rdy),
        .coeff_out_rsc_dat   (coeff_cost_coeff_out_rsc_dat),
        .coeff_out_rsc_vld   (coeff_cost_coeff_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:it2d:1.0
    it2d_0 it2d(
        // Interface: arst_n
        .arst_n              (it2d_arst_n),
        // Interface: clk
        .clk                 (it2d_clk),
        // Interface: coeff_in
        .coeff_in_rsc_dat    (it2d_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (it2d_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (it2d_coeff_in_rsc_rdy),
        // Interface: coeff_out
        .coeff_out_rsc_rdy   (it2d_coeff_out_rsc_rdy),
        .coeff_out_rsc_dat   (it2d_coeff_out_rsc_dat),
        .coeff_out_rsc_vld   (it2d_coeff_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:main_quant:1.0
    main_quant main_quant(
        // Interface: arst_n
        .arst_n              (main_quant_arst_n),
        // Interface: clk
        .clk                 (main_quant_clk),
        // Interface: coeff_in_rsc
        .coeff_in_rsc_dat    (main_quant_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (main_quant_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (main_quant_coeff_in_rsc_rdy),
        // Interface: coeff_out_rsc
        .coeff_out_rsc_rdy   (main_quant_coeff_out_rsc_rdy),
        .coeff_out_rsc_dat   (main_quant_coeff_out_rsc_dat),
        .coeff_out_rsc_vld   (main_quant_coeff_out_rsc_vld),
        // Interface: quant_out_rsc
        .quant_out_rsc_rdy   (main_quant_quant_out_rsc_rdy),
        .quant_out_rsc_dat   (main_quant_quant_out_rsc_dat),
        .quant_out_rsc_vld   (main_quant_quant_out_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:main_reconstruct:1.0
    main_reconstruct main_reconstruct(
        // Interface: arst_n
        .arst_n              (main_reconstruct_arst_n),
        // Interface: clk
        .clk                 (main_reconstruct_clk),
        // Interface: pred_in_rsc
        .pred_in_rsc_dat     (main_reconstruct_pred_in_rsc_dat),
        .pred_in_rsc_vld     (main_reconstruct_pred_in_rsc_vld),
        .pred_in_rsc_rdy     (main_reconstruct_pred_in_rsc_rdy),
        // Interface: rec_out_rsc
        .rec_out_rsc_rdy     (main_reconstruct_rec_out_rsc_rdy),
        .rec_out_rsc_dat     (main_reconstruct_rec_out_rsc_dat),
        .rec_out_rsc_vld     (main_reconstruct_rec_out_rsc_vld),
        // Interface: ref_in_rsc
        .ref_in_rsc_dat      (main_reconstruct_ref_in_rsc_dat),
        .ref_in_rsc_vld      (main_reconstruct_ref_in_rsc_vld),
        .ref_in_rsc_rdy      (main_reconstruct_ref_in_rsc_rdy),
        // Interface: resid_in_rsc
        .resid_in_rsc_dat    (main_reconstruct_resid_in_rsc_dat),
        .resid_in_rsc_vld    (main_reconstruct_resid_in_rsc_vld),
        .resid_in_rsc_rdy    (main_reconstruct_resid_in_rsc_rdy));

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:t2d:1.0
    t2d_0 t2d(
        // Interface: arst_n
        .arst_n              (t2d_arst_n),
        // Interface: clk
        .clk                 (t2d_clk),
        // Interface: coeff_out
        .coeff_out_rsc_rdy   (t2d_coeff_out_rsc_rdy),
        .coeff_out_rsc_dat   (t2d_coeff_out_rsc_dat),
        .coeff_out_rsc_vld   (t2d_coeff_out_rsc_vld),
        // Interface: resid_in
        .resid_in_rsc_dat    (t2d_resid_in_rsc_dat),
        .resid_in_rsc_vld    (t2d_resid_in_rsc_vld),
        .resid_in_rsc_rdy    (t2d_resid_in_rsc_rdy));


endmodule
