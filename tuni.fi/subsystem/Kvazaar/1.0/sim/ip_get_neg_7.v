
module ip_get_neg_7(
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: conf_in
    input                [21:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: hor_out
    input                               hor_out_rsc_rdy,
    output               [31:0]         hor_out_rsc_dat,
    output                              hor_out_rsc_vld,

    // Interface: ref
    input                [31:0]         wdata,
    input                [5:0]          wraddress,
    input                               wren,

    // Interface: ver_out
    input                               ver_out_rsc_rdy,
    output               [31:0]         ver_out_rsc_dat,
    output                              ver_out_rsc_vld
);

    // ip_get_neg_core_0_clk_to_bus wires:
    wire       ip_get_neg_core_0_clk_to_bus_CLK;
    // ip_get_neg_core_0_arst_n_to_bus_1 wires:
    wire       ip_get_neg_core_0_arst_n_to_bus_1_arst_n;
    // ip_get_neg_core_0_hor_out_to_bus_3 wires:
    wire [31:0] ip_get_neg_core_0_hor_out_to_bus_3_DAT;
    wire       ip_get_neg_core_0_hor_out_to_bus_3_RDY;
    wire       ip_get_neg_core_0_hor_out_to_bus_3_VLD;
    // ip_get_neg_core_0_ver_out_to_bus_4 wires:
    wire [31:0] ip_get_neg_core_0_ver_out_to_bus_4_DAT;
    wire       ip_get_neg_core_0_ver_out_to_bus_4_RDY;
    wire       ip_get_neg_core_0_ver_out_to_bus_4_VLD;
    // ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read wires:
    wire [7:0] ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_ADDR;
    wire [7:0] ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_RDATA;
    wire [7:0] ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_WDATA;
    wire       ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_WREN;
    // OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1 wires:
    wire [7:0] OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_ADDR;
    wire [7:0] OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_RDATA;
    wire [7:0] OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_WDATA;
    wire       OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_WREN;
    // OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2 wires:
    wire [7:0] OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_ADDR;
    wire [7:0] OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_RDATA;
    wire [7:0] OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_WDATA;
    wire       OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_WREN;
    // OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3 wires:
    wire [7:0] OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_ADDR;
    wire [7:0] OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_RDATA;
    wire [7:0] OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_WDATA;
    wire       OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_WREN;
    // OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4 wires:
    wire [7:0] OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_ADDR;
    wire [7:0] OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_RDATA;
    wire [7:0] OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_WDATA;
    wire       OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_WREN;
    // OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5 wires:
    wire [7:0] OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_ADDR;
    wire [7:0] OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_RDATA;
    wire [7:0] OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_WDATA;
    wire       OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_WREN;
    // ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read wires:
    wire [7:0] ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_ADDR;
    wire [7:0] ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_RDATA;
    wire [7:0] ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_WDATA;
    wire       ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_WREN;
    // OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7 wires:
    wire [7:0] OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_ADDR;
    wire [7:0] OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_RDATA;
    wire [7:0] OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_WDATA;
    wire       OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_WREN;
    // ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read wires:
    wire [7:0] ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_ADDR;
    wire [7:0] ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_RDATA;
    wire [7:0] ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_WDATA;
    wire       ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_WREN;
    // OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1 wires:
    wire [7:0] OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_ADDR;
    wire [7:0] OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_RDATA;
    wire [7:0] OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_WDATA;
    wire       OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_WREN;
    // ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read wires:
    wire [7:0] ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_ADDR;
    wire [7:0] ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_RDATA;
    wire [7:0] ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_WDATA;
    wire       ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_WREN;
    // OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3 wires:
    wire [7:0] OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_ADDR;
    wire [7:0] OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_RDATA;
    wire [7:0] OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_WDATA;
    wire       OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_WREN;
    // ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read wires:
    wire [7:0] ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_ADDR;
    wire [7:0] ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_RDATA;
    wire [7:0] ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_WDATA;
    wire       ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_WREN;
    // OnChipMemoryMixWidth_0_mem_write_to_ref wires:
    wire [5:0] OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    wire [31:0] OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    wire       OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // fifo_0_data_in_to_conf_in wires:
    wire [21:0] fifo_0_data_in_to_conf_in_DAT;
    wire       fifo_0_data_in_to_conf_in_RDY;
    wire       fifo_0_data_in_to_conf_in_VLD;
    // fifo_0_data_out_to_ip_get_neg_core_0_conf_in wires:
    wire [21:0] fifo_0_data_out_to_ip_get_neg_core_0_conf_in_DAT;
    wire       fifo_0_data_out_to_ip_get_neg_core_0_conf_in_RDY;
    wire       fifo_0_data_out_to_ip_get_neg_core_0_conf_in_VLD;

    // OnChipMemoryMixWidth_0 port wires:
    wire       OnChipMemoryMixWidth_0_clock;
    wire [7:0] OnChipMemoryMixWidth_0_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_0_rdata;
    wire [31:0] OnChipMemoryMixWidth_0_wdata;
    wire [5:0] OnChipMemoryMixWidth_0_wraddress;
    wire       OnChipMemoryMixWidth_0_wren;
    // OnChipMemoryMixWidth_1 port wires:
    wire       OnChipMemoryMixWidth_1_clock;
    wire [7:0] OnChipMemoryMixWidth_1_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_1_rdata;
    wire [31:0] OnChipMemoryMixWidth_1_wdata;
    wire [5:0] OnChipMemoryMixWidth_1_wraddress;
    wire       OnChipMemoryMixWidth_1_wren;
    // OnChipMemoryMixWidth_10 port wires:
    wire       OnChipMemoryMixWidth_10_clock;
    wire [7:0] OnChipMemoryMixWidth_10_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_10_rdata;
    wire [31:0] OnChipMemoryMixWidth_10_wdata;
    wire [5:0] OnChipMemoryMixWidth_10_wraddress;
    wire       OnChipMemoryMixWidth_10_wren;
    // OnChipMemoryMixWidth_11 port wires:
    wire       OnChipMemoryMixWidth_11_clock;
    wire [7:0] OnChipMemoryMixWidth_11_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_11_rdata;
    wire [31:0] OnChipMemoryMixWidth_11_wdata;
    wire [5:0] OnChipMemoryMixWidth_11_wraddress;
    wire       OnChipMemoryMixWidth_11_wren;
    // OnChipMemoryMixWidth_12 port wires:
    wire       OnChipMemoryMixWidth_12_clock;
    wire [7:0] OnChipMemoryMixWidth_12_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_12_rdata;
    wire [31:0] OnChipMemoryMixWidth_12_wdata;
    wire [5:0] OnChipMemoryMixWidth_12_wraddress;
    wire       OnChipMemoryMixWidth_12_wren;
    // OnChipMemoryMixWidth_2 port wires:
    wire       OnChipMemoryMixWidth_2_clock;
    wire [7:0] OnChipMemoryMixWidth_2_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_2_rdata;
    wire [31:0] OnChipMemoryMixWidth_2_wdata;
    wire [5:0] OnChipMemoryMixWidth_2_wraddress;
    wire       OnChipMemoryMixWidth_2_wren;
    // OnChipMemoryMixWidth_3 port wires:
    wire       OnChipMemoryMixWidth_3_clock;
    wire [7:0] OnChipMemoryMixWidth_3_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_3_rdata;
    wire [31:0] OnChipMemoryMixWidth_3_wdata;
    wire [5:0] OnChipMemoryMixWidth_3_wraddress;
    wire       OnChipMemoryMixWidth_3_wren;
    // OnChipMemoryMixWidth_4 port wires:
    wire       OnChipMemoryMixWidth_4_clock;
    wire [7:0] OnChipMemoryMixWidth_4_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_4_rdata;
    wire [31:0] OnChipMemoryMixWidth_4_wdata;
    wire [5:0] OnChipMemoryMixWidth_4_wraddress;
    wire       OnChipMemoryMixWidth_4_wren;
    // OnChipMemoryMixWidth_5 port wires:
    wire       OnChipMemoryMixWidth_5_clock;
    wire [7:0] OnChipMemoryMixWidth_5_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_5_rdata;
    wire [31:0] OnChipMemoryMixWidth_5_wdata;
    wire [5:0] OnChipMemoryMixWidth_5_wraddress;
    wire       OnChipMemoryMixWidth_5_wren;
    // OnChipMemoryMixWidth_6 port wires:
    wire       OnChipMemoryMixWidth_6_clock;
    wire [7:0] OnChipMemoryMixWidth_6_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_6_rdata;
    wire [31:0] OnChipMemoryMixWidth_6_wdata;
    wire [5:0] OnChipMemoryMixWidth_6_wraddress;
    wire       OnChipMemoryMixWidth_6_wren;
    // OnChipMemoryMixWidth_7 port wires:
    wire       OnChipMemoryMixWidth_7_clock;
    wire [7:0] OnChipMemoryMixWidth_7_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_7_rdata;
    wire [31:0] OnChipMemoryMixWidth_7_wdata;
    wire [5:0] OnChipMemoryMixWidth_7_wraddress;
    wire       OnChipMemoryMixWidth_7_wren;
    // OnChipMemoryMixWidth_8 port wires:
    wire       OnChipMemoryMixWidth_8_clock;
    wire [7:0] OnChipMemoryMixWidth_8_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_8_rdata;
    wire [31:0] OnChipMemoryMixWidth_8_wdata;
    wire [5:0] OnChipMemoryMixWidth_8_wraddress;
    wire       OnChipMemoryMixWidth_8_wren;
    // OnChipMemoryMixWidth_9 port wires:
    wire       OnChipMemoryMixWidth_9_clock;
    wire [7:0] OnChipMemoryMixWidth_9_rdaddress;
    wire [7:0] OnChipMemoryMixWidth_9_rdata;
    wire [31:0] OnChipMemoryMixWidth_9_wdata;
    wire [5:0] OnChipMemoryMixWidth_9_wraddress;
    wire       OnChipMemoryMixWidth_9_wren;
    // fifo_0 port wires:
    wire       fifo_0_aclr_n;
    wire       fifo_0_clk;
    wire [21:0] fifo_0_d;
    wire       fifo_0_d_rdy;
    wire       fifo_0_d_vld;
    wire [21:0] fifo_0_q;
    wire       fifo_0_q_rdy;
    wire       fifo_0_q_vld;
    // ip_get_neg_core_0 port wires:
    wire       ip_get_neg_core_0_arst_n;
    wire       ip_get_neg_core_0_clk;
    wire [21:0] ip_get_neg_core_0_conf_in_rsc_dat;
    wire       ip_get_neg_core_0_conf_in_rsc_rdy;
    wire       ip_get_neg_core_0_conf_in_rsc_vld;
    wire [31:0] ip_get_neg_core_0_hor_out_rsc_dat;
    wire       ip_get_neg_core_0_hor_out_rsc_rdy;
    wire       ip_get_neg_core_0_hor_out_rsc_vld;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_0_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_0_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_1_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_1_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_2_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_2_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_3_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_3_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_4_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_4_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_5_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_5_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_6_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_6_q;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_7_adr;
    wire [7:0] ip_get_neg_core_0_ref1_rsc_0_7_q;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_0_adr;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_0_q;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_4_adr;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_4_q;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_5_adr;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_5_q;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_6_adr;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_6_q;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_7_adr;
    wire [7:0] ip_get_neg_core_0_ref2_rsc_0_7_q;
    wire [31:0] ip_get_neg_core_0_ver_out_rsc_dat;
    wire       ip_get_neg_core_0_ver_out_rsc_rdy;
    wire       ip_get_neg_core_0_ver_out_rsc_vld;

    // Assignments for the ports of the encompassing component:
    assign ip_get_neg_core_0_arst_n_to_bus_1_arst_n = arst_n;
    assign ip_get_neg_core_0_clk_to_bus_CLK = clk;
    assign fifo_0_data_in_to_conf_in_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = fifo_0_data_in_to_conf_in_RDY;
    assign fifo_0_data_in_to_conf_in_VLD = conf_in_rsc_vld;
    assign hor_out_rsc_dat = ip_get_neg_core_0_hor_out_to_bus_3_DAT;
    assign ip_get_neg_core_0_hor_out_to_bus_3_RDY = hor_out_rsc_rdy;
    assign hor_out_rsc_vld = ip_get_neg_core_0_hor_out_to_bus_3_VLD;
    assign ver_out_rsc_dat = ip_get_neg_core_0_ver_out_to_bus_4_DAT;
    assign ip_get_neg_core_0_ver_out_to_bus_4_RDY = ver_out_rsc_rdy;
    assign ver_out_rsc_vld = ip_get_neg_core_0_ver_out_to_bus_4_VLD;
    assign OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA = wdata;
    assign OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR = wraddress;
    assign OnChipMemoryMixWidth_0_mem_write_to_ref_WREN = wren;

    // OnChipMemoryMixWidth_0 assignments:
    assign OnChipMemoryMixWidth_0_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_0_rdaddress = ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_ADDR;
    assign ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_RDATA = OnChipMemoryMixWidth_0_rdata;
    assign OnChipMemoryMixWidth_0_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_0_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_0_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_1 assignments:
    assign OnChipMemoryMixWidth_1_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_1_rdaddress = OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_ADDR;
    assign OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_RDATA = OnChipMemoryMixWidth_1_rdata;
    assign OnChipMemoryMixWidth_1_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_1_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_1_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_10 assignments:
    assign OnChipMemoryMixWidth_10_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_10_rdaddress = ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_ADDR;
    assign ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_RDATA = OnChipMemoryMixWidth_10_rdata;
    assign OnChipMemoryMixWidth_10_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_10_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_10_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_11 assignments:
    assign OnChipMemoryMixWidth_11_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_11_rdaddress = OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_ADDR;
    assign OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_RDATA = OnChipMemoryMixWidth_11_rdata;
    assign OnChipMemoryMixWidth_11_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_11_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_11_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_12 assignments:
    assign OnChipMemoryMixWidth_12_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_12_rdaddress = ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_ADDR;
    assign ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_RDATA = OnChipMemoryMixWidth_12_rdata;
    assign OnChipMemoryMixWidth_12_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_12_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_12_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_2 assignments:
    assign OnChipMemoryMixWidth_2_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_2_rdaddress = OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_ADDR;
    assign OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_RDATA = OnChipMemoryMixWidth_2_rdata;
    assign OnChipMemoryMixWidth_2_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_2_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_2_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_3 assignments:
    assign OnChipMemoryMixWidth_3_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_3_rdaddress = OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_ADDR;
    assign OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_RDATA = OnChipMemoryMixWidth_3_rdata;
    assign OnChipMemoryMixWidth_3_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_3_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_3_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_4 assignments:
    assign OnChipMemoryMixWidth_4_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_4_rdaddress = OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_ADDR;
    assign OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_RDATA = OnChipMemoryMixWidth_4_rdata;
    assign OnChipMemoryMixWidth_4_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_4_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_4_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_5 assignments:
    assign OnChipMemoryMixWidth_5_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_5_rdaddress = OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_ADDR;
    assign OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_RDATA = OnChipMemoryMixWidth_5_rdata;
    assign OnChipMemoryMixWidth_5_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_5_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_5_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_6 assignments:
    assign OnChipMemoryMixWidth_6_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_6_rdaddress = ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_ADDR;
    assign ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_RDATA = OnChipMemoryMixWidth_6_rdata;
    assign OnChipMemoryMixWidth_6_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_6_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_6_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_7 assignments:
    assign OnChipMemoryMixWidth_7_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_7_rdaddress = OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_ADDR;
    assign OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_RDATA = OnChipMemoryMixWidth_7_rdata;
    assign OnChipMemoryMixWidth_7_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_7_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_7_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_8 assignments:
    assign OnChipMemoryMixWidth_8_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_8_rdaddress = ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_ADDR;
    assign ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_RDATA = OnChipMemoryMixWidth_8_rdata;
    assign OnChipMemoryMixWidth_8_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_8_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_8_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // OnChipMemoryMixWidth_9 assignments:
    assign OnChipMemoryMixWidth_9_clock = ip_get_neg_core_0_clk_to_bus_CLK;
    assign OnChipMemoryMixWidth_9_rdaddress = OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_ADDR;
    assign OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_RDATA = OnChipMemoryMixWidth_9_rdata;
    assign OnChipMemoryMixWidth_9_wdata = OnChipMemoryMixWidth_0_mem_write_to_ref_WDATA;
    assign OnChipMemoryMixWidth_9_wraddress = OnChipMemoryMixWidth_0_mem_write_to_ref_ADDR;
    assign OnChipMemoryMixWidth_9_wren = OnChipMemoryMixWidth_0_mem_write_to_ref_WREN;
    // fifo_0 assignments:
    assign fifo_0_aclr_n = ip_get_neg_core_0_arst_n_to_bus_1_arst_n;
    assign fifo_0_clk = ip_get_neg_core_0_clk_to_bus_CLK;
    assign fifo_0_d = fifo_0_data_in_to_conf_in_DAT;
    assign fifo_0_data_in_to_conf_in_RDY = fifo_0_d_rdy;
    assign fifo_0_d_vld = fifo_0_data_in_to_conf_in_VLD;
    assign fifo_0_data_out_to_ip_get_neg_core_0_conf_in_DAT = fifo_0_q;
    assign fifo_0_q_rdy = fifo_0_data_out_to_ip_get_neg_core_0_conf_in_RDY;
    assign fifo_0_data_out_to_ip_get_neg_core_0_conf_in_VLD = fifo_0_q_vld;
    // ip_get_neg_core_0 assignments:
    assign ip_get_neg_core_0_arst_n = ip_get_neg_core_0_arst_n_to_bus_1_arst_n;
    assign ip_get_neg_core_0_clk = ip_get_neg_core_0_clk_to_bus_CLK;
    assign ip_get_neg_core_0_conf_in_rsc_dat = fifo_0_data_out_to_ip_get_neg_core_0_conf_in_DAT;
    assign fifo_0_data_out_to_ip_get_neg_core_0_conf_in_RDY = ip_get_neg_core_0_conf_in_rsc_rdy;
    assign ip_get_neg_core_0_conf_in_rsc_vld = fifo_0_data_out_to_ip_get_neg_core_0_conf_in_VLD;
    assign ip_get_neg_core_0_hor_out_to_bus_3_DAT = ip_get_neg_core_0_hor_out_rsc_dat;
    assign ip_get_neg_core_0_hor_out_rsc_rdy = ip_get_neg_core_0_hor_out_to_bus_3_RDY;
    assign ip_get_neg_core_0_hor_out_to_bus_3_VLD = ip_get_neg_core_0_hor_out_rsc_vld;
    assign ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_ADDR = ip_get_neg_core_0_ref1_rsc_0_0_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_0_q = ip_get_neg_core_0_ref1_0_to_OnChipMemoryMixWidth_0_mem_read_RDATA;
    assign OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_ADDR = ip_get_neg_core_0_ref1_rsc_0_1_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_1_q = OnChipMemoryMixWidth_1_mem_read_to_ip_get_neg_core_0_ref1_1_RDATA;
    assign OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_ADDR = ip_get_neg_core_0_ref1_rsc_0_2_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_2_q = OnChipMemoryMixWidth_2_mem_read_to_ip_get_neg_core_0_ref1_2_RDATA;
    assign OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_ADDR = ip_get_neg_core_0_ref1_rsc_0_3_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_3_q = OnChipMemoryMixWidth_3_mem_read_to_ip_get_neg_core_0_ref1_3_RDATA;
    assign OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_ADDR = ip_get_neg_core_0_ref1_rsc_0_4_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_4_q = OnChipMemoryMixWidth_4_mem_read_to_ip_get_neg_core_0_ref1_4_RDATA;
    assign OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_ADDR = ip_get_neg_core_0_ref1_rsc_0_5_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_5_q = OnChipMemoryMixWidth_5_mem_read_to_ip_get_neg_core_0_ref1_5_RDATA;
    assign ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_ADDR = ip_get_neg_core_0_ref1_rsc_0_6_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_6_q = ip_get_neg_core_0_ref1_6_to_OnChipMemoryMixWidth_6_mem_read_RDATA;
    assign OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_ADDR = ip_get_neg_core_0_ref1_rsc_0_7_adr;
    assign ip_get_neg_core_0_ref1_rsc_0_7_q = OnChipMemoryMixWidth_7_mem_read_to_ip_get_neg_core_0_ref1_7_RDATA;
    assign ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_ADDR = ip_get_neg_core_0_ref2_rsc_0_0_adr;
    assign ip_get_neg_core_0_ref2_rsc_0_0_q = ip_get_neg_core_0_ref2_0_to_OnChipMemoryMixWidth_8_mem_read_RDATA;
    assign OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_ADDR = ip_get_neg_core_0_ref2_rsc_0_4_adr;
    assign ip_get_neg_core_0_ref2_rsc_0_4_q = OnChipMemoryMixWidth_9_mem_read_to_ip_get_neg_core_0_ref2_1_RDATA;
    assign ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_ADDR = ip_get_neg_core_0_ref2_rsc_0_5_adr;
    assign ip_get_neg_core_0_ref2_rsc_0_5_q = ip_get_neg_core_0_ref2_2_to_OnChipMemoryMixWidth_10_mem_read_RDATA;
    assign OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_ADDR = ip_get_neg_core_0_ref2_rsc_0_6_adr;
    assign ip_get_neg_core_0_ref2_rsc_0_6_q = OnChipMemoryMixWidth_11_mem_read_to_ip_get_neg_core_0_ref2_3_RDATA;
    assign ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_ADDR = ip_get_neg_core_0_ref2_rsc_0_7_adr;
    assign ip_get_neg_core_0_ref2_rsc_0_7_q = ip_get_neg_core_0_ref2_4_to_OnChipMemoryMixWidth_12_mem_read_RDATA;
    assign ip_get_neg_core_0_ver_out_to_bus_4_DAT = ip_get_neg_core_0_ver_out_rsc_dat;
    assign ip_get_neg_core_0_ver_out_rsc_rdy = ip_get_neg_core_0_ver_out_to_bus_4_RDY;
    assign ip_get_neg_core_0_ver_out_to_bus_4_VLD = ip_get_neg_core_0_ver_out_rsc_vld;

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
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
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
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

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_10(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_10_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_10_rdaddress),
        .rdata               (OnChipMemoryMixWidth_10_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_10_wdata),
        .wraddress           (OnChipMemoryMixWidth_10_wraddress),
        .wren                (OnChipMemoryMixWidth_10_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_11(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_11_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_11_rdaddress),
        .rdata               (OnChipMemoryMixWidth_11_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_11_wdata),
        .wraddress           (OnChipMemoryMixWidth_11_wraddress),
        .wren                (OnChipMemoryMixWidth_11_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_12(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_12_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_12_rdaddress),
        .rdata               (OnChipMemoryMixWidth_12_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_12_wdata),
        .wraddress           (OnChipMemoryMixWidth_12_wraddress),
        .wren                (OnChipMemoryMixWidth_12_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_2(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_2_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_2_rdaddress),
        .rdata               (OnChipMemoryMixWidth_2_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_2_wdata),
        .wraddress           (OnChipMemoryMixWidth_2_wraddress),
        .wren                (OnChipMemoryMixWidth_2_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_3(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_3_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_3_rdaddress),
        .rdata               (OnChipMemoryMixWidth_3_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_3_wdata),
        .wraddress           (OnChipMemoryMixWidth_3_wraddress),
        .wren                (OnChipMemoryMixWidth_3_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_4(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_4_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_4_rdaddress),
        .rdata               (OnChipMemoryMixWidth_4_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_4_wdata),
        .wraddress           (OnChipMemoryMixWidth_4_wraddress),
        .wren                (OnChipMemoryMixWidth_4_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_5(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_5_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_5_rdaddress),
        .rdata               (OnChipMemoryMixWidth_5_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_5_wdata),
        .wraddress           (OnChipMemoryMixWidth_5_wraddress),
        .wren                (OnChipMemoryMixWidth_5_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_6(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_6_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_6_rdaddress),
        .rdata               (OnChipMemoryMixWidth_6_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_6_wdata),
        .wraddress           (OnChipMemoryMixWidth_6_wraddress),
        .wren                (OnChipMemoryMixWidth_6_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_7(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_7_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_7_rdaddress),
        .rdata               (OnChipMemoryMixWidth_7_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_7_wdata),
        .wraddress           (OnChipMemoryMixWidth_7_wraddress),
        .wren                (OnChipMemoryMixWidth_7_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_8(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_8_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_8_rdaddress),
        .rdata               (OnChipMemoryMixWidth_8_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_8_wdata),
        .wraddress           (OnChipMemoryMixWidth_8_wraddress),
        .wren                (OnChipMemoryMixWidth_8_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryMixWidth:1.0
    OnChipMemoryMixWidth #(
        .width_w_g           (32),
        .width_r_g           (8),
        .addr_width_w_g      (6),
        .addr_width_r_g      (8))
    OnChipMemoryMixWidth_9(
        // Interface: clk
        .clock               (OnChipMemoryMixWidth_9_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemoryMixWidth_9_rdaddress),
        .rdata               (OnChipMemoryMixWidth_9_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemoryMixWidth_9_wdata),
        .wraddress           (OnChipMemoryMixWidth_9_wraddress),
        .wren                (OnChipMemoryMixWidth_9_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (22),
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

    // IP-XACT VLNV: tuni.fi:KvazaarPrediction:ip_get_neg_core:1.0
    main_ip_get_ang_neg_18_18 ip_get_neg_core_0(
        // Interface: arst_n
        .arst_n              (ip_get_neg_core_0_arst_n),
        // Interface: clk
        .clk                 (ip_get_neg_core_0_clk),
        // Interface: conf_in
        .conf_in_rsc_dat     (ip_get_neg_core_0_conf_in_rsc_dat),
        .conf_in_rsc_vld     (ip_get_neg_core_0_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (ip_get_neg_core_0_conf_in_rsc_rdy),
        // Interface: hor_out
        .hor_out_rsc_rdy     (ip_get_neg_core_0_hor_out_rsc_rdy),
        .hor_out_rsc_dat     (ip_get_neg_core_0_hor_out_rsc_dat),
        .hor_out_rsc_vld     (ip_get_neg_core_0_hor_out_rsc_vld),
        // Interface: ref1_0
        .ref1_rsc_0_0_q      (ip_get_neg_core_0_ref1_rsc_0_0_q),
        .ref1_rsc_0_0_adr    (ip_get_neg_core_0_ref1_rsc_0_0_adr),
        .ref1_rsc_0_0_d      (),
        .ref1_rsc_0_0_we     (),
        // Interface: ref1_1
        .ref1_rsc_0_1_q      (ip_get_neg_core_0_ref1_rsc_0_1_q),
        .ref1_rsc_0_1_adr    (ip_get_neg_core_0_ref1_rsc_0_1_adr),
        .ref1_rsc_0_1_d      (),
        .ref1_rsc_0_1_we     (),
        // Interface: ref1_2
        .ref1_rsc_0_2_q      (ip_get_neg_core_0_ref1_rsc_0_2_q),
        .ref1_rsc_0_2_adr    (ip_get_neg_core_0_ref1_rsc_0_2_adr),
        .ref1_rsc_0_2_d      (),
        .ref1_rsc_0_2_we     (),
        // Interface: ref1_3
        .ref1_rsc_0_3_q      (ip_get_neg_core_0_ref1_rsc_0_3_q),
        .ref1_rsc_0_3_adr    (ip_get_neg_core_0_ref1_rsc_0_3_adr),
        .ref1_rsc_0_3_d      (),
        .ref1_rsc_0_3_we     (),
        // Interface: ref1_4
        .ref1_rsc_0_4_q      (ip_get_neg_core_0_ref1_rsc_0_4_q),
        .ref1_rsc_0_4_adr    (ip_get_neg_core_0_ref1_rsc_0_4_adr),
        .ref1_rsc_0_4_d      (),
        .ref1_rsc_0_4_we     (),
        // Interface: ref1_5
        .ref1_rsc_0_5_q      (ip_get_neg_core_0_ref1_rsc_0_5_q),
        .ref1_rsc_0_5_adr    (ip_get_neg_core_0_ref1_rsc_0_5_adr),
        .ref1_rsc_0_5_d      (),
        .ref1_rsc_0_5_we     (),
        // Interface: ref1_6
        .ref1_rsc_0_6_q      (ip_get_neg_core_0_ref1_rsc_0_6_q),
        .ref1_rsc_0_6_adr    (ip_get_neg_core_0_ref1_rsc_0_6_adr),
        .ref1_rsc_0_6_d      (),
        .ref1_rsc_0_6_we     (),
        // Interface: ref1_7
        .ref1_rsc_0_7_q      (ip_get_neg_core_0_ref1_rsc_0_7_q),
        .ref1_rsc_0_7_adr    (ip_get_neg_core_0_ref1_rsc_0_7_adr),
        .ref1_rsc_0_7_d      (),
        .ref1_rsc_0_7_we     (),
        // Interface: ref2_0
        .ref2_rsc_0_0_q      (ip_get_neg_core_0_ref2_rsc_0_0_q),
        .ref2_rsc_0_0_adr    (ip_get_neg_core_0_ref2_rsc_0_0_adr),
        .ref2_rsc_0_0_d      (),
        .ref2_rsc_0_0_we     (),
        // Interface: ref2_1
        .ref2_rsc_0_4_q      (ip_get_neg_core_0_ref2_rsc_0_4_q),
        .ref2_rsc_0_4_adr    (ip_get_neg_core_0_ref2_rsc_0_4_adr),
        .ref2_rsc_0_4_d      (),
        .ref2_rsc_0_4_we     (),
        // Interface: ref2_2
        .ref2_rsc_0_5_q      (ip_get_neg_core_0_ref2_rsc_0_5_q),
        .ref2_rsc_0_5_adr    (ip_get_neg_core_0_ref2_rsc_0_5_adr),
        .ref2_rsc_0_5_d      (),
        .ref2_rsc_0_5_we     (),
        // Interface: ref2_3
        .ref2_rsc_0_6_q      (ip_get_neg_core_0_ref2_rsc_0_6_q),
        .ref2_rsc_0_6_adr    (ip_get_neg_core_0_ref2_rsc_0_6_adr),
        .ref2_rsc_0_6_d      (),
        .ref2_rsc_0_6_we     (),
        // Interface: ref2_4
        .ref2_rsc_0_7_q      (ip_get_neg_core_0_ref2_rsc_0_7_q),
        .ref2_rsc_0_7_adr    (ip_get_neg_core_0_ref2_rsc_0_7_adr),
        .ref2_rsc_0_7_d      (),
        .ref2_rsc_0_7_we     (),
        // Interface: ver_out
        .ver_out_rsc_rdy     (ip_get_neg_core_0_ver_out_rsc_rdy),
        .ver_out_rsc_dat     (ip_get_neg_core_0_ver_out_rsc_dat),
        .ver_out_rsc_vld     (ip_get_neg_core_0_ver_out_rsc_vld));


endmodule
