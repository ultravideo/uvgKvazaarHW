
module rec_coeff_buffer_0 #(
    parameter                              width_g          = 32
) (
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: coeff_in_rsc
    input                [511:0]        coeff_in_rsc_dat,
    input                               coeff_in_rsc_vld,
    output                              coeff_in_rsc_rdy,

    // Interface: conf_in_rsc
    input                [22:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: conf_out_rsc
    input                               conf_out_rsc_rdy,
    output               [191:0]        conf_out_rsc_dat,
    output                              conf_out_rsc_vld,

    // Interface: inst_done_rsc
    input                               inst_done_rsc_rdy,
    output               [4:0]          inst_done_rsc_dat,
    output                              inst_done_rsc_vld,

    // Interface: lcu_coeff_rsc
    input                [513:0]        lcu_coeff_rsc_q,
    output               [11:0]         lcu_coeff_rsc_adr,
    output               [513:0]        lcu_coeff_rsc_d,
    output                              lcu_coeff_rsc_we,

    // Interface: lcu_rec_left_rsc
    input                [31:0]         lcu_rec_left_rsc_q,
    output               [8:0]          lcu_rec_left_rsc_adr,
    output               [31:0]         lcu_rec_left_rsc_d,
    output                              lcu_rec_left_rsc_we,

    // Interface: lcu_rec_rsc
    input                [287:0]        lcu_rec_rsc_q,
    output               [11:0]         lcu_rec_rsc_adr,
    output               [287:0]        lcu_rec_rsc_d,
    output                              lcu_rec_rsc_we,

    // Interface: lcu_rec_top_left_rsc
    input                [7:0]          lcu_rec_top_left_rsc_q,
    output               [12:0]         lcu_rec_top_left_rsc_adr,
    output               [7:0]          lcu_rec_top_left_rsc_d,
    output                              lcu_rec_top_left_rsc_we,

    // Interface: lcu_rec_top_rsc
    input                [31:0]         lcu_rec_top_rsc_q_1,
    output               [8:0]          lcu_rec_top_rsc_adr,
    output               [31:0]         lcu_rec_top_rsc_d,
    output                              lcu_rec_top_rsc_we,

    // Interface: rec_in_rsc
    input                [255:0]        rec_in_rsc_dat,
    input                               rec_in_rsc_vld,
    output                              rec_in_rsc_rdy,

    // These ports are not in any interface
    input                [31:0]         lcu_rec_top_rsc_q
);

    // buffer_push_rec_out_rsc_to_RecMem_mem_write wires:
    wire [10:0] buffer_push_rec_out_rsc_to_RecMem_mem_write_ADDR;
    wire [255:0] buffer_push_rec_out_rsc_to_RecMem_mem_write_RDATA;
    wire [255:0] buffer_push_rec_out_rsc_to_RecMem_mem_write_WDATA;
    wire       buffer_push_rec_out_rsc_to_RecMem_mem_write_WREN;
    // buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write wires:
    wire [8:0] buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_ADDR;
    wire [31:0] buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_RDATA;
    wire [31:0] buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_WDATA;
    wire       buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_WREN;
    // buffer_push_borders_top_rsc_to_TopBorderMem_mem_write wires:
    wire [8:0] buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_ADDR;
    wire [31:0] buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_RDATA;
    wire [31:0] buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_WDATA;
    wire       buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_WREN;
    // buffer_push_coeff_out_rsc_to_CoeffMem_mem_write wires:
    wire [10:0] buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_ADDR;
    wire [511:0] buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_RDATA;
    wire [511:0] buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_WDATA;
    wire       buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_WREN;
    // buffer_pull_rec_in_rsc_to_RecMem_mem_read wires:
    wire [10:0] buffer_pull_rec_in_rsc_to_RecMem_mem_read_ADDR;
    wire [255:0] buffer_pull_rec_in_rsc_to_RecMem_mem_read_RDATA;
    wire [255:0] buffer_pull_rec_in_rsc_to_RecMem_mem_read_WDATA;
    wire       buffer_pull_rec_in_rsc_to_RecMem_mem_read_WREN;
    // buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read wires:
    wire [10:0] buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_ADDR;
    wire [511:0] buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_RDATA;
    wire [511:0] buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_WDATA;
    wire       buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_WREN;
    // buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read wires:
    wire [8:0] buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_ADDR;
    wire [31:0] buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_RDATA;
    wire [31:0] buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_WDATA;
    wire       buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_WREN;
    // buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read wires:
    wire [8:0] buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_ADDR;
    wire [31:0] buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_RDATA;
    wire [31:0] buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_WDATA;
    wire       buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_WREN;
    // buffer_pull_inst_done_rsc_to_bus wires:
    wire [4:0] buffer_pull_inst_done_rsc_to_bus_DAT;
    wire       buffer_pull_inst_done_rsc_to_bus_RDY;
    wire       buffer_pull_inst_done_rsc_to_bus_VLD;
    // buffer_pull_clk_to_bus wires:
    wire       buffer_pull_clk_to_bus_CLK;
    // buffer_pull_arst_n_to_bus wires:
    wire       buffer_pull_arst_n_to_bus_arst_n;
    // buffer_push_rec_in_rsc_to_bus_5 wires:
    wire [255:0] buffer_push_rec_in_rsc_to_bus_5_DAT;
    wire       buffer_push_rec_in_rsc_to_bus_5_RDY;
    wire       buffer_push_rec_in_rsc_to_bus_5_VLD;
    // buffer_push_conf_out_rsc_to_bus_4 wires:
    wire [191:0] buffer_push_conf_out_rsc_to_bus_4_DAT;
    wire       buffer_push_conf_out_rsc_to_bus_4_RDY;
    wire       buffer_push_conf_out_rsc_to_bus_4_VLD;
    // buffer_push_coeff_in_rsc_to_bus_3 wires:
    wire [511:0] buffer_push_coeff_in_rsc_to_bus_3_DAT;
    wire       buffer_push_coeff_in_rsc_to_bus_3_RDY;
    wire       buffer_push_coeff_in_rsc_to_bus_3_VLD;
    // buffer_pull_conf_in_rsc_to_bus wires:
    wire [22:0] buffer_pull_conf_in_rsc_to_bus_DAT;
    wire       buffer_pull_conf_in_rsc_to_bus_RDY;
    wire       buffer_pull_conf_in_rsc_to_bus_VLD;
    // buffer_pull_lcu_rec_top_left_rsc_to_bus_1 wires:
    wire [12:0] buffer_pull_lcu_rec_top_left_rsc_to_bus_1_ADDR;
    wire [7:0] buffer_pull_lcu_rec_top_left_rsc_to_bus_1_RDATA;
    wire [7:0] buffer_pull_lcu_rec_top_left_rsc_to_bus_1_WDATA;
    wire       buffer_pull_lcu_rec_top_left_rsc_to_bus_1_WREN;
    // buffer_pull_lcu_rec_left_rsc_to_bus wires:
    wire [8:0] buffer_pull_lcu_rec_left_rsc_to_bus_ADDR;
    wire [31:0] buffer_pull_lcu_rec_left_rsc_to_bus_RDATA;
    wire [31:0] buffer_pull_lcu_rec_left_rsc_to_bus_WDATA;
    wire       buffer_pull_lcu_rec_left_rsc_to_bus_WREN;
    // buffer_pull_lcu_rec_top_rsc_to_bus wires:
    wire [8:0] buffer_pull_lcu_rec_top_rsc_to_bus_ADDR;
    wire [31:0] buffer_pull_lcu_rec_top_rsc_to_bus_RDATA;
    wire [31:0] buffer_pull_lcu_rec_top_rsc_to_bus_WDATA;
    wire       buffer_pull_lcu_rec_top_rsc_to_bus_WREN;
    // buffer_pull_lcu_rec_rsc_to_bus_1 wires:
    wire [11:0] buffer_pull_lcu_rec_rsc_to_bus_1_ADDR;
    wire [31:0] buffer_pull_lcu_rec_rsc_to_bus_1_BYTEEN;
    wire [287:0] buffer_pull_lcu_rec_rsc_to_bus_1_RDATA;
    wire [255:0] buffer_pull_lcu_rec_rsc_to_bus_1_WDATA;
    wire       buffer_pull_lcu_rec_rsc_to_bus_1_WREN;
    // buffer_pull_lcu_coeff_rsc_to_bus wires:
    wire [11:0] buffer_pull_lcu_coeff_rsc_to_bus_ADDR;
    wire [63:0] buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN;
    wire [513:0] buffer_pull_lcu_coeff_rsc_to_bus_RDATA;
    wire [511:0] buffer_pull_lcu_coeff_rsc_to_bus_WDATA;
    wire       buffer_pull_lcu_coeff_rsc_to_bus_WREN;

    // CoeffMem port wires:
    wire       CoeffMem_clock;
    wire [10:0] CoeffMem_rdaddress;
    wire [511:0] CoeffMem_rdata;
    wire [511:0] CoeffMem_wdata;
    wire [10:0] CoeffMem_wraddress;
    wire       CoeffMem_wren;
    // LeftBorderMem port wires:
    wire       LeftBorderMem_clock;
    wire [8:0] LeftBorderMem_rdaddress;
    wire [31:0] LeftBorderMem_rdata;
    wire [31:0] LeftBorderMem_wdata;
    wire [8:0] LeftBorderMem_wraddress;
    wire       LeftBorderMem_wren;
    // RecMem port wires:
    wire       RecMem_clock;
    wire [10:0] RecMem_rdaddress;
    wire [255:0] RecMem_rdata;
    wire [255:0] RecMem_wdata;
    wire [10:0] RecMem_wraddress;
    wire       RecMem_wren;
    // TopBorderMem port wires:
    wire       TopBorderMem_clock;
    wire [8:0] TopBorderMem_rdaddress;
    wire [31:0] TopBorderMem_rdata;
    wire [31:0] TopBorderMem_wdata;
    wire [8:0] TopBorderMem_wraddress;
    wire       TopBorderMem_wren;
    // buffer_pull port wires:
    wire       buffer_pull_arst_n;
    wire [8:0] buffer_pull_borders_left_rsc_adr;
    wire [31:0] buffer_pull_borders_left_rsc_q;
    wire [8:0] buffer_pull_borders_top_rsc_adr;
    wire [31:0] buffer_pull_borders_top_rsc_q;
    wire       buffer_pull_clk;
    wire [10:0] buffer_pull_coeff_in_rsc_adr;
    wire [511:0] buffer_pull_coeff_in_rsc_q;
    wire [22:0] buffer_pull_conf_in_rsc_dat;
    wire       buffer_pull_conf_in_rsc_rdy;
    wire       buffer_pull_conf_in_rsc_vld;
    wire [4:0] buffer_pull_inst_done_rsc_dat;
    wire       buffer_pull_inst_done_rsc_rdy;
    wire       buffer_pull_inst_done_rsc_vld;
    wire [11:0] buffer_pull_lcu_coeff_rsc_adr;
    wire [513:0] buffer_pull_lcu_coeff_rsc_d;
    wire [513:0] buffer_pull_lcu_coeff_rsc_q;
    wire       buffer_pull_lcu_coeff_rsc_we;
    wire [8:0] buffer_pull_lcu_rec_left_rsc_adr;
    wire [31:0] buffer_pull_lcu_rec_left_rsc_d;
    wire [31:0] buffer_pull_lcu_rec_left_rsc_q;
    wire       buffer_pull_lcu_rec_left_rsc_we;
    wire [11:0] buffer_pull_lcu_rec_rsc_adr;
    wire [287:0] buffer_pull_lcu_rec_rsc_d;
    wire [287:0] buffer_pull_lcu_rec_rsc_q;
    wire       buffer_pull_lcu_rec_rsc_we;
    wire [12:0] buffer_pull_lcu_rec_top_left_rsc_adr;
    wire [7:0] buffer_pull_lcu_rec_top_left_rsc_d;
    wire [7:0] buffer_pull_lcu_rec_top_left_rsc_q;
    wire       buffer_pull_lcu_rec_top_left_rsc_we;
    wire [8:0] buffer_pull_lcu_rec_top_rsc_adr;
    wire [31:0] buffer_pull_lcu_rec_top_rsc_d;
    wire [31:0] buffer_pull_lcu_rec_top_rsc_q;
    wire       buffer_pull_lcu_rec_top_rsc_we;
    wire [10:0] buffer_pull_rec_in_rsc_adr;
    wire [255:0] buffer_pull_rec_in_rsc_q;
    // buffer_push port wires:
    wire       buffer_push_arst_n;
    wire [8:0] buffer_push_borders_left_rsc_adr;
    wire [31:0] buffer_push_borders_left_rsc_d;
    wire       buffer_push_borders_left_rsc_we;
    wire [8:0] buffer_push_borders_top_rsc_adr;
    wire [31:0] buffer_push_borders_top_rsc_d;
    wire       buffer_push_borders_top_rsc_we;
    wire       buffer_push_clk;
    wire [511:0] buffer_push_coeff_in_rsc_dat;
    wire       buffer_push_coeff_in_rsc_rdy;
    wire       buffer_push_coeff_in_rsc_vld;
    wire [10:0] buffer_push_coeff_out_rsc_adr;
    wire [511:0] buffer_push_coeff_out_rsc_d;
    wire       buffer_push_coeff_out_rsc_we;
    wire [191:0] buffer_push_conf_out_rsc_dat;
    wire       buffer_push_conf_out_rsc_rdy;
    wire       buffer_push_conf_out_rsc_vld;
    wire [255:0] buffer_push_rec_in_rsc_dat;
    wire       buffer_push_rec_in_rsc_rdy;
    wire       buffer_push_rec_in_rsc_vld;
    wire [10:0] buffer_push_rec_out_rsc_adr;
    wire [255:0] buffer_push_rec_out_rsc_d;
    wire       buffer_push_rec_out_rsc_we;

    // Assignments for the ports of the encompassing component:
    assign buffer_pull_arst_n_to_bus_arst_n = arst_n;
    assign buffer_pull_clk_to_bus_CLK = clk;
    assign buffer_push_coeff_in_rsc_to_bus_3_DAT = coeff_in_rsc_dat;
    assign coeff_in_rsc_rdy = buffer_push_coeff_in_rsc_to_bus_3_RDY;
    assign buffer_push_coeff_in_rsc_to_bus_3_VLD = coeff_in_rsc_vld;
    assign buffer_pull_conf_in_rsc_to_bus_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = buffer_pull_conf_in_rsc_to_bus_RDY;
    assign buffer_pull_conf_in_rsc_to_bus_VLD = conf_in_rsc_vld;
    assign conf_out_rsc_dat = buffer_push_conf_out_rsc_to_bus_4_DAT;
    assign buffer_push_conf_out_rsc_to_bus_4_RDY = conf_out_rsc_rdy;
    assign conf_out_rsc_vld = buffer_push_conf_out_rsc_to_bus_4_VLD;
    assign inst_done_rsc_dat = buffer_pull_inst_done_rsc_to_bus_DAT;
    assign buffer_pull_inst_done_rsc_to_bus_RDY = inst_done_rsc_rdy;
    assign inst_done_rsc_vld = buffer_pull_inst_done_rsc_to_bus_VLD;
    assign lcu_coeff_rsc_adr = buffer_pull_lcu_coeff_rsc_to_bus_ADDR;
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[9];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[10];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[11];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[12];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[13];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[14];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[15];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[16];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[17];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[18];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[19];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[20];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[21];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[22];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[23];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[24];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[25];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[26];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[27];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[28];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[29];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[30];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[31];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[8];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[7];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[6];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[3];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[4];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[5];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[0];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[1];
    assign lcu_coeff_rsc_d[512] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[2];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[35];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[36];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[37];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[38];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[39];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[40];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[41];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[42];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[43];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[44];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[45];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[46];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[47];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[48];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[49];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[50];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[51];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[52];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[53];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[54];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[55];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[56];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[57];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[58];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[59];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[60];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[61];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[62];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[63];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[34];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[32];
    assign lcu_coeff_rsc_d[513] = buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[33];
    assign lcu_coeff_rsc_d[511:0] = buffer_pull_lcu_coeff_rsc_to_bus_WDATA;
    assign buffer_pull_lcu_coeff_rsc_to_bus_RDATA = lcu_coeff_rsc_q;
    assign lcu_coeff_rsc_we = buffer_pull_lcu_coeff_rsc_to_bus_WREN;
    assign lcu_rec_left_rsc_adr = buffer_pull_lcu_rec_left_rsc_to_bus_ADDR;
    assign lcu_rec_left_rsc_d = buffer_pull_lcu_rec_left_rsc_to_bus_WDATA;
    assign buffer_pull_lcu_rec_left_rsc_to_bus_RDATA = lcu_rec_left_rsc_q;
    assign lcu_rec_left_rsc_we = buffer_pull_lcu_rec_left_rsc_to_bus_WREN;
    assign lcu_rec_rsc_adr = buffer_pull_lcu_rec_rsc_to_bus_1_ADDR;
    assign lcu_rec_rsc_d[287:256] = buffer_pull_lcu_rec_rsc_to_bus_1_BYTEEN;
    assign lcu_rec_rsc_d[255:0] = buffer_pull_lcu_rec_rsc_to_bus_1_WDATA;
    assign buffer_pull_lcu_rec_rsc_to_bus_1_RDATA = lcu_rec_rsc_q;
    assign lcu_rec_rsc_we = buffer_pull_lcu_rec_rsc_to_bus_1_WREN;
    assign lcu_rec_top_left_rsc_adr = buffer_pull_lcu_rec_top_left_rsc_to_bus_1_ADDR;
    assign lcu_rec_top_left_rsc_d = buffer_pull_lcu_rec_top_left_rsc_to_bus_1_WDATA;
    assign buffer_pull_lcu_rec_top_left_rsc_to_bus_1_RDATA = lcu_rec_top_left_rsc_q;
    assign lcu_rec_top_left_rsc_we = buffer_pull_lcu_rec_top_left_rsc_to_bus_1_WREN;
    assign lcu_rec_top_rsc_adr = buffer_pull_lcu_rec_top_rsc_to_bus_ADDR;
    assign lcu_rec_top_rsc_d = buffer_pull_lcu_rec_top_rsc_to_bus_WDATA;
    assign buffer_pull_lcu_rec_top_rsc_to_bus_RDATA = lcu_rec_top_rsc_q_1;
    assign lcu_rec_top_rsc_we = buffer_pull_lcu_rec_top_rsc_to_bus_WREN;
    assign buffer_push_rec_in_rsc_to_bus_5_DAT = rec_in_rsc_dat;
    assign rec_in_rsc_rdy = buffer_push_rec_in_rsc_to_bus_5_RDY;
    assign buffer_push_rec_in_rsc_to_bus_5_VLD = rec_in_rsc_vld;


    // CoeffMem assignments:
    assign CoeffMem_clock = buffer_pull_clk_to_bus_CLK;
    assign CoeffMem_rdaddress = buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_ADDR;
    assign buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_RDATA = CoeffMem_rdata;
    assign CoeffMem_wdata = buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_WDATA;
    assign CoeffMem_wraddress = buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_ADDR;
    assign CoeffMem_wren = buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_WREN;
    // LeftBorderMem assignments:
    assign LeftBorderMem_clock = buffer_pull_clk_to_bus_CLK;
    assign LeftBorderMem_rdaddress = buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_ADDR;
    assign buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_RDATA = LeftBorderMem_rdata;
    assign LeftBorderMem_wdata = buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_WDATA;
    assign LeftBorderMem_wraddress = buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_ADDR;
    assign LeftBorderMem_wren = buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_WREN;
    // RecMem assignments:
    assign RecMem_clock = buffer_pull_clk_to_bus_CLK;
    assign RecMem_rdaddress = buffer_pull_rec_in_rsc_to_RecMem_mem_read_ADDR;
    assign buffer_pull_rec_in_rsc_to_RecMem_mem_read_RDATA = RecMem_rdata;
    assign RecMem_wdata = buffer_push_rec_out_rsc_to_RecMem_mem_write_WDATA;
    assign RecMem_wraddress = buffer_push_rec_out_rsc_to_RecMem_mem_write_ADDR;
    assign RecMem_wren = buffer_push_rec_out_rsc_to_RecMem_mem_write_WREN;
    // TopBorderMem assignments:
    assign TopBorderMem_clock = buffer_pull_clk_to_bus_CLK;
    assign TopBorderMem_rdaddress = buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_ADDR;
    assign buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_RDATA = TopBorderMem_rdata;
    assign TopBorderMem_wdata = buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_WDATA;
    assign TopBorderMem_wraddress = buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_ADDR;
    assign TopBorderMem_wren = buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_WREN;
    // buffer_pull assignments:
    assign buffer_pull_arst_n = buffer_pull_arst_n_to_bus_arst_n;
    assign buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_ADDR = buffer_pull_borders_left_rsc_adr;
    assign buffer_pull_borders_left_rsc_q = buffer_pull_borders_left_rsc_to_LeftBorderMem_mem_read_RDATA;
    assign buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_ADDR = buffer_pull_borders_top_rsc_adr;
    assign buffer_pull_borders_top_rsc_q = buffer_pull_borders_top_rsc_to_TopBorderMem_mem_read_RDATA;
    assign buffer_pull_clk = buffer_pull_clk_to_bus_CLK;
    assign buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_ADDR = buffer_pull_coeff_in_rsc_adr;
    assign buffer_pull_coeff_in_rsc_q = buffer_pull_coeff_in_rsc_to_CoeffMem_mem_read_RDATA;
    assign buffer_pull_conf_in_rsc_dat = buffer_pull_conf_in_rsc_to_bus_DAT;
    assign buffer_pull_conf_in_rsc_to_bus_RDY = buffer_pull_conf_in_rsc_rdy;
    assign buffer_pull_conf_in_rsc_vld = buffer_pull_conf_in_rsc_to_bus_VLD;
    assign buffer_pull_inst_done_rsc_to_bus_DAT = buffer_pull_inst_done_rsc_dat;
    assign buffer_pull_inst_done_rsc_rdy = buffer_pull_inst_done_rsc_to_bus_RDY;
    assign buffer_pull_inst_done_rsc_to_bus_VLD = buffer_pull_inst_done_rsc_vld;
    assign buffer_pull_lcu_coeff_rsc_to_bus_ADDR = buffer_pull_lcu_coeff_rsc_adr;
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[9] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[10] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[11] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[12] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[13] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[14] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[15] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[16] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[17] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[18] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[19] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[20] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[21] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[22] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[23] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[24] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[25] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[26] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[27] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[28] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[29] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[30] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[31] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[8] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[7] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[6] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[3] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[4] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[5] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[0] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[1] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[2] = buffer_pull_lcu_coeff_rsc_d[512];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[35] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[36] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[37] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[38] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[39] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[40] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[41] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[42] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[43] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[44] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[45] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[46] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[47] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[48] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[49] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[50] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[51] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[52] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[53] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[54] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[55] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[56] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[57] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[58] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[59] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[60] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[61] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[62] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[63] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[34] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[32] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_BYTEEN[33] = buffer_pull_lcu_coeff_rsc_d[513];
    assign buffer_pull_lcu_coeff_rsc_to_bus_WDATA = buffer_pull_lcu_coeff_rsc_d[511:0];
    assign buffer_pull_lcu_coeff_rsc_q = buffer_pull_lcu_coeff_rsc_to_bus_RDATA;
    assign buffer_pull_lcu_coeff_rsc_to_bus_WREN = buffer_pull_lcu_coeff_rsc_we;
    assign buffer_pull_lcu_rec_left_rsc_to_bus_ADDR = buffer_pull_lcu_rec_left_rsc_adr;
    assign buffer_pull_lcu_rec_left_rsc_to_bus_WDATA = buffer_pull_lcu_rec_left_rsc_d;
    assign buffer_pull_lcu_rec_left_rsc_q = buffer_pull_lcu_rec_left_rsc_to_bus_RDATA;
    assign buffer_pull_lcu_rec_left_rsc_to_bus_WREN = buffer_pull_lcu_rec_left_rsc_we;
    assign buffer_pull_lcu_rec_rsc_to_bus_1_ADDR = buffer_pull_lcu_rec_rsc_adr;
    assign buffer_pull_lcu_rec_rsc_to_bus_1_BYTEEN = buffer_pull_lcu_rec_rsc_d[287:256];
    assign buffer_pull_lcu_rec_rsc_to_bus_1_WDATA = buffer_pull_lcu_rec_rsc_d[255:0];
    assign buffer_pull_lcu_rec_rsc_q = buffer_pull_lcu_rec_rsc_to_bus_1_RDATA;
    assign buffer_pull_lcu_rec_rsc_to_bus_1_WREN = buffer_pull_lcu_rec_rsc_we;
    assign buffer_pull_lcu_rec_top_left_rsc_to_bus_1_ADDR = buffer_pull_lcu_rec_top_left_rsc_adr;
    assign buffer_pull_lcu_rec_top_left_rsc_to_bus_1_WDATA = buffer_pull_lcu_rec_top_left_rsc_d;
    assign buffer_pull_lcu_rec_top_left_rsc_q = buffer_pull_lcu_rec_top_left_rsc_to_bus_1_RDATA;
    assign buffer_pull_lcu_rec_top_left_rsc_to_bus_1_WREN = buffer_pull_lcu_rec_top_left_rsc_we;
    assign buffer_pull_lcu_rec_top_rsc_to_bus_ADDR = buffer_pull_lcu_rec_top_rsc_adr;
    assign buffer_pull_lcu_rec_top_rsc_to_bus_WDATA = buffer_pull_lcu_rec_top_rsc_d;
    assign buffer_pull_lcu_rec_top_rsc_q = buffer_pull_lcu_rec_top_rsc_to_bus_RDATA;
    assign buffer_pull_lcu_rec_top_rsc_to_bus_WREN = buffer_pull_lcu_rec_top_rsc_we;
    assign buffer_pull_rec_in_rsc_to_RecMem_mem_read_ADDR = buffer_pull_rec_in_rsc_adr;
    assign buffer_pull_rec_in_rsc_q = buffer_pull_rec_in_rsc_to_RecMem_mem_read_RDATA;
    // buffer_push assignments:
    assign buffer_push_arst_n = buffer_pull_arst_n_to_bus_arst_n;
    assign buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_ADDR = buffer_push_borders_left_rsc_adr;
    assign buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_WDATA = buffer_push_borders_left_rsc_d;
    assign buffer_push_borders_left_rsc_to_LeftBorderMem_mem_write_WREN = buffer_push_borders_left_rsc_we;
    assign buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_ADDR = buffer_push_borders_top_rsc_adr;
    assign buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_WDATA = buffer_push_borders_top_rsc_d;
    assign buffer_push_borders_top_rsc_to_TopBorderMem_mem_write_WREN = buffer_push_borders_top_rsc_we;
    assign buffer_push_clk = buffer_pull_clk_to_bus_CLK;
    assign buffer_push_coeff_in_rsc_dat = buffer_push_coeff_in_rsc_to_bus_3_DAT;
    assign buffer_push_coeff_in_rsc_to_bus_3_RDY = buffer_push_coeff_in_rsc_rdy;
    assign buffer_push_coeff_in_rsc_vld = buffer_push_coeff_in_rsc_to_bus_3_VLD;
    assign buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_ADDR = buffer_push_coeff_out_rsc_adr;
    assign buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_WDATA = buffer_push_coeff_out_rsc_d;
    assign buffer_push_coeff_out_rsc_to_CoeffMem_mem_write_WREN = buffer_push_coeff_out_rsc_we;
    assign buffer_push_conf_out_rsc_to_bus_4_DAT = buffer_push_conf_out_rsc_dat;
    assign buffer_push_conf_out_rsc_rdy = buffer_push_conf_out_rsc_to_bus_4_RDY;
    assign buffer_push_conf_out_rsc_to_bus_4_VLD = buffer_push_conf_out_rsc_vld;
    assign buffer_push_rec_in_rsc_dat = buffer_push_rec_in_rsc_to_bus_5_DAT;
    assign buffer_push_rec_in_rsc_to_bus_5_RDY = buffer_push_rec_in_rsc_rdy;
    assign buffer_push_rec_in_rsc_vld = buffer_push_rec_in_rsc_to_bus_5_VLD;
    assign buffer_push_rec_out_rsc_to_RecMem_mem_write_ADDR = buffer_push_rec_out_rsc_adr;
    assign buffer_push_rec_out_rsc_to_RecMem_mem_write_WDATA = buffer_push_rec_out_rsc_d;
    assign buffer_push_rec_out_rsc_to_RecMem_mem_write_WREN = buffer_push_rec_out_rsc_we;

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (512),
        .addr_width_g        (11))
    CoeffMem(
        // Interface: clk
        .clock               (CoeffMem_clock),
        // Interface: mem_read
        .rdaddress           (CoeffMem_rdaddress),
        .rdata               (CoeffMem_rdata),
        // Interface: mem_write
        .wdata               (CoeffMem_wdata),
        .wraddress           (CoeffMem_wraddress),
        .wren                (CoeffMem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (32),
        .addr_width_g        (9))
    LeftBorderMem(
        // Interface: clk
        .clock               (LeftBorderMem_clock),
        // Interface: mem_read
        .rdaddress           (LeftBorderMem_rdaddress),
        .rdata               (LeftBorderMem_rdata),
        // Interface: mem_write
        .wdata               (LeftBorderMem_wdata),
        .wraddress           (LeftBorderMem_wraddress),
        .wren                (LeftBorderMem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (256),
        .addr_width_g        (11))
    RecMem(
        // Interface: clk
        .clock               (RecMem_clock),
        // Interface: mem_read
        .rdaddress           (RecMem_rdaddress),
        .rdata               (RecMem_rdata),
        // Interface: mem_write
        .wdata               (RecMem_wdata),
        .wraddress           (RecMem_wraddress),
        .wren                (RecMem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (32),
        .addr_width_g        (9))
    TopBorderMem(
        // Interface: clk
        .clock               (TopBorderMem_clock),
        // Interface: mem_read
        .rdaddress           (TopBorderMem_rdaddress),
        .rdata               (TopBorderMem_rdata),
        // Interface: mem_write
        .wdata               (TopBorderMem_wdata),
        .wraddress           (TopBorderMem_wraddress),
        .wren                (TopBorderMem_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarControl:buffer_pull:1.0
    buffer_pull buffer_pull(
        // Interface: arst_n
        .arst_n              (buffer_pull_arst_n),
        // Interface: borders_left_rsc
        .borders_left_rsc_q  (buffer_pull_borders_left_rsc_q),
        .borders_left_rsc_adr(buffer_pull_borders_left_rsc_adr),
        .borders_left_rsc_d  (),
        .borders_left_rsc_we (),
        // Interface: borders_top_rsc
        .borders_top_rsc_q   (buffer_pull_borders_top_rsc_q),
        .borders_top_rsc_adr (buffer_pull_borders_top_rsc_adr),
        .borders_top_rsc_d   (),
        .borders_top_rsc_we  (),
        // Interface: clk
        .clk                 (buffer_pull_clk),
        // Interface: coeff_in_rsc
        .coeff_in_rsc_q      (buffer_pull_coeff_in_rsc_q),
        .coeff_in_rsc_adr    (buffer_pull_coeff_in_rsc_adr),
        .coeff_in_rsc_d      (),
        .coeff_in_rsc_we     (),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (buffer_pull_conf_in_rsc_dat),
        .conf_in_rsc_vld     (buffer_pull_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (buffer_pull_conf_in_rsc_rdy),
        // Interface: inst_done_rsc
        .inst_done_rsc_rdy   (buffer_pull_inst_done_rsc_rdy),
        .inst_done_rsc_dat   (buffer_pull_inst_done_rsc_dat),
        .inst_done_rsc_vld   (buffer_pull_inst_done_rsc_vld),
        // Interface: lcu_coeff_rsc
        .lcu_coeff_rsc_q     (buffer_pull_lcu_coeff_rsc_q),
        .lcu_coeff_rsc_adr   (buffer_pull_lcu_coeff_rsc_adr),
        .lcu_coeff_rsc_d     (buffer_pull_lcu_coeff_rsc_d),
        .lcu_coeff_rsc_we    (buffer_pull_lcu_coeff_rsc_we),
        // Interface: lcu_rec_left_rsc
        .lcu_rec_left_rsc_q  (buffer_pull_lcu_rec_left_rsc_q),
        .lcu_rec_left_rsc_adr(buffer_pull_lcu_rec_left_rsc_adr),
        .lcu_rec_left_rsc_d  (buffer_pull_lcu_rec_left_rsc_d),
        .lcu_rec_left_rsc_we (buffer_pull_lcu_rec_left_rsc_we),
        // Interface: lcu_rec_rsc
        .lcu_rec_rsc_q       (buffer_pull_lcu_rec_rsc_q),
        .lcu_rec_rsc_adr     (buffer_pull_lcu_rec_rsc_adr),
        .lcu_rec_rsc_d       (buffer_pull_lcu_rec_rsc_d),
        .lcu_rec_rsc_we      (buffer_pull_lcu_rec_rsc_we),
        // Interface: lcu_rec_top_left_rsc
        .lcu_rec_top_left_rsc_q(buffer_pull_lcu_rec_top_left_rsc_q),
        .lcu_rec_top_left_rsc_adr(buffer_pull_lcu_rec_top_left_rsc_adr),
        .lcu_rec_top_left_rsc_d(buffer_pull_lcu_rec_top_left_rsc_d),
        .lcu_rec_top_left_rsc_we(buffer_pull_lcu_rec_top_left_rsc_we),
        // Interface: lcu_rec_top_rsc
        .lcu_rec_top_rsc_q   (buffer_pull_lcu_rec_top_rsc_q),
        .lcu_rec_top_rsc_adr (buffer_pull_lcu_rec_top_rsc_adr),
        .lcu_rec_top_rsc_d   (buffer_pull_lcu_rec_top_rsc_d),
        .lcu_rec_top_rsc_we  (buffer_pull_lcu_rec_top_rsc_we),
        // Interface: rec_in_rsc
        .rec_in_rsc_q        (buffer_pull_rec_in_rsc_q),
        .rec_in_rsc_adr      (buffer_pull_rec_in_rsc_adr),
        .rec_in_rsc_d        (),
        .rec_in_rsc_we       ());

    // IP-XACT VLNV: tuni.fi:KvazaarControl:buffer_push:1.0
    buffer_push buffer_push(
        // Interface: arst_n
        .arst_n              (buffer_push_arst_n),
        // Interface: borders_left_rsc
        .borders_left_rsc_q  (),
        .borders_left_rsc_adr(buffer_push_borders_left_rsc_adr),
        .borders_left_rsc_d  (buffer_push_borders_left_rsc_d),
        .borders_left_rsc_we (buffer_push_borders_left_rsc_we),
        // Interface: borders_top_rsc
        .borders_top_rsc_q   (),
        .borders_top_rsc_adr (buffer_push_borders_top_rsc_adr),
        .borders_top_rsc_d   (buffer_push_borders_top_rsc_d),
        .borders_top_rsc_we  (buffer_push_borders_top_rsc_we),
        // Interface: clk
        .clk                 (buffer_push_clk),
        // Interface: coeff_in_rsc
        .coeff_in_rsc_dat    (buffer_push_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (buffer_push_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (buffer_push_coeff_in_rsc_rdy),
        // Interface: coeff_out_rsc
        .coeff_out_rsc_q     (),
        .coeff_out_rsc_adr   (buffer_push_coeff_out_rsc_adr),
        .coeff_out_rsc_d     (buffer_push_coeff_out_rsc_d),
        .coeff_out_rsc_we    (buffer_push_coeff_out_rsc_we),
        // Interface: conf_out_rsc
        .conf_out_rsc_rdy    (buffer_push_conf_out_rsc_rdy),
        .conf_out_rsc_dat    (buffer_push_conf_out_rsc_dat),
        .conf_out_rsc_vld    (buffer_push_conf_out_rsc_vld),
        // Interface: rec_in_rsc
        .rec_in_rsc_dat      (buffer_push_rec_in_rsc_dat),
        .rec_in_rsc_vld      (buffer_push_rec_in_rsc_vld),
        .rec_in_rsc_rdy      (buffer_push_rec_in_rsc_rdy),
        // Interface: rec_out_rsc
        .rec_out_rsc_q       (),
        .rec_out_rsc_adr     (buffer_push_rec_out_rsc_adr),
        .rec_out_rsc_d       (buffer_push_rec_out_rsc_d),
        .rec_out_rsc_we      (buffer_push_rec_out_rsc_we));


endmodule
