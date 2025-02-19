
module CabacMemories_1 #(
    parameter                              bitstream_addr   = 10,
    parameter                              cabac_addr       = 7,
    parameter                              cabac_metas_pull_addr = 3,
    parameter                              cabac_metas_push_addr = 4,
    parameter                              coeff_addr       = 11,
    parameter                              coeff_width      = 512,
    parameter                              cu_info_addr     = 9,
    parameter                              cu_info_border_addr = 3,
    parameter                              mem_width        = 128
) (
    // Interface: arst_n
    input                               rst_n,

    // Interface: bitstream_a
    input                [9:0]          address_a_7,
    input                [15:0]         byteena_a_7,
    input                [127:0]        data_a_7,
    input                               wren_a_7,
    output               [127:0]        q_a_7,

    // Interface: bitstream_b
    input                [14:0]         ram_a_address_7,
    input                               ram_a_write_7,
    input                [7:0]          ram_a_writedata_7,
    output               [7:0]          ram_a_readdata_7,

    // Interface: cabac_metas_pull_a
    input                [2:0]          address_a_9,
    input                [15:0]         byteena_a_9,
    input                [127:0]        data_a_9,
    input                               wren_a_9,
    output               [127:0]        q_a_9,

    // Interface: cabac_metas_pull_b
    input                [2:0]          address_b,
    input                [127:0]        data_b,
    input                               wren_b,
    output               [127:0]        q_b,

    // Interface: cabac_metas_push_a
    input                [3:0]          address_a_10,
    input                [15:0]         byteena_a_10,
    input                [127:0]        data_a_10,
    input                               wren_a_10,
    output               [127:0]        q_a_10,

    // Interface: cabac_metas_push_b
    input                [3:0]          address_b_1,
    input                [127:0]        data_b_1,
    input                               wren_b_1,
    output               [127:0]        q_b_1,

    // Interface: cabac_states_a
    input                [6:0]          address_a_6,
    input                [15:0]         byteena_a_6,
    input                [127:0]        data_a_6,
    input                               wren_a_6,
    output               [127:0]        q_a_6,

    // Interface: cabac_states_b
    input                [13:0]         ram_a_address_6,
    input                               ram_a_write_6,
    input                [7:0]          ram_a_writedata_6,
    output               [7:0]          ram_a_readdata_6,

    // Interface: clk_base
    input                               clk,

    // Interface: clk_bin_coding
    input                               clock_a,

    // Interface: clk_binarization
    input                               clock_a_1,

    // Interface: clk_intra_base
    input                               clk_intra_base,

    // Interface: clk_mem
    input                               clock_a_2,

    // Interface: coeff_a
    input                [11:0]         address_a_8,
    input                [63:0]         byteena_a_8,
    input                [511:0]        data_a_8,
    input                               wren_a_8,
    output               [511:0]        q_a_8,

    // Interface: coeff_b
    input                [14:0]         ram_a_address_8,
    input                               ram_a_write_8,
    input                [63:0]         ram_a_writedata_8,
    output               [63:0]         ram_a_readdata_8,

    // Interface: cu_info1_a
    input                [8:0]          address_a,
    input                [15:0]         byteena_a,
    input                [127:0]        data_a,
    input                               wren_a,
    output               [127:0]        q_a,

    // Interface: cu_info1_b
    input                [11:0]         ram_a_address,
    input                               ram_a_write,
    input                [31:0]         ram_a_writedata,
    output               [31:0]         ram_a_readdata,

    // Interface: cu_info1_left_a
    input                [2:0]          address_a_2,
    input                [15:0]         byteena_a_2,
    input                [127:0]        data_a_2,
    input                               wren_a_2,
    output               [127:0]        q_a_2,

    // Interface: cu_info1_left_b
    input                [7:0]          ram_a_address_2,
    input                               ram_a_write_2,
    input                [7:0]          ram_a_writedata_2,
    output               [7:0]          ram_a_readdata_2,

    // Interface: cu_info1_top_a
    input                [2:0]          address_a_1,
    input                [15:0]         byteena_a_1,
    input                [127:0]        data_a_1,
    input                               wren_a_1,
    output               [127:0]        q_a_1,

    // Interface: cu_info1_top_b
    input                [7:0]          ram_a_address_1,
    input                               ram_a_write_1,
    input                [7:0]          ram_a_writedata_1,
    output               [7:0]          ram_a_readdata_1,

    // Interface: cu_info2_a
    input                [8:0]          address_a_3,
    input                [15:0]         byteena_a_3,
    input                [127:0]        data_a_3,
    input                               wren_a_3,
    output               [127:0]        q_a_3,

    // Interface: cu_info2_b
    input                [11:0]         ram_a_address_3,
    input                               ram_a_write_3,
    input                [31:0]         ram_a_writedata_3,
    output               [31:0]         ram_a_readdata_3,

    // Interface: cu_info2_left_a
    input                [2:0]          address_a_5,
    input                [15:0]         byteena_a_5,
    input                [127:0]        data_a_5,
    input                               wren_a_5,
    output               [127:0]        q_a_5,

    // Interface: cu_info2_left_b
    input                [7:0]          ram_a_address_5,
    input                               ram_a_write_5,
    input                [7:0]          ram_a_writedata_5,
    output               [7:0]          ram_a_readdata_5,

    // Interface: cu_info2_top_a
    input                [2:0]          address_a_4,
    input                [15:0]         byteena_a_4,
    input                [127:0]        data_a_4,
    input                               wren_a_4,
    output               [127:0]        q_a_4,

    // Interface: cu_info2_top_b
    input                [7:0]          ram_a_address_4,
    input                               ram_a_write_4,
    input                [7:0]          ram_a_writedata_4,
    output               [7:0]          ram_a_readdata_4
);

    // lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b wires:
    wire [9:0] lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_ADDR;
    wire [15:0] lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_BYTEEN;
    wire [127:0] lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_RDATA;
    wire [127:0] lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_WDATA;
    wire       lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_WREN;
    // cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b wires:
    wire [3:0] cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_ADDR;
    wire [15:0] cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_BYTEEN;
    wire [127:0] cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_RDATA;
    wire [127:0] cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_WDATA;
    wire       cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_WREN;
    // lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b wires:
    wire [3:0] lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_ADDR;
    wire [15:0] lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_BYTEEN;
    wire [127:0] lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_RDATA;
    wire [127:0] lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_WDATA;
    wire       lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_WREN;
    // cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b wires:
    wire [9:0] cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_ADDR;
    wire [15:0] cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_BYTEEN;
    wire [127:0] cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_RDATA;
    wire [127:0] cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_WDATA;
    wire       cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_WREN;
    // lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b wires:
    wire [3:0] lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_ADDR;
    wire [15:0] lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_BYTEEN;
    wire [127:0] lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_RDATA;
    wire [127:0] lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_WDATA;
    wire       lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_WREN;
    // lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b wires:
    wire [3:0] lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_ADDR;
    wire [15:0] lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_BYTEEN;
    wire [127:0] lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_RDATA;
    wire [127:0] lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_WDATA;
    wire       lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_WREN;
    // cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b wires:
    wire [7:0] cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_ADDR;
    wire [15:0] cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_BYTEEN;
    wire [127:0] cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_RDATA;
    wire [127:0] cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_WDATA;
    wire       cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_WREN;
    // bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b wires:
    wire [10:0] bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_ADDR;
    wire [15:0] bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_BYTEEN;
    wire [127:0] bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_RDATA;
    wire [127:0] bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_WDATA;
    wire       bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_WREN;
    // coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b wires:
    wire [11:0] coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_ADDR;
    wire [63:0] coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_BYTEEN;
    wire [511:0] coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_RDATA;
    wire [511:0] coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_WDATA;
    wire       coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_WREN;
    // lcu1_RAM_adapter_0_clk_to_clk_base wires:
    wire       lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    // cabac_states_RAM_adapter_0_clk_to_clk_bin_coding wires:
    wire       cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK;
    // coeff_RAM_adapter_0_clk_to_clk_binarization wires:
    wire       coeff_RAM_adapter_0_clk_to_clk_binarization_CLK;
    // cu_info1_top_mem_clk_a_to_clk_mem wires:
    wire       cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    // lcu1_RAM_adapter_0_ram_a_to_cu_info1_b wires:
    wire [11:0] lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_ADDR;
    wire [31:0] lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_RDATA;
    wire [31:0] lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_WDATA;
    wire       lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_WREN;
    // coeff_RAM_adapter_0_ram_a_to_coeff_b wires:
    wire [14:0] coeff_RAM_adapter_0_ram_a_to_coeff_b_ADDR;
    wire [63:0] coeff_RAM_adapter_0_ram_a_to_coeff_b_RDATA;
    wire [63:0] coeff_RAM_adapter_0_ram_a_to_coeff_b_WDATA;
    wire       coeff_RAM_adapter_0_ram_a_to_coeff_b_WREN;
    // bitstream_RAM_adapter_0_ram_a_to_bitstream_b wires:
    wire [14:0] bitstream_RAM_adapter_0_ram_a_to_bitstream_b_ADDR;
    wire [7:0] bitstream_RAM_adapter_0_ram_a_to_bitstream_b_RDATA;
    wire [7:0] bitstream_RAM_adapter_0_ram_a_to_bitstream_b_WDATA;
    wire       bitstream_RAM_adapter_0_ram_a_to_bitstream_b_WREN;
    // cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b wires:
    wire [13:0] cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_ADDR;
    wire [7:0] cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_RDATA;
    wire [7:0] cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_WDATA;
    wire       cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_WREN;
    // lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b wires:
    wire [7:0] lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_ADDR;
    wire [7:0] lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_RDATA;
    wire [7:0] lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_WDATA;
    wire       lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_WREN;
    // lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b wires:
    wire [7:0] lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_ADDR;
    wire [7:0] lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_RDATA;
    wire [7:0] lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_WDATA;
    wire       lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_WREN;
    // lcu2_RAM_adapter_0_ram_a_to_cu_info2_b wires:
    wire [11:0] lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_ADDR;
    wire [31:0] lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_RDATA;
    wire [31:0] lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_WDATA;
    wire       lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_WREN;
    // lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b wires:
    wire [7:0] lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_ADDR;
    wire [7:0] lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_RDATA;
    wire [7:0] lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_WDATA;
    wire       lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_WREN;
    // lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b wires:
    wire [7:0] lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_ADDR;
    wire [7:0] lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_RDATA;
    wire [7:0] lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_WDATA;
    wire       lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_WREN;
    // lcu1_top_RAM_adapter_0_arst_n_to_bus wires:
    wire       lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b wires:
    wire [2:0] cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_ADDR;
    wire [15:0] cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_BYTEEN;
    wire [127:0] cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_RDATA;
    wire [127:0] cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_WDATA;
    wire       cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_WREN;
    // cabac_metas_push_mem_ram_b_to_cabac_metas_push_b wires:
    wire [3:0] cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_ADDR;
    wire [15:0] cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_BYTEEN;
    wire [127:0] cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_RDATA;
    wire [127:0] cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_WDATA;
    wire       cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_WREN;
    // cu_info1_mem_ram_a_to_cu_info1_a wires:
    wire [8:0] cu_info1_mem_ram_a_to_cu_info1_a_ADDR;
    wire [15:0] cu_info1_mem_ram_a_to_cu_info1_a_BYTEEN;
    wire [127:0] cu_info1_mem_ram_a_to_cu_info1_a_RDATA;
    wire [127:0] cu_info1_mem_ram_a_to_cu_info1_a_WDATA;
    wire       cu_info1_mem_ram_a_to_cu_info1_a_WREN;
    // cu_info1_top_mem_ram_a_to_cu_info1_top_a wires:
    wire [2:0] cu_info1_top_mem_ram_a_to_cu_info1_top_a_ADDR;
    wire [15:0] cu_info1_top_mem_ram_a_to_cu_info1_top_a_BYTEEN;
    wire [127:0] cu_info1_top_mem_ram_a_to_cu_info1_top_a_RDATA;
    wire [127:0] cu_info1_top_mem_ram_a_to_cu_info1_top_a_WDATA;
    wire       cu_info1_top_mem_ram_a_to_cu_info1_top_a_WREN;
    // cu_info1_left_mem_ram_a_to_cu_info1_left_a wires:
    wire [2:0] cu_info1_left_mem_ram_a_to_cu_info1_left_a_ADDR;
    wire [15:0] cu_info1_left_mem_ram_a_to_cu_info1_left_a_BYTEEN;
    wire [127:0] cu_info1_left_mem_ram_a_to_cu_info1_left_a_RDATA;
    wire [127:0] cu_info1_left_mem_ram_a_to_cu_info1_left_a_WDATA;
    wire       cu_info1_left_mem_ram_a_to_cu_info1_left_a_WREN;
    // cu_info2_mem_ram_a_to_cu_info2_a wires:
    wire [8:0] cu_info2_mem_ram_a_to_cu_info2_a_ADDR;
    wire [15:0] cu_info2_mem_ram_a_to_cu_info2_a_BYTEEN;
    wire [127:0] cu_info2_mem_ram_a_to_cu_info2_a_RDATA;
    wire [127:0] cu_info2_mem_ram_a_to_cu_info2_a_WDATA;
    wire       cu_info2_mem_ram_a_to_cu_info2_a_WREN;
    // cu_info2_top_mem_ram_a_to_cu_info2_top_a wires:
    wire [2:0] cu_info2_top_mem_ram_a_to_cu_info2_top_a_ADDR;
    wire [15:0] cu_info2_top_mem_ram_a_to_cu_info2_top_a_BYTEEN;
    wire [127:0] cu_info2_top_mem_ram_a_to_cu_info2_top_a_RDATA;
    wire [127:0] cu_info2_top_mem_ram_a_to_cu_info2_top_a_WDATA;
    wire       cu_info2_top_mem_ram_a_to_cu_info2_top_a_WREN;
    // cu_info2_left_mem_ram_a_to_cu_info2_left_a wires:
    wire [2:0] cu_info2_left_mem_ram_a_to_cu_info2_left_a_ADDR;
    wire [15:0] cu_info2_left_mem_ram_a_to_cu_info2_left_a_BYTEEN;
    wire [127:0] cu_info2_left_mem_ram_a_to_cu_info2_left_a_RDATA;
    wire [127:0] cu_info2_left_mem_ram_a_to_cu_info2_left_a_WDATA;
    wire       cu_info2_left_mem_ram_a_to_cu_info2_left_a_WREN;
    // cabac_states_mem_ram_a_to_cabac_states_a wires:
    wire [6:0] cabac_states_mem_ram_a_to_cabac_states_a_ADDR;
    wire [15:0] cabac_states_mem_ram_a_to_cabac_states_a_BYTEEN;
    wire [127:0] cabac_states_mem_ram_a_to_cabac_states_a_RDATA;
    wire [127:0] cabac_states_mem_ram_a_to_cabac_states_a_WDATA;
    wire       cabac_states_mem_ram_a_to_cabac_states_a_WREN;
    // bitstream_mem_ram_a_to_bitstream_a wires:
    wire [9:0] bitstream_mem_ram_a_to_bitstream_a_ADDR;
    wire [15:0] bitstream_mem_ram_a_to_bitstream_a_BYTEEN;
    wire [127:0] bitstream_mem_ram_a_to_bitstream_a_RDATA;
    wire [127:0] bitstream_mem_ram_a_to_bitstream_a_WDATA;
    wire       bitstream_mem_ram_a_to_bitstream_a_WREN;
    // coeff_mem_ram_a_to_coeff_a wires:
    wire [11:0] coeff_mem_ram_a_to_coeff_a_ADDR;
    wire [63:0] coeff_mem_ram_a_to_coeff_a_BYTEEN;
    wire [511:0] coeff_mem_ram_a_to_coeff_a_RDATA;
    wire [511:0] coeff_mem_ram_a_to_coeff_a_WDATA;
    wire       coeff_mem_ram_a_to_coeff_a_WREN;
    // cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a wires:
    wire [2:0] cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_ADDR;
    wire [15:0] cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_BYTEEN;
    wire [127:0] cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_RDATA;
    wire [127:0] cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_WDATA;
    wire       cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_WREN;
    // cabac_metas_push_mem_ram_a_to_cabac_metas_push_a wires:
    wire [3:0] cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_ADDR;
    wire [15:0] cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_BYTEEN;
    wire [127:0] cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_RDATA;
    wire [127:0] cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_WDATA;
    wire       cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_WREN;
    // cu_info1_mem_clk_a_to_clk_intra_base wires:
    wire       cu_info1_mem_clk_a_to_clk_intra_base_CLK;

    // bitstream_RAM_adapter_0 port wires:
    wire       bitstream_RAM_adapter_0_clk;
    wire [14:0] bitstream_RAM_adapter_0_ram_a_address;
    wire [7:0] bitstream_RAM_adapter_0_ram_a_readdata;
    wire       bitstream_RAM_adapter_0_ram_a_write;
    wire [7:0] bitstream_RAM_adapter_0_ram_a_writedata;
    wire [10:0] bitstream_RAM_adapter_0_ram_b_address;
    wire [15:0] bitstream_RAM_adapter_0_ram_b_byteen;
    wire [127:0] bitstream_RAM_adapter_0_ram_b_readdata;
    wire       bitstream_RAM_adapter_0_ram_b_write;
    wire [127:0] bitstream_RAM_adapter_0_ram_b_writedata;
    wire       bitstream_RAM_adapter_0_rst_n;
    // bitstream_mem port wires:
    wire [9:0] bitstream_mem_address_a;
    wire [9:0] bitstream_mem_address_b;
    wire [15:0] bitstream_mem_byteena_a;
    wire [15:0] bitstream_mem_byteena_b;
    wire       bitstream_mem_clock_a;
    wire       bitstream_mem_clock_b;
    wire [127:0] bitstream_mem_data_a;
    wire [127:0] bitstream_mem_data_b;
    wire [127:0] bitstream_mem_q_a;
    wire [127:0] bitstream_mem_q_b;
    wire       bitstream_mem_wren_a;
    wire       bitstream_mem_wren_b;
    // cabac_metas_pull_mem port wires:
    wire [2:0] cabac_metas_pull_mem_address_a;
    wire [2:0] cabac_metas_pull_mem_address_b;
    wire [15:0] cabac_metas_pull_mem_byteena_a;
    wire [15:0] cabac_metas_pull_mem_byteena_b;
    wire       cabac_metas_pull_mem_clock_a;
    wire       cabac_metas_pull_mem_clock_b;
    wire [127:0] cabac_metas_pull_mem_data_a;
    wire [127:0] cabac_metas_pull_mem_data_b;
    wire [127:0] cabac_metas_pull_mem_q_a;
    wire [127:0] cabac_metas_pull_mem_q_b;
    wire       cabac_metas_pull_mem_wren_a;
    wire       cabac_metas_pull_mem_wren_b;
    // cabac_metas_push_mem port wires:
    wire [3:0] cabac_metas_push_mem_address_a;
    wire [3:0] cabac_metas_push_mem_address_b;
    wire [15:0] cabac_metas_push_mem_byteena_a;
    wire [15:0] cabac_metas_push_mem_byteena_b;
    wire       cabac_metas_push_mem_clock_a;
    wire       cabac_metas_push_mem_clock_b;
    wire [127:0] cabac_metas_push_mem_data_a;
    wire [127:0] cabac_metas_push_mem_data_b;
    wire [127:0] cabac_metas_push_mem_q_a;
    wire [127:0] cabac_metas_push_mem_q_b;
    wire       cabac_metas_push_mem_wren_a;
    wire       cabac_metas_push_mem_wren_b;
    // cabac_states_RAM_adapter_0 port wires:
    wire       cabac_states_RAM_adapter_0_clk;
    wire [11:0] cabac_states_RAM_adapter_0_ram_a_address;
    wire [7:0] cabac_states_RAM_adapter_0_ram_a_readdata;
    wire       cabac_states_RAM_adapter_0_ram_a_write;
    wire [7:0] cabac_states_RAM_adapter_0_ram_a_writedata;
    wire [7:0] cabac_states_RAM_adapter_0_ram_b_address;
    wire [15:0] cabac_states_RAM_adapter_0_ram_b_byteen;
    wire [127:0] cabac_states_RAM_adapter_0_ram_b_readdata;
    wire       cabac_states_RAM_adapter_0_ram_b_write;
    wire [127:0] cabac_states_RAM_adapter_0_ram_b_writedata;
    wire       cabac_states_RAM_adapter_0_rst_n;
    // cabac_states_mem port wires:
    wire [6:0] cabac_states_mem_address_a;
    wire [6:0] cabac_states_mem_address_b;
    wire [15:0] cabac_states_mem_byteena_a;
    wire [15:0] cabac_states_mem_byteena_b;
    wire       cabac_states_mem_clock_a;
    wire       cabac_states_mem_clock_b;
    wire [127:0] cabac_states_mem_data_a;
    wire [127:0] cabac_states_mem_data_b;
    wire [127:0] cabac_states_mem_q_a;
    wire [127:0] cabac_states_mem_q_b;
    wire       cabac_states_mem_wren_a;
    wire       cabac_states_mem_wren_b;
    // coeff_RAM_adapter_0 port wires:
    wire       coeff_RAM_adapter_0_clk;
    wire [14:0] coeff_RAM_adapter_0_ram_a_address;
    wire [63:0] coeff_RAM_adapter_0_ram_a_readdata;
    wire       coeff_RAM_adapter_0_ram_a_write;
    wire [63:0] coeff_RAM_adapter_0_ram_a_writedata;
    wire [11:0] coeff_RAM_adapter_0_ram_b_address;
    wire [63:0] coeff_RAM_adapter_0_ram_b_byteen;
    wire [511:0] coeff_RAM_adapter_0_ram_b_readdata;
    wire       coeff_RAM_adapter_0_ram_b_write;
    wire [511:0] coeff_RAM_adapter_0_ram_b_writedata;
    wire       coeff_RAM_adapter_0_rst_n;
    // coeff_mem port wires:
    wire [10:0] coeff_mem_address_a;
    wire [10:0] coeff_mem_address_b;
    wire [63:0] coeff_mem_byteena_a;
    wire [63:0] coeff_mem_byteena_b;
    wire       coeff_mem_clock_a;
    wire       coeff_mem_clock_b;
    wire [511:0] coeff_mem_data_a;
    wire [511:0] coeff_mem_data_b;
    wire [511:0] coeff_mem_q_a;
    wire [511:0] coeff_mem_q_b;
    wire       coeff_mem_wren_a;
    wire       coeff_mem_wren_b;
    // cu_info1_left_mem port wires:
    wire [2:0] cu_info1_left_mem_address_a;
    wire [2:0] cu_info1_left_mem_address_b;
    wire [15:0] cu_info1_left_mem_byteena_a;
    wire [15:0] cu_info1_left_mem_byteena_b;
    wire       cu_info1_left_mem_clock_a;
    wire       cu_info1_left_mem_clock_b;
    wire [127:0] cu_info1_left_mem_data_a;
    wire [127:0] cu_info1_left_mem_data_b;
    wire [127:0] cu_info1_left_mem_q_a;
    wire [127:0] cu_info1_left_mem_q_b;
    wire       cu_info1_left_mem_wren_a;
    wire       cu_info1_left_mem_wren_b;
    // cu_info1_mem port wires:
    wire [8:0] cu_info1_mem_address_a;
    wire [8:0] cu_info1_mem_address_b;
    wire [15:0] cu_info1_mem_byteena_a;
    wire [15:0] cu_info1_mem_byteena_b;
    wire       cu_info1_mem_clock_a;
    wire       cu_info1_mem_clock_b;
    wire [127:0] cu_info1_mem_data_a;
    wire [127:0] cu_info1_mem_data_b;
    wire [127:0] cu_info1_mem_q_a;
    wire [127:0] cu_info1_mem_q_b;
    wire       cu_info1_mem_wren_a;
    wire       cu_info1_mem_wren_b;
    // cu_info1_top_mem port wires:
    wire [2:0] cu_info1_top_mem_address_a;
    wire [2:0] cu_info1_top_mem_address_b;
    wire [15:0] cu_info1_top_mem_byteena_a;
    wire [15:0] cu_info1_top_mem_byteena_b;
    wire       cu_info1_top_mem_clock_a;
    wire       cu_info1_top_mem_clock_b;
    wire [127:0] cu_info1_top_mem_data_a;
    wire [127:0] cu_info1_top_mem_data_b;
    wire [127:0] cu_info1_top_mem_q_a;
    wire [127:0] cu_info1_top_mem_q_b;
    wire       cu_info1_top_mem_wren_a;
    wire       cu_info1_top_mem_wren_b;
    // cu_info2_left_mem port wires:
    wire [2:0] cu_info2_left_mem_address_a;
    wire [2:0] cu_info2_left_mem_address_b;
    wire [15:0] cu_info2_left_mem_byteena_a;
    wire [15:0] cu_info2_left_mem_byteena_b;
    wire       cu_info2_left_mem_clock_a;
    wire       cu_info2_left_mem_clock_b;
    wire [127:0] cu_info2_left_mem_data_a;
    wire [127:0] cu_info2_left_mem_data_b;
    wire [127:0] cu_info2_left_mem_q_a;
    wire [127:0] cu_info2_left_mem_q_b;
    wire       cu_info2_left_mem_wren_a;
    wire       cu_info2_left_mem_wren_b;
    // cu_info2_mem port wires:
    wire [8:0] cu_info2_mem_address_a;
    wire [8:0] cu_info2_mem_address_b;
    wire [15:0] cu_info2_mem_byteena_a;
    wire [15:0] cu_info2_mem_byteena_b;
    wire       cu_info2_mem_clock_a;
    wire       cu_info2_mem_clock_b;
    wire [127:0] cu_info2_mem_data_a;
    wire [127:0] cu_info2_mem_data_b;
    wire [127:0] cu_info2_mem_q_a;
    wire [127:0] cu_info2_mem_q_b;
    wire       cu_info2_mem_wren_a;
    wire       cu_info2_mem_wren_b;
    // cu_info2_top_mem port wires:
    wire [2:0] cu_info2_top_mem_address_a;
    wire [2:0] cu_info2_top_mem_address_b;
    wire [15:0] cu_info2_top_mem_byteena_a;
    wire [15:0] cu_info2_top_mem_byteena_b;
    wire       cu_info2_top_mem_clock_a;
    wire       cu_info2_top_mem_clock_b;
    wire [127:0] cu_info2_top_mem_data_a;
    wire [127:0] cu_info2_top_mem_data_b;
    wire [127:0] cu_info2_top_mem_q_a;
    wire [127:0] cu_info2_top_mem_q_b;
    wire       cu_info2_top_mem_wren_a;
    wire       cu_info2_top_mem_wren_b;
    // lcu1_RAM_adapter_0 port wires:
    wire       lcu1_RAM_adapter_0_clk;
    wire [11:0] lcu1_RAM_adapter_0_ram_a_address;
    wire [31:0] lcu1_RAM_adapter_0_ram_a_readdata;
    wire       lcu1_RAM_adapter_0_ram_a_write;
    wire [31:0] lcu1_RAM_adapter_0_ram_a_writedata;
    wire [9:0] lcu1_RAM_adapter_0_ram_b_address;
    wire [15:0] lcu1_RAM_adapter_0_ram_b_byteen;
    wire [127:0] lcu1_RAM_adapter_0_ram_b_readdata;
    wire       lcu1_RAM_adapter_0_ram_b_write;
    wire [127:0] lcu1_RAM_adapter_0_ram_b_writedata;
    wire       lcu1_RAM_adapter_0_rst_n;
    // lcu1_left_RAM_adapter_0 port wires:
    wire       lcu1_left_RAM_adapter_0_clk;
    wire [7:0] lcu1_left_RAM_adapter_0_ram_a_address;
    wire [7:0] lcu1_left_RAM_adapter_0_ram_a_readdata;
    wire       lcu1_left_RAM_adapter_0_ram_a_write;
    wire [7:0] lcu1_left_RAM_adapter_0_ram_a_writedata;
    wire [3:0] lcu1_left_RAM_adapter_0_ram_b_address;
    wire [15:0] lcu1_left_RAM_adapter_0_ram_b_byteen;
    wire [127:0] lcu1_left_RAM_adapter_0_ram_b_readdata;
    wire       lcu1_left_RAM_adapter_0_ram_b_write;
    wire [127:0] lcu1_left_RAM_adapter_0_ram_b_writedata;
    wire       lcu1_left_RAM_adapter_0_rst_n;
    // lcu1_top_RAM_adapter_0 port wires:
    wire       lcu1_top_RAM_adapter_0_clk;
    wire [7:0] lcu1_top_RAM_adapter_0_ram_a_address;
    wire [7:0] lcu1_top_RAM_adapter_0_ram_a_readdata;
    wire       lcu1_top_RAM_adapter_0_ram_a_write;
    wire [7:0] lcu1_top_RAM_adapter_0_ram_a_writedata;
    wire [3:0] lcu1_top_RAM_adapter_0_ram_b_address;
    wire [15:0] lcu1_top_RAM_adapter_0_ram_b_byteen;
    wire [127:0] lcu1_top_RAM_adapter_0_ram_b_readdata;
    wire       lcu1_top_RAM_adapter_0_ram_b_write;
    wire [127:0] lcu1_top_RAM_adapter_0_ram_b_writedata;
    wire       lcu1_top_RAM_adapter_0_rst_n;
    // lcu2_RAM_adapter_0 port wires:
    wire       lcu2_RAM_adapter_0_clk;
    wire [11:0] lcu2_RAM_adapter_0_ram_a_address;
    wire [31:0] lcu2_RAM_adapter_0_ram_a_readdata;
    wire       lcu2_RAM_adapter_0_ram_a_write;
    wire [31:0] lcu2_RAM_adapter_0_ram_a_writedata;
    wire [9:0] lcu2_RAM_adapter_0_ram_b_address;
    wire [15:0] lcu2_RAM_adapter_0_ram_b_byteen;
    wire [127:0] lcu2_RAM_adapter_0_ram_b_readdata;
    wire       lcu2_RAM_adapter_0_ram_b_write;
    wire [127:0] lcu2_RAM_adapter_0_ram_b_writedata;
    wire       lcu2_RAM_adapter_0_rst_n;
    // lcu2_left_RAM_adapter_0 port wires:
    wire       lcu2_left_RAM_adapter_0_clk;
    wire [7:0] lcu2_left_RAM_adapter_0_ram_a_address;
    wire [7:0] lcu2_left_RAM_adapter_0_ram_a_readdata;
    wire       lcu2_left_RAM_adapter_0_ram_a_write;
    wire [7:0] lcu2_left_RAM_adapter_0_ram_a_writedata;
    wire [3:0] lcu2_left_RAM_adapter_0_ram_b_address;
    wire [15:0] lcu2_left_RAM_adapter_0_ram_b_byteen;
    wire [127:0] lcu2_left_RAM_adapter_0_ram_b_readdata;
    wire       lcu2_left_RAM_adapter_0_ram_b_write;
    wire [127:0] lcu2_left_RAM_adapter_0_ram_b_writedata;
    wire       lcu2_left_RAM_adapter_0_rst_n;
    // lcu2_top_RAM_adapter_0 port wires:
    wire       lcu2_top_RAM_adapter_0_clk;
    wire [7:0] lcu2_top_RAM_adapter_0_ram_a_address;
    wire [7:0] lcu2_top_RAM_adapter_0_ram_a_readdata;
    wire       lcu2_top_RAM_adapter_0_ram_a_write;
    wire [7:0] lcu2_top_RAM_adapter_0_ram_a_writedata;
    wire [3:0] lcu2_top_RAM_adapter_0_ram_b_address;
    wire [15:0] lcu2_top_RAM_adapter_0_ram_b_byteen;
    wire [127:0] lcu2_top_RAM_adapter_0_ram_b_readdata;
    wire       lcu2_top_RAM_adapter_0_ram_b_write;
    wire [127:0] lcu2_top_RAM_adapter_0_ram_b_writedata;
    wire       lcu2_top_RAM_adapter_0_rst_n;

    // Assignments for the ports of the encompassing component:
    assign cu_info1_mem_ram_a_to_cu_info1_a_ADDR = address_a;
    assign cu_info1_top_mem_ram_a_to_cu_info1_top_a_ADDR = address_a_1;
    assign cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_ADDR = address_a_10;
    assign cu_info1_left_mem_ram_a_to_cu_info1_left_a_ADDR = address_a_2;
    assign cu_info2_mem_ram_a_to_cu_info2_a_ADDR = address_a_3;
    assign cu_info2_top_mem_ram_a_to_cu_info2_top_a_ADDR = address_a_4;
    assign cu_info2_left_mem_ram_a_to_cu_info2_left_a_ADDR = address_a_5;
    assign cabac_states_mem_ram_a_to_cabac_states_a_ADDR = address_a_6;
    assign bitstream_mem_ram_a_to_bitstream_a_ADDR = address_a_7;
    assign coeff_mem_ram_a_to_coeff_a_ADDR = address_a_8;
    assign cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_ADDR = address_a_9;
    assign cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_ADDR = address_b;
    assign cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_ADDR = address_b_1;
    assign cu_info1_mem_ram_a_to_cu_info1_a_BYTEEN = byteena_a;
    assign cu_info1_top_mem_ram_a_to_cu_info1_top_a_BYTEEN = byteena_a_1;
    assign cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_BYTEEN = byteena_a_10;
    assign cu_info1_left_mem_ram_a_to_cu_info1_left_a_BYTEEN = byteena_a_2;
    assign cu_info2_mem_ram_a_to_cu_info2_a_BYTEEN = byteena_a_3;
    assign cu_info2_top_mem_ram_a_to_cu_info2_top_a_BYTEEN = byteena_a_4;
    assign cu_info2_left_mem_ram_a_to_cu_info2_left_a_BYTEEN = byteena_a_5;
    assign cabac_states_mem_ram_a_to_cabac_states_a_BYTEEN = byteena_a_6;
    assign bitstream_mem_ram_a_to_bitstream_a_BYTEEN = byteena_a_7;
    assign coeff_mem_ram_a_to_coeff_a_BYTEEN = byteena_a_8;
    assign cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_BYTEEN = byteena_a_9;
    assign lcu1_RAM_adapter_0_clk_to_clk_base_CLK = clk;
    assign cu_info1_mem_clk_a_to_clk_intra_base_CLK = clk_intra_base;
    assign cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK = clock_a;
    assign coeff_RAM_adapter_0_clk_to_clk_binarization_CLK = clock_a_1;
    assign cu_info1_top_mem_clk_a_to_clk_mem_CLK = clock_a_2;
    assign cu_info1_mem_ram_a_to_cu_info1_a_WDATA = data_a;
    assign cu_info1_top_mem_ram_a_to_cu_info1_top_a_WDATA = data_a_1;
    assign cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_WDATA = data_a_10;
    assign cu_info1_left_mem_ram_a_to_cu_info1_left_a_WDATA = data_a_2;
    assign cu_info2_mem_ram_a_to_cu_info2_a_WDATA = data_a_3;
    assign cu_info2_top_mem_ram_a_to_cu_info2_top_a_WDATA = data_a_4;
    assign cu_info2_left_mem_ram_a_to_cu_info2_left_a_WDATA = data_a_5;
    assign cabac_states_mem_ram_a_to_cabac_states_a_WDATA = data_a_6;
    assign bitstream_mem_ram_a_to_bitstream_a_WDATA = data_a_7;
    assign coeff_mem_ram_a_to_coeff_a_WDATA = data_a_8;
    assign cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_WDATA = data_a_9;
    assign cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_WDATA = data_b;
    assign cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_WDATA = data_b_1;
    assign q_a = cu_info1_mem_ram_a_to_cu_info1_a_RDATA;
    assign q_a_1 = cu_info1_top_mem_ram_a_to_cu_info1_top_a_RDATA;
    assign q_a_10 = cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_RDATA;
    assign q_a_2 = cu_info1_left_mem_ram_a_to_cu_info1_left_a_RDATA;
    assign q_a_3 = cu_info2_mem_ram_a_to_cu_info2_a_RDATA;
    assign q_a_4 = cu_info2_top_mem_ram_a_to_cu_info2_top_a_RDATA;
    assign q_a_5 = cu_info2_left_mem_ram_a_to_cu_info2_left_a_RDATA;
    assign q_a_6 = cabac_states_mem_ram_a_to_cabac_states_a_RDATA;
    assign q_a_7 = bitstream_mem_ram_a_to_bitstream_a_RDATA;
    assign q_a_8 = coeff_mem_ram_a_to_coeff_a_RDATA;
    assign q_a_9 = cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_RDATA;
    assign q_b = cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_RDATA;
    assign q_b_1 = cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_RDATA;
    assign lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_ADDR = ram_a_address;
    assign lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_ADDR = ram_a_address_1;
    assign lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_ADDR = ram_a_address_2;
    assign lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_ADDR = ram_a_address_3;
    assign lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_ADDR = ram_a_address_4;
    assign lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_ADDR = ram_a_address_5;
    assign cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_ADDR = ram_a_address_6;
    assign bitstream_RAM_adapter_0_ram_a_to_bitstream_b_ADDR = ram_a_address_7;
    assign coeff_RAM_adapter_0_ram_a_to_coeff_b_ADDR = ram_a_address_8;
    assign ram_a_readdata = lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_RDATA;
    assign ram_a_readdata_1 = lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_RDATA;
    assign ram_a_readdata_2 = lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_RDATA;
    assign ram_a_readdata_3 = lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_RDATA;
    assign ram_a_readdata_4 = lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_RDATA;
    assign ram_a_readdata_5 = lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_RDATA;
    assign ram_a_readdata_6 = cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_RDATA;
    assign ram_a_readdata_7 = bitstream_RAM_adapter_0_ram_a_to_bitstream_b_RDATA;
    assign ram_a_readdata_8 = coeff_RAM_adapter_0_ram_a_to_coeff_b_RDATA;
    assign lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_WREN = ram_a_write;
    assign lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_WREN = ram_a_write_1;
    assign lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_WREN = ram_a_write_2;
    assign lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_WREN = ram_a_write_3;
    assign lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_WREN = ram_a_write_4;
    assign lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_WREN = ram_a_write_5;
    assign cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_WREN = ram_a_write_6;
    assign bitstream_RAM_adapter_0_ram_a_to_bitstream_b_WREN = ram_a_write_7;
    assign coeff_RAM_adapter_0_ram_a_to_coeff_b_WREN = ram_a_write_8;
    assign lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_WDATA = ram_a_writedata;
    assign lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_WDATA = ram_a_writedata_1;
    assign lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_WDATA = ram_a_writedata_2;
    assign lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_WDATA = ram_a_writedata_3;
    assign lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_WDATA = ram_a_writedata_4;
    assign lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_WDATA = ram_a_writedata_5;
    assign cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_WDATA = ram_a_writedata_6;
    assign bitstream_RAM_adapter_0_ram_a_to_bitstream_b_WDATA = ram_a_writedata_7;
    assign coeff_RAM_adapter_0_ram_a_to_coeff_b_WDATA = ram_a_writedata_8;
    assign lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n = rst_n;
    assign cu_info1_mem_ram_a_to_cu_info1_a_WREN = wren_a;
    assign cu_info1_top_mem_ram_a_to_cu_info1_top_a_WREN = wren_a_1;
    assign cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_WREN = wren_a_10;
    assign cu_info1_left_mem_ram_a_to_cu_info1_left_a_WREN = wren_a_2;
    assign cu_info2_mem_ram_a_to_cu_info2_a_WREN = wren_a_3;
    assign cu_info2_top_mem_ram_a_to_cu_info2_top_a_WREN = wren_a_4;
    assign cu_info2_left_mem_ram_a_to_cu_info2_left_a_WREN = wren_a_5;
    assign cabac_states_mem_ram_a_to_cabac_states_a_WREN = wren_a_6;
    assign bitstream_mem_ram_a_to_bitstream_a_WREN = wren_a_7;
    assign coeff_mem_ram_a_to_coeff_a_WREN = wren_a_8;
    assign cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_WREN = wren_a_9;
    assign cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_WREN = wren_b;
    assign cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_WREN = wren_b_1;

    // bitstream_RAM_adapter_0 assignments:
    assign bitstream_RAM_adapter_0_clk = cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK;
    assign bitstream_RAM_adapter_0_ram_a_address = bitstream_RAM_adapter_0_ram_a_to_bitstream_b_ADDR;
    assign bitstream_RAM_adapter_0_ram_a_to_bitstream_b_RDATA = bitstream_RAM_adapter_0_ram_a_readdata;
    assign bitstream_RAM_adapter_0_ram_a_write = bitstream_RAM_adapter_0_ram_a_to_bitstream_b_WREN;
    assign bitstream_RAM_adapter_0_ram_a_writedata = bitstream_RAM_adapter_0_ram_a_to_bitstream_b_WDATA;
    assign bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_ADDR = bitstream_RAM_adapter_0_ram_b_address;
    assign bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_BYTEEN = bitstream_RAM_adapter_0_ram_b_byteen;
    assign bitstream_RAM_adapter_0_ram_b_readdata = bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_RDATA;
    assign bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_WREN = bitstream_RAM_adapter_0_ram_b_write;
    assign bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_WDATA = bitstream_RAM_adapter_0_ram_b_writedata;
    assign bitstream_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // bitstream_mem assignments:
    assign bitstream_mem_address_a = bitstream_mem_ram_a_to_bitstream_a_ADDR;
    assign bitstream_mem_address_b = bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_ADDR[9:0];
    assign bitstream_mem_byteena_a = bitstream_mem_ram_a_to_bitstream_a_BYTEEN;
    assign bitstream_mem_byteena_b = bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_BYTEEN;
    assign bitstream_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign bitstream_mem_clock_b = cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK;
    assign bitstream_mem_data_a = bitstream_mem_ram_a_to_bitstream_a_WDATA;
    assign bitstream_mem_data_b = bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_WDATA;
    assign bitstream_mem_ram_a_to_bitstream_a_RDATA = bitstream_mem_q_a;
    assign bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_RDATA = bitstream_mem_q_b;
    assign bitstream_mem_wren_a = bitstream_mem_ram_a_to_bitstream_a_WREN;
    assign bitstream_mem_wren_b = bitstream_RAM_adapter_0_ram_b_to_bitstream_mem_ram_b_WREN;
    // cabac_metas_pull_mem assignments:
    assign cabac_metas_pull_mem_address_a = cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_ADDR;
    assign cabac_metas_pull_mem_address_b = cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_ADDR;
    assign cabac_metas_pull_mem_byteena_a = cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_BYTEEN;
    assign cabac_metas_pull_mem_byteena_b = 16'hffff;
    assign cabac_metas_pull_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cabac_metas_pull_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cabac_metas_pull_mem_data_a = cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_WDATA;
    assign cabac_metas_pull_mem_data_b = cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_WDATA;
    assign cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_RDATA = cabac_metas_pull_mem_q_a;
    assign cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_RDATA = cabac_metas_pull_mem_q_b;
    assign cabac_metas_pull_mem_wren_a = cabac_metas_pull_mem_ram_a_to_cabac_metas_pull_a_WREN;
    assign cabac_metas_pull_mem_wren_b = cabac_metas_pull_mem_ram_b_to_cabac_metas_pull_b_WREN;
    // cabac_metas_push_mem assignments:
    assign cabac_metas_push_mem_address_a = cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_ADDR;
    assign cabac_metas_push_mem_address_b = cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_ADDR;
    assign cabac_metas_push_mem_byteena_a = cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_BYTEEN;
    assign cabac_metas_push_mem_byteena_b = 16'hffff;
    assign cabac_metas_push_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cabac_metas_push_mem_clock_b = cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK;
    assign cabac_metas_push_mem_data_a = cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_WDATA;
    assign cabac_metas_push_mem_data_b = cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_WDATA;
    assign cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_RDATA = cabac_metas_push_mem_q_a;
    assign cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_RDATA = cabac_metas_push_mem_q_b;
    assign cabac_metas_push_mem_wren_a = cabac_metas_push_mem_ram_a_to_cabac_metas_push_a_WREN;
    assign cabac_metas_push_mem_wren_b = cabac_metas_push_mem_ram_b_to_cabac_metas_push_b_WREN;
    // cabac_states_RAM_adapter_0 assignments:
    assign cabac_states_RAM_adapter_0_clk = cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK;
    assign cabac_states_RAM_adapter_0_ram_a_address = cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_ADDR[11:0];
    assign cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_RDATA = cabac_states_RAM_adapter_0_ram_a_readdata;
    assign cabac_states_RAM_adapter_0_ram_a_write = cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_WREN;
    assign cabac_states_RAM_adapter_0_ram_a_writedata = cabac_states_RAM_adapter_0_ram_a_to_cabac_states_b_WDATA;
    assign cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_ADDR = cabac_states_RAM_adapter_0_ram_b_address;
    assign cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_BYTEEN = cabac_states_RAM_adapter_0_ram_b_byteen;
    assign cabac_states_RAM_adapter_0_ram_b_readdata = cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_RDATA;
    assign cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_WREN = cabac_states_RAM_adapter_0_ram_b_write;
    assign cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_WDATA = cabac_states_RAM_adapter_0_ram_b_writedata;
    assign cabac_states_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // cabac_states_mem assignments:
    assign cabac_states_mem_address_a = cabac_states_mem_ram_a_to_cabac_states_a_ADDR;
    assign cabac_states_mem_address_b = cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_ADDR[6:0];
    assign cabac_states_mem_byteena_a = cabac_states_mem_ram_a_to_cabac_states_a_BYTEEN;
    assign cabac_states_mem_byteena_b = cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_BYTEEN;
    assign cabac_states_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cabac_states_mem_clock_b = cabac_states_RAM_adapter_0_clk_to_clk_bin_coding_CLK;
    assign cabac_states_mem_data_a = cabac_states_mem_ram_a_to_cabac_states_a_WDATA;
    assign cabac_states_mem_data_b = cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_WDATA;
    assign cabac_states_mem_ram_a_to_cabac_states_a_RDATA = cabac_states_mem_q_a;
    assign cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_RDATA = cabac_states_mem_q_b;
    assign cabac_states_mem_wren_a = cabac_states_mem_ram_a_to_cabac_states_a_WREN;
    assign cabac_states_mem_wren_b = cabac_states_mem_ram_b_to_cabac_states_RAM_adapter_0_ram_b_WREN;
    // coeff_RAM_adapter_0 assignments:
    assign coeff_RAM_adapter_0_clk = coeff_RAM_adapter_0_clk_to_clk_binarization_CLK;
    assign coeff_RAM_adapter_0_ram_a_address = coeff_RAM_adapter_0_ram_a_to_coeff_b_ADDR;
    assign coeff_RAM_adapter_0_ram_a_to_coeff_b_RDATA = coeff_RAM_adapter_0_ram_a_readdata;
    assign coeff_RAM_adapter_0_ram_a_write = coeff_RAM_adapter_0_ram_a_to_coeff_b_WREN;
    assign coeff_RAM_adapter_0_ram_a_writedata = coeff_RAM_adapter_0_ram_a_to_coeff_b_WDATA;
    assign coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_ADDR = coeff_RAM_adapter_0_ram_b_address;
    assign coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_BYTEEN = coeff_RAM_adapter_0_ram_b_byteen;
    assign coeff_RAM_adapter_0_ram_b_readdata = coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_RDATA;
    assign coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_WREN = coeff_RAM_adapter_0_ram_b_write;
    assign coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_WDATA = coeff_RAM_adapter_0_ram_b_writedata;
    assign coeff_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // coeff_mem assignments:
    assign coeff_mem_address_a = coeff_mem_ram_a_to_coeff_a_ADDR[10:0];
    assign coeff_mem_address_b = coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_ADDR[10:0];
    assign coeff_mem_byteena_a = coeff_mem_ram_a_to_coeff_a_BYTEEN;
    assign coeff_mem_byteena_b = coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_BYTEEN;
    assign coeff_mem_clock_a = cu_info1_mem_clk_a_to_clk_intra_base_CLK;
    assign coeff_mem_clock_b = coeff_RAM_adapter_0_clk_to_clk_binarization_CLK;
    assign coeff_mem_data_a = coeff_mem_ram_a_to_coeff_a_WDATA;
    assign coeff_mem_data_b = coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_WDATA;
    assign coeff_mem_ram_a_to_coeff_a_RDATA = coeff_mem_q_a;
    assign coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_RDATA = coeff_mem_q_b;
    assign coeff_mem_wren_a = coeff_mem_ram_a_to_coeff_a_WREN;
    assign coeff_mem_wren_b = coeff_mem_ram_b_to_coeff_RAM_adapter_0_ram_b_WREN;
    // cu_info1_left_mem assignments:
    assign cu_info1_left_mem_address_a = cu_info1_left_mem_ram_a_to_cu_info1_left_a_ADDR;
    assign cu_info1_left_mem_address_b = lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_ADDR[2:0];
    assign cu_info1_left_mem_byteena_a = cu_info1_left_mem_ram_a_to_cu_info1_left_a_BYTEEN;
    assign cu_info1_left_mem_byteena_b = lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_BYTEEN;
    assign cu_info1_left_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cu_info1_left_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info1_left_mem_data_a = cu_info1_left_mem_ram_a_to_cu_info1_left_a_WDATA;
    assign cu_info1_left_mem_data_b = lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_WDATA;
    assign cu_info1_left_mem_ram_a_to_cu_info1_left_a_RDATA = cu_info1_left_mem_q_a;
    assign lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_RDATA = cu_info1_left_mem_q_b;
    assign cu_info1_left_mem_wren_a = cu_info1_left_mem_ram_a_to_cu_info1_left_a_WREN;
    assign cu_info1_left_mem_wren_b = lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_WREN;
    // cu_info1_mem assignments:
    assign cu_info1_mem_address_a = cu_info1_mem_ram_a_to_cu_info1_a_ADDR;
    assign cu_info1_mem_address_b = lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_ADDR[8:0];
    assign cu_info1_mem_byteena_a = cu_info1_mem_ram_a_to_cu_info1_a_BYTEEN;
    assign cu_info1_mem_byteena_b = lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_BYTEEN;
    assign cu_info1_mem_clock_a = cu_info1_mem_clk_a_to_clk_intra_base_CLK;
    assign cu_info1_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info1_mem_data_a = cu_info1_mem_ram_a_to_cu_info1_a_WDATA;
    assign cu_info1_mem_data_b = lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_WDATA;
    assign cu_info1_mem_ram_a_to_cu_info1_a_RDATA = cu_info1_mem_q_a;
    assign lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_RDATA = cu_info1_mem_q_b;
    assign cu_info1_mem_wren_a = cu_info1_mem_ram_a_to_cu_info1_a_WREN;
    assign cu_info1_mem_wren_b = lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_WREN;
    // cu_info1_top_mem assignments:
    assign cu_info1_top_mem_address_a = cu_info1_top_mem_ram_a_to_cu_info1_top_a_ADDR;
    assign cu_info1_top_mem_address_b = cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_ADDR[2:0];
    assign cu_info1_top_mem_byteena_a = cu_info1_top_mem_ram_a_to_cu_info1_top_a_BYTEEN;
    assign cu_info1_top_mem_byteena_b = cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_BYTEEN;
    assign cu_info1_top_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cu_info1_top_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info1_top_mem_data_a = cu_info1_top_mem_ram_a_to_cu_info1_top_a_WDATA;
    assign cu_info1_top_mem_data_b = cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_WDATA;
    assign cu_info1_top_mem_ram_a_to_cu_info1_top_a_RDATA = cu_info1_top_mem_q_a;
    assign cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_RDATA = cu_info1_top_mem_q_b;
    assign cu_info1_top_mem_wren_a = cu_info1_top_mem_ram_a_to_cu_info1_top_a_WREN;
    assign cu_info1_top_mem_wren_b = cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_WREN;
    // cu_info2_left_mem assignments:
    assign cu_info2_left_mem_address_a = cu_info2_left_mem_ram_a_to_cu_info2_left_a_ADDR;
    assign cu_info2_left_mem_address_b = lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_ADDR[2:0];
    assign cu_info2_left_mem_byteena_a = cu_info2_left_mem_ram_a_to_cu_info2_left_a_BYTEEN;
    assign cu_info2_left_mem_byteena_b = lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_BYTEEN;
    assign cu_info2_left_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cu_info2_left_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info2_left_mem_data_a = cu_info2_left_mem_ram_a_to_cu_info2_left_a_WDATA;
    assign cu_info2_left_mem_data_b = lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_WDATA;
    assign cu_info2_left_mem_ram_a_to_cu_info2_left_a_RDATA = cu_info2_left_mem_q_a;
    assign lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_RDATA = cu_info2_left_mem_q_b;
    assign cu_info2_left_mem_wren_a = cu_info2_left_mem_ram_a_to_cu_info2_left_a_WREN;
    assign cu_info2_left_mem_wren_b = lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_WREN;
    // cu_info2_mem assignments:
    assign cu_info2_mem_address_a = cu_info2_mem_ram_a_to_cu_info2_a_ADDR;
    assign cu_info2_mem_address_b = cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_ADDR[8:0];
    assign cu_info2_mem_byteena_a = cu_info2_mem_ram_a_to_cu_info2_a_BYTEEN;
    assign cu_info2_mem_byteena_b = cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_BYTEEN;
    assign cu_info2_mem_clock_a = cu_info1_mem_clk_a_to_clk_intra_base_CLK;
    assign cu_info2_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info2_mem_data_a = cu_info2_mem_ram_a_to_cu_info2_a_WDATA;
    assign cu_info2_mem_data_b = cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_WDATA;
    assign cu_info2_mem_ram_a_to_cu_info2_a_RDATA = cu_info2_mem_q_a;
    assign cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_RDATA = cu_info2_mem_q_b;
    assign cu_info2_mem_wren_a = cu_info2_mem_ram_a_to_cu_info2_a_WREN;
    assign cu_info2_mem_wren_b = cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_WREN;
    // cu_info2_top_mem assignments:
    assign cu_info2_top_mem_address_a = cu_info2_top_mem_ram_a_to_cu_info2_top_a_ADDR;
    assign cu_info2_top_mem_address_b = lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_ADDR[2:0];
    assign cu_info2_top_mem_byteena_a = cu_info2_top_mem_ram_a_to_cu_info2_top_a_BYTEEN;
    assign cu_info2_top_mem_byteena_b = lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_BYTEEN;
    assign cu_info2_top_mem_clock_a = cu_info1_top_mem_clk_a_to_clk_mem_CLK;
    assign cu_info2_top_mem_clock_b = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info2_top_mem_data_a = cu_info2_top_mem_ram_a_to_cu_info2_top_a_WDATA;
    assign cu_info2_top_mem_data_b = lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_WDATA;
    assign cu_info2_top_mem_ram_a_to_cu_info2_top_a_RDATA = cu_info2_top_mem_q_a;
    assign lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_RDATA = cu_info2_top_mem_q_b;
    assign cu_info2_top_mem_wren_a = cu_info2_top_mem_ram_a_to_cu_info2_top_a_WREN;
    assign cu_info2_top_mem_wren_b = lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_WREN;
    // lcu1_RAM_adapter_0 assignments:
    assign lcu1_RAM_adapter_0_clk = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign lcu1_RAM_adapter_0_ram_a_address = lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_ADDR;
    assign lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_RDATA = lcu1_RAM_adapter_0_ram_a_readdata;
    assign lcu1_RAM_adapter_0_ram_a_write = lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_WREN;
    assign lcu1_RAM_adapter_0_ram_a_writedata = lcu1_RAM_adapter_0_ram_a_to_cu_info1_b_WDATA;
    assign lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_ADDR = lcu1_RAM_adapter_0_ram_b_address;
    assign lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_BYTEEN = lcu1_RAM_adapter_0_ram_b_byteen;
    assign lcu1_RAM_adapter_0_ram_b_readdata = lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_RDATA;
    assign lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_WREN = lcu1_RAM_adapter_0_ram_b_write;
    assign lcu1_RAM_adapter_0_ram_b_to_cu_info1_mem_ram_b_WDATA = lcu1_RAM_adapter_0_ram_b_writedata;
    assign lcu1_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // lcu1_left_RAM_adapter_0 assignments:
    assign lcu1_left_RAM_adapter_0_clk = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign lcu1_left_RAM_adapter_0_ram_a_address = lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_ADDR;
    assign lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_RDATA = lcu1_left_RAM_adapter_0_ram_a_readdata;
    assign lcu1_left_RAM_adapter_0_ram_a_write = lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_WREN;
    assign lcu1_left_RAM_adapter_0_ram_a_writedata = lcu1_left_RAM_adapter_0_ram_a_to_cu_info1_left_b_WDATA;
    assign lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_ADDR = lcu1_left_RAM_adapter_0_ram_b_address;
    assign lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_BYTEEN = lcu1_left_RAM_adapter_0_ram_b_byteen;
    assign lcu1_left_RAM_adapter_0_ram_b_readdata = lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_RDATA;
    assign lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_WREN = lcu1_left_RAM_adapter_0_ram_b_write;
    assign lcu1_left_RAM_adapter_0_ram_b_to_cu_info1_left_mem_ram_b_WDATA = lcu1_left_RAM_adapter_0_ram_b_writedata;
    assign lcu1_left_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // lcu1_top_RAM_adapter_0 assignments:
    assign lcu1_top_RAM_adapter_0_clk = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign lcu1_top_RAM_adapter_0_ram_a_address = lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_ADDR;
    assign lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_RDATA = lcu1_top_RAM_adapter_0_ram_a_readdata;
    assign lcu1_top_RAM_adapter_0_ram_a_write = lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_WREN;
    assign lcu1_top_RAM_adapter_0_ram_a_writedata = lcu1_top_RAM_adapter_0_ram_a_to_cu_info1_top_b_WDATA;
    assign cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_ADDR = lcu1_top_RAM_adapter_0_ram_b_address;
    assign cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_BYTEEN = lcu1_top_RAM_adapter_0_ram_b_byteen;
    assign lcu1_top_RAM_adapter_0_ram_b_readdata = cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_RDATA;
    assign cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_WREN = lcu1_top_RAM_adapter_0_ram_b_write;
    assign cu_info1_top_mem_ram_b_to_lcu1_top_RAM_adapter_0_ram_b_WDATA = lcu1_top_RAM_adapter_0_ram_b_writedata;
    assign lcu1_top_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // lcu2_RAM_adapter_0 assignments:
    assign lcu2_RAM_adapter_0_clk = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign lcu2_RAM_adapter_0_ram_a_address = lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_ADDR;
    assign lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_RDATA = lcu2_RAM_adapter_0_ram_a_readdata;
    assign lcu2_RAM_adapter_0_ram_a_write = lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_WREN;
    assign lcu2_RAM_adapter_0_ram_a_writedata = lcu2_RAM_adapter_0_ram_a_to_cu_info2_b_WDATA;
    assign cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_ADDR = lcu2_RAM_adapter_0_ram_b_address;
    assign cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_BYTEEN = lcu2_RAM_adapter_0_ram_b_byteen;
    assign lcu2_RAM_adapter_0_ram_b_readdata = cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_RDATA;
    assign cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_WREN = lcu2_RAM_adapter_0_ram_b_write;
    assign cu_info2_mem_ram_b_to_lcu2_RAM_adapter_0_ram_b_WDATA = lcu2_RAM_adapter_0_ram_b_writedata;
    assign lcu2_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // lcu2_left_RAM_adapter_0 assignments:
    assign lcu2_left_RAM_adapter_0_clk = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign lcu2_left_RAM_adapter_0_ram_a_address = lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_ADDR;
    assign lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_RDATA = lcu2_left_RAM_adapter_0_ram_a_readdata;
    assign lcu2_left_RAM_adapter_0_ram_a_write = lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_WREN;
    assign lcu2_left_RAM_adapter_0_ram_a_writedata = lcu2_left_RAM_adapter_0_ram_a_to_cu_info2_left_b_WDATA;
    assign lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_ADDR = lcu2_left_RAM_adapter_0_ram_b_address;
    assign lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_BYTEEN = lcu2_left_RAM_adapter_0_ram_b_byteen;
    assign lcu2_left_RAM_adapter_0_ram_b_readdata = lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_RDATA;
    assign lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_WREN = lcu2_left_RAM_adapter_0_ram_b_write;
    assign lcu2_left_RAM_adapter_0_ram_b_to_cu_info2_left_mem_ram_b_WDATA = lcu2_left_RAM_adapter_0_ram_b_writedata;
    assign lcu2_left_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;
    // lcu2_top_RAM_adapter_0 assignments:
    assign lcu2_top_RAM_adapter_0_clk = lcu1_RAM_adapter_0_clk_to_clk_base_CLK;
    assign lcu2_top_RAM_adapter_0_ram_a_address = lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_ADDR;
    assign lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_RDATA = lcu2_top_RAM_adapter_0_ram_a_readdata;
    assign lcu2_top_RAM_adapter_0_ram_a_write = lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_WREN;
    assign lcu2_top_RAM_adapter_0_ram_a_writedata = lcu2_top_RAM_adapter_0_ram_a_to_cu_info2_top_b_WDATA;
    assign lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_ADDR = lcu2_top_RAM_adapter_0_ram_b_address;
    assign lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_BYTEEN = lcu2_top_RAM_adapter_0_ram_b_byteen;
    assign lcu2_top_RAM_adapter_0_ram_b_readdata = lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_RDATA;
    assign lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_WREN = lcu2_top_RAM_adapter_0_ram_b_write;
    assign lcu2_top_RAM_adapter_0_ram_b_to_cu_info2_top_mem_ram_b_WDATA = lcu2_top_RAM_adapter_0_ram_b_writedata;
    assign lcu2_top_RAM_adapter_0_rst_n = lcu1_top_RAM_adapter_0_arst_n_to_bus_arst_n;

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(15),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(11))
    bitstream_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (bitstream_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (bitstream_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (bitstream_RAM_adapter_0_ram_a_address),
        .ram_a_write         (bitstream_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (bitstream_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (bitstream_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (bitstream_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (bitstream_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (bitstream_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (bitstream_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (bitstream_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (10),
        .addr_width_b_g      (10))
    bitstream_mem(
        // Interface: clk_a
        .clock_a             (bitstream_mem_clock_a),
        // Interface: clk_b
        .clock_b             (bitstream_mem_clock_b),
        // Interface: ram_a
        .address_a           (bitstream_mem_address_a),
        .byteena_a           (bitstream_mem_byteena_a),
        .data_a              (bitstream_mem_data_a),
        .wren_a              (bitstream_mem_wren_a),
        .q_a                 (bitstream_mem_q_a),
        // Interface: ram_b
        .address_b           (bitstream_mem_address_b),
        .byteena_b           (bitstream_mem_byteena_b),
        .data_b              (bitstream_mem_data_b),
        .wren_b              (bitstream_mem_wren_b),
        .q_b                 (bitstream_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (3),
        .addr_width_b_g      (3))
    cabac_metas_pull_mem(
        // Interface: clk_a
        .clock_a             (cabac_metas_pull_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cabac_metas_pull_mem_clock_b),
        // Interface: ram_a
        .address_a           (cabac_metas_pull_mem_address_a),
        .byteena_a           (cabac_metas_pull_mem_byteena_a),
        .data_a              (cabac_metas_pull_mem_data_a),
        .wren_a              (cabac_metas_pull_mem_wren_a),
        .q_a                 (cabac_metas_pull_mem_q_a),
        // Interface: ram_b
        .address_b           (cabac_metas_pull_mem_address_b),
        .byteena_b           (cabac_metas_pull_mem_byteena_b),
        .data_b              (cabac_metas_pull_mem_data_b),
        .wren_b              (cabac_metas_pull_mem_wren_b),
        .q_b                 (cabac_metas_pull_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (4),
        .addr_width_b_g      (4))
    cabac_metas_push_mem(
        // Interface: clk_a
        .clock_a             (cabac_metas_push_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cabac_metas_push_mem_clock_b),
        // Interface: ram_a
        .address_a           (cabac_metas_push_mem_address_a),
        .byteena_a           (cabac_metas_push_mem_byteena_a),
        .data_a              (cabac_metas_push_mem_data_a),
        .wren_a              (cabac_metas_push_mem_wren_a),
        .q_a                 (cabac_metas_push_mem_q_a),
        // Interface: ram_b
        .address_b           (cabac_metas_push_mem_address_b),
        .byteena_b           (cabac_metas_push_mem_byteena_b),
        .data_b              (cabac_metas_push_mem_data_b),
        .wren_b              (cabac_metas_push_mem_wren_b),
        .q_b                 (cabac_metas_push_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(12),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(8))
    cabac_states_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (cabac_states_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (cabac_states_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (cabac_states_RAM_adapter_0_ram_a_address),
        .ram_a_write         (cabac_states_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (cabac_states_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (cabac_states_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (cabac_states_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (cabac_states_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (cabac_states_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (cabac_states_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (cabac_states_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (7),
        .addr_width_b_g      (7))
    cabac_states_mem(
        // Interface: clk_a
        .clock_a             (cabac_states_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cabac_states_mem_clock_b),
        // Interface: ram_a
        .address_a           (cabac_states_mem_address_a),
        .byteena_a           (cabac_states_mem_byteena_a),
        .data_a              (cabac_states_mem_data_a),
        .wren_a              (cabac_states_mem_wren_a),
        .q_a                 (cabac_states_mem_q_a),
        // Interface: ram_b
        .address_b           (cabac_states_mem_address_b),
        .byteena_b           (cabac_states_mem_byteena_b),
        .data_b              (cabac_states_mem_data_b),
        .wren_b              (cabac_states_mem_wren_b),
        .q_b                 (cabac_states_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (64),
        .ram_a_address_width_g(15),
        .ram_b_width_g       (512),
        .ram_b_address_width_g(12))
    coeff_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (coeff_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (coeff_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (coeff_RAM_adapter_0_ram_a_address),
        .ram_a_write         (coeff_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (coeff_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (coeff_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (coeff_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (coeff_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (coeff_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (coeff_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (coeff_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (512),
        .width_b_g           (512),
        .addr_width_a_g      (11),
        .addr_width_b_g      (11))
    coeff_mem(
        // Interface: clk_a
        .clock_a             (coeff_mem_clock_a),
        // Interface: clk_b
        .clock_b             (coeff_mem_clock_b),
        // Interface: ram_a
        .address_a           (coeff_mem_address_a),
        .byteena_a           (coeff_mem_byteena_a),
        .data_a              (coeff_mem_data_a),
        .wren_a              (coeff_mem_wren_a),
        .q_a                 (coeff_mem_q_a),
        // Interface: ram_b
        .address_b           (coeff_mem_address_b),
        .byteena_b           (coeff_mem_byteena_b),
        .data_b              (coeff_mem_data_b),
        .wren_b              (coeff_mem_wren_b),
        .q_b                 (coeff_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (3),
        .addr_width_b_g      (3))
    cu_info1_left_mem(
        // Interface: clk_a
        .clock_a             (cu_info1_left_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info1_left_mem_clock_b),
        // Interface: ram_a
        .address_a           (cu_info1_left_mem_address_a),
        .byteena_a           (cu_info1_left_mem_byteena_a),
        .data_a              (cu_info1_left_mem_data_a),
        .wren_a              (cu_info1_left_mem_wren_a),
        .q_a                 (cu_info1_left_mem_q_a),
        // Interface: ram_b
        .address_b           (cu_info1_left_mem_address_b),
        .byteena_b           (cu_info1_left_mem_byteena_b),
        .data_b              (cu_info1_left_mem_data_b),
        .wren_b              (cu_info1_left_mem_wren_b),
        .q_b                 (cu_info1_left_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (9),
        .addr_width_b_g      (9))
    cu_info1_mem(
        // Interface: clk_a
        .clock_a             (cu_info1_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info1_mem_clock_b),
        // Interface: ram_a
        .address_a           (cu_info1_mem_address_a),
        .byteena_a           (cu_info1_mem_byteena_a),
        .data_a              (cu_info1_mem_data_a),
        .wren_a              (cu_info1_mem_wren_a),
        .q_a                 (cu_info1_mem_q_a),
        // Interface: ram_b
        .address_b           (cu_info1_mem_address_b),
        .byteena_b           (cu_info1_mem_byteena_b),
        .data_b              (cu_info1_mem_data_b),
        .wren_b              (cu_info1_mem_wren_b),
        .q_b                 (cu_info1_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (3),
        .addr_width_b_g      (3))
    cu_info1_top_mem(
        // Interface: clk_a
        .clock_a             (cu_info1_top_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info1_top_mem_clock_b),
        // Interface: ram_a
        .address_a           (cu_info1_top_mem_address_a),
        .byteena_a           (cu_info1_top_mem_byteena_a),
        .data_a              (cu_info1_top_mem_data_a),
        .wren_a              (cu_info1_top_mem_wren_a),
        .q_a                 (cu_info1_top_mem_q_a),
        // Interface: ram_b
        .address_b           (cu_info1_top_mem_address_b),
        .byteena_b           (cu_info1_top_mem_byteena_b),
        .data_b              (cu_info1_top_mem_data_b),
        .wren_b              (cu_info1_top_mem_wren_b),
        .q_b                 (cu_info1_top_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (3),
        .addr_width_b_g      (3))
    cu_info2_left_mem(
        // Interface: clk_a
        .clock_a             (cu_info2_left_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info2_left_mem_clock_b),
        // Interface: ram_a
        .address_a           (cu_info2_left_mem_address_a),
        .byteena_a           (cu_info2_left_mem_byteena_a),
        .data_a              (cu_info2_left_mem_data_a),
        .wren_a              (cu_info2_left_mem_wren_a),
        .q_a                 (cu_info2_left_mem_q_a),
        // Interface: ram_b
        .address_b           (cu_info2_left_mem_address_b),
        .byteena_b           (cu_info2_left_mem_byteena_b),
        .data_b              (cu_info2_left_mem_data_b),
        .wren_b              (cu_info2_left_mem_wren_b),
        .q_b                 (cu_info2_left_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (9),
        .addr_width_b_g      (9))
    cu_info2_mem(
        // Interface: clk_a
        .clock_a             (cu_info2_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info2_mem_clock_b),
        // Interface: ram_a
        .address_a           (cu_info2_mem_address_a),
        .byteena_a           (cu_info2_mem_byteena_a),
        .data_a              (cu_info2_mem_data_a),
        .wren_a              (cu_info2_mem_wren_a),
        .q_a                 (cu_info2_mem_q_a),
        // Interface: ram_b
        .address_b           (cu_info2_mem_address_b),
        .byteena_b           (cu_info2_mem_byteena_b),
        .data_b              (cu_info2_mem_data_b),
        .wren_b              (cu_info2_mem_wren_b),
        .q_b                 (cu_info2_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (3),
        .addr_width_b_g      (3))
    cu_info2_top_mem(
        // Interface: clk_a
        .clock_a             (cu_info2_top_mem_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info2_top_mem_clock_b),
        // Interface: ram_a
        .address_a           (cu_info2_top_mem_address_a),
        .byteena_a           (cu_info2_top_mem_byteena_a),
        .data_a              (cu_info2_top_mem_data_a),
        .wren_a              (cu_info2_top_mem_wren_a),
        .q_a                 (cu_info2_top_mem_q_a),
        // Interface: ram_b
        .address_b           (cu_info2_top_mem_address_b),
        .byteena_b           (cu_info2_top_mem_byteena_b),
        .data_b              (cu_info2_top_mem_data_b),
        .wren_b              (cu_info2_top_mem_wren_b),
        .q_b                 (cu_info2_top_mem_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (32),
        .ram_a_address_width_g(12),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(10))
    lcu1_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (lcu1_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (lcu1_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (lcu1_RAM_adapter_0_ram_a_address),
        .ram_a_write         (lcu1_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (lcu1_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (lcu1_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (lcu1_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (lcu1_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (lcu1_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (lcu1_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (lcu1_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(8),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(4))
    lcu1_left_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (lcu1_left_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (lcu1_left_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (lcu1_left_RAM_adapter_0_ram_a_address),
        .ram_a_write         (lcu1_left_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (lcu1_left_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (lcu1_left_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (lcu1_left_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (lcu1_left_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (lcu1_left_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (lcu1_left_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (lcu1_left_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(8),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(4))
    lcu1_top_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (lcu1_top_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (lcu1_top_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (lcu1_top_RAM_adapter_0_ram_a_address),
        .ram_a_write         (lcu1_top_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (lcu1_top_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (lcu1_top_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (lcu1_top_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (lcu1_top_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (lcu1_top_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (lcu1_top_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (lcu1_top_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (32),
        .ram_a_address_width_g(12),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(10))
    lcu2_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (lcu2_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (lcu2_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (lcu2_RAM_adapter_0_ram_a_address),
        .ram_a_write         (lcu2_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (lcu2_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (lcu2_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (lcu2_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (lcu2_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (lcu2_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (lcu2_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (lcu2_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(8),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(4))
    lcu2_left_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (lcu2_left_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (lcu2_left_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (lcu2_left_RAM_adapter_0_ram_a_address),
        .ram_a_write         (lcu2_left_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (lcu2_left_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (lcu2_left_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (lcu2_left_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (lcu2_left_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (lcu2_left_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (lcu2_left_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (lcu2_left_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(8),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(4))
    lcu2_top_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (lcu2_top_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (lcu2_top_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (lcu2_top_RAM_adapter_0_ram_a_address),
        .ram_a_write         (lcu2_top_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (lcu2_top_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (lcu2_top_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (lcu2_top_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (lcu2_top_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (lcu2_top_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (lcu2_top_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (lcu2_top_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());


endmodule
