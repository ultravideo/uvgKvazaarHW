
module IntraSearchControl_0 #(
    parameter                              width_g          = 32
) (
    // Interface: arst_n
    input                               arst_n,

    // Interface: cabac_rsc
    input                [127:0]        cabac_rsc_q,
    output               [3:0]          cabac_rsc_adr,
    output               [127:0]        cabac_rsc_d,
    output                              cabac_rsc_we,

    // Interface: clk
    input                               clk,

    // Interface: coeff_in_rsc
    input                [511:0]        coeff_in_rsc_dat,
    input                               coeff_in_rsc_vld,
    output                              coeff_in_rsc_rdy,

    // Interface: conf_in_rsc
    input                [31:0]         conf_in_rsc_dat,
    input                               conf_in_rsc_vld,
    output                              conf_in_rsc_rdy,

    // Interface: conf_out_rsc
    input                               conf_out_rsc_rdy,
    output               [87:0]         conf_out_rsc_dat,
    output                              conf_out_rsc_vld,

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

    // Interface: rec_in_rsc
    input                [255:0]        rec_in_rsc_dat,
    input                               rec_in_rsc_vld,
    output                              rec_in_rsc_rdy,

    // These ports are not in any interface
    input                [513:0]        lcu_coeff_rsc_q
);

    // LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc wires:
    wire [12:0] LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_ADDR;
    wire [7:0] LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_RDATA;
    wire [7:0] LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_WDATA;
    wire       LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_WREN;
    // build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read wires:
    wire [8:0] build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_ADDR;
    wire [31:0] build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_RDATA;
    wire       build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_WDATA;
    wire [31:0] build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_WREN;
    // init_ctu_inst_rsc_to_inst_mem_mem_write wires:
    wire [12:0] init_ctu_inst_rsc_to_inst_mem_mem_write_ADDR;
    wire [22:0] init_ctu_inst_rsc_to_inst_mem_mem_write_RDATA;
    wire [22:0] init_ctu_inst_rsc_to_inst_mem_mem_write_WDATA;
    wire       init_ctu_inst_rsc_to_inst_mem_mem_write_WREN;
    // scheduler_inst_rsc_to_inst_mem_mem_read wires:
    wire [12:0] scheduler_inst_rsc_to_inst_mem_mem_read_ADDR;
    wire [22:0] scheduler_inst_rsc_to_inst_mem_mem_read_RDATA;
    wire [22:0] scheduler_inst_rsc_to_inst_mem_mem_read_WDATA;
    wire       scheduler_inst_rsc_to_inst_mem_mem_read_WREN;
    // scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc wires:
    wire [8:0] scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_DAT;
    wire       scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_RDY;
    wire       scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_VLD;
    // build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc wires:
    wire [47:0] build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_DAT;
    wire       build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_RDY;
    wire       build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_VLD;
    // init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write wires:
    wire [3:0] init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_ADDR;
    wire [43:0] init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_RDATA;
    wire [43:0] init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_WDATA;
    wire       init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_WREN;
    // exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read wires:
    wire [3:0] exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_ADDR;
    wire [43:0] exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_RDATA;
    wire [43:0] exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_WDATA;
    wire       exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_WREN;
    // exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read wires:
    wire [11:0] exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_ADDR;
    wire [7:0] exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_RDATA;
    wire [7:0] exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_WDATA;
    wire       exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_WREN;
    // init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read wires:
    wire [11:0] init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_ADDR;
    wire [7:0] init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_RDATA;
    wire [7:0] init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_WDATA;
    wire       init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_WREN;
    // rec_coeff_buffer_arst_n_to_arst_n wires:
    wire       rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    // exec_end_clk_to_clk wires:
    wire       exec_end_clk_to_clk_CLK;
    // ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc wires:
    wire [3:0] ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_ADDR;
    wire [15:0] ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_RDATA;
    wire [15:0] ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_WDATA;
    wire       ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_WREN;
    // exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read wires:
    wire [3:0] exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_ADDR;
    wire [15:0] exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_RDATA;
    wire [15:0] exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_WDATA;
    wire       exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_WREN;
    // exec_end_inst_input_rsc_to_lcu_str_data_out wires:
    wire [21:0] exec_end_inst_input_rsc_to_lcu_str_data_out_DAT;
    wire       exec_end_inst_input_rsc_to_lcu_str_data_out_RDY;
    wire       exec_end_inst_input_rsc_to_lcu_str_data_out_VLD;
    // exec_str_inst_out_rsc_to_lcu_str_data_in wires:
    wire [21:0] exec_str_inst_out_rsc_to_lcu_str_data_in_DAT;
    wire       exec_str_inst_out_rsc_to_lcu_str_data_in_RDY;
    wire       exec_str_inst_out_rsc_to_lcu_str_data_in_VLD;
    // init_ctu_init_chroma_in_rsc_to_init_chroma_data_out wires:
    wire [47:0] init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_DAT;
    wire       init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_RDY;
    wire       init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_VLD;
    // exec_str_init_chroma_rsc_to_init_chroma_data_in wires:
    wire [47:0] exec_str_init_chroma_rsc_to_init_chroma_data_in_DAT;
    wire       exec_str_init_chroma_rsc_to_init_chroma_data_in_RDY;
    wire       exec_str_init_chroma_rsc_to_init_chroma_data_in_VLD;
    // scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc wires:
    wire [4:0] scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_DAT;
    wire       scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_RDY;
    wire       scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_VLD;
    // exec_str_inst_input_rsc_to_lcu_sched_data_out wires:
    wire [21:0] exec_str_inst_input_rsc_to_lcu_sched_data_out_DAT;
    wire       exec_str_inst_input_rsc_to_lcu_sched_data_out_RDY;
    wire       exec_str_inst_input_rsc_to_lcu_sched_data_out_VLD;
    // scheduler_inst_out_rsc_to_lcu_sched_data_in wires:
    wire [21:0] scheduler_inst_out_rsc_to_lcu_sched_data_in_DAT;
    wire       scheduler_inst_out_rsc_to_lcu_sched_data_in_RDY;
    wire       scheduler_inst_out_rsc_to_lcu_sched_data_in_VLD;
    // LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc wires:
    wire [8:0] LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_ADDR;
    wire [31:0] LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_RDATA;
    wire [31:0] LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_WDATA;
    wire       LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_WREN;
    // exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in wires:
    wire [22:0] exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_DAT;
    wire       exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_RDY;
    wire       exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_VLD;
    // LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc wires:
    wire [12:0] LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_ADDR;
    wire [7:0] LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_RDATA;
    wire [7:0] LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_WDATA;
    wire       LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_WREN;
    // lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc wires:
    wire [22:0] lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_DAT;
    wire       lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_RDY;
    wire       lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_VLD;
    // LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc wires:
    wire [8:0] LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_ADDR;
    wire [31:0] LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_RDATA;
    wire [31:0] LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_WDATA;
    wire       LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_WREN;
    // LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc wires:
    wire [8:0] LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_ADDR;
    wire [31:0] LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_RDATA;
    wire [31:0] LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_WDATA;
    wire       LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_WREN;
    // rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc wires:
    wire [191:0] rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_DAT;
    wire       rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_RDY;
    wire       rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_VLD;
    // rec_coeff_buffer_coeff_in_rsc_to_bus wires:
    wire [511:0] rec_coeff_buffer_coeff_in_rsc_to_bus_DAT;
    wire       rec_coeff_buffer_coeff_in_rsc_to_bus_RDY;
    wire       rec_coeff_buffer_coeff_in_rsc_to_bus_VLD;
    // rec_coeff_buffer_rec_in_rsc_to_bus wires:
    wire [255:0] rec_coeff_buffer_rec_in_rsc_to_bus_DAT;
    wire       rec_coeff_buffer_rec_in_rsc_to_bus_RDY;
    wire       rec_coeff_buffer_rec_in_rsc_to_bus_VLD;
    // exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc wires:
    wire [11:0] exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_ADDR;
    wire [31:0] exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_RDATA;
    wire [31:0] exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WDATA;
    wire       exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WREN;
    // init_ctu_conf_in_rsc_to_bus wires:
    wire [31:0] init_ctu_conf_in_rsc_to_bus_DAT;
    wire       init_ctu_conf_in_rsc_to_bus_RDY;
    wire       init_ctu_conf_in_rsc_to_bus_VLD;
    // exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str wires:
    wire [7:0] exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_ADDR;
    wire [7:0] exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_RDATA;
    wire [7:0] exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_WDATA;
    wire       exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_WREN;
    // exec_str_irq_rsc_to_lcu_poll wires:
    wire [15:0] exec_str_irq_rsc_to_lcu_poll_DAT;
    // build_reference_border_lcu_border_left_rsc_to_lcu_border_left wires:
    wire [9:0] build_reference_border_lcu_border_left_rsc_to_lcu_border_left_ADDR;
    wire [31:0] build_reference_border_lcu_border_left_rsc_to_lcu_border_left_RDATA;
    wire [31:0] build_reference_border_lcu_border_left_rsc_to_lcu_border_left_WDATA;
    wire       build_reference_border_lcu_border_left_rsc_to_lcu_border_left_WREN;
    // build_reference_border_lcu_border_top_rsc_to_lcu_border_top wires:
    wire [9:0] build_reference_border_lcu_border_top_rsc_to_lcu_border_top_ADDR;
    wire [31:0] build_reference_border_lcu_border_top_rsc_to_lcu_border_top_RDATA;
    wire [31:0] build_reference_border_lcu_border_top_rsc_to_lcu_border_top_WDATA;
    wire       build_reference_border_lcu_border_top_rsc_to_lcu_border_top_WREN;
    // exec_end_cabac_rsc_to_bus wires:
    wire [3:0] exec_end_cabac_rsc_to_bus_ADDR;
    wire [127:0] exec_end_cabac_rsc_to_bus_RDATA;
    wire [127:0] exec_end_cabac_rsc_to_bus_WDATA;
    wire       exec_end_cabac_rsc_to_bus_WREN;
    // exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver wires:
    wire [7:0] exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_ADDR;
    wire [7:0] exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_RDATA;
    wire [7:0] exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_WDATA;
    wire       exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_WREN;
    // exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor wires:
    wire [7:0] exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_ADDR;
    wire [7:0] exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_RDATA;
    wire [7:0] exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_WDATA;
    wire       exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_WREN;
    // build_reference_border_conf_out_rsc_to_bus wires:
    wire [87:0] build_reference_border_conf_out_rsc_to_bus_DAT;
    wire       build_reference_border_conf_out_rsc_to_bus_RDY;
    wire       build_reference_border_conf_out_rsc_to_bus_VLD;
    // exec_end_stack_rsc_to_exec_end_stack_mem wires:
    wire [5:0] exec_end_stack_rsc_to_exec_end_stack_mem_ADDR;
    wire [104:0] exec_end_stack_rsc_to_exec_end_stack_mem_RDATA;
    wire [104:0] exec_end_stack_rsc_to_exec_end_stack_mem_WDATA;
    wire       exec_end_stack_rsc_to_exec_end_stack_mem_WREN;
    // rec_coeff_buffer_lcu_coeff_rsc_to_bus wires:
    wire [11:0] rec_coeff_buffer_lcu_coeff_rsc_to_bus_ADDR;
    wire [63:0] rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN;
    wire [513:0] rec_coeff_buffer_lcu_coeff_rsc_to_bus_RDATA;
    wire [511:0] rec_coeff_buffer_lcu_coeff_rsc_to_bus_WDATA;
    wire       rec_coeff_buffer_lcu_coeff_rsc_to_bus_WREN;
    // rec_coeff_buffer_lcu_rec_rsc_to_bus_1 wires:
    wire [11:0] rec_coeff_buffer_lcu_rec_rsc_to_bus_1_ADDR;
    wire [31:0] rec_coeff_buffer_lcu_rec_rsc_to_bus_1_BYTEEN;
    wire [287:0] rec_coeff_buffer_lcu_rec_rsc_to_bus_1_RDATA;
    wire [255:0] rec_coeff_buffer_lcu_rec_rsc_to_bus_1_WDATA;
    wire       rec_coeff_buffer_lcu_rec_rsc_to_bus_1_WREN;

    // Ad-hoc wires:
    wire       init_chroma_q_vld_to_init_ctu_init_chroma_lz_rsc_dat;
    wire       init_ctu_conf_in_lz_rsc_dat_to_conf_in_rsc_vld;

    // LCU_RecLeft port wires:
    wire       LCU_RecLeft_clock;
    wire [8:0] LCU_RecLeft_rdaddress;
    wire [31:0] LCU_RecLeft_rdata;
    wire [31:0] LCU_RecLeft_wdata;
    wire [8:0] LCU_RecLeft_wraddress;
    wire       LCU_RecLeft_wren;
    // LCU_RecTop port wires:
    wire       LCU_RecTop_clock;
    wire [8:0] LCU_RecTop_rdaddress;
    wire [31:0] LCU_RecTop_rdata;
    wire [31:0] LCU_RecTop_wdata;
    wire [8:0] LCU_RecTop_wraddress;
    wire       LCU_RecTop_wren;
    // LCU_RecTopLeft port wires:
    wire       LCU_RecTopLeft_clock;
    wire [12:0] LCU_RecTopLeft_rdaddress;
    wire [7:0] LCU_RecTopLeft_rdata;
    wire [7:0] LCU_RecTopLeft_wdata;
    wire [12:0] LCU_RecTopLeft_wraddress;
    wire       LCU_RecTopLeft_wren;
    // build_reference_border port wires:
    wire       build_reference_border_arst_n;
    wire       build_reference_border_clk;
    wire [47:0] build_reference_border_conf_in_rsc_dat;
    wire       build_reference_border_conf_in_rsc_rdy;
    wire       build_reference_border_conf_in_rsc_vld;
    wire [87:0] build_reference_border_conf_out_rsc_dat;
    wire       build_reference_border_conf_out_rsc_rdy;
    wire       build_reference_border_conf_out_rsc_vld;
    wire [9:0] build_reference_border_lcu_border_left_rsc_adr;
    wire [31:0] build_reference_border_lcu_border_left_rsc_d;
    wire [31:0] build_reference_border_lcu_border_left_rsc_q;
    wire       build_reference_border_lcu_border_left_rsc_we;
    wire [9:0] build_reference_border_lcu_border_top_rsc_adr;
    wire [31:0] build_reference_border_lcu_border_top_rsc_d;
    wire [31:0] build_reference_border_lcu_border_top_rsc_q;
    wire       build_reference_border_lcu_border_top_rsc_we;
    wire [8:0] build_reference_border_lcu_rec_left_rsc_adr;
    wire [31:0] build_reference_border_lcu_rec_left_rsc_q;
    wire [12:0] build_reference_border_lcu_rec_top_left_rsc_adr;
    wire [7:0] build_reference_border_lcu_rec_top_left_rsc_q;
    wire [8:0] build_reference_border_lcu_rec_top_rsc_adr;
    wire [31:0] build_reference_border_lcu_rec_top_rsc_q;
    // ctu_end_mem port wires:
    wire       ctu_end_mem_clock;
    wire [3:0] ctu_end_mem_rdaddress;
    wire [15:0] ctu_end_mem_rdata;
    wire [15:0] ctu_end_mem_wdata;
    wire [3:0] ctu_end_mem_wraddress;
    wire       ctu_end_mem_wren;
    // ctu_str_mem port wires:
    wire       ctu_str_mem_clock;
    wire [3:0] ctu_str_mem_rdaddress;
    wire [43:0] ctu_str_mem_rdata;
    wire [43:0] ctu_str_mem_wdata;
    wire [3:0] ctu_str_mem_wraddress;
    wire       ctu_str_mem_wren;
    // cu_info_mem port wires:
    wire       cu_info_mem_clock;
    wire [11:0] cu_info_mem_rdaddress;
    wire [7:0] cu_info_mem_rdata;
    wire [7:0] cu_info_mem_wdata;
    wire [11:0] cu_info_mem_wraddress;
    wire       cu_info_mem_wren;
    // cu_info_mem_2 port wires:
    wire       cu_info_mem_2_clock;
    wire [11:0] cu_info_mem_2_rdaddress;
    wire [7:0] cu_info_mem_2_rdata;
    wire [7:0] cu_info_mem_2_wdata;
    wire [11:0] cu_info_mem_2_wraddress;
    wire       cu_info_mem_2_wren;
    // exec_end port wires:
    wire       exec_end_arst_n;
    wire [22:0] exec_end_buffer_rsc_dat;
    wire       exec_end_buffer_rsc_rdy;
    wire       exec_end_buffer_rsc_vld;
    wire [3:0] exec_end_cabac_rsc_adr;
    wire [127:0] exec_end_cabac_rsc_d;
    wire [127:0] exec_end_cabac_rsc_q;
    wire       exec_end_cabac_rsc_we;
    wire       exec_end_clk;
    wire [3:0] exec_end_ctu_end_rsc_adr;
    wire [15:0] exec_end_ctu_end_rsc_q;
    wire [11:0] exec_end_cu_cu_cu_info_rsc_adr;
    wire [31:0] exec_end_cu_cu_cu_info_rsc_d;
    wire [31:0] exec_end_cu_cu_cu_info_rsc_q;
    wire       exec_end_cu_cu_cu_info_rsc_we;
    wire [7:0] exec_end_cu_cu_hor_cu_info_rsc_adr;
    wire [7:0] exec_end_cu_cu_hor_cu_info_rsc_d;
    wire [7:0] exec_end_cu_cu_hor_cu_info_rsc_q;
    wire       exec_end_cu_cu_hor_cu_info_rsc_we;
    wire [7:0] exec_end_cu_cu_ver_cu_info_rsc_adr;
    wire [7:0] exec_end_cu_cu_ver_cu_info_rsc_d;
    wire [7:0] exec_end_cu_cu_ver_cu_info_rsc_q;
    wire       exec_end_cu_cu_ver_cu_info_rsc_we;
    wire [21:0] exec_end_inst_input_rsc_dat;
    wire       exec_end_inst_input_rsc_rdy;
    wire       exec_end_inst_input_rsc_vld;
    wire [191:0] exec_end_result_in_rsc_dat;
    wire       exec_end_result_in_rsc_rdy;
    wire       exec_end_result_in_rsc_vld;
    wire [5:0] exec_end_stack_rsc_adr;
    wire [104:0] exec_end_stack_rsc_d;
    wire [104:0] exec_end_stack_rsc_q;
    wire       exec_end_stack_rsc_we;
    // exec_end_stack port wires:
    wire [5:0] exec_end_stack_address;
    wire       exec_end_stack_clock;
    wire [104:0] exec_end_stack_data;
    wire [104:0] exec_end_stack_q;
    wire       exec_end_stack_wren;
    // exec_str port wires:
    wire       exec_str_arst_n;
    wire       exec_str_clk;
    wire [3:0] exec_str_ctu_str_rsc_adr;
    wire [43:0] exec_str_ctu_str_rsc_q;
    wire [11:0] exec_str_cu_cu_cu_info_rsc_adr;
    wire [7:0] exec_str_cu_cu_cu_info_rsc_q;
    wire [7:0] exec_str_cu_cu_hor_cu_info_rsc_adr;
    wire [7:0] exec_str_cu_cu_hor_cu_info_rsc_d;
    wire [7:0] exec_str_cu_cu_hor_cu_info_rsc_q;
    wire       exec_str_cu_cu_hor_cu_info_rsc_we;
    wire [47:0] exec_str_init_chroma_rsc_dat;
    wire       exec_str_init_chroma_rsc_rdy;
    wire       exec_str_init_chroma_rsc_vld;
    wire [21:0] exec_str_inst_input_rsc_dat;
    wire       exec_str_inst_input_rsc_rdy;
    wire       exec_str_inst_input_rsc_vld;
    wire [21:0] exec_str_inst_out_rsc_dat;
    wire       exec_str_inst_out_rsc_rdy;
    wire       exec_str_inst_out_rsc_vld;
    wire [47:0] exec_str_ip_ctrl_rsc_dat;
    wire       exec_str_ip_ctrl_rsc_rdy;
    wire       exec_str_ip_ctrl_rsc_vld;
    wire [15:0] exec_str_irq_rsc_dat;
    // init_chroma port wires:
    wire       init_chroma_aclr_n;
    wire       init_chroma_clk;
    wire [47:0] init_chroma_d;
    wire       init_chroma_d_rdy;
    wire       init_chroma_d_vld;
    wire [47:0] init_chroma_q;
    wire       init_chroma_q_rdy;
    wire       init_chroma_q_vld;
    // init_ctu port wires:
    wire       init_ctu_arst_n;
    wire       init_ctu_clk;
    wire       init_ctu_conf_in_lz_rsc_dat;
    wire [31:0] init_ctu_conf_in_rsc_dat;
    wire       init_ctu_conf_in_rsc_rdy;
    wire       init_ctu_conf_in_rsc_vld;
    wire [3:0] init_ctu_ctu_end_rsc_adr;
    wire [15:0] init_ctu_ctu_end_rsc_d;
    wire       init_ctu_ctu_end_rsc_we;
    wire [3:0] init_ctu_ctu_str_rsc_adr;
    wire [43:0] init_ctu_ctu_str_rsc_d;
    wire       init_ctu_ctu_str_rsc_we;
    wire [11:0] init_ctu_cu_feedback_cu_info_rsc_adr;
    wire [7:0] init_ctu_cu_feedback_cu_info_rsc_q;
    wire [47:0] init_ctu_init_chroma_in_rsc_dat;
    wire       init_ctu_init_chroma_in_rsc_rdy;
    wire       init_ctu_init_chroma_in_rsc_vld;
    wire       init_ctu_init_chroma_lz_rsc_dat;
    wire [12:0] init_ctu_inst_rsc_adr;
    wire [22:0] init_ctu_inst_rsc_d;
    wire       init_ctu_inst_rsc_we;
    wire [8:0] init_ctu_scheduler_rsc_dat;
    wire       init_ctu_scheduler_rsc_rdy;
    wire       init_ctu_scheduler_rsc_vld;
    // inst_mem port wires:
    wire       inst_mem_clock;
    wire [12:0] inst_mem_rdaddress;
    wire [22:0] inst_mem_rdata;
    wire [22:0] inst_mem_wdata;
    wire [12:0] inst_mem_wraddress;
    wire       inst_mem_wren;
    // lcu_end_inst_fb_fifo port wires:
    wire       lcu_end_inst_fb_fifo_aclr_n;
    wire       lcu_end_inst_fb_fifo_clk;
    wire [22:0] lcu_end_inst_fb_fifo_d;
    wire       lcu_end_inst_fb_fifo_d_rdy;
    wire       lcu_end_inst_fb_fifo_d_vld;
    wire [22:0] lcu_end_inst_fb_fifo_q;
    wire       lcu_end_inst_fb_fifo_q_rdy;
    wire       lcu_end_inst_fb_fifo_q_vld;
    // lcu_sched port wires:
    wire       lcu_sched_aclr_n;
    wire       lcu_sched_clk;
    wire [21:0] lcu_sched_d;
    wire       lcu_sched_d_rdy;
    wire       lcu_sched_d_vld;
    wire [21:0] lcu_sched_q;
    wire       lcu_sched_q_rdy;
    wire       lcu_sched_q_vld;
    // lcu_str port wires:
    wire       lcu_str_aclr_n;
    wire       lcu_str_clk;
    wire [21:0] lcu_str_d;
    wire       lcu_str_d_rdy;
    wire       lcu_str_d_vld;
    wire [21:0] lcu_str_q;
    wire       lcu_str_q_rdy;
    wire       lcu_str_q_vld;
    // rec_coeff_buffer port wires:
    wire       rec_coeff_buffer_arst_n;
    wire       rec_coeff_buffer_clk;
    wire [511:0] rec_coeff_buffer_coeff_in_rsc_dat;
    wire       rec_coeff_buffer_coeff_in_rsc_rdy;
    wire       rec_coeff_buffer_coeff_in_rsc_vld;
    wire [22:0] rec_coeff_buffer_conf_in_rsc_dat;
    wire       rec_coeff_buffer_conf_in_rsc_rdy;
    wire       rec_coeff_buffer_conf_in_rsc_vld;
    wire [191:0] rec_coeff_buffer_conf_out_rsc_dat;
    wire       rec_coeff_buffer_conf_out_rsc_rdy;
    wire       rec_coeff_buffer_conf_out_rsc_vld;
    wire [4:0] rec_coeff_buffer_inst_done_rsc_dat;
    wire       rec_coeff_buffer_inst_done_rsc_rdy;
    wire       rec_coeff_buffer_inst_done_rsc_vld;
    wire [11:0] rec_coeff_buffer_lcu_coeff_rsc_adr;
    wire [513:0] rec_coeff_buffer_lcu_coeff_rsc_d;
    wire [513:0] rec_coeff_buffer_lcu_coeff_rsc_q;
    wire       rec_coeff_buffer_lcu_coeff_rsc_we;
    wire [8:0] rec_coeff_buffer_lcu_rec_left_rsc_adr;
    wire [31:0] rec_coeff_buffer_lcu_rec_left_rsc_d;
    wire       rec_coeff_buffer_lcu_rec_left_rsc_we;
    wire [11:0] rec_coeff_buffer_lcu_rec_rsc_adr;
    wire [287:0] rec_coeff_buffer_lcu_rec_rsc_d;
    wire [287:0] rec_coeff_buffer_lcu_rec_rsc_q;
    wire       rec_coeff_buffer_lcu_rec_rsc_we;
    wire [12:0] rec_coeff_buffer_lcu_rec_top_left_rsc_adr;
    wire [7:0] rec_coeff_buffer_lcu_rec_top_left_rsc_d;
    wire       rec_coeff_buffer_lcu_rec_top_left_rsc_we;
    wire [8:0] rec_coeff_buffer_lcu_rec_top_rsc_adr;
    wire [31:0] rec_coeff_buffer_lcu_rec_top_rsc_d;
    wire       rec_coeff_buffer_lcu_rec_top_rsc_we;
    wire [255:0] rec_coeff_buffer_rec_in_rsc_dat;
    wire       rec_coeff_buffer_rec_in_rsc_rdy;
    wire       rec_coeff_buffer_rec_in_rsc_vld;
    // scheduler port wires:
    wire       scheduler_arst_n;
    wire       scheduler_clk;
    wire [8:0] scheduler_conf_in_rsc_dat;
    wire       scheduler_conf_in_rsc_rdy;
    wire       scheduler_conf_in_rsc_vld;
    wire [4:0] scheduler_inst_done_rsc_dat;
    wire       scheduler_inst_done_rsc_rdy;
    wire       scheduler_inst_done_rsc_vld;
    wire [21:0] scheduler_inst_out_rsc_dat;
    wire       scheduler_inst_out_rsc_rdy;
    wire       scheduler_inst_out_rsc_vld;
    wire [12:0] scheduler_inst_rsc_adr;
    wire [22:0] scheduler_inst_rsc_q;

    // Assignments for the ports of the encompassing component:
    assign rec_coeff_buffer_arst_n_to_arst_n_arst_n = arst_n;
    assign cabac_rsc_adr = exec_end_cabac_rsc_to_bus_ADDR;
    assign cabac_rsc_d = exec_end_cabac_rsc_to_bus_WDATA;
    assign exec_end_cabac_rsc_to_bus_RDATA = cabac_rsc_q;
    assign cabac_rsc_we = exec_end_cabac_rsc_to_bus_WREN;
    assign exec_end_clk_to_clk_CLK = clk;
    assign rec_coeff_buffer_coeff_in_rsc_to_bus_DAT = coeff_in_rsc_dat;
    assign coeff_in_rsc_rdy = rec_coeff_buffer_coeff_in_rsc_to_bus_RDY;
    assign rec_coeff_buffer_coeff_in_rsc_to_bus_VLD = coeff_in_rsc_vld;
    assign init_ctu_conf_in_rsc_to_bus_DAT = conf_in_rsc_dat;
    assign conf_in_rsc_rdy = init_ctu_conf_in_rsc_to_bus_RDY;
    assign init_ctu_conf_in_rsc_to_bus_VLD = conf_in_rsc_vld;
    assign init_ctu_conf_in_lz_rsc_dat_to_conf_in_rsc_vld = conf_in_rsc_vld;
    assign conf_out_rsc_dat = build_reference_border_conf_out_rsc_to_bus_DAT;
    assign build_reference_border_conf_out_rsc_to_bus_RDY = conf_out_rsc_rdy;
    assign conf_out_rsc_vld = build_reference_border_conf_out_rsc_to_bus_VLD;
    assign cu_cu_cu_info_rsc_adr = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_ADDR;
    assign cu_cu_cu_info_rsc_d = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WDATA;
    assign cu_cu_cu_info_rsc_d_1 = exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_WDATA;
    assign exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_RDATA = cu_cu_cu_info_rsc_q;
    assign exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_RDATA = cu_cu_cu_info_rsc_q_1;
    assign cu_cu_cu_info_rsc_we = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WREN;
    assign cu_cu_hor_cu_info_rsc_adr = exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_ADDR;
    assign cu_cu_hor_cu_info_rsc_adr_1 = exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_ADDR;
    assign cu_cu_hor_cu_info_rsc_d = exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_WDATA;
    assign exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_RDATA = cu_cu_hor_cu_info_rsc_q;
    assign cu_cu_hor_cu_info_rsc_we = exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_WREN;
    assign cu_cu_hor_cu_info_rsc_we_1 = exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_WREN;
    assign cu_cu_ver_cu_info_rsc_adr = exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_ADDR;
    assign cu_cu_ver_cu_info_rsc_d = exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_WDATA;
    assign exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_RDATA = cu_cu_ver_cu_info_rsc_q;
    assign cu_cu_ver_cu_info_rsc_we = exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_WREN;
    assign irq_rsc_dat = exec_str_irq_rsc_to_lcu_poll_DAT;
    assign lcu_border_left_rsc_adr = build_reference_border_lcu_border_left_rsc_to_lcu_border_left_ADDR;
    assign lcu_border_left_rsc_d = build_reference_border_lcu_border_left_rsc_to_lcu_border_left_WDATA;
    assign build_reference_border_lcu_border_left_rsc_to_lcu_border_left_RDATA = lcu_border_left_rsc_q;
    assign lcu_border_left_rsc_we = build_reference_border_lcu_border_left_rsc_to_lcu_border_left_WREN;
    assign lcu_border_top_rsc_adr = build_reference_border_lcu_border_top_rsc_to_lcu_border_top_ADDR;
    assign lcu_border_top_rsc_d = build_reference_border_lcu_border_top_rsc_to_lcu_border_top_WDATA;
    assign build_reference_border_lcu_border_top_rsc_to_lcu_border_top_RDATA = lcu_border_top_rsc_q;
    assign lcu_border_top_rsc_we = build_reference_border_lcu_border_top_rsc_to_lcu_border_top_WREN;
    assign lcu_coeff_rsc_adr = rec_coeff_buffer_lcu_coeff_rsc_to_bus_ADDR;
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[9];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[10];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[11];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[12];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[13];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[14];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[15];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[16];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[17];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[18];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[19];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[20];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[21];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[22];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[23];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[24];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[25];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[26];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[27];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[28];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[29];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[30];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[31];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[8];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[7];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[6];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[3];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[4];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[5];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[0];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[1];
    assign lcu_coeff_rsc_d[512] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[2];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[35];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[36];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[37];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[38];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[39];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[40];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[41];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[42];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[43];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[44];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[45];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[46];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[47];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[48];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[49];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[50];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[51];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[52];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[53];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[54];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[55];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[56];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[57];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[58];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[59];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[60];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[61];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[62];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[63];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[34];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[32];
    assign lcu_coeff_rsc_d[513] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[33];
    assign lcu_coeff_rsc_d[511:0] = rec_coeff_buffer_lcu_coeff_rsc_to_bus_WDATA;
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_RDATA = lcu_coeff_rsc_q_1;
    assign lcu_coeff_rsc_we = rec_coeff_buffer_lcu_coeff_rsc_to_bus_WREN;
    assign lcu_rec_rsc_adr = rec_coeff_buffer_lcu_rec_rsc_to_bus_1_ADDR;
    assign lcu_rec_rsc_d[287:256] = rec_coeff_buffer_lcu_rec_rsc_to_bus_1_BYTEEN;
    assign lcu_rec_rsc_d[255:0] = rec_coeff_buffer_lcu_rec_rsc_to_bus_1_WDATA;
    assign rec_coeff_buffer_lcu_rec_rsc_to_bus_1_RDATA = lcu_rec_rsc_q;
    assign lcu_rec_rsc_we = rec_coeff_buffer_lcu_rec_rsc_to_bus_1_WREN;
    assign rec_coeff_buffer_rec_in_rsc_to_bus_DAT = rec_in_rsc_dat;
    assign rec_in_rsc_rdy = rec_coeff_buffer_rec_in_rsc_to_bus_RDY;
    assign rec_coeff_buffer_rec_in_rsc_to_bus_VLD = rec_in_rsc_vld;


    // LCU_RecLeft assignments:
    assign LCU_RecLeft_clock = exec_end_clk_to_clk_CLK;
    assign LCU_RecLeft_rdaddress = LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_ADDR;
    assign LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_RDATA = LCU_RecLeft_rdata;
    assign LCU_RecLeft_wdata = LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_WDATA;
    assign LCU_RecLeft_wraddress = LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_ADDR;
    assign LCU_RecLeft_wren = LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_WREN;
    // LCU_RecTop assignments:
    assign LCU_RecTop_clock = exec_end_clk_to_clk_CLK;
    assign LCU_RecTop_rdaddress = build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_ADDR;
    assign build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_RDATA = LCU_RecTop_rdata;
    assign LCU_RecTop_wdata = LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_WDATA;
    assign LCU_RecTop_wraddress = LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_ADDR;
    assign LCU_RecTop_wren = LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_WREN;
    // LCU_RecTopLeft assignments:
    assign LCU_RecTopLeft_clock = exec_end_clk_to_clk_CLK;
    assign LCU_RecTopLeft_rdaddress = LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_ADDR;
    assign LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_RDATA = LCU_RecTopLeft_rdata;
    assign LCU_RecTopLeft_wdata = LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_WDATA;
    assign LCU_RecTopLeft_wraddress = LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_ADDR;
    assign LCU_RecTopLeft_wren = LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_WREN;
    // build_reference_border assignments:
    assign build_reference_border_arst_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign build_reference_border_clk = exec_end_clk_to_clk_CLK;
    assign build_reference_border_conf_in_rsc_dat = build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_DAT;
    assign build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_RDY = build_reference_border_conf_in_rsc_rdy;
    assign build_reference_border_conf_in_rsc_vld = build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_VLD;
    assign build_reference_border_conf_out_rsc_to_bus_DAT = build_reference_border_conf_out_rsc_dat;
    assign build_reference_border_conf_out_rsc_rdy = build_reference_border_conf_out_rsc_to_bus_RDY;
    assign build_reference_border_conf_out_rsc_to_bus_VLD = build_reference_border_conf_out_rsc_vld;
    assign build_reference_border_lcu_border_left_rsc_to_lcu_border_left_ADDR = build_reference_border_lcu_border_left_rsc_adr;
    assign build_reference_border_lcu_border_left_rsc_to_lcu_border_left_WDATA = build_reference_border_lcu_border_left_rsc_d;
    assign build_reference_border_lcu_border_left_rsc_q = build_reference_border_lcu_border_left_rsc_to_lcu_border_left_RDATA;
    assign build_reference_border_lcu_border_left_rsc_to_lcu_border_left_WREN = build_reference_border_lcu_border_left_rsc_we;
    assign build_reference_border_lcu_border_top_rsc_to_lcu_border_top_ADDR = build_reference_border_lcu_border_top_rsc_adr;
    assign build_reference_border_lcu_border_top_rsc_to_lcu_border_top_WDATA = build_reference_border_lcu_border_top_rsc_d;
    assign build_reference_border_lcu_border_top_rsc_q = build_reference_border_lcu_border_top_rsc_to_lcu_border_top_RDATA;
    assign build_reference_border_lcu_border_top_rsc_to_lcu_border_top_WREN = build_reference_border_lcu_border_top_rsc_we;
    assign LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_ADDR = build_reference_border_lcu_rec_left_rsc_adr;
    assign build_reference_border_lcu_rec_left_rsc_q = LCU_RecLeft_mem_read_to_build_reference_border_lcu_rec_left_rsc_RDATA;
    assign LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_ADDR = build_reference_border_lcu_rec_top_left_rsc_adr;
    assign build_reference_border_lcu_rec_top_left_rsc_q = LCU_RecTopLeft_mem_read_to_build_reference_border_lcu_rec_top_left_rsc_RDATA;
    assign build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_ADDR = build_reference_border_lcu_rec_top_rsc_adr;
    assign build_reference_border_lcu_rec_top_rsc_q = build_reference_border_lcu_rec_top_rsc_to_LCU_RecTop_mem_read_RDATA;
    // ctu_end_mem assignments:
    assign ctu_end_mem_clock = exec_end_clk_to_clk_CLK;
    assign ctu_end_mem_rdaddress = exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_ADDR;
    assign exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_RDATA = ctu_end_mem_rdata;
    assign ctu_end_mem_wdata = ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_WDATA;
    assign ctu_end_mem_wraddress = ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_ADDR;
    assign ctu_end_mem_wren = ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_WREN;
    // ctu_str_mem assignments:
    assign ctu_str_mem_clock = exec_end_clk_to_clk_CLK;
    assign ctu_str_mem_rdaddress = exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_ADDR;
    assign exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_RDATA = ctu_str_mem_rdata;
    assign ctu_str_mem_wdata = init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_WDATA;
    assign ctu_str_mem_wraddress = init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_ADDR;
    assign ctu_str_mem_wren = init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_WREN;
    // cu_info_mem assignments:
    assign cu_info_mem_clock = exec_end_clk_to_clk_CLK;
    assign cu_info_mem_rdaddress = exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_ADDR;
    assign exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_RDATA = cu_info_mem_rdata;
    assign cu_info_mem_wdata = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WDATA[7:0];
    assign cu_info_mem_wraddress = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_ADDR;
    assign cu_info_mem_wren = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WREN;
    // cu_info_mem_2 assignments:
    assign cu_info_mem_2_clock = exec_end_clk_to_clk_CLK;
    assign cu_info_mem_2_rdaddress = init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_ADDR;
    assign init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_RDATA = cu_info_mem_2_rdata;
    assign cu_info_mem_2_wdata = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WDATA[7:0];
    assign cu_info_mem_2_wraddress = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_ADDR;
    assign cu_info_mem_2_wren = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WREN;
    // exec_end assignments:
    assign exec_end_arst_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_DAT = exec_end_buffer_rsc_dat;
    assign exec_end_buffer_rsc_rdy = exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_RDY;
    assign exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_VLD = exec_end_buffer_rsc_vld;
    assign exec_end_cabac_rsc_to_bus_ADDR = exec_end_cabac_rsc_adr;
    assign exec_end_cabac_rsc_to_bus_WDATA = exec_end_cabac_rsc_d;
    assign exec_end_cabac_rsc_q = exec_end_cabac_rsc_to_bus_RDATA;
    assign exec_end_cabac_rsc_to_bus_WREN = exec_end_cabac_rsc_we;
    assign exec_end_clk = exec_end_clk_to_clk_CLK;
    assign exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_ADDR = exec_end_ctu_end_rsc_adr;
    assign exec_end_ctu_end_rsc_q = exec_end_ctu_end_rsc_to_ctu_end_mem_mem_read_RDATA;
    assign exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_ADDR = exec_end_cu_cu_cu_info_rsc_adr;
    assign exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WDATA = exec_end_cu_cu_cu_info_rsc_d;
    assign exec_end_cu_cu_cu_info_rsc_q = exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_RDATA;
    assign exec_end_cu_cu_cu_info_rsc_to_cu_info_rsc_WREN = exec_end_cu_cu_cu_info_rsc_we;
    assign exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_ADDR = exec_end_cu_cu_hor_cu_info_rsc_adr;
    assign exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_WDATA = exec_end_cu_cu_hor_cu_info_rsc_d;
    assign exec_end_cu_cu_hor_cu_info_rsc_q = exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_RDATA;
    assign exec_end_cu_cu_hor_cu_info_rsc_to_cu_info_hor_WREN = exec_end_cu_cu_hor_cu_info_rsc_we;
    assign exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_ADDR = exec_end_cu_cu_ver_cu_info_rsc_adr;
    assign exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_WDATA = exec_end_cu_cu_ver_cu_info_rsc_d;
    assign exec_end_cu_cu_ver_cu_info_rsc_q = exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_RDATA;
    assign exec_end_cu_cu_ver_cu_info_rsc_to_cu_info_ver_WREN = exec_end_cu_cu_ver_cu_info_rsc_we;
    assign exec_end_inst_input_rsc_dat = exec_end_inst_input_rsc_to_lcu_str_data_out_DAT;
    assign exec_end_inst_input_rsc_to_lcu_str_data_out_RDY = exec_end_inst_input_rsc_rdy;
    assign exec_end_inst_input_rsc_vld = exec_end_inst_input_rsc_to_lcu_str_data_out_VLD;
    assign exec_end_result_in_rsc_dat = rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_DAT;
    assign rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_RDY = exec_end_result_in_rsc_rdy;
    assign exec_end_result_in_rsc_vld = rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_VLD;
    assign exec_end_stack_rsc_to_exec_end_stack_mem_ADDR = exec_end_stack_rsc_adr;
    assign exec_end_stack_rsc_to_exec_end_stack_mem_WDATA = exec_end_stack_rsc_d;
    assign exec_end_stack_rsc_q = exec_end_stack_rsc_to_exec_end_stack_mem_RDATA;
    assign exec_end_stack_rsc_to_exec_end_stack_mem_WREN = exec_end_stack_rsc_we;
    // exec_end_stack assignments:
    assign exec_end_stack_address = exec_end_stack_rsc_to_exec_end_stack_mem_ADDR;
    assign exec_end_stack_clock = exec_end_clk_to_clk_CLK;
    assign exec_end_stack_data = exec_end_stack_rsc_to_exec_end_stack_mem_WDATA;
    assign exec_end_stack_rsc_to_exec_end_stack_mem_RDATA = exec_end_stack_q;
    assign exec_end_stack_wren = exec_end_stack_rsc_to_exec_end_stack_mem_WREN;
    // exec_str assignments:
    assign exec_str_arst_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign exec_str_clk = exec_end_clk_to_clk_CLK;
    assign exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_ADDR = exec_str_ctu_str_rsc_adr;
    assign exec_str_ctu_str_rsc_q = exec_str_ctu_str_rsc_to_ctu_str_mem_mem_read_RDATA;
    assign exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_ADDR = exec_str_cu_cu_cu_info_rsc_adr;
    assign exec_str_cu_cu_cu_info_rsc_q = exec_str_cu_cu_cu_info_rsc_to_cu_info_mem_mem_read_RDATA;
    assign exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_ADDR = exec_str_cu_cu_hor_cu_info_rsc_adr;
    assign exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_WDATA = exec_str_cu_cu_hor_cu_info_rsc_d;
    assign exec_str_cu_cu_hor_cu_info_rsc_q = exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_RDATA;
    assign exec_str_cu_cu_hor_cu_info_rsc_to_cu_info_hor_str_WREN = exec_str_cu_cu_hor_cu_info_rsc_we;
    assign exec_str_init_chroma_rsc_to_init_chroma_data_in_DAT = exec_str_init_chroma_rsc_dat;
    assign exec_str_init_chroma_rsc_rdy = exec_str_init_chroma_rsc_to_init_chroma_data_in_RDY;
    assign exec_str_init_chroma_rsc_to_init_chroma_data_in_VLD = exec_str_init_chroma_rsc_vld;
    assign exec_str_inst_input_rsc_dat = exec_str_inst_input_rsc_to_lcu_sched_data_out_DAT;
    assign exec_str_inst_input_rsc_to_lcu_sched_data_out_RDY = exec_str_inst_input_rsc_rdy;
    assign exec_str_inst_input_rsc_vld = exec_str_inst_input_rsc_to_lcu_sched_data_out_VLD;
    assign exec_str_inst_out_rsc_to_lcu_str_data_in_DAT = exec_str_inst_out_rsc_dat;
    assign exec_str_inst_out_rsc_rdy = exec_str_inst_out_rsc_to_lcu_str_data_in_RDY;
    assign exec_str_inst_out_rsc_to_lcu_str_data_in_VLD = exec_str_inst_out_rsc_vld;
    assign build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_DAT = exec_str_ip_ctrl_rsc_dat;
    assign exec_str_ip_ctrl_rsc_rdy = build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_RDY;
    assign build_reference_border_conf_in_rsc_to_exec_str_ip_ctrl_rsc_VLD = exec_str_ip_ctrl_rsc_vld;
    assign exec_str_irq_rsc_to_lcu_poll_DAT = exec_str_irq_rsc_dat;
    // init_chroma assignments:
    assign init_chroma_aclr_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign init_chroma_clk = exec_end_clk_to_clk_CLK;
    assign init_chroma_d = exec_str_init_chroma_rsc_to_init_chroma_data_in_DAT;
    assign exec_str_init_chroma_rsc_to_init_chroma_data_in_RDY = init_chroma_d_rdy;
    assign init_chroma_d_vld = exec_str_init_chroma_rsc_to_init_chroma_data_in_VLD;
    assign init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_DAT = init_chroma_q;
    assign init_chroma_q_rdy = init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_RDY;
    assign init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_VLD = init_chroma_q_vld;
    assign init_chroma_q_vld_to_init_ctu_init_chroma_lz_rsc_dat = init_chroma_q_vld;
    // init_ctu assignments:
    assign init_ctu_arst_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign init_ctu_clk = exec_end_clk_to_clk_CLK;
    assign init_ctu_conf_in_lz_rsc_dat = init_ctu_conf_in_lz_rsc_dat_to_conf_in_rsc_vld;
    assign init_ctu_conf_in_rsc_dat = init_ctu_conf_in_rsc_to_bus_DAT;
    assign init_ctu_conf_in_rsc_to_bus_RDY = init_ctu_conf_in_rsc_rdy;
    assign init_ctu_conf_in_rsc_vld = init_ctu_conf_in_rsc_to_bus_VLD;
    assign ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_ADDR = init_ctu_ctu_end_rsc_adr;
    assign ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_WDATA = init_ctu_ctu_end_rsc_d;
    assign ctu_end_mem_mem_write_to_init_ctu_ctu_end_rsc_WREN = init_ctu_ctu_end_rsc_we;
    assign init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_ADDR = init_ctu_ctu_str_rsc_adr;
    assign init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_WDATA = init_ctu_ctu_str_rsc_d;
    assign init_ctu_ctu_str_rsc_to_ctu_str_mem_mem_write_WREN = init_ctu_ctu_str_rsc_we;
    assign init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_ADDR = init_ctu_cu_feedback_cu_info_rsc_adr;
    assign init_ctu_cu_feedback_cu_info_rsc_q = init_ctu_cu_feedback_cu_info_rsc_to_cu_info_mem_2_mem_read_RDATA;
    assign init_ctu_init_chroma_in_rsc_dat = init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_DAT;
    assign init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_RDY = init_ctu_init_chroma_in_rsc_rdy;
    assign init_ctu_init_chroma_in_rsc_vld = init_ctu_init_chroma_in_rsc_to_init_chroma_data_out_VLD;
    assign init_ctu_init_chroma_lz_rsc_dat = init_chroma_q_vld_to_init_ctu_init_chroma_lz_rsc_dat;
    assign init_ctu_inst_rsc_to_inst_mem_mem_write_ADDR = init_ctu_inst_rsc_adr;
    assign init_ctu_inst_rsc_to_inst_mem_mem_write_WDATA = init_ctu_inst_rsc_d;
    assign init_ctu_inst_rsc_to_inst_mem_mem_write_WREN = init_ctu_inst_rsc_we;
    assign scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_DAT = init_ctu_scheduler_rsc_dat;
    assign init_ctu_scheduler_rsc_rdy = scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_RDY;
    assign scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_VLD = init_ctu_scheduler_rsc_vld;
    // inst_mem assignments:
    assign inst_mem_clock = exec_end_clk_to_clk_CLK;
    assign inst_mem_rdaddress = scheduler_inst_rsc_to_inst_mem_mem_read_ADDR;
    assign scheduler_inst_rsc_to_inst_mem_mem_read_RDATA = inst_mem_rdata;
    assign inst_mem_wdata = init_ctu_inst_rsc_to_inst_mem_mem_write_WDATA;
    assign inst_mem_wraddress = init_ctu_inst_rsc_to_inst_mem_mem_write_ADDR;
    assign inst_mem_wren = init_ctu_inst_rsc_to_inst_mem_mem_write_WREN;
    // lcu_end_inst_fb_fifo assignments:
    assign lcu_end_inst_fb_fifo_aclr_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign lcu_end_inst_fb_fifo_clk = exec_end_clk_to_clk_CLK;
    assign lcu_end_inst_fb_fifo_d = exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_DAT;
    assign exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_RDY = lcu_end_inst_fb_fifo_d_rdy;
    assign lcu_end_inst_fb_fifo_d_vld = exec_end_buffer_rsc_to_lcu_end_inst_fb_fifo_data_in_VLD;
    assign lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_DAT = lcu_end_inst_fb_fifo_q;
    assign lcu_end_inst_fb_fifo_q_rdy = lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_RDY;
    assign lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_VLD = lcu_end_inst_fb_fifo_q_vld;
    // lcu_sched assignments:
    assign lcu_sched_aclr_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign lcu_sched_clk = exec_end_clk_to_clk_CLK;
    assign lcu_sched_d = scheduler_inst_out_rsc_to_lcu_sched_data_in_DAT;
    assign scheduler_inst_out_rsc_to_lcu_sched_data_in_RDY = lcu_sched_d_rdy;
    assign lcu_sched_d_vld = scheduler_inst_out_rsc_to_lcu_sched_data_in_VLD;
    assign exec_str_inst_input_rsc_to_lcu_sched_data_out_DAT = lcu_sched_q;
    assign lcu_sched_q_rdy = exec_str_inst_input_rsc_to_lcu_sched_data_out_RDY;
    assign exec_str_inst_input_rsc_to_lcu_sched_data_out_VLD = lcu_sched_q_vld;
    // lcu_str assignments:
    assign lcu_str_aclr_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign lcu_str_clk = exec_end_clk_to_clk_CLK;
    assign lcu_str_d = exec_str_inst_out_rsc_to_lcu_str_data_in_DAT;
    assign exec_str_inst_out_rsc_to_lcu_str_data_in_RDY = lcu_str_d_rdy;
    assign lcu_str_d_vld = exec_str_inst_out_rsc_to_lcu_str_data_in_VLD;
    assign exec_end_inst_input_rsc_to_lcu_str_data_out_DAT = lcu_str_q;
    assign lcu_str_q_rdy = exec_end_inst_input_rsc_to_lcu_str_data_out_RDY;
    assign exec_end_inst_input_rsc_to_lcu_str_data_out_VLD = lcu_str_q_vld;
    // rec_coeff_buffer assignments:
    assign rec_coeff_buffer_arst_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign rec_coeff_buffer_clk = exec_end_clk_to_clk_CLK;
    assign rec_coeff_buffer_coeff_in_rsc_dat = rec_coeff_buffer_coeff_in_rsc_to_bus_DAT;
    assign rec_coeff_buffer_coeff_in_rsc_to_bus_RDY = rec_coeff_buffer_coeff_in_rsc_rdy;
    assign rec_coeff_buffer_coeff_in_rsc_vld = rec_coeff_buffer_coeff_in_rsc_to_bus_VLD;
    assign rec_coeff_buffer_conf_in_rsc_dat = lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_DAT;
    assign lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_RDY = rec_coeff_buffer_conf_in_rsc_rdy;
    assign rec_coeff_buffer_conf_in_rsc_vld = lcu_end_inst_fb_fifo_data_out_to_rec_coeff_buffer_conf_in_rsc_VLD;
    assign rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_DAT = rec_coeff_buffer_conf_out_rsc_dat;
    assign rec_coeff_buffer_conf_out_rsc_rdy = rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_RDY;
    assign rec_coeff_buffer_conf_out_rsc_to_exec_end_result_in_rsc_VLD = rec_coeff_buffer_conf_out_rsc_vld;
    assign scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_DAT = rec_coeff_buffer_inst_done_rsc_dat;
    assign rec_coeff_buffer_inst_done_rsc_rdy = scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_RDY;
    assign scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_VLD = rec_coeff_buffer_inst_done_rsc_vld;
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_ADDR = rec_coeff_buffer_lcu_coeff_rsc_adr;
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[9] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[10] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[11] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[12] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[13] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[14] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[15] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[16] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[17] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[18] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[19] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[20] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[21] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[22] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[23] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[24] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[25] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[26] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[27] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[28] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[29] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[30] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[31] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[8] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[7] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[6] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[3] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[4] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[5] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[0] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[1] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[2] = rec_coeff_buffer_lcu_coeff_rsc_d[512];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[35] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[36] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[37] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[38] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[39] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[40] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[41] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[42] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[43] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[44] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[45] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[46] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[47] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[48] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[49] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[50] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[51] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[52] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[53] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[54] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[55] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[56] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[57] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[58] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[59] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[60] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[61] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[62] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[63] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[34] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[32] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_BYTEEN[33] = rec_coeff_buffer_lcu_coeff_rsc_d[513];
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_WDATA = rec_coeff_buffer_lcu_coeff_rsc_d[511:0];
    assign rec_coeff_buffer_lcu_coeff_rsc_q = rec_coeff_buffer_lcu_coeff_rsc_to_bus_RDATA;
    assign rec_coeff_buffer_lcu_coeff_rsc_to_bus_WREN = rec_coeff_buffer_lcu_coeff_rsc_we;
    assign LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_ADDR = rec_coeff_buffer_lcu_rec_left_rsc_adr;
    assign LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_WDATA = rec_coeff_buffer_lcu_rec_left_rsc_d;
    assign LCU_RecLeft_mem_write_to_rec_coeff_buffer_lcu_rec_left_rsc_WREN = rec_coeff_buffer_lcu_rec_left_rsc_we;
    assign rec_coeff_buffer_lcu_rec_rsc_to_bus_1_ADDR = rec_coeff_buffer_lcu_rec_rsc_adr;
    assign rec_coeff_buffer_lcu_rec_rsc_to_bus_1_BYTEEN = rec_coeff_buffer_lcu_rec_rsc_d[287:256];
    assign rec_coeff_buffer_lcu_rec_rsc_to_bus_1_WDATA = rec_coeff_buffer_lcu_rec_rsc_d[255:0];
    assign rec_coeff_buffer_lcu_rec_rsc_q = rec_coeff_buffer_lcu_rec_rsc_to_bus_1_RDATA;
    assign rec_coeff_buffer_lcu_rec_rsc_to_bus_1_WREN = rec_coeff_buffer_lcu_rec_rsc_we;
    assign LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_ADDR = rec_coeff_buffer_lcu_rec_top_left_rsc_adr;
    assign LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_WDATA = rec_coeff_buffer_lcu_rec_top_left_rsc_d;
    assign LCU_RecTopLeft_mem_write_to_rec_coeff_buffer_lcu_rec_top_left_rsc_WREN = rec_coeff_buffer_lcu_rec_top_left_rsc_we;
    assign LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_ADDR = rec_coeff_buffer_lcu_rec_top_rsc_adr;
    assign LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_WDATA = rec_coeff_buffer_lcu_rec_top_rsc_d;
    assign LCU_RecTop_mem_write_to_rec_coeff_buffer_lcu_rec_top_rsc_WREN = rec_coeff_buffer_lcu_rec_top_rsc_we;
    assign rec_coeff_buffer_rec_in_rsc_dat = rec_coeff_buffer_rec_in_rsc_to_bus_DAT;
    assign rec_coeff_buffer_rec_in_rsc_to_bus_RDY = rec_coeff_buffer_rec_in_rsc_rdy;
    assign rec_coeff_buffer_rec_in_rsc_vld = rec_coeff_buffer_rec_in_rsc_to_bus_VLD;
    // scheduler assignments:
    assign scheduler_arst_n = rec_coeff_buffer_arst_n_to_arst_n_arst_n;
    assign scheduler_clk = exec_end_clk_to_clk_CLK;
    assign scheduler_conf_in_rsc_dat = scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_DAT;
    assign scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_RDY = scheduler_conf_in_rsc_rdy;
    assign scheduler_conf_in_rsc_vld = scheduler_conf_in_rsc_to_init_ctu_scheduler_rsc_VLD;
    assign scheduler_inst_done_rsc_dat = scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_DAT;
    assign scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_RDY = scheduler_inst_done_rsc_rdy;
    assign scheduler_inst_done_rsc_vld = scheduler_inst_done_rsc_to_rec_coeff_buffer_inst_done_rsc_VLD;
    assign scheduler_inst_out_rsc_to_lcu_sched_data_in_DAT = scheduler_inst_out_rsc_dat;
    assign scheduler_inst_out_rsc_rdy = scheduler_inst_out_rsc_to_lcu_sched_data_in_RDY;
    assign scheduler_inst_out_rsc_to_lcu_sched_data_in_VLD = scheduler_inst_out_rsc_vld;
    assign scheduler_inst_rsc_to_inst_mem_mem_read_ADDR = scheduler_inst_rsc_adr;
    assign scheduler_inst_rsc_q = scheduler_inst_rsc_to_inst_mem_mem_read_RDATA;

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (32),
        .addr_width_g        (9))
    LCU_RecLeft(
        // Interface: clk
        .clock               (LCU_RecLeft_clock),
        // Interface: mem_read
        .rdaddress           (LCU_RecLeft_rdaddress),
        .rdata               (LCU_RecLeft_rdata),
        // Interface: mem_write
        .wdata               (LCU_RecLeft_wdata),
        .wraddress           (LCU_RecLeft_wraddress),
        .wren                (LCU_RecLeft_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (32),
        .addr_width_g        (9))
    LCU_RecTop(
        // Interface: clk
        .clock               (LCU_RecTop_clock),
        // Interface: mem_read
        .rdaddress           (LCU_RecTop_rdaddress),
        .rdata               (LCU_RecTop_rdata),
        // Interface: mem_write
        .wdata               (LCU_RecTop_wdata),
        .wraddress           (LCU_RecTop_wraddress),
        .wren                (LCU_RecTop_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (8),
        .addr_width_g        (13))
    LCU_RecTopLeft(
        // Interface: clk
        .clock               (LCU_RecTopLeft_clock),
        // Interface: mem_read
        .rdaddress           (LCU_RecTopLeft_rdaddress),
        .rdata               (LCU_RecTopLeft_rdata),
        // Interface: mem_write
        .wdata               (LCU_RecTopLeft_wdata),
        .wraddress           (LCU_RecTopLeft_wraddress),
        .wren                (LCU_RecTopLeft_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarControl:build_reference_border:1.0
    main_build_reference_border build_reference_border(
        // Interface: arst_n
        .arst_n              (build_reference_border_arst_n),
        // Interface: clk
        .clk                 (build_reference_border_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (build_reference_border_conf_in_rsc_dat),
        .conf_in_rsc_vld     (build_reference_border_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (build_reference_border_conf_in_rsc_rdy),
        // Interface: conf_out_rsc
        .conf_out_rsc_rdy    (build_reference_border_conf_out_rsc_rdy),
        .conf_out_rsc_dat    (build_reference_border_conf_out_rsc_dat),
        .conf_out_rsc_vld    (build_reference_border_conf_out_rsc_vld),
        // Interface: lcu_border_left_rsc
        .lcu_border_left_rsc_q(build_reference_border_lcu_border_left_rsc_q),
        .lcu_border_left_rsc_adr(build_reference_border_lcu_border_left_rsc_adr),
        .lcu_border_left_rsc_d(build_reference_border_lcu_border_left_rsc_d),
        .lcu_border_left_rsc_we(build_reference_border_lcu_border_left_rsc_we),
        // Interface: lcu_border_top_rsc
        .lcu_border_top_rsc_q(build_reference_border_lcu_border_top_rsc_q),
        .lcu_border_top_rsc_adr(build_reference_border_lcu_border_top_rsc_adr),
        .lcu_border_top_rsc_d(build_reference_border_lcu_border_top_rsc_d),
        .lcu_border_top_rsc_we(build_reference_border_lcu_border_top_rsc_we),
        // Interface: lcu_rec_left_rsc
        .lcu_rec_left_rsc_q  (build_reference_border_lcu_rec_left_rsc_q),
        .lcu_rec_left_rsc_adr(build_reference_border_lcu_rec_left_rsc_adr),
        .lcu_rec_left_rsc_d  (),
        .lcu_rec_left_rsc_we (),
        // Interface: lcu_rec_top_left_rsc
        .lcu_rec_top_left_rsc_q(build_reference_border_lcu_rec_top_left_rsc_q),
        .lcu_rec_top_left_rsc_adr(build_reference_border_lcu_rec_top_left_rsc_adr),
        .lcu_rec_top_left_rsc_d(),
        .lcu_rec_top_left_rsc_we(),
        // Interface: lcu_rec_top_rsc
        .lcu_rec_top_rsc_q   (build_reference_border_lcu_rec_top_rsc_q),
        .lcu_rec_top_rsc_adr (build_reference_border_lcu_rec_top_rsc_adr),
        .lcu_rec_top_rsc_d   (),
        .lcu_rec_top_rsc_we  ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (4))
    ctu_end_mem(
        // Interface: clk
        .clock               (ctu_end_mem_clock),
        // Interface: mem_read
        .rdaddress           (ctu_end_mem_rdaddress),
        .rdata               (ctu_end_mem_rdata),
        // Interface: mem_write
        .wdata               (ctu_end_mem_wdata),
        .wraddress           (ctu_end_mem_wraddress),
        .wren                (ctu_end_mem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (44),
        .addr_width_g        (4))
    ctu_str_mem(
        // Interface: clk
        .clock               (ctu_str_mem_clock),
        // Interface: mem_read
        .rdaddress           (ctu_str_mem_rdaddress),
        .rdata               (ctu_str_mem_rdata),
        // Interface: mem_write
        .wdata               (ctu_str_mem_wdata),
        .wraddress           (ctu_str_mem_wraddress),
        .wren                (ctu_str_mem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (8),
        .addr_width_g        (12))
    cu_info_mem(
        // Interface: clk
        .clock               (cu_info_mem_clock),
        // Interface: mem_read
        .rdaddress           (cu_info_mem_rdaddress),
        .rdata               (cu_info_mem_rdata),
        // Interface: mem_write
        .wdata               (cu_info_mem_wdata),
        .wraddress           (cu_info_mem_wraddress),
        .wren                (cu_info_mem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (8),
        .addr_width_g        (12))
    cu_info_mem_2(
        // Interface: clk
        .clock               (cu_info_mem_2_clock),
        // Interface: mem_read
        .rdaddress           (cu_info_mem_2_rdaddress),
        .rdata               (cu_info_mem_2_rdata),
        // Interface: mem_write
        .wdata               (cu_info_mem_2_wdata),
        .wraddress           (cu_info_mem_2_wraddress),
        .wren                (cu_info_mem_2_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarControl:exec_end:1.0
    exec_end exec_end(
        // Interface: arst_n
        .arst_n              (exec_end_arst_n),
        // Interface: buffer_rsc
        .buffer_rsc_rdy      (exec_end_buffer_rsc_rdy),
        .buffer_rsc_dat      (exec_end_buffer_rsc_dat),
        .buffer_rsc_vld      (exec_end_buffer_rsc_vld),
        // Interface: cabac_rsc
        .cabac_rsc_q         (exec_end_cabac_rsc_q),
        .cabac_rsc_adr       (exec_end_cabac_rsc_adr),
        .cabac_rsc_d         (exec_end_cabac_rsc_d),
        .cabac_rsc_we        (exec_end_cabac_rsc_we),
        // Interface: clk
        .clk                 (exec_end_clk),
        // Interface: ctu_end_rsc
        .ctu_end_rsc_q       (exec_end_ctu_end_rsc_q),
        .ctu_end_rsc_adr     (exec_end_ctu_end_rsc_adr),
        .ctu_end_rsc_d       (),
        .ctu_end_rsc_we      (),
        // Interface: cu_cu_cu_info_rsc
        .cu_cu_cu_info_rsc_q (exec_end_cu_cu_cu_info_rsc_q),
        .cu_cu_cu_info_rsc_adr(exec_end_cu_cu_cu_info_rsc_adr),
        .cu_cu_cu_info_rsc_d (exec_end_cu_cu_cu_info_rsc_d),
        .cu_cu_cu_info_rsc_we(exec_end_cu_cu_cu_info_rsc_we),
        // Interface: cu_cu_hor_cu_info_rsc
        .cu_cu_hor_cu_info_rsc_q(exec_end_cu_cu_hor_cu_info_rsc_q),
        .cu_cu_hor_cu_info_rsc_adr(exec_end_cu_cu_hor_cu_info_rsc_adr),
        .cu_cu_hor_cu_info_rsc_d(exec_end_cu_cu_hor_cu_info_rsc_d),
        .cu_cu_hor_cu_info_rsc_we(exec_end_cu_cu_hor_cu_info_rsc_we),
        // Interface: cu_cu_ver_cu_info_rsc
        .cu_cu_ver_cu_info_rsc_q(exec_end_cu_cu_ver_cu_info_rsc_q),
        .cu_cu_ver_cu_info_rsc_adr(exec_end_cu_cu_ver_cu_info_rsc_adr),
        .cu_cu_ver_cu_info_rsc_d(exec_end_cu_cu_ver_cu_info_rsc_d),
        .cu_cu_ver_cu_info_rsc_we(exec_end_cu_cu_ver_cu_info_rsc_we),
        // Interface: inst_input_rsc
        .inst_input_rsc_dat  (exec_end_inst_input_rsc_dat),
        .inst_input_rsc_vld  (exec_end_inst_input_rsc_vld),
        .inst_input_rsc_rdy  (exec_end_inst_input_rsc_rdy),
        // Interface: result_in_rsc
        .result_in_rsc_dat   (exec_end_result_in_rsc_dat),
        .result_in_rsc_vld   (exec_end_result_in_rsc_vld),
        .result_in_rsc_rdy   (exec_end_result_in_rsc_rdy),
        // Interface: stack_rsc
        .stack_rsc_q         (exec_end_stack_rsc_q),
        .stack_rsc_adr       (exec_end_stack_rsc_adr),
        .stack_rsc_d         (exec_end_stack_rsc_d),
        .stack_rsc_we        (exec_end_stack_rsc_we));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemorySinglePort:1.0
    OnChipMemorySinglePort     exec_end_stack(
        // Interface: clk
        .clock               (exec_end_stack_clock),
        // Interface: mem
        .address             (exec_end_stack_address),
        .data                (exec_end_stack_data),
        .wren                (exec_end_stack_wren),
        .q                   (exec_end_stack_q));

    // IP-XACT VLNV: tuni.fi:KvazaarControl:exec_str:1.0
    exec_str exec_str(
        // Interface: arst_n
        .arst_n              (exec_str_arst_n),
        // Interface: clk
        .clk                 (exec_str_clk),
        // Interface: ctu_str_rsc
        .ctu_str_rsc_q       (exec_str_ctu_str_rsc_q),
        .ctu_str_rsc_adr     (exec_str_ctu_str_rsc_adr),
        .ctu_str_rsc_d       (),
        .ctu_str_rsc_we      (),
        // Interface: cu_cu_cu_info_rsc
        .cu_cu_cu_info_rsc_q (exec_str_cu_cu_cu_info_rsc_q),
        .cu_cu_cu_info_rsc_adr(exec_str_cu_cu_cu_info_rsc_adr),
        .cu_cu_cu_info_rsc_d (),
        .cu_cu_cu_info_rsc_we(),
        // Interface: cu_cu_hor_cu_info_rsc
        .cu_cu_hor_cu_info_rsc_q(exec_str_cu_cu_hor_cu_info_rsc_q),
        .cu_cu_hor_cu_info_rsc_adr(exec_str_cu_cu_hor_cu_info_rsc_adr),
        .cu_cu_hor_cu_info_rsc_d(exec_str_cu_cu_hor_cu_info_rsc_d),
        .cu_cu_hor_cu_info_rsc_we(exec_str_cu_cu_hor_cu_info_rsc_we),
        // Interface: init_chroma_rsc
        .init_chroma_rsc_rdy (exec_str_init_chroma_rsc_rdy),
        .init_chroma_rsc_dat (exec_str_init_chroma_rsc_dat),
        .init_chroma_rsc_vld (exec_str_init_chroma_rsc_vld),
        // Interface: inst_input_rsc
        .inst_input_rsc_dat  (exec_str_inst_input_rsc_dat),
        .inst_input_rsc_vld  (exec_str_inst_input_rsc_vld),
        .inst_input_rsc_rdy  (exec_str_inst_input_rsc_rdy),
        // Interface: inst_out_rsc
        .inst_out_rsc_rdy    (exec_str_inst_out_rsc_rdy),
        .inst_out_rsc_dat    (exec_str_inst_out_rsc_dat),
        .inst_out_rsc_vld    (exec_str_inst_out_rsc_vld),
        // Interface: ip_ctrl_rsc
        .ip_ctrl_rsc_rdy     (exec_str_ip_ctrl_rsc_rdy),
        .ip_ctrl_rsc_dat     (exec_str_ip_ctrl_rsc_dat),
        .ip_ctrl_rsc_vld     (exec_str_ip_ctrl_rsc_vld),
        // Interface: irq_rsc
        .irq_rsc_dat         (exec_str_irq_rsc_dat));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (48),
        .size_g              (16),
        .use_memory_g        ("OFF"))
    init_chroma(
        // Interface: aclr_n
        .aclr_n              (init_chroma_aclr_n),
        // Interface: clk
        .clk                 (init_chroma_clk),
        // Interface: data_in
        .d                   (init_chroma_d),
        .d_vld               (init_chroma_d_vld),
        .d_rdy               (init_chroma_d_rdy),
        // Interface: data_out
        .q_rdy               (init_chroma_q_rdy),
        .q                   (init_chroma_q),
        .q_vld               (init_chroma_q_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarControl:init_ctu:1.0
    init_ctu init_ctu(
        // Interface: arst_n
        .arst_n              (init_ctu_arst_n),
        // Interface: clk
        .clk                 (init_ctu_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (init_ctu_conf_in_rsc_dat),
        .conf_in_rsc_vld     (init_ctu_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (init_ctu_conf_in_rsc_rdy),
        // Interface: ctu_end_rsc
        .ctu_end_rsc_q       (),
        .ctu_end_rsc_adr     (init_ctu_ctu_end_rsc_adr),
        .ctu_end_rsc_d       (init_ctu_ctu_end_rsc_d),
        .ctu_end_rsc_we      (init_ctu_ctu_end_rsc_we),
        // Interface: ctu_str_rsc
        .ctu_str_rsc_q       (),
        .ctu_str_rsc_adr     (init_ctu_ctu_str_rsc_adr),
        .ctu_str_rsc_d       (init_ctu_ctu_str_rsc_d),
        .ctu_str_rsc_we      (init_ctu_ctu_str_rsc_we),
        // Interface: cu_feedback_cu_info_rsc
        .cu_feedback_cu_info_rsc_q(init_ctu_cu_feedback_cu_info_rsc_q),
        .cu_feedback_cu_info_rsc_adr(init_ctu_cu_feedback_cu_info_rsc_adr),
        .cu_feedback_cu_info_rsc_d(),
        .cu_feedback_cu_info_rsc_we(),
        // Interface: init_chroma_in_rsc
        .init_chroma_in_rsc_dat(init_ctu_init_chroma_in_rsc_dat),
        .init_chroma_in_rsc_vld(init_ctu_init_chroma_in_rsc_vld),
        .init_chroma_in_rsc_rdy(init_ctu_init_chroma_in_rsc_rdy),
        // Interface: inst_rsc
        .inst_rsc_q          (),
        .inst_rsc_adr        (init_ctu_inst_rsc_adr),
        .inst_rsc_d          (init_ctu_inst_rsc_d),
        .inst_rsc_we         (init_ctu_inst_rsc_we),
        // Interface: scheduler_rsc
        .scheduler_rsc_rdy   (init_ctu_scheduler_rsc_rdy),
        .scheduler_rsc_dat   (init_ctu_scheduler_rsc_dat),
        .scheduler_rsc_vld   (init_ctu_scheduler_rsc_vld),
        // These ports are not in any interface
        .conf_in_lz_rsc_dat  (init_ctu_conf_in_lz_rsc_dat),
        .init_chroma_lz_rsc_dat(init_ctu_init_chroma_lz_rsc_dat));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (23),
        .addr_width_g        (13))
    inst_mem(
        // Interface: clk
        .clock               (inst_mem_clock),
        // Interface: mem_read
        .rdaddress           (inst_mem_rdaddress),
        .rdata               (inst_mem_rdata),
        // Interface: mem_write
        .wdata               (inst_mem_wdata),
        .wraddress           (inst_mem_wraddress),
        .wren                (inst_mem_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (23),
        .size_g              (16),
        .use_memory_g        ("OFF"))
    lcu_end_inst_fb_fifo(
        // Interface: aclr_n
        .aclr_n              (lcu_end_inst_fb_fifo_aclr_n),
        // Interface: clk
        .clk                 (lcu_end_inst_fb_fifo_clk),
        // Interface: data_in
        .d                   (lcu_end_inst_fb_fifo_d),
        .d_vld               (lcu_end_inst_fb_fifo_d_vld),
        .d_rdy               (lcu_end_inst_fb_fifo_d_rdy),
        // Interface: data_out
        .q_rdy               (lcu_end_inst_fb_fifo_q_rdy),
        .q                   (lcu_end_inst_fb_fifo_q),
        .q_vld               (lcu_end_inst_fb_fifo_q_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (22),
        .size_g              (16),
        .use_memory_g        ("OFF"))
    lcu_sched(
        // Interface: aclr_n
        .aclr_n              (lcu_sched_aclr_n),
        // Interface: clk
        .clk                 (lcu_sched_clk),
        // Interface: data_in
        .d                   (lcu_sched_d),
        .d_vld               (lcu_sched_d_vld),
        .d_rdy               (lcu_sched_d_rdy),
        // Interface: data_out
        .q_rdy               (lcu_sched_q_rdy),
        .q                   (lcu_sched_q),
        .q_vld               (lcu_sched_q_vld));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (22),
        .size_g              (16),
        .use_memory_g        ("OFF"))
    lcu_str(
        // Interface: aclr_n
        .aclr_n              (lcu_str_aclr_n),
        // Interface: clk
        .clk                 (lcu_str_clk),
        // Interface: data_in
        .d                   (lcu_str_d),
        .d_vld               (lcu_str_d_vld),
        .d_rdy               (lcu_str_d_rdy),
        // Interface: data_out
        .q_rdy               (lcu_str_q_rdy),
        .q                   (lcu_str_q),
        .q_vld               (lcu_str_q_vld));

    // IP-XACT VLNV: tuni.fi:KvazaarControl:rec_coeff_buffer:1.0
    rec_coeff_buffer_0     rec_coeff_buffer(
        // Interface: arst_n
        .arst_n              (rec_coeff_buffer_arst_n),
        // Interface: clk
        .clk                 (rec_coeff_buffer_clk),
        // Interface: coeff_in_rsc
        .coeff_in_rsc_dat    (rec_coeff_buffer_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (rec_coeff_buffer_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (rec_coeff_buffer_coeff_in_rsc_rdy),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (rec_coeff_buffer_conf_in_rsc_dat),
        .conf_in_rsc_vld     (rec_coeff_buffer_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (rec_coeff_buffer_conf_in_rsc_rdy),
        // Interface: conf_out_rsc
        .conf_out_rsc_rdy    (rec_coeff_buffer_conf_out_rsc_rdy),
        .conf_out_rsc_dat    (rec_coeff_buffer_conf_out_rsc_dat),
        .conf_out_rsc_vld    (rec_coeff_buffer_conf_out_rsc_vld),
        // Interface: inst_done_rsc
        .inst_done_rsc_rdy   (rec_coeff_buffer_inst_done_rsc_rdy),
        .inst_done_rsc_dat   (rec_coeff_buffer_inst_done_rsc_dat),
        .inst_done_rsc_vld   (rec_coeff_buffer_inst_done_rsc_vld),
        // Interface: lcu_coeff_rsc
        .lcu_coeff_rsc_q     (rec_coeff_buffer_lcu_coeff_rsc_q),
        .lcu_coeff_rsc_adr   (rec_coeff_buffer_lcu_coeff_rsc_adr),
        .lcu_coeff_rsc_d     (rec_coeff_buffer_lcu_coeff_rsc_d),
        .lcu_coeff_rsc_we    (rec_coeff_buffer_lcu_coeff_rsc_we),
        // Interface: lcu_rec_left_rsc
        .lcu_rec_left_rsc_q  (),
        .lcu_rec_left_rsc_adr(rec_coeff_buffer_lcu_rec_left_rsc_adr),
        .lcu_rec_left_rsc_d  (rec_coeff_buffer_lcu_rec_left_rsc_d),
        .lcu_rec_left_rsc_we (rec_coeff_buffer_lcu_rec_left_rsc_we),
        // Interface: lcu_rec_rsc
        .lcu_rec_rsc_q       (rec_coeff_buffer_lcu_rec_rsc_q),
        .lcu_rec_rsc_adr     (rec_coeff_buffer_lcu_rec_rsc_adr),
        .lcu_rec_rsc_d       (rec_coeff_buffer_lcu_rec_rsc_d),
        .lcu_rec_rsc_we      (rec_coeff_buffer_lcu_rec_rsc_we),
        // Interface: lcu_rec_top_left_rsc
        .lcu_rec_top_left_rsc_q(),
        .lcu_rec_top_left_rsc_adr(rec_coeff_buffer_lcu_rec_top_left_rsc_adr),
        .lcu_rec_top_left_rsc_d(rec_coeff_buffer_lcu_rec_top_left_rsc_d),
        .lcu_rec_top_left_rsc_we(rec_coeff_buffer_lcu_rec_top_left_rsc_we),
        // Interface: lcu_rec_top_rsc
        .lcu_rec_top_rsc_q_1 (),
        .lcu_rec_top_rsc_adr (rec_coeff_buffer_lcu_rec_top_rsc_adr),
        .lcu_rec_top_rsc_d   (rec_coeff_buffer_lcu_rec_top_rsc_d),
        .lcu_rec_top_rsc_we  (rec_coeff_buffer_lcu_rec_top_rsc_we),
        // Interface: rec_in_rsc
        .rec_in_rsc_dat      (rec_coeff_buffer_rec_in_rsc_dat),
        .rec_in_rsc_vld      (rec_coeff_buffer_rec_in_rsc_vld),
        .rec_in_rsc_rdy      (rec_coeff_buffer_rec_in_rsc_rdy),
        // These ports are not in any interface
        .lcu_rec_top_rsc_q   ());

    // IP-XACT VLNV: tuni.fi:KvazaarControl:scheduler:1.0
    scheduler scheduler(
        // Interface: arst_n
        .arst_n              (scheduler_arst_n),
        // Interface: clk
        .clk                 (scheduler_clk),
        // Interface: conf_in_rsc
        .conf_in_rsc_dat     (scheduler_conf_in_rsc_dat),
        .conf_in_rsc_vld     (scheduler_conf_in_rsc_vld),
        .conf_in_rsc_rdy     (scheduler_conf_in_rsc_rdy),
        // Interface: inst_done_rsc
        .inst_done_rsc_dat   (scheduler_inst_done_rsc_dat),
        .inst_done_rsc_vld   (scheduler_inst_done_rsc_vld),
        .inst_done_rsc_rdy   (scheduler_inst_done_rsc_rdy),
        // Interface: inst_out_rsc
        .inst_out_rsc_rdy    (scheduler_inst_out_rsc_rdy),
        .inst_out_rsc_dat    (scheduler_inst_out_rsc_dat),
        .inst_out_rsc_vld    (scheduler_inst_out_rsc_vld),
        // Interface: inst_rsc
        .inst_rsc_q          (scheduler_inst_rsc_q),
        .inst_rsc_adr        (scheduler_inst_rsc_adr),
        .inst_rsc_d          (),
        .inst_rsc_we         ());


endmodule
