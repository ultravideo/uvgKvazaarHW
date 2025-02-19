
module IntraMemories_0 #(
    parameter                              border_addr      = 8,
    parameter                              cabac_addr       = 4,
    parameter                              cu_info_addr     = 10,
    parameter                              cu_info_border_addr = 4,
    parameter                              mem_width        = 128,
    parameter                              rec_addr         = 13,
    parameter                              ref_addr         = 13
) (
    // Interface: arst_n
    input                               rst_n,

    // Interface: cabac_a
    input                [3:0]          address_a_7,
    input                [15:0]         byteena_a_7,
    input                [127:0]        data_a_7,
    input                               wren_a_7,
    output               [127:0]        q_a_7,

    // Interface: cabac_b
    input                [3:0]          address_b,
    input                [127:0]        data_b,
    input                               wren_b,
    output               [127:0]        q_b,

    // Interface: clk_base
    input                               clk,

    // Interface: clk_mem
    input                               clock_a,

    // Interface: cu_info_a
    input                [9:0]          address_a_6,
    input                [15:0]         byteena_a_6,
    input                [127:0]        data_a_6,
    input                               wren_a_6,
    output               [127:0]        q_a_6,

    // Interface: cu_info_b
    input                [11:0]         ram_a_address_6,
    input                               ram_a_write_6,
    input                [31:0]         ram_a_writedata_6,
    output               [31:0]         ram_a_readdata_6,

    // Interface: cu_info_hor_a
    input                [3:0]          address_a_4,
    input                [15:0]         byteena_a_4,
    input                [127:0]        data_a_4,
    input                               wren_a_4,
    output               [127:0]        q_a_4,

    // Interface: cu_info_hor_b
    input                [7:0]          ram_a_address_4,
    input                               ram_a_write_4,
    input                [7:0]          ram_a_writedata_4,
    output               [7:0]          ram_a_readdata_4,

    // Interface: cu_info_hor_str_a
    input                [3:0]          address_a_5,
    input                [15:0]         byteena_a_5,
    input                [127:0]        data_a_5,
    input                               wren_a_5,
    output               [127:0]        q_a_5,

    // Interface: cu_info_hor_str_b
    input                [7:0]          ram_a_address_5,
    input                               ram_a_write_5,
    input                [7:0]          ram_a_writedata_5,
    output               [7:0]          ram_a_readdata_5,

    // Interface: cu_info_to_cabac
    output               [9:0]          ram_b_address,
    output               [15:0]         ram_b_byteen,
    output                              ram_b_write,
    output               [127:0]        ram_b_writedata,

    // Interface: cu_info_ver_a
    input                [3:0]          address_a_3,
    input                [15:0]         byteena_a_3,
    input                [127:0]        data_a_3,
    input                               wren_a_3,
    output               [127:0]        q_a_3,

    // Interface: cu_info_ver_b
    input                [7:0]          ram_a_address_3,
    input                               ram_a_write_3,
    input                [7:0]          ram_a_writedata_3,
    output               [7:0]          ram_a_readdata_3,

    // Interface: left_border_a
    input                [7:0]          address_a_2,
    input                [15:0]         byteena_a_2,
    input                [127:0]        data_a_2,
    input                               wren_a_2,
    output               [127:0]        q_a_2,

    // Interface: left_border_b
    input                [9:0]          ram_a_address_2,
    input                               ram_a_write_2,
    input                [31:0]         ram_a_writedata_2,
    output               [31:0]         ram_a_readdata_2,

    // Interface: rec_a
    input                [12:0]         address_a_8,
    input                [15:0]         byteena_a_8,
    input                [127:0]        data_a_8,
    input                               wren_a_8,
    output               [127:0]        q_a_8,

    // Interface: rec_b
    input                [11:0]         address_b_1,
    input                [31:0]         byteena_b_1,
    input                [255:0]        data_b_1,
    input                               wren_b_1,
    output               [255:0]        q_b_1,

    // Interface: ref_a
    input                [12:0]         address_a,
    input                [15:0]         byteena_a,
    input                [127:0]        data_a,
    input                               wren_a,
    output               [127:0]        q_a,

    // Interface: ref_b
    input                [14:0]         ram_a_address,
    input                               ram_a_write,
    input                [31:0]         ram_a_writedata,
    output               [31:0]         ram_a_readdata,

    // Interface: top_border_a
    input                [7:0]          address_a_1,
    input                [15:0]         byteena_a_1,
    input                [127:0]        data_a_1,
    input                               wren_a_1,
    output               [127:0]        q_a_1,

    // Interface: top_border_b
    input                [9:0]          ram_a_address_1,
    input                               ram_a_write_1,
    input                [31:0]         ram_a_writedata_1,
    output               [31:0]         ram_a_readdata_1
);

    // ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b wires:
    wire [12:0] ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_ADDR;
    wire [15:0] ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_BYTEEN;
    wire [127:0] ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_RDATA;
    wire [127:0] ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_WDATA;
    wire       ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_WREN;
    // top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b wires:
    wire [7:0] top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_ADDR;
    wire [15:0] top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_BYTEEN;
    wire [127:0] top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_RDATA;
    wire [127:0] top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_WDATA;
    wire       top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_WREN;
    // left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b wires:
    wire [7:0] left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_ADDR;
    wire [15:0] left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_BYTEEN;
    wire [127:0] left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_RDATA;
    wire [127:0] left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_WDATA;
    wire       left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_WREN;
    // cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b wires:
    wire [3:0] cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_ADDR;
    wire [15:0] cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_BYTEEN;
    wire [127:0] cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_RDATA;
    wire [127:0] cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_WDATA;
    wire       cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_WREN;
    // cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b wires:
    wire [3:0] cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_ADDR;
    wire [15:0] cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_BYTEEN;
    wire [127:0] cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_RDATA;
    wire [127:0] cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_WDATA;
    wire       cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_WREN;
    // cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b wires:
    wire [3:0] cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_ADDR;
    wire [15:0] cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_BYTEEN;
    wire [127:0] cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_RDATA;
    wire [127:0] cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_WDATA;
    wire       cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_WREN;
    // cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b wires:
    wire [9:0] cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_ADDR;
    wire [15:0] cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_BYTEEN;
    wire [127:0] cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_RDATA;
    wire [127:0] cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WDATA;
    wire       cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WREN;
    // ref_RAM_adapter_0_arst_n_to_bus_1 wires:
    wire       ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // ref_mem_0_clk_a_to_clk_mem wires:
    wire       ref_mem_0_clk_a_to_clk_mem_CLK;
    // ref_RAM_adapter_0_clk_to_clk_base wires:
    wire       ref_RAM_adapter_0_clk_to_clk_base_CLK;
    // ref_RAM_adapter_0_ram_a_to_ref_b wires:
    wire [14:0] ref_RAM_adapter_0_ram_a_to_ref_b_ADDR;
    wire [31:0] ref_RAM_adapter_0_ram_a_to_ref_b_RDATA;
    wire [31:0] ref_RAM_adapter_0_ram_a_to_ref_b_WDATA;
    wire       ref_RAM_adapter_0_ram_a_to_ref_b_WREN;
    // ref_mem_0_ram_a_to_ref_a wires:
    wire [12:0] ref_mem_0_ram_a_to_ref_a_ADDR;
    wire [15:0] ref_mem_0_ram_a_to_ref_a_BYTEEN;
    wire [127:0] ref_mem_0_ram_a_to_ref_a_RDATA;
    wire [127:0] ref_mem_0_ram_a_to_ref_a_WDATA;
    wire       ref_mem_0_ram_a_to_ref_a_WREN;
    // top_border_mem_0_ram_a_to_top_border_a wires:
    wire [7:0] top_border_mem_0_ram_a_to_top_border_a_ADDR;
    wire [15:0] top_border_mem_0_ram_a_to_top_border_a_BYTEEN;
    wire [127:0] top_border_mem_0_ram_a_to_top_border_a_RDATA;
    wire [127:0] top_border_mem_0_ram_a_to_top_border_a_WDATA;
    wire       top_border_mem_0_ram_a_to_top_border_a_WREN;
    // top_border_RAM_adapter_0_ram_a_to_top_border_b wires:
    wire [9:0] top_border_RAM_adapter_0_ram_a_to_top_border_b_ADDR;
    wire [31:0] top_border_RAM_adapter_0_ram_a_to_top_border_b_RDATA;
    wire [31:0] top_border_RAM_adapter_0_ram_a_to_top_border_b_WDATA;
    wire       top_border_RAM_adapter_0_ram_a_to_top_border_b_WREN;
    // left_border_RAM_adapter_0_ram_a_to_left_border_b wires:
    wire [9:0] left_border_RAM_adapter_0_ram_a_to_left_border_b_ADDR;
    wire [31:0] left_border_RAM_adapter_0_ram_a_to_left_border_b_RDATA;
    wire [31:0] left_border_RAM_adapter_0_ram_a_to_left_border_b_WDATA;
    wire       left_border_RAM_adapter_0_ram_a_to_left_border_b_WREN;
    // left_border_mem_0_ram_a_to_left_border_a wires:
    wire [7:0] left_border_mem_0_ram_a_to_left_border_a_ADDR;
    wire [15:0] left_border_mem_0_ram_a_to_left_border_a_BYTEEN;
    wire [127:0] left_border_mem_0_ram_a_to_left_border_a_RDATA;
    wire [127:0] left_border_mem_0_ram_a_to_left_border_a_WDATA;
    wire       left_border_mem_0_ram_a_to_left_border_a_WREN;
    // cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b wires:
    wire [7:0] cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_ADDR;
    wire [7:0] cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_RDATA;
    wire [7:0] cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_WDATA;
    wire       cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_WREN;
    // cu_info_ver_mem_0_ram_a_to_cu_info_ver_a wires:
    wire [3:0] cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_ADDR;
    wire [15:0] cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_BYTEEN;
    wire [127:0] cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_RDATA;
    wire [127:0] cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_WDATA;
    wire       cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_WREN;
    // cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b wires:
    wire [7:0] cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_ADDR;
    wire [7:0] cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_RDATA;
    wire [7:0] cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_WDATA;
    wire       cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_WREN;
    // cu_info_hor_mem_0_ram_a_to_cu_info_hor_a wires:
    wire [3:0] cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_ADDR;
    wire [15:0] cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_BYTEEN;
    wire [127:0] cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_RDATA;
    wire [127:0] cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_WDATA;
    wire       cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_WREN;
    // cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a wires:
    wire [3:0] cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_ADDR;
    wire [15:0] cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_BYTEEN;
    wire [127:0] cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_RDATA;
    wire [127:0] cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_WDATA;
    wire       cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_WREN;
    // cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b wires:
    wire [7:0] cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_ADDR;
    wire [7:0] cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_RDATA;
    wire [7:0] cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_WDATA;
    wire       cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_WREN;
    // cu_info_RAM_adapter_0_ram_a_to_cu_info_b wires:
    wire [11:0] cu_info_RAM_adapter_0_ram_a_to_cu_info_b_ADDR;
    wire [31:0] cu_info_RAM_adapter_0_ram_a_to_cu_info_b_RDATA;
    wire [31:0] cu_info_RAM_adapter_0_ram_a_to_cu_info_b_WDATA;
    wire       cu_info_RAM_adapter_0_ram_a_to_cu_info_b_WREN;
    // cu_info_mem_0_ram_a_to_cu_info_a wires:
    wire [9:0] cu_info_mem_0_ram_a_to_cu_info_a_ADDR;
    wire [15:0] cu_info_mem_0_ram_a_to_cu_info_a_BYTEEN;
    wire [127:0] cu_info_mem_0_ram_a_to_cu_info_a_RDATA;
    wire [127:0] cu_info_mem_0_ram_a_to_cu_info_a_WDATA;
    wire       cu_info_mem_0_ram_a_to_cu_info_a_WREN;
    // cabac_mem_0_ram_a_to_cabac_a wires:
    wire [3:0] cabac_mem_0_ram_a_to_cabac_a_ADDR;
    wire [15:0] cabac_mem_0_ram_a_to_cabac_a_BYTEEN;
    wire [127:0] cabac_mem_0_ram_a_to_cabac_a_RDATA;
    wire [127:0] cabac_mem_0_ram_a_to_cabac_a_WDATA;
    wire       cabac_mem_0_ram_a_to_cabac_a_WREN;
    // rec_mem_0_ram_a_to_rec_a wires:
    wire [12:0] rec_mem_0_ram_a_to_rec_a_ADDR;
    wire [15:0] rec_mem_0_ram_a_to_rec_a_BYTEEN;
    wire [127:0] rec_mem_0_ram_a_to_rec_a_RDATA;
    wire [127:0] rec_mem_0_ram_a_to_rec_a_WDATA;
    wire       rec_mem_0_ram_a_to_rec_a_WREN;
    // cabac_mem_0_ram_b_to_cabac_b wires:
    wire [3:0] cabac_mem_0_ram_b_to_cabac_b_ADDR;
    wire [15:0] cabac_mem_0_ram_b_to_cabac_b_BYTEEN;
    wire [127:0] cabac_mem_0_ram_b_to_cabac_b_RDATA;
    wire [127:0] cabac_mem_0_ram_b_to_cabac_b_WDATA;
    wire       cabac_mem_0_ram_b_to_cabac_b_WREN;
    // rec_mem_0_ram_b_to_rec_b wires:
    wire [11:0] rec_mem_0_ram_b_to_rec_b_ADDR;
    wire [31:0] rec_mem_0_ram_b_to_rec_b_BYTEEN;
    wire [255:0] rec_mem_0_ram_b_to_rec_b_RDATA;
    wire [255:0] rec_mem_0_ram_b_to_rec_b_WDATA;
    wire       rec_mem_0_ram_b_to_rec_b_WREN;

    // cabac_mem_0 port wires:
    wire [3:0] cabac_mem_0_address_a;
    wire [3:0] cabac_mem_0_address_b;
    wire [15:0] cabac_mem_0_byteena_a;
    wire       cabac_mem_0_clock_a;
    wire       cabac_mem_0_clock_b;
    wire [127:0] cabac_mem_0_data_a;
    wire [127:0] cabac_mem_0_data_b;
    wire [127:0] cabac_mem_0_q_a;
    wire [127:0] cabac_mem_0_q_b;
    wire       cabac_mem_0_wren_a;
    wire       cabac_mem_0_wren_b;
    // cu_info_RAM_adapter_0 port wires:
    wire       cu_info_RAM_adapter_0_clk;
    wire [11:0] cu_info_RAM_adapter_0_ram_a_address;
    wire [31:0] cu_info_RAM_adapter_0_ram_a_readdata;
    wire       cu_info_RAM_adapter_0_ram_a_write;
    wire [31:0] cu_info_RAM_adapter_0_ram_a_writedata;
    wire [9:0] cu_info_RAM_adapter_0_ram_b_address;
    wire [15:0] cu_info_RAM_adapter_0_ram_b_byteen;
    wire [127:0] cu_info_RAM_adapter_0_ram_b_readdata;
    wire       cu_info_RAM_adapter_0_ram_b_write;
    wire [127:0] cu_info_RAM_adapter_0_ram_b_writedata;
    wire       cu_info_RAM_adapter_0_rst_n;
    // cu_info_hor_RAM_adapter_0 port wires:
    wire       cu_info_hor_RAM_adapter_0_clk;
    wire [7:0] cu_info_hor_RAM_adapter_0_ram_a_address;
    wire [7:0] cu_info_hor_RAM_adapter_0_ram_a_readdata;
    wire       cu_info_hor_RAM_adapter_0_ram_a_write;
    wire [7:0] cu_info_hor_RAM_adapter_0_ram_a_writedata;
    wire [3:0] cu_info_hor_RAM_adapter_0_ram_b_address;
    wire [15:0] cu_info_hor_RAM_adapter_0_ram_b_byteen;
    wire [127:0] cu_info_hor_RAM_adapter_0_ram_b_readdata;
    wire       cu_info_hor_RAM_adapter_0_ram_b_write;
    wire [127:0] cu_info_hor_RAM_adapter_0_ram_b_writedata;
    wire       cu_info_hor_RAM_adapter_0_rst_n;
    // cu_info_hor_mem_0 port wires:
    wire [3:0] cu_info_hor_mem_0_address_a;
    wire [3:0] cu_info_hor_mem_0_address_b;
    wire [15:0] cu_info_hor_mem_0_byteena_a;
    wire [15:0] cu_info_hor_mem_0_byteena_b;
    wire       cu_info_hor_mem_0_clock_a;
    wire       cu_info_hor_mem_0_clock_b;
    wire [127:0] cu_info_hor_mem_0_data_a;
    wire [127:0] cu_info_hor_mem_0_data_b;
    wire [127:0] cu_info_hor_mem_0_q_a;
    wire [127:0] cu_info_hor_mem_0_q_b;
    wire       cu_info_hor_mem_0_wren_a;
    wire       cu_info_hor_mem_0_wren_b;
    // cu_info_hor_str_RAM_adapter_0 port wires:
    wire       cu_info_hor_str_RAM_adapter_0_clk;
    wire [7:0] cu_info_hor_str_RAM_adapter_0_ram_a_address;
    wire [7:0] cu_info_hor_str_RAM_adapter_0_ram_a_readdata;
    wire       cu_info_hor_str_RAM_adapter_0_ram_a_write;
    wire [7:0] cu_info_hor_str_RAM_adapter_0_ram_a_writedata;
    wire [3:0] cu_info_hor_str_RAM_adapter_0_ram_b_address;
    wire [15:0] cu_info_hor_str_RAM_adapter_0_ram_b_byteen;
    wire [127:0] cu_info_hor_str_RAM_adapter_0_ram_b_readdata;
    wire       cu_info_hor_str_RAM_adapter_0_ram_b_write;
    wire [127:0] cu_info_hor_str_RAM_adapter_0_ram_b_writedata;
    wire       cu_info_hor_str_RAM_adapter_0_rst_n;
    // cu_info_hor_str_mem_0 port wires:
    wire [3:0] cu_info_hor_str_mem_0_address_a;
    wire [3:0] cu_info_hor_str_mem_0_address_b;
    wire [15:0] cu_info_hor_str_mem_0_byteena_a;
    wire [15:0] cu_info_hor_str_mem_0_byteena_b;
    wire       cu_info_hor_str_mem_0_clock_a;
    wire       cu_info_hor_str_mem_0_clock_b;
    wire [127:0] cu_info_hor_str_mem_0_data_a;
    wire [127:0] cu_info_hor_str_mem_0_data_b;
    wire [127:0] cu_info_hor_str_mem_0_q_a;
    wire [127:0] cu_info_hor_str_mem_0_q_b;
    wire       cu_info_hor_str_mem_0_wren_a;
    wire       cu_info_hor_str_mem_0_wren_b;
    // cu_info_mem_0 port wires:
    wire [9:0] cu_info_mem_0_address_a;
    wire [9:0] cu_info_mem_0_address_b;
    wire [15:0] cu_info_mem_0_byteena_a;
    wire [15:0] cu_info_mem_0_byteena_b;
    wire       cu_info_mem_0_clock_a;
    wire       cu_info_mem_0_clock_b;
    wire [127:0] cu_info_mem_0_data_a;
    wire [127:0] cu_info_mem_0_data_b;
    wire [127:0] cu_info_mem_0_q_a;
    wire [127:0] cu_info_mem_0_q_b;
    wire       cu_info_mem_0_wren_a;
    wire       cu_info_mem_0_wren_b;
    // cu_info_ver_RAM_adapter_0 port wires:
    wire       cu_info_ver_RAM_adapter_0_clk;
    wire [7:0] cu_info_ver_RAM_adapter_0_ram_a_address;
    wire [7:0] cu_info_ver_RAM_adapter_0_ram_a_readdata;
    wire       cu_info_ver_RAM_adapter_0_ram_a_write;
    wire [7:0] cu_info_ver_RAM_adapter_0_ram_a_writedata;
    wire [3:0] cu_info_ver_RAM_adapter_0_ram_b_address;
    wire [15:0] cu_info_ver_RAM_adapter_0_ram_b_byteen;
    wire [127:0] cu_info_ver_RAM_adapter_0_ram_b_readdata;
    wire       cu_info_ver_RAM_adapter_0_ram_b_write;
    wire [127:0] cu_info_ver_RAM_adapter_0_ram_b_writedata;
    wire       cu_info_ver_RAM_adapter_0_rst_n;
    // cu_info_ver_mem_0 port wires:
    wire [3:0] cu_info_ver_mem_0_address_a;
    wire [3:0] cu_info_ver_mem_0_address_b;
    wire [15:0] cu_info_ver_mem_0_byteena_a;
    wire [15:0] cu_info_ver_mem_0_byteena_b;
    wire       cu_info_ver_mem_0_clock_a;
    wire       cu_info_ver_mem_0_clock_b;
    wire [127:0] cu_info_ver_mem_0_data_a;
    wire [127:0] cu_info_ver_mem_0_data_b;
    wire [127:0] cu_info_ver_mem_0_q_a;
    wire [127:0] cu_info_ver_mem_0_q_b;
    wire       cu_info_ver_mem_0_wren_a;
    wire       cu_info_ver_mem_0_wren_b;
    // left_border_RAM_adapter_0 port wires:
    wire       left_border_RAM_adapter_0_clk;
    wire [9:0] left_border_RAM_adapter_0_ram_a_address;
    wire [31:0] left_border_RAM_adapter_0_ram_a_readdata;
    wire       left_border_RAM_adapter_0_ram_a_write;
    wire [31:0] left_border_RAM_adapter_0_ram_a_writedata;
    wire [7:0] left_border_RAM_adapter_0_ram_b_address;
    wire [15:0] left_border_RAM_adapter_0_ram_b_byteen;
    wire [127:0] left_border_RAM_adapter_0_ram_b_readdata;
    wire       left_border_RAM_adapter_0_ram_b_write;
    wire [127:0] left_border_RAM_adapter_0_ram_b_writedata;
    wire       left_border_RAM_adapter_0_rst_n;
    // left_border_mem_0 port wires:
    wire [7:0] left_border_mem_0_address_a;
    wire [7:0] left_border_mem_0_address_b;
    wire [15:0] left_border_mem_0_byteena_a;
    wire [15:0] left_border_mem_0_byteena_b;
    wire       left_border_mem_0_clock_a;
    wire       left_border_mem_0_clock_b;
    wire [127:0] left_border_mem_0_data_a;
    wire [127:0] left_border_mem_0_data_b;
    wire [127:0] left_border_mem_0_q_a;
    wire [127:0] left_border_mem_0_q_b;
    wire       left_border_mem_0_wren_a;
    wire       left_border_mem_0_wren_b;
    // rec_mem_0 port wires:
    wire [12:0] rec_mem_0_address_a;
    wire [11:0] rec_mem_0_address_b;
    wire [15:0] rec_mem_0_byteena_a;
    wire [31:0] rec_mem_0_byteena_b;
    wire       rec_mem_0_clock_a;
    wire       rec_mem_0_clock_b;
    wire [127:0] rec_mem_0_data_a;
    wire [255:0] rec_mem_0_data_b;
    wire [127:0] rec_mem_0_q_a;
    wire [255:0] rec_mem_0_q_b;
    wire       rec_mem_0_wren_a;
    wire       rec_mem_0_wren_b;
    // ref_RAM_adapter_0 port wires:
    wire       ref_RAM_adapter_0_clk;
    wire [14:0] ref_RAM_adapter_0_ram_a_address;
    wire [31:0] ref_RAM_adapter_0_ram_a_readdata;
    wire       ref_RAM_adapter_0_ram_a_write;
    wire [31:0] ref_RAM_adapter_0_ram_a_writedata;
    wire [12:0] ref_RAM_adapter_0_ram_b_address;
    wire [15:0] ref_RAM_adapter_0_ram_b_byteen;
    wire [127:0] ref_RAM_adapter_0_ram_b_readdata;
    wire       ref_RAM_adapter_0_ram_b_write;
    wire [127:0] ref_RAM_adapter_0_ram_b_writedata;
    wire       ref_RAM_adapter_0_rst_n;
    // ref_mem_0 port wires:
    wire [12:0] ref_mem_0_address_a;
    wire [12:0] ref_mem_0_address_b;
    wire [15:0] ref_mem_0_byteena_a;
    wire [15:0] ref_mem_0_byteena_b;
    wire       ref_mem_0_clock_a;
    wire       ref_mem_0_clock_b;
    wire [127:0] ref_mem_0_data_a;
    wire [127:0] ref_mem_0_data_b;
    wire [127:0] ref_mem_0_q_a;
    wire [127:0] ref_mem_0_q_b;
    wire       ref_mem_0_wren_a;
    wire       ref_mem_0_wren_b;
    // top_border_RAM_adapter_0 port wires:
    wire       top_border_RAM_adapter_0_clk;
    wire [9:0] top_border_RAM_adapter_0_ram_a_address;
    wire [31:0] top_border_RAM_adapter_0_ram_a_readdata;
    wire       top_border_RAM_adapter_0_ram_a_write;
    wire [31:0] top_border_RAM_adapter_0_ram_a_writedata;
    wire [7:0] top_border_RAM_adapter_0_ram_b_address;
    wire [15:0] top_border_RAM_adapter_0_ram_b_byteen;
    wire [127:0] top_border_RAM_adapter_0_ram_b_readdata;
    wire       top_border_RAM_adapter_0_ram_b_write;
    wire [127:0] top_border_RAM_adapter_0_ram_b_writedata;
    wire       top_border_RAM_adapter_0_rst_n;
    // top_border_mem_0 port wires:
    wire [7:0] top_border_mem_0_address_a;
    wire [7:0] top_border_mem_0_address_b;
    wire [15:0] top_border_mem_0_byteena_a;
    wire [15:0] top_border_mem_0_byteena_b;
    wire       top_border_mem_0_clock_a;
    wire       top_border_mem_0_clock_b;
    wire [127:0] top_border_mem_0_data_a;
    wire [127:0] top_border_mem_0_data_b;
    wire [127:0] top_border_mem_0_q_a;
    wire [127:0] top_border_mem_0_q_b;
    wire       top_border_mem_0_wren_a;
    wire       top_border_mem_0_wren_b;

    // Assignments for the ports of the encompassing component:
    assign ref_mem_0_ram_a_to_ref_a_ADDR = address_a;
    assign top_border_mem_0_ram_a_to_top_border_a_ADDR = address_a_1;
    assign left_border_mem_0_ram_a_to_left_border_a_ADDR = address_a_2;
    assign cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_ADDR = address_a_3;
    assign cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_ADDR = address_a_4;
    assign cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_ADDR = address_a_5;
    assign cu_info_mem_0_ram_a_to_cu_info_a_ADDR = address_a_6;
    assign cabac_mem_0_ram_a_to_cabac_a_ADDR = address_a_7;
    assign rec_mem_0_ram_a_to_rec_a_ADDR = address_a_8;
    assign cabac_mem_0_ram_b_to_cabac_b_ADDR = address_b;
    assign rec_mem_0_ram_b_to_rec_b_ADDR = address_b_1;
    assign ref_mem_0_ram_a_to_ref_a_BYTEEN = byteena_a;
    assign top_border_mem_0_ram_a_to_top_border_a_BYTEEN = byteena_a_1;
    assign left_border_mem_0_ram_a_to_left_border_a_BYTEEN = byteena_a_2;
    assign cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_BYTEEN = byteena_a_3;
    assign cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_BYTEEN = byteena_a_4;
    assign cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_BYTEEN = byteena_a_5;
    assign cu_info_mem_0_ram_a_to_cu_info_a_BYTEEN = byteena_a_6;
    assign cabac_mem_0_ram_a_to_cabac_a_BYTEEN = byteena_a_7;
    assign rec_mem_0_ram_a_to_rec_a_BYTEEN = byteena_a_8;
    assign rec_mem_0_ram_b_to_rec_b_BYTEEN = byteena_b_1;
    assign ref_RAM_adapter_0_clk_to_clk_base_CLK = clk;
    assign ref_mem_0_clk_a_to_clk_mem_CLK = clock_a;
    assign ref_mem_0_ram_a_to_ref_a_WDATA = data_a;
    assign top_border_mem_0_ram_a_to_top_border_a_WDATA = data_a_1;
    assign left_border_mem_0_ram_a_to_left_border_a_WDATA = data_a_2;
    assign cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_WDATA = data_a_3;
    assign cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_WDATA = data_a_4;
    assign cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_WDATA = data_a_5;
    assign cu_info_mem_0_ram_a_to_cu_info_a_WDATA = data_a_6;
    assign cabac_mem_0_ram_a_to_cabac_a_WDATA = data_a_7;
    assign rec_mem_0_ram_a_to_rec_a_WDATA = data_a_8;
    assign cabac_mem_0_ram_b_to_cabac_b_WDATA = data_b;
    assign rec_mem_0_ram_b_to_rec_b_WDATA = data_b_1;
    assign q_a = ref_mem_0_ram_a_to_ref_a_RDATA;
    assign q_a_1 = top_border_mem_0_ram_a_to_top_border_a_RDATA;
    assign q_a_2 = left_border_mem_0_ram_a_to_left_border_a_RDATA;
    assign q_a_3 = cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_RDATA;
    assign q_a_4 = cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_RDATA;
    assign q_a_5 = cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_RDATA;
    assign q_a_6 = cu_info_mem_0_ram_a_to_cu_info_a_RDATA;
    assign q_a_7 = cabac_mem_0_ram_a_to_cabac_a_RDATA;
    assign q_a_8 = rec_mem_0_ram_a_to_rec_a_RDATA;
    assign q_b = cabac_mem_0_ram_b_to_cabac_b_RDATA;
    assign q_b_1 = rec_mem_0_ram_b_to_rec_b_RDATA;
    assign ref_RAM_adapter_0_ram_a_to_ref_b_ADDR = ram_a_address;
    assign top_border_RAM_adapter_0_ram_a_to_top_border_b_ADDR = ram_a_address_1;
    assign left_border_RAM_adapter_0_ram_a_to_left_border_b_ADDR = ram_a_address_2;
    assign cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_ADDR = ram_a_address_3;
    assign cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_ADDR = ram_a_address_4;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_ADDR = ram_a_address_5;
    assign cu_info_RAM_adapter_0_ram_a_to_cu_info_b_ADDR = ram_a_address_6;
    assign ram_a_readdata = ref_RAM_adapter_0_ram_a_to_ref_b_RDATA;
    assign ram_a_readdata_1 = top_border_RAM_adapter_0_ram_a_to_top_border_b_RDATA;
    assign ram_a_readdata_2 = left_border_RAM_adapter_0_ram_a_to_left_border_b_RDATA;
    assign ram_a_readdata_3 = cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_RDATA;
    assign ram_a_readdata_4 = cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_RDATA;
    assign ram_a_readdata_5 = cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_RDATA;
    assign ram_a_readdata_6 = cu_info_RAM_adapter_0_ram_a_to_cu_info_b_RDATA;
    assign ref_RAM_adapter_0_ram_a_to_ref_b_WREN = ram_a_write;
    assign top_border_RAM_adapter_0_ram_a_to_top_border_b_WREN = ram_a_write_1;
    assign left_border_RAM_adapter_0_ram_a_to_left_border_b_WREN = ram_a_write_2;
    assign cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_WREN = ram_a_write_3;
    assign cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_WREN = ram_a_write_4;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_WREN = ram_a_write_5;
    assign cu_info_RAM_adapter_0_ram_a_to_cu_info_b_WREN = ram_a_write_6;
    assign ref_RAM_adapter_0_ram_a_to_ref_b_WDATA = ram_a_writedata;
    assign top_border_RAM_adapter_0_ram_a_to_top_border_b_WDATA = ram_a_writedata_1;
    assign left_border_RAM_adapter_0_ram_a_to_left_border_b_WDATA = ram_a_writedata_2;
    assign cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_WDATA = ram_a_writedata_3;
    assign cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_WDATA = ram_a_writedata_4;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_WDATA = ram_a_writedata_5;
    assign cu_info_RAM_adapter_0_ram_a_to_cu_info_b_WDATA = ram_a_writedata_6;
    assign ram_b_address = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_ADDR;
    assign ram_b_byteen = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_BYTEEN;
    assign ram_b_write = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WREN;
    assign ram_b_writedata = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WDATA;
    assign ref_RAM_adapter_0_arst_n_to_bus_1_arst_n = rst_n;
    assign ref_mem_0_ram_a_to_ref_a_WREN = wren_a;
    assign top_border_mem_0_ram_a_to_top_border_a_WREN = wren_a_1;
    assign left_border_mem_0_ram_a_to_left_border_a_WREN = wren_a_2;
    assign cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_WREN = wren_a_3;
    assign cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_WREN = wren_a_4;
    assign cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_WREN = wren_a_5;
    assign cu_info_mem_0_ram_a_to_cu_info_a_WREN = wren_a_6;
    assign cabac_mem_0_ram_a_to_cabac_a_WREN = wren_a_7;
    assign rec_mem_0_ram_a_to_rec_a_WREN = wren_a_8;
    assign cabac_mem_0_ram_b_to_cabac_b_WREN = wren_b;
    assign rec_mem_0_ram_b_to_rec_b_WREN = wren_b_1;

    // cabac_mem_0 assignments:
    assign cabac_mem_0_address_a = cabac_mem_0_ram_a_to_cabac_a_ADDR;
    assign cabac_mem_0_address_b = cabac_mem_0_ram_b_to_cabac_b_ADDR;
    assign cabac_mem_0_byteena_a = cabac_mem_0_ram_a_to_cabac_a_BYTEEN;
    assign cabac_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign cabac_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cabac_mem_0_data_a = cabac_mem_0_ram_a_to_cabac_a_WDATA;
    assign cabac_mem_0_data_b = cabac_mem_0_ram_b_to_cabac_b_WDATA;
    assign cabac_mem_0_ram_a_to_cabac_a_RDATA = cabac_mem_0_q_a;
    assign cabac_mem_0_ram_b_to_cabac_b_RDATA = cabac_mem_0_q_b;
    assign cabac_mem_0_wren_a = cabac_mem_0_ram_a_to_cabac_a_WREN;
    assign cabac_mem_0_wren_b = cabac_mem_0_ram_b_to_cabac_b_WREN;
    // cu_info_RAM_adapter_0 assignments:
    assign cu_info_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_RAM_adapter_0_ram_a_address = cu_info_RAM_adapter_0_ram_a_to_cu_info_b_ADDR;
    assign cu_info_RAM_adapter_0_ram_a_to_cu_info_b_RDATA = cu_info_RAM_adapter_0_ram_a_readdata;
    assign cu_info_RAM_adapter_0_ram_a_write = cu_info_RAM_adapter_0_ram_a_to_cu_info_b_WREN;
    assign cu_info_RAM_adapter_0_ram_a_writedata = cu_info_RAM_adapter_0_ram_a_to_cu_info_b_WDATA;
    assign cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_ADDR = cu_info_RAM_adapter_0_ram_b_address;
    assign cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_BYTEEN = cu_info_RAM_adapter_0_ram_b_byteen;
    assign cu_info_RAM_adapter_0_ram_b_readdata = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_RDATA;
    assign cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WREN = cu_info_RAM_adapter_0_ram_b_write;
    assign cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WDATA = cu_info_RAM_adapter_0_ram_b_writedata;
    assign cu_info_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // cu_info_hor_RAM_adapter_0 assignments:
    assign cu_info_hor_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_hor_RAM_adapter_0_ram_a_address = cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_ADDR;
    assign cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_RDATA = cu_info_hor_RAM_adapter_0_ram_a_readdata;
    assign cu_info_hor_RAM_adapter_0_ram_a_write = cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_WREN;
    assign cu_info_hor_RAM_adapter_0_ram_a_writedata = cu_info_hor_RAM_adapter_0_ram_a_to_cu_info_hor_b_WDATA;
    assign cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_ADDR = cu_info_hor_RAM_adapter_0_ram_b_address;
    assign cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_BYTEEN = cu_info_hor_RAM_adapter_0_ram_b_byteen;
    assign cu_info_hor_RAM_adapter_0_ram_b_readdata = cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_RDATA;
    assign cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_WREN = cu_info_hor_RAM_adapter_0_ram_b_write;
    assign cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_WDATA = cu_info_hor_RAM_adapter_0_ram_b_writedata;
    assign cu_info_hor_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // cu_info_hor_mem_0 assignments:
    assign cu_info_hor_mem_0_address_a = cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_ADDR;
    assign cu_info_hor_mem_0_address_b = cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_ADDR;
    assign cu_info_hor_mem_0_byteena_a = cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_BYTEEN;
    assign cu_info_hor_mem_0_byteena_b = cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_BYTEEN;
    assign cu_info_hor_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign cu_info_hor_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_hor_mem_0_data_a = cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_WDATA;
    assign cu_info_hor_mem_0_data_b = cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_WDATA;
    assign cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_RDATA = cu_info_hor_mem_0_q_a;
    assign cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_RDATA = cu_info_hor_mem_0_q_b;
    assign cu_info_hor_mem_0_wren_a = cu_info_hor_mem_0_ram_a_to_cu_info_hor_a_WREN;
    assign cu_info_hor_mem_0_wren_b = cu_info_hor_RAM_adapter_0_ram_b_to_cu_info_hor_mem_0_ram_b_WREN;
    // cu_info_hor_str_RAM_adapter_0 assignments:
    assign cu_info_hor_str_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_address = cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_ADDR;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_RDATA = cu_info_hor_str_RAM_adapter_0_ram_a_readdata;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_write = cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_WREN;
    assign cu_info_hor_str_RAM_adapter_0_ram_a_writedata = cu_info_hor_str_RAM_adapter_0_ram_a_to_cu_info_hor_str_b_WDATA;
    assign cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_ADDR = cu_info_hor_str_RAM_adapter_0_ram_b_address;
    assign cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_BYTEEN = cu_info_hor_str_RAM_adapter_0_ram_b_byteen;
    assign cu_info_hor_str_RAM_adapter_0_ram_b_readdata = cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_RDATA;
    assign cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_WREN = cu_info_hor_str_RAM_adapter_0_ram_b_write;
    assign cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_WDATA = cu_info_hor_str_RAM_adapter_0_ram_b_writedata;
    assign cu_info_hor_str_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // cu_info_hor_str_mem_0 assignments:
    assign cu_info_hor_str_mem_0_address_a = cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_ADDR;
    assign cu_info_hor_str_mem_0_address_b = cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_ADDR;
    assign cu_info_hor_str_mem_0_byteena_a = cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_BYTEEN;
    assign cu_info_hor_str_mem_0_byteena_b = cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_BYTEEN;
    assign cu_info_hor_str_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign cu_info_hor_str_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_hor_str_mem_0_data_a = cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_WDATA;
    assign cu_info_hor_str_mem_0_data_b = cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_WDATA;
    assign cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_RDATA = cu_info_hor_str_mem_0_q_a;
    assign cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_RDATA = cu_info_hor_str_mem_0_q_b;
    assign cu_info_hor_str_mem_0_wren_a = cu_info_hor_str_mem_0_ram_a_to_cu_info_hor_str_a_WREN;
    assign cu_info_hor_str_mem_0_wren_b = cu_info_hor_str_mem_0_ram_b_to_cu_info_hor_str_RAM_adapter_0_ram_b_WREN;
    // cu_info_mem_0 assignments:
    assign cu_info_mem_0_address_a = cu_info_mem_0_ram_a_to_cu_info_a_ADDR;
    assign cu_info_mem_0_address_b = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_ADDR;
    assign cu_info_mem_0_byteena_a = cu_info_mem_0_ram_a_to_cu_info_a_BYTEEN;
    assign cu_info_mem_0_byteena_b = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_BYTEEN;
    assign cu_info_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign cu_info_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_mem_0_data_a = cu_info_mem_0_ram_a_to_cu_info_a_WDATA;
    assign cu_info_mem_0_data_b = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WDATA;
    assign cu_info_mem_0_ram_a_to_cu_info_a_RDATA = cu_info_mem_0_q_a;
    assign cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_RDATA = cu_info_mem_0_q_b;
    assign cu_info_mem_0_wren_a = cu_info_mem_0_ram_a_to_cu_info_a_WREN;
    assign cu_info_mem_0_wren_b = cu_info_RAM_adapter_0_ram_b_to_cu_info_mem_0_ram_b_WREN;
    // cu_info_ver_RAM_adapter_0 assignments:
    assign cu_info_ver_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_ver_RAM_adapter_0_ram_a_address = cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_ADDR;
    assign cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_RDATA = cu_info_ver_RAM_adapter_0_ram_a_readdata;
    assign cu_info_ver_RAM_adapter_0_ram_a_write = cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_WREN;
    assign cu_info_ver_RAM_adapter_0_ram_a_writedata = cu_info_ver_RAM_adapter_0_ram_a_to_cu_info_ver_b_WDATA;
    assign cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_ADDR = cu_info_ver_RAM_adapter_0_ram_b_address;
    assign cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_BYTEEN = cu_info_ver_RAM_adapter_0_ram_b_byteen;
    assign cu_info_ver_RAM_adapter_0_ram_b_readdata = cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_RDATA;
    assign cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_WREN = cu_info_ver_RAM_adapter_0_ram_b_write;
    assign cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_WDATA = cu_info_ver_RAM_adapter_0_ram_b_writedata;
    assign cu_info_ver_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // cu_info_ver_mem_0 assignments:
    assign cu_info_ver_mem_0_address_a = cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_ADDR;
    assign cu_info_ver_mem_0_address_b = cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_ADDR;
    assign cu_info_ver_mem_0_byteena_a = cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_BYTEEN;
    assign cu_info_ver_mem_0_byteena_b = cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_BYTEEN;
    assign cu_info_ver_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign cu_info_ver_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign cu_info_ver_mem_0_data_a = cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_WDATA;
    assign cu_info_ver_mem_0_data_b = cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_WDATA;
    assign cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_RDATA = cu_info_ver_mem_0_q_a;
    assign cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_RDATA = cu_info_ver_mem_0_q_b;
    assign cu_info_ver_mem_0_wren_a = cu_info_ver_mem_0_ram_a_to_cu_info_ver_a_WREN;
    assign cu_info_ver_mem_0_wren_b = cu_info_ver_mem_0_ram_b_to_cu_info_ver_RAM_adapter_0_ram_b_WREN;
    // left_border_RAM_adapter_0 assignments:
    assign left_border_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign left_border_RAM_adapter_0_ram_a_address = left_border_RAM_adapter_0_ram_a_to_left_border_b_ADDR;
    assign left_border_RAM_adapter_0_ram_a_to_left_border_b_RDATA = left_border_RAM_adapter_0_ram_a_readdata;
    assign left_border_RAM_adapter_0_ram_a_write = left_border_RAM_adapter_0_ram_a_to_left_border_b_WREN;
    assign left_border_RAM_adapter_0_ram_a_writedata = left_border_RAM_adapter_0_ram_a_to_left_border_b_WDATA;
    assign left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_ADDR = left_border_RAM_adapter_0_ram_b_address;
    assign left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_BYTEEN = left_border_RAM_adapter_0_ram_b_byteen;
    assign left_border_RAM_adapter_0_ram_b_readdata = left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_RDATA;
    assign left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_WREN = left_border_RAM_adapter_0_ram_b_write;
    assign left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_WDATA = left_border_RAM_adapter_0_ram_b_writedata;
    assign left_border_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // left_border_mem_0 assignments:
    assign left_border_mem_0_address_a = left_border_mem_0_ram_a_to_left_border_a_ADDR;
    assign left_border_mem_0_address_b = left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_ADDR;
    assign left_border_mem_0_byteena_a = left_border_mem_0_ram_a_to_left_border_a_BYTEEN;
    assign left_border_mem_0_byteena_b = left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_BYTEEN;
    assign left_border_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign left_border_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign left_border_mem_0_data_a = left_border_mem_0_ram_a_to_left_border_a_WDATA;
    assign left_border_mem_0_data_b = left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_WDATA;
    assign left_border_mem_0_ram_a_to_left_border_a_RDATA = left_border_mem_0_q_a;
    assign left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_RDATA = left_border_mem_0_q_b;
    assign left_border_mem_0_wren_a = left_border_mem_0_ram_a_to_left_border_a_WREN;
    assign left_border_mem_0_wren_b = left_border_RAM_adapter_0_ram_b_to_left_border_mem_0_ram_b_WREN;
    // rec_mem_0 assignments:
    assign rec_mem_0_address_a = rec_mem_0_ram_a_to_rec_a_ADDR;
    assign rec_mem_0_address_b = rec_mem_0_ram_b_to_rec_b_ADDR;
    assign rec_mem_0_byteena_a = rec_mem_0_ram_a_to_rec_a_BYTEEN;
    assign rec_mem_0_byteena_b = rec_mem_0_ram_b_to_rec_b_BYTEEN;
    assign rec_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign rec_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign rec_mem_0_data_a = rec_mem_0_ram_a_to_rec_a_WDATA;
    assign rec_mem_0_data_b = rec_mem_0_ram_b_to_rec_b_WDATA;
    assign rec_mem_0_ram_a_to_rec_a_RDATA = rec_mem_0_q_a;
    assign rec_mem_0_ram_b_to_rec_b_RDATA = rec_mem_0_q_b;
    assign rec_mem_0_wren_a = rec_mem_0_ram_a_to_rec_a_WREN;
    assign rec_mem_0_wren_b = rec_mem_0_ram_b_to_rec_b_WREN;
    // ref_RAM_adapter_0 assignments:
    assign ref_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign ref_RAM_adapter_0_ram_a_address = ref_RAM_adapter_0_ram_a_to_ref_b_ADDR;
    assign ref_RAM_adapter_0_ram_a_to_ref_b_RDATA = ref_RAM_adapter_0_ram_a_readdata;
    assign ref_RAM_adapter_0_ram_a_write = ref_RAM_adapter_0_ram_a_to_ref_b_WREN;
    assign ref_RAM_adapter_0_ram_a_writedata = ref_RAM_adapter_0_ram_a_to_ref_b_WDATA;
    assign ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_ADDR = ref_RAM_adapter_0_ram_b_address;
    assign ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_BYTEEN = ref_RAM_adapter_0_ram_b_byteen;
    assign ref_RAM_adapter_0_ram_b_readdata = ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_RDATA;
    assign ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_WREN = ref_RAM_adapter_0_ram_b_write;
    assign ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_WDATA = ref_RAM_adapter_0_ram_b_writedata;
    assign ref_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // ref_mem_0 assignments:
    assign ref_mem_0_address_a = ref_mem_0_ram_a_to_ref_a_ADDR;
    assign ref_mem_0_address_b = ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_ADDR;
    assign ref_mem_0_byteena_a = ref_mem_0_ram_a_to_ref_a_BYTEEN;
    assign ref_mem_0_byteena_b = ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_BYTEEN;
    assign ref_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign ref_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign ref_mem_0_data_a = ref_mem_0_ram_a_to_ref_a_WDATA;
    assign ref_mem_0_data_b = ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_WDATA;
    assign ref_mem_0_ram_a_to_ref_a_RDATA = ref_mem_0_q_a;
    assign ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_RDATA = ref_mem_0_q_b;
    assign ref_mem_0_wren_a = ref_mem_0_ram_a_to_ref_a_WREN;
    assign ref_mem_0_wren_b = ref_RAM_adapter_0_ram_b_to_ref_mem_0_ram_b_WREN;
    // top_border_RAM_adapter_0 assignments:
    assign top_border_RAM_adapter_0_clk = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign top_border_RAM_adapter_0_ram_a_address = top_border_RAM_adapter_0_ram_a_to_top_border_b_ADDR;
    assign top_border_RAM_adapter_0_ram_a_to_top_border_b_RDATA = top_border_RAM_adapter_0_ram_a_readdata;
    assign top_border_RAM_adapter_0_ram_a_write = top_border_RAM_adapter_0_ram_a_to_top_border_b_WREN;
    assign top_border_RAM_adapter_0_ram_a_writedata = top_border_RAM_adapter_0_ram_a_to_top_border_b_WDATA;
    assign top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_ADDR = top_border_RAM_adapter_0_ram_b_address;
    assign top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_BYTEEN = top_border_RAM_adapter_0_ram_b_byteen;
    assign top_border_RAM_adapter_0_ram_b_readdata = top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_RDATA;
    assign top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_WREN = top_border_RAM_adapter_0_ram_b_write;
    assign top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_WDATA = top_border_RAM_adapter_0_ram_b_writedata;
    assign top_border_RAM_adapter_0_rst_n = ref_RAM_adapter_0_arst_n_to_bus_1_arst_n;
    // top_border_mem_0 assignments:
    assign top_border_mem_0_address_a = top_border_mem_0_ram_a_to_top_border_a_ADDR;
    assign top_border_mem_0_address_b = top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_ADDR;
    assign top_border_mem_0_byteena_a = top_border_mem_0_ram_a_to_top_border_a_BYTEEN;
    assign top_border_mem_0_byteena_b = top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_BYTEEN;
    assign top_border_mem_0_clock_a = ref_mem_0_clk_a_to_clk_mem_CLK;
    assign top_border_mem_0_clock_b = ref_RAM_adapter_0_clk_to_clk_base_CLK;
    assign top_border_mem_0_data_a = top_border_mem_0_ram_a_to_top_border_a_WDATA;
    assign top_border_mem_0_data_b = top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_WDATA;
    assign top_border_mem_0_ram_a_to_top_border_a_RDATA = top_border_mem_0_q_a;
    assign top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_RDATA = top_border_mem_0_q_b;
    assign top_border_mem_0_wren_a = top_border_mem_0_ram_a_to_top_border_a_WREN;
    assign top_border_mem_0_wren_b = top_border_mem_0_ram_b_to_top_border_RAM_adapter_0_ram_b_WREN;

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (4),
        .addr_width_b_g      (4))
    cabac_mem_0(
        // Interface: clk_a
        .clock_a             (cabac_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (cabac_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (cabac_mem_0_address_a),
        .byteena_a           (cabac_mem_0_byteena_a),
        .data_a              (cabac_mem_0_data_a),
        .wren_a              (cabac_mem_0_wren_a),
        .q_a                 (cabac_mem_0_q_a),
        // Interface: ram_b
        .address_b           (cabac_mem_0_address_b),
        .byteena_b           (),
        .data_b              (cabac_mem_0_data_b),
        .wren_b              (cabac_mem_0_wren_b),
        .q_b                 (cabac_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (32),
        .ram_a_address_width_g(12),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(10))
    cu_info_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (cu_info_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (cu_info_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (cu_info_RAM_adapter_0_ram_a_address),
        .ram_a_write         (cu_info_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (cu_info_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (cu_info_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (cu_info_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (cu_info_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (cu_info_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (cu_info_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (cu_info_RAM_adapter_0_ram_b_writedata),
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
    cu_info_hor_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (cu_info_hor_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (cu_info_hor_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (cu_info_hor_RAM_adapter_0_ram_a_address),
        .ram_a_write         (cu_info_hor_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (cu_info_hor_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (cu_info_hor_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (cu_info_hor_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (cu_info_hor_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (cu_info_hor_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (cu_info_hor_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (cu_info_hor_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (4),
        .addr_width_b_g      (4))
    cu_info_hor_mem_0(
        // Interface: clk_a
        .clock_a             (cu_info_hor_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info_hor_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (cu_info_hor_mem_0_address_a),
        .byteena_a           (cu_info_hor_mem_0_byteena_a),
        .data_a              (cu_info_hor_mem_0_data_a),
        .wren_a              (cu_info_hor_mem_0_wren_a),
        .q_a                 (cu_info_hor_mem_0_q_a),
        // Interface: ram_b
        .address_b           (cu_info_hor_mem_0_address_b),
        .byteena_b           (cu_info_hor_mem_0_byteena_b),
        .data_b              (cu_info_hor_mem_0_data_b),
        .wren_b              (cu_info_hor_mem_0_wren_b),
        .q_b                 (cu_info_hor_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(8),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(4))
    cu_info_hor_str_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (cu_info_hor_str_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (cu_info_hor_str_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (cu_info_hor_str_RAM_adapter_0_ram_a_address),
        .ram_a_write         (cu_info_hor_str_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (cu_info_hor_str_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (cu_info_hor_str_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (cu_info_hor_str_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (cu_info_hor_str_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (cu_info_hor_str_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (cu_info_hor_str_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (cu_info_hor_str_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (4),
        .addr_width_b_g      (4))
    cu_info_hor_str_mem_0(
        // Interface: clk_a
        .clock_a             (cu_info_hor_str_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info_hor_str_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (cu_info_hor_str_mem_0_address_a),
        .byteena_a           (cu_info_hor_str_mem_0_byteena_a),
        .data_a              (cu_info_hor_str_mem_0_data_a),
        .wren_a              (cu_info_hor_str_mem_0_wren_a),
        .q_a                 (cu_info_hor_str_mem_0_q_a),
        // Interface: ram_b
        .address_b           (cu_info_hor_str_mem_0_address_b),
        .byteena_b           (cu_info_hor_str_mem_0_byteena_b),
        .data_b              (cu_info_hor_str_mem_0_data_b),
        .wren_b              (cu_info_hor_str_mem_0_wren_b),
        .q_b                 (cu_info_hor_str_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (10),
        .addr_width_b_g      (10))
    cu_info_mem_0(
        // Interface: clk_a
        .clock_a             (cu_info_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (cu_info_mem_0_address_a),
        .byteena_a           (cu_info_mem_0_byteena_a),
        .data_a              (cu_info_mem_0_data_a),
        .wren_a              (cu_info_mem_0_wren_a),
        .q_a                 (cu_info_mem_0_q_a),
        // Interface: ram_b
        .address_b           (cu_info_mem_0_address_b),
        .byteena_b           (cu_info_mem_0_byteena_b),
        .data_b              (cu_info_mem_0_data_b),
        .wren_b              (cu_info_mem_0_wren_b),
        .q_b                 (cu_info_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (8),
        .ram_a_address_width_g(8),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(4))
    cu_info_ver_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (cu_info_ver_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (cu_info_ver_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (cu_info_ver_RAM_adapter_0_ram_a_address),
        .ram_a_write         (cu_info_ver_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (cu_info_ver_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (cu_info_ver_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (cu_info_ver_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (cu_info_ver_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (cu_info_ver_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (cu_info_ver_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (cu_info_ver_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (4),
        .addr_width_b_g      (4))
    cu_info_ver_mem_0(
        // Interface: clk_a
        .clock_a             (cu_info_ver_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (cu_info_ver_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (cu_info_ver_mem_0_address_a),
        .byteena_a           (cu_info_ver_mem_0_byteena_a),
        .data_a              (cu_info_ver_mem_0_data_a),
        .wren_a              (cu_info_ver_mem_0_wren_a),
        .q_a                 (cu_info_ver_mem_0_q_a),
        // Interface: ram_b
        .address_b           (cu_info_ver_mem_0_address_b),
        .byteena_b           (cu_info_ver_mem_0_byteena_b),
        .data_b              (cu_info_ver_mem_0_data_b),
        .wren_b              (cu_info_ver_mem_0_wren_b),
        .q_b                 (cu_info_ver_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (32),
        .ram_a_address_width_g(10),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(8))
    left_border_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (left_border_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (left_border_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (left_border_RAM_adapter_0_ram_a_address),
        .ram_a_write         (left_border_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (left_border_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (left_border_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (left_border_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (left_border_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (left_border_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (left_border_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (left_border_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (8),
        .addr_width_b_g      (8))
    left_border_mem_0(
        // Interface: clk_a
        .clock_a             (left_border_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (left_border_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (left_border_mem_0_address_a),
        .byteena_a           (left_border_mem_0_byteena_a),
        .data_a              (left_border_mem_0_data_a),
        .wren_a              (left_border_mem_0_wren_a),
        .q_a                 (left_border_mem_0_q_a),
        // Interface: ram_b
        .address_b           (left_border_mem_0_address_b),
        .byteena_b           (left_border_mem_0_byteena_b),
        .data_b              (left_border_mem_0_data_b),
        .wren_b              (left_border_mem_0_wren_b),
        .q_b                 (left_border_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (256),
        .addr_width_a_g      (13),
        .addr_width_b_g      (12))
    rec_mem_0(
        // Interface: clk_a
        .clock_a             (rec_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (rec_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (rec_mem_0_address_a),
        .byteena_a           (rec_mem_0_byteena_a),
        .data_a              (rec_mem_0_data_a),
        .wren_a              (rec_mem_0_wren_a),
        .q_a                 (rec_mem_0_q_a),
        // Interface: ram_b
        .address_b           (rec_mem_0_address_b),
        .byteena_b           (rec_mem_0_byteena_b),
        .data_b              (rec_mem_0_data_b),
        .wren_b              (rec_mem_0_wren_b),
        .q_b                 (rec_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (32),
        .ram_a_address_width_g(15),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(13))
    ref_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (ref_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (ref_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (ref_RAM_adapter_0_ram_a_address),
        .ram_a_write         (ref_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (ref_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (ref_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (ref_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (ref_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (ref_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (ref_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (ref_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (13),
        .addr_width_b_g      (13))
    ref_mem_0(
        // Interface: clk_a
        .clock_a             (ref_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (ref_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (ref_mem_0_address_a),
        .byteena_a           (ref_mem_0_byteena_a),
        .data_a              (ref_mem_0_data_a),
        .wren_a              (ref_mem_0_wren_a),
        .q_a                 (ref_mem_0_q_a),
        // Interface: ram_b
        .address_b           (ref_mem_0_address_b),
        .byteena_b           (ref_mem_0_byteena_b),
        .data_b              (ref_mem_0_data_b),
        .wren_b              (ref_mem_0_wren_b),
        .q_b                 (ref_mem_0_q_b));

    // IP-XACT VLNV: tuni.fi:Kvazaar:RAM_adapter:1.0
    RAM_adapter #(
        .ram_a_width_g       (32),
        .ram_a_address_width_g(10),
        .ram_b_width_g       (128),
        .ram_b_address_width_g(8))
    top_border_RAM_adapter_0(
        // Interface: arst_n
        .rst_n               (top_border_RAM_adapter_0_rst_n),
        // Interface: clk
        .clk                 (top_border_RAM_adapter_0_clk),
        // Interface: ram_a
        .ram_a_address       (top_border_RAM_adapter_0_ram_a_address),
        .ram_a_write         (top_border_RAM_adapter_0_ram_a_write),
        .ram_a_writedata     (top_border_RAM_adapter_0_ram_a_writedata),
        .ram_a_readdata      (top_border_RAM_adapter_0_ram_a_readdata),
        // Interface: ram_b
        .ram_b_readdata      (top_border_RAM_adapter_0_ram_b_readdata),
        .ram_b_address       (top_border_RAM_adapter_0_ram_b_address),
        .ram_b_byteen        (top_border_RAM_adapter_0_ram_b_byteen),
        .ram_b_write         (top_border_RAM_adapter_0_ram_b_write),
        .ram_b_writedata     (top_border_RAM_adapter_0_ram_b_writedata),
        // These ports are not in any interface
        .ram_a_byteen        (32'hffffffff),
        .ram_a_read          (),
        .ram_b_read          ());

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemoryDualPortDC:1.0
    OnChipMemoryDualPortDC #(
        .width_a_g           (128),
        .width_b_g           (128),
        .addr_width_a_g      (8),
        .addr_width_b_g      (8))
    top_border_mem_0(
        // Interface: clk_a
        .clock_a             (top_border_mem_0_clock_a),
        // Interface: clk_b
        .clock_b             (top_border_mem_0_clock_b),
        // Interface: ram_a
        .address_a           (top_border_mem_0_address_a),
        .byteena_a           (top_border_mem_0_byteena_a),
        .data_a              (top_border_mem_0_data_a),
        .wren_a              (top_border_mem_0_wren_a),
        .q_a                 (top_border_mem_0_q_a),
        // Interface: ram_b
        .address_b           (top_border_mem_0_address_b),
        .byteena_b           (top_border_mem_0_byteena_b),
        .data_b              (top_border_mem_0_data_b),
        .wren_b              (top_border_mem_0_wren_b),
        .q_b                 (top_border_mem_0_q_b));


endmodule
