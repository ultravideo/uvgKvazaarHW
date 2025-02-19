
module ip_get_planar_0(
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: conf_in
    input                [19:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: pred_out
    input                               pred_out_rsc_rdy,
    output               [31:0]         pred_out_rsc_dat,
    output                              pred_out_rsc_vld,

    // Interface: ref
    input                [31:0]         wdata,
    input                [5:0]          wraddress,
    input                               wren
);

    // ip_get_planar_core_0_clk_to_bus wires:
    wire       ip_get_planar_core_0_clk_to_bus_CLK;
    // ip_get_planar_core_0_arst_n_to_bus_1 wires:
    wire       ip_get_planar_core_0_arst_n_to_bus_1_arst_n;
    // fifo_0_data_in_to_conf_in wires:
    wire [19:0] fifo_0_data_in_to_conf_in_DAT;
    wire       fifo_0_data_in_to_conf_in_RDY;
    wire       fifo_0_data_in_to_conf_in_VLD;
    // fifo_0_data_out_to_ip_get_planar_core_0_conf_in wires:
    wire [19:0] fifo_0_data_out_to_ip_get_planar_core_0_conf_in_DAT;
    wire       fifo_0_data_out_to_ip_get_planar_core_0_conf_in_RDY;
    wire       fifo_0_data_out_to_ip_get_planar_core_0_conf_in_VLD;
    // ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read wires:
    wire [5:0] ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_ADDR;
    wire [31:0] ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_RDATA;
    wire [31:0] ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_WDATA;
    wire       ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_WREN;
    // ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read wires:
    wire [5:0] ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_ADDR;
    wire [31:0] ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_RDATA;
    wire [31:0] ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_WDATA;
    wire       ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_WREN;
    // ip_get_planar_core_0_pred_out_to_bus wires:
    wire [31:0] ip_get_planar_core_0_pred_out_to_bus_DAT;
    wire       ip_get_planar_core_0_pred_out_to_bus_RDY;
    wire       ip_get_planar_core_0_pred_out_to_bus_VLD;
    // OnChipMemoryMixWidth_0_mem_write_to_ref wires:
    wire [5:0] OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    wire [31:0] OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    wire       OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;

    // OnChipMemoryMixWidth_0 port wires:
    wire       OnChipMemoryMixWidth_0_clock;
    wire [5:0] OnChipMemoryMixWidth_0_rdaddress;
    wire [31:0] OnChipMemoryMixWidth_0_rdata;
    wire [31:0] OnChipMemoryMixWidth_0_wdata;
    wire [5:0] OnChipMemoryMixWidth_0_wraddress;
    wire       OnChipMemoryMixWidth_0_wren;
    // OnChipMemoryMixWidth_1 port wires:
    wire       OnChipMemoryMixWidth_1_clock;
    wire [5:0] OnChipMemoryMixWidth_1_rdaddress;
    wire [31:0] OnChipMemoryMixWidth_1_rdata;
    wire [31:0] OnChipMemoryMixWidth_1_wdata;
    wire [5:0] OnChipMemoryMixWidth_1_wraddress;
    wire       OnChipMemoryMixWidth_1_wren;
    // fifo_0 port wires:
    wire       fifo_0_aclr_n;
    wire       fifo_0_clk;
    wire [19:0] fifo_0_d;
    wire       fifo_0_d_rdy;
    wire       fifo_0_d_vld;
    wire [19:0] fifo_0_q;
    wire       fifo_0_q_rdy;
    wire       fifo_0_q_vld;
    // ip_get_planar_core_0 port wires:
    wire       ip_get_planar_core_0_arst_n;
    wire       ip_get_planar_core_0_clk;
    wire [19:0] ip_get_planar_core_0_conf_in_rsc_dat;
    wire       ip_get_planar_core_0_conf_in_rsc_rdy;
    wire       ip_get_planar_core_0_conf_in_rsc_vld;
    wire [31:0] ip_get_planar_core_0_pred_out_rsc_dat;
    wire       ip_get_planar_core_0_pred_out_rsc_rdy;
    wire       ip_get_planar_core_0_pred_out_rsc_vld;
    wire [5:0] ip_get_planar_core_0_ref_rsc_0_0_adr;
    wire [31:0] ip_get_planar_core_0_ref_rsc_0_0_q;
    wire [5:0] ip_get_planar_core_0_ref_rsc_0_1_adr;
    wire [31:0] ip_get_planar_core_0_ref_rsc_0_1_q;

    // Assignments for the ports of the encompassing component:
    assign ip_get_planar_core_0_arst_n_to_bus_1_arst_n = arst_n;
    assign ip_get_planar_core_0_clk_to_bus_CLK = clk;
    assign fifo_0_data_in_to_conf_in_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = fifo_0_data_in_to_conf_in_RDY;
    assign fifo_0_data_in_to_conf_in_VLD = conf_in_rsc_vld;
    assign pred_out_rsc_dat = ip_get_planar_core_0_pred_out_to_bus_DAT;
    assign ip_get_planar_core_0_pred_out_to_bus_RDY = pred_out_rsc_rdy;
    assign pred_out_rsc_vld = ip_get_planar_core_0_pred_out_to_bus_VLD;
    assign OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA = wdata;
    assign OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR = wraddress;
    assign OnChipMemoryMixWidth_0_mem_write_to_ref_WREN = wren;

    // OnChipMemoryMixWidth_0 assignments:
    assign OnChipMemoryMixWidth_0_clock = ip_get_planar_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_0_rdaddress = ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_ADDR;
    assign ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_RDATA = OnChipMemoryMixWidth_0_rdata;
    assign OnChipMemoryMixWidth_0_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_0_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_0_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_1 assignments:
    assign OnChipMemoryMixWidth_1_clock = ip_get_planar_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_1_rdaddress = ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_ADDR;
    assign ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_RDATA = OnChipMemoryMixWidth_1_rdata;
    assign OnChipMemoryMixWidth_1_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_1_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_1_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // fifo_0 assignments:
    assign fifo_0_aclr_n = ip_get_planar_core_0_arst_n_to_bus_1_arst_n;
    assign fifo_0_clk = ip_get_planar_core_0_clk_to_bus_CLK;
    assign fifo_0_d = fifo_0_data_in_to_conf_in_DAT;
    assign fifo_0_data_in_to_conf_in_RDY = fifo_0_d_rdy;
    assign fifo_0_d_vld = fifo_0_data_in_to_conf_in_VLD;
    assign fifo_0_data_out_to_ip_get_planar_core_0_conf_in_DAT = fifo_0_q;
    assign fifo_0_q_rdy = fifo_0_data_out_to_ip_get_planar_core_0_conf_in_RDY;
    assign fifo_0_data_out_to_ip_get_planar_core_0_conf_in_VLD = fifo_0_q_vld;
    // ip_get_planar_core_0 assignments:
    assign ip_get_planar_core_0_arst_n = ip_get_planar_core_0_arst_n_to_bus_1_arst_n;
    assign ip_get_planar_core_0_clk = ip_get_planar_core_0_clk_to_bus_CLK;
    assign ip_get_planar_core_0_conf_in_rsc_dat = fifo_0_data_out_to_ip_get_planar_core_0_conf_in_DAT;
    assign fifo_0_data_out_to_ip_get_planar_core_0_conf_in_RDY = ip_get_planar_core_0_conf_in_rsc_rdy;
    assign ip_get_planar_core_0_conf_in_rsc_vld = fifo_0_data_out_to_ip_get_planar_core_0_conf_in_VLD;
    assign ip_get_planar_core_0_pred_out_to_bus_DAT = ip_get_planar_core_0_pred_out_rsc_dat;
    assign ip_get_planar_core_0_pred_out_rsc_rdy = ip_get_planar_core_0_pred_out_to_bus_RDY;
    assign ip_get_planar_core_0_pred_out_to_bus_VLD = ip_get_planar_core_0_pred_out_rsc_vld;
    assign ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_ADDR = ip_get_planar_core_0_ref_rsc_0_0_adr;
    assign ip_get_planar_core_0_ref_rsc_0_0_q = ip_get_planar_core_0_ref0_to_OnChipMemoryMixWidth_0_mem_read_RDATA;
    assign ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_ADDR = ip_get_planar_core_0_ref_rsc_0_1_adr;
    assign ip_get_planar_core_0_ref_rsc_0_1_q = ip_get_planar_core_0_ref1_to_OnChipMemoryMixWidth_1_mem_read_RDATA;

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (32),
        .addr_width_w_g      (6),
        .addr_width_r_g      (6))
    OnChipMemoryMixWidth_0(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_0_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_0_rdaddress),
        .rdata               (OnChipMemoryMixWidth_0_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_0_wdata),
        .wraddress           (OnChipMemoryMixWidth_0_wraddress),
        .wren                (OnChipMemoryMixWidth_0_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (32),
        .addr_width_w_g      (6),
        .addr_width_r_g      (6))
    OnChipMemoryMixWidth_1(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_1_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_1_rdaddress),
        .rdata               (OnChipMemoryMixWidth_1_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_1_wdata),
        .wraddress           (OnChipMemoryMixWidth_1_wraddress),
        .wren                (OnChipMemoryMixWidth_1_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (20),
        .size_g              (2),
        .use_memory_g        ("OFF"))
    fifo_0(
        // Interface: aclr_n
        .aclr_n              (fifo_0_aclr_n),
        // Interface: clk
        .clk                 (fifo_0_clk),
        // Interface: data_in
        .d                   (fifo_0_d),
        .d_vld               (fifo_0_d_vld),
        .d_rdy               (fifo_0_d_rdy),
        // Interface: data_out
        .q_rdy               (fifo_0_q_rdy),
        .q                   (fifo_0_q),
        .q_vld               (fifo_0_q_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_planar_core:1.0
    main_ip_get_planar ip_get_planar_core_0(
        // Interface: arst_n
        .arst_n              (ip_get_planar_core_0_arst_n),
        // Interface: clk
        .clk                 (ip_get_planar_core_0_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_planar_core_0_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_planar_core_0_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_planar_core_0_conf_in_rsc_rdy),
        // Interface: pred_out
        .pred_out_rsc_rdy    (ip_get_planar_core_0_pred_out_rsc_rdy),
        .pred_out_rsc_dat    (ip_get_planar_core_0_pred_out_rsc_dat),
        .pred_out_rsc_vld    (ip_get_planar_core_0_pred_out_rsc_vld),
        // Interface: ref0
        .ref_rsc_0_0_q       (ip_get_planar_core_0_ref_rsc_0_0_q),
        .ref_rsc_0_0_adr     (ip_get_planar_core_0_ref_rsc_0_0_adr),
        .ref_rsc_0_0_d       (),
        .ref_rsc_0_0_we      (),
        // Interface: ref1
        .ref_rsc_0_1_q       (ip_get_planar_core_0_ref_rsc_0_1_q),
        .ref_rsc_0_1_adr     (ip_get_planar_core_0_ref_rsc_0_1_adr),
        .ref_rsc_0_1_d       (),
        .ref_rsc_0_1_we      ());


endmodule
