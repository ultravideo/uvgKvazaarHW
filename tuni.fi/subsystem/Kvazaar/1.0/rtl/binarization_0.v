
module binarization_0(
    // Interface: arst_n
    input                               arst_n,

    // Interface: cabac_write_out
    input                               cabac_write_out_rsc_rdy,
    output               [35:0]         cabac_write_out_rsc_dat,
    output                              cabac_write_out_rsc_vld,

    // Interface: clk
    input                               clk,

    // Interface: clk_binarization
    input                               clk_cabac_main,

    // Interface: coeff_rsc
    input                [63:0]         coeff_rsc_q,
    output               [14:0]         coeff_rsc_adr,
    output               [63:0]         coeff_rsc_d_1,
    output                              coeff_rsc_we_1,

    // Interface: conf_in_rsc
    input                [78:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: done_rsc
    input                               done_rsc_rdy,
    output                              done_rsc_dat,
    output                              done_rsc_vld
);

    // coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write wires:
    wire [6:0] coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_ADDR;
    wire [255:0] coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_RDATA;
    wire [255:0] coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_WDATA;
    wire       coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_WREN;
    // cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc wires:
    wire [6:0] cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_ADDR;
    wire [255:0] cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_RDATA;
    wire [255:0] cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_WDATA;
    wire       cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_WREN;
    // coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc
    // wires:
    wire [107:0] coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_DAT;
    wire       coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_RDY;
    wire       coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_VLD;
    // coeff_group_arranging_conf_in_rsc_to_bus_1 wires:
    wire [78:0] coeff_group_arranging_conf_in_rsc_to_bus_1_DAT;
    wire       coeff_group_arranging_conf_in_rsc_to_bus_1_RDY;
    wire       coeff_group_arranging_conf_in_rsc_to_bus_1_VLD;
    // coeff_group_arranging_coeff_rsc_to_bus wires:
    wire [14:0] coeff_group_arranging_coeff_rsc_to_bus_ADDR;
    wire [63:0] coeff_group_arranging_coeff_rsc_to_bus_RDATA;
    wire [63:0] coeff_group_arranging_coeff_rsc_to_bus_WDATA;
    wire       coeff_group_arranging_coeff_rsc_to_bus_WREN;
    // coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc
    // wires:
    wire [633:0] coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_DAT;
    wire       coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_RDY;
    wire       coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_VLD;
    // coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc
    // wires:
    wire [633:0] coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_DAT;
    wire       coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_RDY;
    wire       coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_VLD;
    // coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc wires:
    wire [35:0] coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_DAT;
    wire       coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_RDY;
    wire       coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_VLD;
    // coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in wires:
    wire [35:0] coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_DAT;
    wire       coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_RDY;
    wire       coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_VLD;
    // coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in wires:
    wire [35:0] coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_DAT;
    wire       coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_RDY;
    wire       coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_VLD;
    // fifo_0_data_out_to_arbiter_0_cabac_write2_rsc wires:
    wire [35:0] fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_DAT;
    wire       fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_RDY;
    wire       fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_VLD;
    // fifo_1_data_out_to_arbiter_0_cabac_write3_rsc wires:
    wire [35:0] fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_DAT;
    wire       fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_RDY;
    wire       fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_VLD;
    // arbiter_0_cabac_write_out_to_bus_1 wires:
    wire [35:0] arbiter_0_cabac_write_out_to_bus_1_DAT;
    wire       arbiter_0_cabac_write_out_to_bus_1_RDY;
    wire       arbiter_0_cabac_write_out_to_bus_1_VLD;
    // coeff_group_arranging_arst_n_to_arst_n wires:
    wire       coeff_group_arranging_arst_n_to_arst_n_arst_n;
    // arbiter_0_done_rsc_to_done_rsc wires:
    wire       arbiter_0_done_rsc_to_done_rsc_DAT;
    wire       arbiter_0_done_rsc_to_done_rsc_RDY;
    wire       arbiter_0_done_rsc_to_done_rsc_VLD;
    // arbiter_0_clk_base_to_clk wires:
    wire       arbiter_0_clk_base_to_clk_CLK;
    // coeff_group_arranging_clk_to_clk_binarization wires:
    wire       coeff_group_arranging_clk_to_clk_binarization_CLK;

    // arbiter_0 port wires:
    wire       arbiter_0_arst_n;
    wire [35:0] arbiter_0_cabac_write1_rsc_dat;
    wire       arbiter_0_cabac_write1_rsc_rdy;
    wire       arbiter_0_cabac_write1_rsc_vld;
    wire [35:0] arbiter_0_cabac_write2_rsc_dat;
    wire       arbiter_0_cabac_write2_rsc_rdy;
    wire       arbiter_0_cabac_write2_rsc_vld;
    wire [35:0] arbiter_0_cabac_write3_rsc_dat;
    wire       arbiter_0_cabac_write3_rsc_rdy;
    wire       arbiter_0_cabac_write3_rsc_vld;
    wire [35:0] arbiter_0_cabac_write_out_rsc_dat;
    wire       arbiter_0_cabac_write_out_rsc_rdy;
    wire       arbiter_0_cabac_write_out_rsc_vld;
    wire       arbiter_0_clk;
    wire       arbiter_0_clk_base;
    wire       arbiter_0_clk_base_arst_n;
    wire       arbiter_0_done_rsc_dat;
    wire       arbiter_0_done_rsc_rdy;
    wire       arbiter_0_done_rsc_vld;
    // cabac_main_coeff_s port wires:
    wire       cabac_main_coeff_s_clock;
    wire [6:0] cabac_main_coeff_s_rdaddress;
    wire [255:0] cabac_main_coeff_s_rdata;
    wire [255:0] cabac_main_coeff_s_wdata;
    wire [6:0] cabac_main_coeff_s_wraddress;
    wire       cabac_main_coeff_s_wren;
    // coeff_binarization_0 port wires:
    wire       coeff_binarization_0_arst_n;
    wire [35:0] coeff_binarization_0_cabac_write_rsc_dat;
    wire       coeff_binarization_0_cabac_write_rsc_rdy;
    wire       coeff_binarization_0_cabac_write_rsc_vld;
    wire       coeff_binarization_0_clk;
    wire [633:0] coeff_binarization_0_coeff_data_rsc_dat;
    wire       coeff_binarization_0_coeff_data_rsc_rdy;
    wire       coeff_binarization_0_coeff_data_rsc_vld;
    // coeff_binarization_1 port wires:
    wire       coeff_binarization_1_arst_n;
    wire [35:0] coeff_binarization_1_cabac_write_rsc_dat;
    wire       coeff_binarization_1_cabac_write_rsc_rdy;
    wire       coeff_binarization_1_cabac_write_rsc_vld;
    wire       coeff_binarization_1_clk;
    wire [633:0] coeff_binarization_1_coeff_data_rsc_dat;
    wire       coeff_binarization_1_coeff_data_rsc_rdy;
    wire       coeff_binarization_1_coeff_data_rsc_vld;
    // coeff_group_arranging port wires:
    wire       coeff_group_arranging_arst_n;
    wire       coeff_group_arranging_clk;
    wire [14:0] coeff_group_arranging_coeff_rsc_adr;
    wire [63:0] coeff_group_arranging_coeff_rsc_d;
    wire [63:0] coeff_group_arranging_coeff_rsc_q;
    wire       coeff_group_arranging_coeff_rsc_we;
    wire [6:0] coeff_group_arranging_coeff_s_rsc_adr;
    wire [255:0] coeff_group_arranging_coeff_s_rsc_d;
    wire       coeff_group_arranging_coeff_s_rsc_we;
    wire [78:0] coeff_group_arranging_conf_in_rsc_dat;
    wire       coeff_group_arranging_conf_in_rsc_rdy;
    wire       coeff_group_arranging_conf_in_rsc_vld;
    wire [107:0] coeff_group_arranging_encode_coeff_config_rsc_dat;
    wire       coeff_group_arranging_encode_coeff_config_rsc_rdy;
    wire       coeff_group_arranging_encode_coeff_config_rsc_vld;
    // coeff_group_scanning_0 port wires:
    wire       coeff_group_scanning_0_arst_n;
    wire [35:0] coeff_group_scanning_0_cabac_write_rsc_dat;
    wire       coeff_group_scanning_0_cabac_write_rsc_rdy;
    wire       coeff_group_scanning_0_cabac_write_rsc_vld;
    wire       coeff_group_scanning_0_clk;
    wire [633:0] coeff_group_scanning_0_coeff_data2_rsc_dat;
    wire       coeff_group_scanning_0_coeff_data2_rsc_rdy;
    wire       coeff_group_scanning_0_coeff_data2_rsc_vld;
    wire [633:0] coeff_group_scanning_0_coeff_data_rsc_dat;
    wire       coeff_group_scanning_0_coeff_data_rsc_rdy;
    wire       coeff_group_scanning_0_coeff_data_rsc_vld;
    wire [6:0] coeff_group_scanning_0_coeff_s_rsc_adr;
    wire [255:0] coeff_group_scanning_0_coeff_s_rsc_q;
    wire [107:0] coeff_group_scanning_0_encode_coeff_config_in_rsc_dat;
    wire       coeff_group_scanning_0_encode_coeff_config_in_rsc_rdy;
    wire       coeff_group_scanning_0_encode_coeff_config_in_rsc_vld;
    // fifo_0 port wires:
    wire       fifo_0_aclr_n;
    wire       fifo_0_clk;
    wire [35:0] fifo_0_d;
    wire       fifo_0_d_rdy;
    wire       fifo_0_d_vld;
    wire [35:0] fifo_0_q;
    wire       fifo_0_q_rdy;
    wire       fifo_0_q_vld;
    // fifo_1 port wires:
    wire       fifo_1_aclr_n;
    wire       fifo_1_clk;
    wire [35:0] fifo_1_d;
    wire       fifo_1_d_rdy;
    wire       fifo_1_d_vld;
    wire [35:0] fifo_1_q;
    wire       fifo_1_q_rdy;
    wire       fifo_1_q_vld;

    // Assignments for the ports of the encompassing component:
    assign coeff_group_arranging_arst_n_to_arst_n_arst_n = arst_n;
    assign cabac_write_out_rsc_dat = arbiter_0_cabac_write_out_to_bus_1_DAT;
    assign arbiter_0_cabac_write_out_to_bus_1_RDY = cabac_write_out_rsc_rdy;
    assign cabac_write_out_rsc_vld = arbiter_0_cabac_write_out_to_bus_1_VLD;
    assign arbiter_0_clk_base_to_clk_CLK = clk;
    assign coeff_group_arranging_clk_to_clk_binarization_CLK = clk_cabac_main;
    assign coeff_rsc_adr = coeff_group_arranging_coeff_rsc_to_bus_ADDR;
    assign coeff_rsc_d_1 = coeff_group_arranging_coeff_rsc_to_bus_WDATA;
    assign coeff_group_arranging_coeff_rsc_to_bus_RDATA = coeff_rsc_q;
    assign coeff_rsc_we_1 = coeff_group_arranging_coeff_rsc_to_bus_WREN;
    assign coeff_group_arranging_conf_in_rsc_to_bus_1_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = coeff_group_arranging_conf_in_rsc_to_bus_1_RDY;
    assign coeff_group_arranging_conf_in_rsc_to_bus_1_VLD = conf_in_rsc_vld;
    assign done_rsc_dat = arbiter_0_done_rsc_to_done_rsc_DAT;
    assign arbiter_0_done_rsc_to_done_rsc_RDY = done_rsc_rdy;
    assign done_rsc_vld = arbiter_0_done_rsc_to_done_rsc_VLD;

    // arbiter_0 assignments:
    assign arbiter_0_arst_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign arbiter_0_cabac_write1_rsc_dat = coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_DAT;
    assign coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_RDY = arbiter_0_cabac_write1_rsc_rdy;
    assign arbiter_0_cabac_write1_rsc_vld = coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_VLD;
    assign arbiter_0_cabac_write2_rsc_dat = fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_DAT;
    assign fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_RDY = arbiter_0_cabac_write2_rsc_rdy;
    assign arbiter_0_cabac_write2_rsc_vld = fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_VLD;
    assign arbiter_0_cabac_write3_rsc_dat = fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_DAT;
    assign fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_RDY = arbiter_0_cabac_write3_rsc_rdy;
    assign arbiter_0_cabac_write3_rsc_vld = fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_VLD;
    assign arbiter_0_cabac_write_out_to_bus_1_DAT = arbiter_0_cabac_write_out_rsc_dat;
    assign arbiter_0_cabac_write_out_rsc_rdy = arbiter_0_cabac_write_out_to_bus_1_RDY;
    assign arbiter_0_cabac_write_out_to_bus_1_VLD = arbiter_0_cabac_write_out_rsc_vld;
    assign arbiter_0_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign arbiter_0_clk_base = arbiter_0_clk_base_to_clk_CLK;
    assign arbiter_0_clk_base_arst_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign arbiter_0_done_rsc_to_done_rsc_DAT = arbiter_0_done_rsc_dat;
    assign arbiter_0_done_rsc_rdy = arbiter_0_done_rsc_to_done_rsc_RDY;
    assign arbiter_0_done_rsc_to_done_rsc_VLD = arbiter_0_done_rsc_vld;
    // cabac_main_coeff_s assignments:
    assign cabac_main_coeff_s_clock = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign cabac_main_coeff_s_rdaddress = cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_ADDR;
    assign cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_RDATA = cabac_main_coeff_s_rdata;
    assign cabac_main_coeff_s_wdata = coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_WDATA;
    assign cabac_main_coeff_s_wraddress = coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_ADDR;
    assign cabac_main_coeff_s_wren = coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_WREN;
    // coeff_binarization_0 assignments:
    assign coeff_binarization_0_arst_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_DAT = coeff_binarization_0_cabac_write_rsc_dat;
    assign coeff_binarization_0_cabac_write_rsc_rdy = coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_RDY;
    assign coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_VLD = coeff_binarization_0_cabac_write_rsc_vld;
    assign coeff_binarization_0_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign coeff_binarization_0_coeff_data_rsc_dat = coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_DAT;
    assign coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_RDY = coeff_binarization_0_coeff_data_rsc_rdy;
    assign coeff_binarization_0_coeff_data_rsc_vld = coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_VLD;
    // coeff_binarization_1 assignments:
    assign coeff_binarization_1_arst_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_DAT = coeff_binarization_1_cabac_write_rsc_dat;
    assign coeff_binarization_1_cabac_write_rsc_rdy = coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_RDY;
    assign coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_VLD = coeff_binarization_1_cabac_write_rsc_vld;
    assign coeff_binarization_1_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign coeff_binarization_1_coeff_data_rsc_dat = coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_DAT;
    assign coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_RDY = coeff_binarization_1_coeff_data_rsc_rdy;
    assign coeff_binarization_1_coeff_data_rsc_vld = coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_VLD;
    // coeff_group_arranging assignments:
    assign coeff_group_arranging_arst_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign coeff_group_arranging_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign coeff_group_arranging_coeff_rsc_to_bus_ADDR = coeff_group_arranging_coeff_rsc_adr;
    assign coeff_group_arranging_coeff_rsc_to_bus_WDATA = coeff_group_arranging_coeff_rsc_d;
    assign coeff_group_arranging_coeff_rsc_q = coeff_group_arranging_coeff_rsc_to_bus_RDATA;
    assign coeff_group_arranging_coeff_rsc_to_bus_WREN = coeff_group_arranging_coeff_rsc_we;
    assign coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_ADDR = coeff_group_arranging_coeff_s_rsc_adr;
    assign coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_WDATA = coeff_group_arranging_coeff_s_rsc_d;
    assign coeff_group_arranging_coeff_s_rsc_to_cabac_main_coeff_s_mem_write_WREN = coeff_group_arranging_coeff_s_rsc_we;
    assign coeff_group_arranging_conf_in_rsc_dat = coeff_group_arranging_conf_in_rsc_to_bus_1_DAT;
    assign coeff_group_arranging_conf_in_rsc_to_bus_1_RDY = coeff_group_arranging_conf_in_rsc_rdy;
    assign coeff_group_arranging_conf_in_rsc_vld = coeff_group_arranging_conf_in_rsc_to_bus_1_VLD;
    assign coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_DAT = coeff_group_arranging_encode_coeff_config_rsc_dat;
    assign coeff_group_arranging_encode_coeff_config_rsc_rdy = coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_RDY;
    assign coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_VLD = coeff_group_arranging_encode_coeff_config_rsc_vld;
    // coeff_group_scanning_0 assignments:
    assign coeff_group_scanning_0_arst_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_DAT = coeff_group_scanning_0_cabac_write_rsc_dat;
    assign coeff_group_scanning_0_cabac_write_rsc_rdy = coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_RDY;
    assign coeff_group_scanning_0_cabac_write_rsc_to_arbiter_0_cabac_write1_rsc_VLD = coeff_group_scanning_0_cabac_write_rsc_vld;
    assign coeff_group_scanning_0_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_DAT = coeff_group_scanning_0_coeff_data2_rsc_dat;
    assign coeff_group_scanning_0_coeff_data2_rsc_rdy = coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_RDY;
    assign coeff_group_scanning_0_coeff_data2_rsc_to_coeff_binarization_1_coeff_data_rsc_VLD = coeff_group_scanning_0_coeff_data2_rsc_vld;
    assign coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_DAT = coeff_group_scanning_0_coeff_data_rsc_dat;
    assign coeff_group_scanning_0_coeff_data_rsc_rdy = coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_RDY;
    assign coeff_group_scanning_0_coeff_data_rsc_to_coeff_binarization_0_coeff_data_rsc_VLD = coeff_group_scanning_0_coeff_data_rsc_vld;
    assign cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_ADDR = coeff_group_scanning_0_coeff_s_rsc_adr;
    assign coeff_group_scanning_0_coeff_s_rsc_q = cabac_main_coeff_s_mem_read_to_coeff_group_scanning_0_coeff_s_rsc_RDATA;
    assign coeff_group_scanning_0_encode_coeff_config_in_rsc_dat = coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_DAT;
    assign coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_RDY = coeff_group_scanning_0_encode_coeff_config_in_rsc_rdy;
    assign coeff_group_scanning_0_encode_coeff_config_in_rsc_vld = coeff_group_arranging_encode_coeff_config_rsc_to_coeff_group_scanning_0_encode_coeff_config_in_rsc_VLD;
    // fifo_0 assignments:
    assign fifo_0_aclr_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign fifo_0_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign fifo_0_d = coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_DAT;
    assign coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_RDY = fifo_0_d_rdy;
    assign fifo_0_d_vld = coeff_binarization_0_coeff_write_rsc_to_fifo_0_data_in_VLD;
    assign fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_DAT = fifo_0_q;
    assign fifo_0_q_rdy = fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_RDY;
    assign fifo_0_data_out_to_arbiter_0_cabac_write2_rsc_VLD = fifo_0_q_vld;
    // fifo_1 assignments:
    assign fifo_1_aclr_n = coeff_group_arranging_arst_n_to_arst_n_arst_n;
    assign fifo_1_clk = coeff_group_arranging_clk_to_clk_binarization_CLK;
    assign fifo_1_d = coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_DAT;
    assign coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_RDY = fifo_1_d_rdy;
    assign fifo_1_d_vld = coeff_binarization_1_coeff_write_rsc_to_fifo_1_data_in_VLD;
    assign fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_DAT = fifo_1_q;
    assign fifo_1_q_rdy = fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_RDY;
    assign fifo_1_data_out_to_arbiter_0_cabac_write3_rsc_VLD = fifo_1_q_vld;

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:arbiter:1.0
    arbiter arbiter_0(
        // Interface: arst_n
        .arst_n              (arbiter_0_arst_n),
        // Interface: cabac_write1_rsc
        .cabac_write1_rsc_dat(arbiter_0_cabac_write1_rsc_dat),
        .cabac_write1_rsc_vld(arbiter_0_cabac_write1_rsc_vld),
        .cabac_write1_rsc_rdy(arbiter_0_cabac_write1_rsc_rdy),
        // Interface: cabac_write2_rsc
        .cabac_write2_rsc_dat(arbiter_0_cabac_write2_rsc_dat),
        .cabac_write2_rsc_vld(arbiter_0_cabac_write2_rsc_vld),
        .cabac_write2_rsc_rdy(arbiter_0_cabac_write2_rsc_rdy),
        // Interface: cabac_write3_rsc
        .cabac_write3_rsc_dat(arbiter_0_cabac_write3_rsc_dat),
        .cabac_write3_rsc_vld(arbiter_0_cabac_write3_rsc_vld),
        .cabac_write3_rsc_rdy(arbiter_0_cabac_write3_rsc_rdy),
        // Interface: cabac_write_out
        .cabac_write_out_rsc_rdy(arbiter_0_cabac_write_out_rsc_rdy),
        .cabac_write_out_rsc_dat(arbiter_0_cabac_write_out_rsc_dat),
        .cabac_write_out_rsc_vld(arbiter_0_cabac_write_out_rsc_vld),
        // Interface: clk
        .clk                 (arbiter_0_clk),
        // Interface: clk_base
        .clk_base            (arbiter_0_clk_base),
        // Interface: clk_base_asrt_n
        .clk_base_arst_n     (arbiter_0_clk_base_arst_n),
        // Interface: done_rsc
        .done_rsc_rdy        (arbiter_0_done_rsc_rdy),
        .done_rsc_dat        (arbiter_0_done_rsc_dat),
        .done_rsc_vld        (arbiter_0_done_rsc_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (256),
        .addr_width_g        (7))
    cabac_main_coeff_s(
        // Interface: clk
        .clock               (cabac_main_coeff_s_clock),
        // Interface: mem_read
        .rdaddress           (cabac_main_coeff_s_rdaddress),
        .rdata               (cabac_main_coeff_s_rdata),
        // Interface: mem_write
        .wdata               (cabac_main_coeff_s_wdata),
        .wraddress           (cabac_main_coeff_s_wraddress),
        .wren                (cabac_main_coeff_s_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:coeff_binarization:1.0
    coeff_binarization coeff_binarization_0(
        // Interface: arst_n
        .arst_n              (coeff_binarization_0_arst_n),
        // Interface: clk
        .clk                 (coeff_binarization_0_clk),
        // Interface: coeff_data_rsc
        .coeff_data_rsc_dat  (coeff_binarization_0_coeff_data_rsc_dat),
        .coeff_data_rsc_vld  (coeff_binarization_0_coeff_data_rsc_vld),
        .coeff_data_rsc_rdy  (coeff_binarization_0_coeff_data_rsc_rdy),
        // Interface: coeff_write_rsc
        .cabac_write_rsc_rdy (coeff_binarization_0_cabac_write_rsc_rdy),
        .cabac_write_rsc_dat (coeff_binarization_0_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (coeff_binarization_0_cabac_write_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:coeff_binarization:1.0
    coeff_binarization coeff_binarization_1(
        // Interface: arst_n
        .arst_n              (coeff_binarization_1_arst_n),
        // Interface: clk
        .clk                 (coeff_binarization_1_clk),
        // Interface: coeff_data_rsc
        .coeff_data_rsc_dat  (coeff_binarization_1_coeff_data_rsc_dat),
        .coeff_data_rsc_vld  (coeff_binarization_1_coeff_data_rsc_vld),
        .coeff_data_rsc_rdy  (coeff_binarization_1_coeff_data_rsc_rdy),
        // Interface: coeff_write_rsc
        .cabac_write_rsc_rdy (coeff_binarization_1_cabac_write_rsc_rdy),
        .cabac_write_rsc_dat (coeff_binarization_1_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (coeff_binarization_1_cabac_write_rsc_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:coeff_group_arranging:1.0
    coeff_group_arranging     coeff_group_arranging(
        // Interface: arst_n
        .arst_n              (coeff_group_arranging_arst_n),
        // Interface: clk
        .clk                 (coeff_group_arranging_clk),
        // Interface: coeff_rsc
        .coeff_rsc_q         (coeff_group_arranging_coeff_rsc_q),
        .coeff_rsc_adr       (coeff_group_arranging_coeff_rsc_adr),
        .coeff_rsc_d         (coeff_group_arranging_coeff_rsc_d),
        .coeff_rsc_we        (coeff_group_arranging_coeff_rsc_we),
        // Interface: coeff_s_rsc
        .coeff_s_rsc_q       (),
        .coeff_s_rsc_adr     (coeff_group_arranging_coeff_s_rsc_adr),
        .coeff_s_rsc_d       (coeff_group_arranging_coeff_s_rsc_d),
        .coeff_s_rsc_we      (coeff_group_arranging_coeff_s_rsc_we),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (coeff_group_arranging_conf_in_rsc_dat),
        .conf_in_rsc_vld     (coeff_group_arranging_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (coeff_group_arranging_conf_in_rsc_rdy),
        // Interface: encode_coeff_config_rsc
        .encode_coeff_config_rsc_rdy(coeff_group_arranging_encode_coeff_config_rsc_rdy),
        .encode_coeff_config_rsc_dat(coeff_group_arranging_encode_coeff_config_rsc_dat),
        .encode_coeff_config_rsc_vld(coeff_group_arranging_encode_coeff_config_rsc_vld),
        // These ports are not in any interface
        .coeff_s_rsc_req_vz  (1),
        .coeff_s_rsc_rls_lz  ());

    // IP-XACT VLNV: tuni.fi:KvazaarCabac:coeff_group_scanning:1.0
    coeff_group_scanning coeff_group_scanning_0(
        // Interface: arst_n
        .arst_n              (coeff_group_scanning_0_arst_n),
        // Interface: cabac_write_rsc
        .cabac_write_rsc_rdy (coeff_group_scanning_0_cabac_write_rsc_rdy),
        .cabac_write_rsc_dat (coeff_group_scanning_0_cabac_write_rsc_dat),
        .cabac_write_rsc_vld (coeff_group_scanning_0_cabac_write_rsc_vld),
        // Interface: clk
        .clk                 (coeff_group_scanning_0_clk),
        // Interface: coeff_data2_rsc
        .coeff_data2_rsc_rdy (coeff_group_scanning_0_coeff_data2_rsc_rdy),
        .coeff_data2_rsc_dat (coeff_group_scanning_0_coeff_data2_rsc_dat),
        .coeff_data2_rsc_vld (coeff_group_scanning_0_coeff_data2_rsc_vld),
        // Interface: coeff_data_rsc
        .coeff_data_rsc_rdy  (coeff_group_scanning_0_coeff_data_rsc_rdy),
        .coeff_data_rsc_dat  (coeff_group_scanning_0_coeff_data_rsc_dat),
        .coeff_data_rsc_vld  (coeff_group_scanning_0_coeff_data_rsc_vld),
        // Interface: coeff_s_rsc
        .coeff_s_rsc_q       (coeff_group_scanning_0_coeff_s_rsc_q),
        .coeff_s_rsc_adr     (coeff_group_scanning_0_coeff_s_rsc_adr),
        .coeff_s_rsc_d       (),
        .coeff_s_rsc_we      (),
        // Interface: encode_coeff_config_in_rsc
        .encode_coeff_config_in_rsc_dat(coeff_group_scanning_0_encode_coeff_config_in_rsc_dat),
        .encode_coeff_config_in_rsc_vld(coeff_group_scanning_0_encode_coeff_config_in_rsc_vld),
        .encode_coeff_config_in_rsc_rdy(coeff_group_scanning_0_encode_coeff_config_in_rsc_rdy),
        // These ports are not in any interface
        .coeff_s_rsc_req_vz  (1),
        .coeff_s_rsc_rls_lz  ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (36),
        .size_g              (16),
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

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (36),
        .size_g              (16),
        .use_memory_g        ("OFF"))
    fifo_1(
        // Interface: aclr_n
        .aclr_n              (fifo_1_aclr_n),
        // Interface: clk
        .clk                 (fifo_1_clk),
        // Interface: data_in
        .d                   (fifo_1_d),
        .d_vld               (fifo_1_d_vld),
        .d_rdy               (fifo_1_d_rdy),
        // Interface: data_out
        .q_rdy               (fifo_1_q_rdy),
        .q                   (fifo_1_q),
        .q_vld               (fifo_1_q_vld));


endmodule
