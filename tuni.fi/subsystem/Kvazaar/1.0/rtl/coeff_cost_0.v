
module coeff_cost_0(
    // Interface: arst_n
    input                               arst_n,

    // Interface: clk
    input                               clk,

    // Interface: coeff_in
    input                [511:0]        coeff_in_rsc_dat,
    input                               coeff_in_rsc_vld,
    output                              coeff_in_rsc_rdy,

    // Interface: coeff_out
    input                               coeff_out_rsc_rdy,
    output               [511:0]        coeff_out_rsc_dat,
    output                              coeff_out_rsc_vld
);

    // coeff_cost_core_0_arst_n_to_bus wires:
    wire       coeff_cost_core_0_arst_n_to_bus_arst_n;
    // coeff_cost_core_0_clk_to_bus_1 wires:
    wire       coeff_cost_core_0_clk_to_bus_1_CLK;
    // coeff_cost_core_0_coeff_in_to_bus_3 wires:
    wire [511:0] coeff_cost_core_0_coeff_in_to_bus_3_DAT;
    wire       coeff_cost_core_0_coeff_in_to_bus_3_RDY;
    wire       coeff_cost_core_0_coeff_in_to_bus_3_VLD;
    // coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_WREN;
    // OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1 wires:
    wire [6:0] OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_ADDR;
    wire [15:0] OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_RDATA;
    wire [15:0] OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_WDATA;
    wire       OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_WREN;
    // coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_WREN;
    // OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3 wires:
    wire [6:0] OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_ADDR;
    wire [15:0] OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_RDATA;
    wire [15:0] OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_WDATA;
    wire       OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_WREN;
    // coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_WREN;
    // OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5 wires:
    wire [6:0] OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_ADDR;
    wire [15:0] OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_RDATA;
    wire [15:0] OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_WDATA;
    wire       OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_WREN;
    // coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_WREN;
    // OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7 wires:
    wire [6:0] OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_ADDR;
    wire [15:0] OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_RDATA;
    wire [15:0] OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_WDATA;
    wire       OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_WREN;
    // coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_WREN;
    // OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9 wires:
    wire [6:0] OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_ADDR;
    wire [15:0] OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_RDATA;
    wire [15:0] OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_WDATA;
    wire       OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_WREN;
    // coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_WREN;
    // OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11 wires:
    wire [6:0] OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_ADDR;
    wire [15:0] OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_RDATA;
    wire [15:0] OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_WDATA;
    wire       OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_WREN;
    // OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12 wires:
    wire [6:0] OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_ADDR;
    wire [15:0] OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_RDATA;
    wire [15:0] OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_WDATA;
    wire       OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_WREN;
    // coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_WREN;
    // OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14 wires:
    wire [6:0] OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_ADDR;
    wire [15:0] OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_RDATA;
    wire [15:0] OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_WDATA;
    wire       OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_WREN;
    // coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_WREN;
    // coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_WREN;
    // OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17 wires:
    wire [6:0] OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_ADDR;
    wire [15:0] OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_RDATA;
    wire [15:0] OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_WDATA;
    wire       OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_WREN;
    // coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_WREN;
    // OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19 wires:
    wire [6:0] OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_ADDR;
    wire [15:0] OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_RDATA;
    wire [15:0] OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_WDATA;
    wire       OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_WREN;
    // coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_WREN;
    // OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21 wires:
    wire [6:0] OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_ADDR;
    wire [15:0] OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_RDATA;
    wire [15:0] OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_WDATA;
    wire       OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_WREN;
    // coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_WREN;
    // OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23 wires:
    wire [6:0] OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_ADDR;
    wire [15:0] OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_RDATA;
    wire [15:0] OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_WDATA;
    wire       OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_WREN;
    // coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_WREN;
    // OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25 wires:
    wire [6:0] OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_ADDR;
    wire [15:0] OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_RDATA;
    wire [15:0] OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_WDATA;
    wire       OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_WREN;
    // coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_WREN;
    // OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27 wires:
    wire [6:0] OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_ADDR;
    wire [15:0] OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_RDATA;
    wire [15:0] OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_WDATA;
    wire       OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_WREN;
    // coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_WREN;
    // OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29 wires:
    wire [6:0] OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_ADDR;
    wire [15:0] OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_RDATA;
    wire [15:0] OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_WDATA;
    wire       OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_WREN;
    // coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read wires:
    wire [6:0] coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_ADDR;
    wire [15:0] coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_RDATA;
    wire [15:0] coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_WDATA;
    wire       coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_WREN;
    // OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31 wires:
    wire [6:0] OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_ADDR;
    wire [15:0] OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_RDATA;
    wire [15:0] OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_WDATA;
    wire       OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_WREN;
    // coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_WDATA;
    wire       coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_WREN;
    // OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1 wires:
    wire [6:0] OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_ADDR;
    wire [15:0] OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_RDATA;
    wire [15:0] OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_WDATA;
    wire       OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_WREN;
    // coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_WDATA;
    wire       coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_WREN;
    // OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3 wires:
    wire [6:0] OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_ADDR;
    wire [15:0] OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_RDATA;
    wire [15:0] OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_WDATA;
    wire       OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_WREN;
    // coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_WDATA;
    wire       coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_WREN;
    // OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5 wires:
    wire [6:0] OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_ADDR;
    wire [15:0] OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_RDATA;
    wire [15:0] OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_WDATA;
    wire       OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_WREN;
    // coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_WDATA;
    wire       coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_WREN;
    // OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7 wires:
    wire [6:0] OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_ADDR;
    wire [15:0] OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_RDATA;
    wire [15:0] OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_WDATA;
    wire       OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_WREN;
    // coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_WDATA;
    wire       coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_WREN;
    // OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9 wires:
    wire [6:0] OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_ADDR;
    wire [15:0] OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_RDATA;
    wire [15:0] OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_WDATA;
    wire       OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_WREN;
    // coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_WDATA;
    wire       coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_WREN;
    // OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11 wires:
    wire [6:0] OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_ADDR;
    wire [15:0] OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_RDATA;
    wire [15:0] OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_WDATA;
    wire       OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_WREN;
    // coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_WDATA;
    wire       coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_WREN;
    // OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13 wires:
    wire [6:0] OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_ADDR;
    wire [15:0] OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_RDATA;
    wire [15:0] OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_WDATA;
    wire       OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_WREN;
    // coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_WDATA;
    wire       coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_WREN;
    // OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15 wires:
    wire [6:0] OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_ADDR;
    wire [15:0] OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_RDATA;
    wire [15:0] OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_WDATA;
    wire       OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_WREN;
    // coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_WDATA;
    wire       coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_WREN;
    // OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17 wires:
    wire [6:0] OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_ADDR;
    wire [15:0] OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_RDATA;
    wire [15:0] OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_WDATA;
    wire       OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_WREN;
    // coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_WDATA;
    wire       coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_WREN;
    // OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19 wires:
    wire [6:0] OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_ADDR;
    wire [15:0] OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_RDATA;
    wire [15:0] OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_WDATA;
    wire       OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_WREN;
    // coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_WDATA;
    wire       coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_WREN;
    // OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21 wires:
    wire [6:0] OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_ADDR;
    wire [15:0] OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_RDATA;
    wire [15:0] OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_WDATA;
    wire       OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_WREN;
    // coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_WDATA;
    wire       coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_WREN;
    // OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23 wires:
    wire [6:0] OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_ADDR;
    wire [15:0] OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_RDATA;
    wire [15:0] OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_WDATA;
    wire       OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_WREN;
    // coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_WDATA;
    wire       coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_WREN;
    // OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25 wires:
    wire [6:0] OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_ADDR;
    wire [15:0] OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_RDATA;
    wire [15:0] OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_WDATA;
    wire       OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_WREN;
    // coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_WDATA;
    wire       coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_WREN;
    // OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27 wires:
    wire [6:0] OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_ADDR;
    wire [15:0] OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_RDATA;
    wire [15:0] OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_WDATA;
    wire       OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_WREN;
    // coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_WDATA;
    wire       coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_WREN;
    // OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29 wires:
    wire [6:0] OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_ADDR;
    wire [15:0] OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_RDATA;
    wire [15:0] OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_WDATA;
    wire       OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_WREN;
    // coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write wires:
    wire [6:0] coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_ADDR;
    wire [15:0] coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_RDATA;
    wire [15:0] coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_WDATA;
    wire       coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_WREN;
    // OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31 wires:
    wire [6:0] OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_ADDR;
    wire [15:0] OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_RDATA;
    wire [15:0] OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_WDATA;
    wire       OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_WREN;
    // coeff_cost_core_0_coeff_out_to_fifo_0_data_in wires:
    wire [511:0] coeff_cost_core_0_coeff_out_to_fifo_0_data_in_DAT;
    wire       coeff_cost_core_0_coeff_out_to_fifo_0_data_in_RDY;
    wire       coeff_cost_core_0_coeff_out_to_fifo_0_data_in_VLD;
    // fifo_0_data_out_to_coeff_out wires:
    wire [511:0] fifo_0_data_out_to_coeff_out_DAT;
    wire       fifo_0_data_out_to_coeff_out_RDY;
    wire       fifo_0_data_out_to_coeff_out_VLD;

    // OnChipMemory_0 port wires:
    wire       OnChipMemory_0_clock;
    wire [6:0] OnChipMemory_0_rdaddress;
    wire [15:0] OnChipMemory_0_rdata;
    wire [15:0] OnChipMemory_0_wdata;
    wire [6:0] OnChipMemory_0_wraddress;
    wire       OnChipMemory_0_wren;
    // OnChipMemory_1 port wires:
    wire       OnChipMemory_1_clock;
    wire [6:0] OnChipMemory_1_rdaddress;
    wire [15:0] OnChipMemory_1_rdata;
    wire [15:0] OnChipMemory_1_wdata;
    wire [6:0] OnChipMemory_1_wraddress;
    wire       OnChipMemory_1_wren;
    // OnChipMemory_10 port wires:
    wire       OnChipMemory_10_clock;
    wire [6:0] OnChipMemory_10_rdaddress;
    wire [15:0] OnChipMemory_10_rdata;
    wire [15:0] OnChipMemory_10_wdata;
    wire [6:0] OnChipMemory_10_wraddress;
    wire       OnChipMemory_10_wren;
    // OnChipMemory_11 port wires:
    wire       OnChipMemory_11_clock;
    wire [6:0] OnChipMemory_11_rdaddress;
    wire [15:0] OnChipMemory_11_rdata;
    wire [15:0] OnChipMemory_11_wdata;
    wire [6:0] OnChipMemory_11_wraddress;
    wire       OnChipMemory_11_wren;
    // OnChipMemory_12 port wires:
    wire       OnChipMemory_12_clock;
    wire [6:0] OnChipMemory_12_rdaddress;
    wire [15:0] OnChipMemory_12_rdata;
    wire [15:0] OnChipMemory_12_wdata;
    wire [6:0] OnChipMemory_12_wraddress;
    wire       OnChipMemory_12_wren;
    // OnChipMemory_13 port wires:
    wire       OnChipMemory_13_clock;
    wire [6:0] OnChipMemory_13_rdaddress;
    wire [15:0] OnChipMemory_13_rdata;
    wire [15:0] OnChipMemory_13_wdata;
    wire [6:0] OnChipMemory_13_wraddress;
    wire       OnChipMemory_13_wren;
    // OnChipMemory_14 port wires:
    wire       OnChipMemory_14_clock;
    wire [6:0] OnChipMemory_14_rdaddress;
    wire [15:0] OnChipMemory_14_rdata;
    wire [15:0] OnChipMemory_14_wdata;
    wire [6:0] OnChipMemory_14_wraddress;
    wire       OnChipMemory_14_wren;
    // OnChipMemory_15 port wires:
    wire       OnChipMemory_15_clock;
    wire [6:0] OnChipMemory_15_rdaddress;
    wire [15:0] OnChipMemory_15_rdata;
    wire [15:0] OnChipMemory_15_wdata;
    wire [6:0] OnChipMemory_15_wraddress;
    wire       OnChipMemory_15_wren;
    // OnChipMemory_16 port wires:
    wire       OnChipMemory_16_clock;
    wire [6:0] OnChipMemory_16_rdaddress;
    wire [15:0] OnChipMemory_16_rdata;
    wire [15:0] OnChipMemory_16_wdata;
    wire [6:0] OnChipMemory_16_wraddress;
    wire       OnChipMemory_16_wren;
    // OnChipMemory_17 port wires:
    wire       OnChipMemory_17_clock;
    wire [6:0] OnChipMemory_17_rdaddress;
    wire [15:0] OnChipMemory_17_rdata;
    wire [15:0] OnChipMemory_17_wdata;
    wire [6:0] OnChipMemory_17_wraddress;
    wire       OnChipMemory_17_wren;
    // OnChipMemory_18 port wires:
    wire       OnChipMemory_18_clock;
    wire [6:0] OnChipMemory_18_rdaddress;
    wire [15:0] OnChipMemory_18_rdata;
    wire [15:0] OnChipMemory_18_wdata;
    wire [6:0] OnChipMemory_18_wraddress;
    wire       OnChipMemory_18_wren;
    // OnChipMemory_19 port wires:
    wire       OnChipMemory_19_clock;
    wire [6:0] OnChipMemory_19_rdaddress;
    wire [15:0] OnChipMemory_19_rdata;
    wire [15:0] OnChipMemory_19_wdata;
    wire [6:0] OnChipMemory_19_wraddress;
    wire       OnChipMemory_19_wren;
    // OnChipMemory_2 port wires:
    wire       OnChipMemory_2_clock;
    wire [6:0] OnChipMemory_2_rdaddress;
    wire [15:0] OnChipMemory_2_rdata;
    wire [15:0] OnChipMemory_2_wdata;
    wire [6:0] OnChipMemory_2_wraddress;
    wire       OnChipMemory_2_wren;
    // OnChipMemory_20 port wires:
    wire       OnChipMemory_20_clock;
    wire [6:0] OnChipMemory_20_rdaddress;
    wire [15:0] OnChipMemory_20_rdata;
    wire [15:0] OnChipMemory_20_wdata;
    wire [6:0] OnChipMemory_20_wraddress;
    wire       OnChipMemory_20_wren;
    // OnChipMemory_21 port wires:
    wire       OnChipMemory_21_clock;
    wire [6:0] OnChipMemory_21_rdaddress;
    wire [15:0] OnChipMemory_21_rdata;
    wire [15:0] OnChipMemory_21_wdata;
    wire [6:0] OnChipMemory_21_wraddress;
    wire       OnChipMemory_21_wren;
    // OnChipMemory_22 port wires:
    wire       OnChipMemory_22_clock;
    wire [6:0] OnChipMemory_22_rdaddress;
    wire [15:0] OnChipMemory_22_rdata;
    wire [15:0] OnChipMemory_22_wdata;
    wire [6:0] OnChipMemory_22_wraddress;
    wire       OnChipMemory_22_wren;
    // OnChipMemory_23 port wires:
    wire       OnChipMemory_23_clock;
    wire [6:0] OnChipMemory_23_rdaddress;
    wire [15:0] OnChipMemory_23_rdata;
    wire [15:0] OnChipMemory_23_wdata;
    wire [6:0] OnChipMemory_23_wraddress;
    wire       OnChipMemory_23_wren;
    // OnChipMemory_24 port wires:
    wire       OnChipMemory_24_clock;
    wire [6:0] OnChipMemory_24_rdaddress;
    wire [15:0] OnChipMemory_24_rdata;
    wire [15:0] OnChipMemory_24_wdata;
    wire [6:0] OnChipMemory_24_wraddress;
    wire       OnChipMemory_24_wren;
    // OnChipMemory_25 port wires:
    wire       OnChipMemory_25_clock;
    wire [6:0] OnChipMemory_25_rdaddress;
    wire [15:0] OnChipMemory_25_rdata;
    wire [15:0] OnChipMemory_25_wdata;
    wire [6:0] OnChipMemory_25_wraddress;
    wire       OnChipMemory_25_wren;
    // OnChipMemory_26 port wires:
    wire       OnChipMemory_26_clock;
    wire [6:0] OnChipMemory_26_rdaddress;
    wire [15:0] OnChipMemory_26_rdata;
    wire [15:0] OnChipMemory_26_wdata;
    wire [6:0] OnChipMemory_26_wraddress;
    wire       OnChipMemory_26_wren;
    // OnChipMemory_27 port wires:
    wire       OnChipMemory_27_clock;
    wire [6:0] OnChipMemory_27_rdaddress;
    wire [15:0] OnChipMemory_27_rdata;
    wire [15:0] OnChipMemory_27_wdata;
    wire [6:0] OnChipMemory_27_wraddress;
    wire       OnChipMemory_27_wren;
    // OnChipMemory_28 port wires:
    wire       OnChipMemory_28_clock;
    wire [6:0] OnChipMemory_28_rdaddress;
    wire [15:0] OnChipMemory_28_rdata;
    wire [15:0] OnChipMemory_28_wdata;
    wire [6:0] OnChipMemory_28_wraddress;
    wire       OnChipMemory_28_wren;
    // OnChipMemory_29 port wires:
    wire       OnChipMemory_29_clock;
    wire [6:0] OnChipMemory_29_rdaddress;
    wire [15:0] OnChipMemory_29_rdata;
    wire [15:0] OnChipMemory_29_wdata;
    wire [6:0] OnChipMemory_29_wraddress;
    wire       OnChipMemory_29_wren;
    // OnChipMemory_3 port wires:
    wire       OnChipMemory_3_clock;
    wire [6:0] OnChipMemory_3_rdaddress;
    wire [15:0] OnChipMemory_3_rdata;
    wire [15:0] OnChipMemory_3_wdata;
    wire [6:0] OnChipMemory_3_wraddress;
    wire       OnChipMemory_3_wren;
    // OnChipMemory_30 port wires:
    wire       OnChipMemory_30_clock;
    wire [6:0] OnChipMemory_30_rdaddress;
    wire [15:0] OnChipMemory_30_rdata;
    wire [15:0] OnChipMemory_30_wdata;
    wire [6:0] OnChipMemory_30_wraddress;
    wire       OnChipMemory_30_wren;
    // OnChipMemory_31 port wires:
    wire       OnChipMemory_31_clock;
    wire [6:0] OnChipMemory_31_rdaddress;
    wire [15:0] OnChipMemory_31_rdata;
    wire [15:0] OnChipMemory_31_wdata;
    wire [6:0] OnChipMemory_31_wraddress;
    wire       OnChipMemory_31_wren;
    // OnChipMemory_4 port wires:
    wire       OnChipMemory_4_clock;
    wire [6:0] OnChipMemory_4_rdaddress;
    wire [15:0] OnChipMemory_4_rdata;
    wire [15:0] OnChipMemory_4_wdata;
    wire [6:0] OnChipMemory_4_wraddress;
    wire       OnChipMemory_4_wren;
    // OnChipMemory_5 port wires:
    wire       OnChipMemory_5_clock;
    wire [6:0] OnChipMemory_5_rdaddress;
    wire [15:0] OnChipMemory_5_rdata;
    wire [15:0] OnChipMemory_5_wdata;
    wire [6:0] OnChipMemory_5_wraddress;
    wire       OnChipMemory_5_wren;
    // OnChipMemory_6 port wires:
    wire       OnChipMemory_6_clock;
    wire [6:0] OnChipMemory_6_rdaddress;
    wire [15:0] OnChipMemory_6_rdata;
    wire [15:0] OnChipMemory_6_wdata;
    wire [6:0] OnChipMemory_6_wraddress;
    wire       OnChipMemory_6_wren;
    // OnChipMemory_7 port wires:
    wire       OnChipMemory_7_clock;
    wire [6:0] OnChipMemory_7_rdaddress;
    wire [15:0] OnChipMemory_7_rdata;
    wire [15:0] OnChipMemory_7_wdata;
    wire [6:0] OnChipMemory_7_wraddress;
    wire       OnChipMemory_7_wren;
    // OnChipMemory_8 port wires:
    wire       OnChipMemory_8_clock;
    wire [6:0] OnChipMemory_8_rdaddress;
    wire [15:0] OnChipMemory_8_rdata;
    wire [15:0] OnChipMemory_8_wdata;
    wire [6:0] OnChipMemory_8_wraddress;
    wire       OnChipMemory_8_wren;
    // OnChipMemory_9 port wires:
    wire       OnChipMemory_9_clock;
    wire [6:0] OnChipMemory_9_rdaddress;
    wire [15:0] OnChipMemory_9_rdata;
    wire [15:0] OnChipMemory_9_wdata;
    wire [6:0] OnChipMemory_9_wraddress;
    wire       OnChipMemory_9_wren;
    // coeff_cost_core_0 port wires:
    wire       coeff_cost_core_0_arst_n;
    wire       coeff_cost_core_0_clk;
    wire [511:0] coeff_cost_core_0_coeff_in_rsc_dat;
    wire       coeff_cost_core_0_coeff_in_rsc_rdy;
    wire       coeff_cost_core_0_coeff_in_rsc_vld;
    wire [511:0] coeff_cost_core_0_coeff_out_rsc_dat;
    wire       coeff_cost_core_0_coeff_out_rsc_rdy;
    wire       coeff_cost_core_0_coeff_out_rsc_vld;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_0_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_0_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_10_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_10_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_11_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_11_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_12_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_12_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_13_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_13_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_14_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_14_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_15_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_15_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_16_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_16_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_17_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_17_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_18_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_18_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_19_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_19_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_1_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_1_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_20_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_20_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_21_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_21_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_22_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_22_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_23_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_23_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_24_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_24_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_25_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_25_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_26_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_26_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_27_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_27_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_28_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_28_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_29_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_29_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_2_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_2_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_30_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_30_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_31_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_31_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_3_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_3_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_4_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_4_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_5_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_5_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_6_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_6_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_7_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_7_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_8_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_8_q;
    wire [6:0] coeff_cost_core_0_trans_pull_rsc_0_9_adr;
    wire [15:0] coeff_cost_core_0_trans_pull_rsc_0_9_q;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_0_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_0_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_0_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_10_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_10_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_10_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_11_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_11_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_11_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_12_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_12_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_12_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_13_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_13_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_13_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_14_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_14_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_14_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_15_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_15_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_15_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_16_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_16_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_16_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_17_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_17_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_17_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_18_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_18_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_18_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_19_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_19_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_19_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_1_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_1_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_1_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_20_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_20_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_20_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_21_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_21_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_21_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_22_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_22_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_22_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_23_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_23_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_23_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_24_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_24_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_24_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_25_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_25_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_25_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_26_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_26_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_26_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_27_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_27_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_27_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_28_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_28_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_28_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_29_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_29_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_29_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_2_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_2_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_2_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_30_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_30_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_30_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_31_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_31_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_31_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_3_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_3_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_3_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_4_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_4_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_4_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_5_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_5_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_5_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_6_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_6_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_6_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_7_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_7_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_7_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_8_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_8_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_8_we;
    wire [6:0] coeff_cost_core_0_trans_push_rsc_0_9_adr;
    wire [15:0] coeff_cost_core_0_trans_push_rsc_0_9_d;
    wire       coeff_cost_core_0_trans_push_rsc_0_9_we;
    // fifo_0 port wires:
    wire       fifo_0_aclr_n;
    wire       fifo_0_clk;
    wire [511:0] fifo_0_d;
    wire       fifo_0_d_rdy;
    wire       fifo_0_d_vld;
    wire [511:0] fifo_0_q;
    wire       fifo_0_q_rdy;
    wire       fifo_0_q_vld;

    // Assignments for the ports of the encompassing component:
    assign coeff_cost_core_0_arst_n_to_bus_arst_n = arst_n;
    assign coeff_cost_core_0_clk_to_bus_1_CLK = clk;
    assign coeff_cost_core_0_coeff_in_to_bus_3_DAT = coeff_in_rsc_dat;
    assign coeff_in_rsc_rdy = coeff_cost_core_0_coeff_in_to_bus_3_RDY;
    assign coeff_cost_core_0_coeff_in_to_bus_3_VLD = coeff_in_rsc_vld;
    assign coeff_out_rsc_dat = fifo_0_data_out_to_coeff_out_DAT;
    assign fifo_0_data_out_to_coeff_out_RDY = coeff_out_rsc_rdy;
    assign coeff_out_rsc_vld = fifo_0_data_out_to_coeff_out_VLD;

    // OnChipMemory_0 assignments:
    assign OnChipMemory_0_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_0_rdaddress = coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_ADDR;
    assign coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_RDATA = OnChipMemory_0_rdata;
    assign OnChipMemory_0_wdata = coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_WDATA;
    assign OnChipMemory_0_wraddress = coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_ADDR;
    assign OnChipMemory_0_wren = coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_WREN;
    // OnChipMemory_1 assignments:
    assign OnChipMemory_1_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_1_rdaddress = OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_ADDR;
    assign OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_RDATA = OnChipMemory_1_rdata;
    assign OnChipMemory_1_wdata = OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_WDATA;
    assign OnChipMemory_1_wraddress = OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_ADDR;
    assign OnChipMemory_1_wren = OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_WREN;
    // OnChipMemory_10 assignments:
    assign OnChipMemory_10_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_10_rdaddress = coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_ADDR;
    assign coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_RDATA = OnChipMemory_10_rdata;
    assign OnChipMemory_10_wdata = coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_WDATA;
    assign OnChipMemory_10_wraddress = coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_ADDR;
    assign OnChipMemory_10_wren = coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_WREN;
    // OnChipMemory_11 assignments:
    assign OnChipMemory_11_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_11_rdaddress = OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_ADDR;
    assign OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_RDATA = OnChipMemory_11_rdata;
    assign OnChipMemory_11_wdata = OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_WDATA;
    assign OnChipMemory_11_wraddress = OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_ADDR;
    assign OnChipMemory_11_wren = OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_WREN;
    // OnChipMemory_12 assignments:
    assign OnChipMemory_12_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_12_rdaddress = OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_ADDR;
    assign OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_RDATA = OnChipMemory_12_rdata;
    assign OnChipMemory_12_wdata = coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_WDATA;
    assign OnChipMemory_12_wraddress = coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_ADDR;
    assign OnChipMemory_12_wren = coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_WREN;
    // OnChipMemory_13 assignments:
    assign OnChipMemory_13_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_13_rdaddress = coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_ADDR;
    assign coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_RDATA = OnChipMemory_13_rdata;
    assign OnChipMemory_13_wdata = OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_WDATA;
    assign OnChipMemory_13_wraddress = OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_ADDR;
    assign OnChipMemory_13_wren = OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_WREN;
    // OnChipMemory_14 assignments:
    assign OnChipMemory_14_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_14_rdaddress = OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_ADDR;
    assign OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_RDATA = OnChipMemory_14_rdata;
    assign OnChipMemory_14_wdata = coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_WDATA;
    assign OnChipMemory_14_wraddress = coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_ADDR;
    assign OnChipMemory_14_wren = coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_WREN;
    // OnChipMemory_15 assignments:
    assign OnChipMemory_15_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_15_rdaddress = coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_ADDR;
    assign coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_RDATA = OnChipMemory_15_rdata;
    assign OnChipMemory_15_wdata = OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_WDATA;
    assign OnChipMemory_15_wraddress = OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_ADDR;
    assign OnChipMemory_15_wren = OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_WREN;
    // OnChipMemory_16 assignments:
    assign OnChipMemory_16_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_16_rdaddress = coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_ADDR;
    assign coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_RDATA = OnChipMemory_16_rdata;
    assign OnChipMemory_16_wdata = coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_WDATA;
    assign OnChipMemory_16_wraddress = coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_ADDR;
    assign OnChipMemory_16_wren = coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_WREN;
    // OnChipMemory_17 assignments:
    assign OnChipMemory_17_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_17_rdaddress = OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_ADDR;
    assign OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_RDATA = OnChipMemory_17_rdata;
    assign OnChipMemory_17_wdata = OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_WDATA;
    assign OnChipMemory_17_wraddress = OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_ADDR;
    assign OnChipMemory_17_wren = OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_WREN;
    // OnChipMemory_18 assignments:
    assign OnChipMemory_18_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_18_rdaddress = coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_ADDR;
    assign coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_RDATA = OnChipMemory_18_rdata;
    assign OnChipMemory_18_wdata = coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_WDATA;
    assign OnChipMemory_18_wraddress = coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_ADDR;
    assign OnChipMemory_18_wren = coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_WREN;
    // OnChipMemory_19 assignments:
    assign OnChipMemory_19_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_19_rdaddress = OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_ADDR;
    assign OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_RDATA = OnChipMemory_19_rdata;
    assign OnChipMemory_19_wdata = OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_WDATA;
    assign OnChipMemory_19_wraddress = OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_ADDR;
    assign OnChipMemory_19_wren = OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_WREN;
    // OnChipMemory_2 assignments:
    assign OnChipMemory_2_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_2_rdaddress = coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_ADDR;
    assign coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_RDATA = OnChipMemory_2_rdata;
    assign OnChipMemory_2_wdata = coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_WDATA;
    assign OnChipMemory_2_wraddress = coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_ADDR;
    assign OnChipMemory_2_wren = coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_WREN;
    // OnChipMemory_20 assignments:
    assign OnChipMemory_20_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_20_rdaddress = coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_ADDR;
    assign coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_RDATA = OnChipMemory_20_rdata;
    assign OnChipMemory_20_wdata = coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_WDATA;
    assign OnChipMemory_20_wraddress = coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_ADDR;
    assign OnChipMemory_20_wren = coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_WREN;
    // OnChipMemory_21 assignments:
    assign OnChipMemory_21_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_21_rdaddress = OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_ADDR;
    assign OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_RDATA = OnChipMemory_21_rdata;
    assign OnChipMemory_21_wdata = OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_WDATA;
    assign OnChipMemory_21_wraddress = OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_ADDR;
    assign OnChipMemory_21_wren = OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_WREN;
    // OnChipMemory_22 assignments:
    assign OnChipMemory_22_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_22_rdaddress = coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_ADDR;
    assign coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_RDATA = OnChipMemory_22_rdata;
    assign OnChipMemory_22_wdata = coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_WDATA;
    assign OnChipMemory_22_wraddress = coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_ADDR;
    assign OnChipMemory_22_wren = coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_WREN;
    // OnChipMemory_23 assignments:
    assign OnChipMemory_23_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_23_rdaddress = OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_ADDR;
    assign OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_RDATA = OnChipMemory_23_rdata;
    assign OnChipMemory_23_wdata = OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_WDATA;
    assign OnChipMemory_23_wraddress = OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_ADDR;
    assign OnChipMemory_23_wren = OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_WREN;
    // OnChipMemory_24 assignments:
    assign OnChipMemory_24_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_24_rdaddress = coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_ADDR;
    assign coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_RDATA = OnChipMemory_24_rdata;
    assign OnChipMemory_24_wdata = coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_WDATA;
    assign OnChipMemory_24_wraddress = coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_ADDR;
    assign OnChipMemory_24_wren = coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_WREN;
    // OnChipMemory_25 assignments:
    assign OnChipMemory_25_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_25_rdaddress = OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_ADDR;
    assign OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_RDATA = OnChipMemory_25_rdata;
    assign OnChipMemory_25_wdata = OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_WDATA;
    assign OnChipMemory_25_wraddress = OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_ADDR;
    assign OnChipMemory_25_wren = OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_WREN;
    // OnChipMemory_26 assignments:
    assign OnChipMemory_26_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_26_rdaddress = coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_ADDR;
    assign coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_RDATA = OnChipMemory_26_rdata;
    assign OnChipMemory_26_wdata = coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_WDATA;
    assign OnChipMemory_26_wraddress = coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_ADDR;
    assign OnChipMemory_26_wren = coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_WREN;
    // OnChipMemory_27 assignments:
    assign OnChipMemory_27_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_27_rdaddress = OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_ADDR;
    assign OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_RDATA = OnChipMemory_27_rdata;
    assign OnChipMemory_27_wdata = OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_WDATA;
    assign OnChipMemory_27_wraddress = OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_ADDR;
    assign OnChipMemory_27_wren = OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_WREN;
    // OnChipMemory_28 assignments:
    assign OnChipMemory_28_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_28_rdaddress = coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_ADDR;
    assign coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_RDATA = OnChipMemory_28_rdata;
    assign OnChipMemory_28_wdata = coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_WDATA;
    assign OnChipMemory_28_wraddress = coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_ADDR;
    assign OnChipMemory_28_wren = coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_WREN;
    // OnChipMemory_29 assignments:
    assign OnChipMemory_29_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_29_rdaddress = OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_ADDR;
    assign OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_RDATA = OnChipMemory_29_rdata;
    assign OnChipMemory_29_wdata = OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_WDATA;
    assign OnChipMemory_29_wraddress = OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_ADDR;
    assign OnChipMemory_29_wren = OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_WREN;
    // OnChipMemory_3 assignments:
    assign OnChipMemory_3_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_3_rdaddress = OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_ADDR;
    assign OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_RDATA = OnChipMemory_3_rdata;
    assign OnChipMemory_3_wdata = OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_WDATA;
    assign OnChipMemory_3_wraddress = OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_ADDR;
    assign OnChipMemory_3_wren = OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_WREN;
    // OnChipMemory_30 assignments:
    assign OnChipMemory_30_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_30_rdaddress = coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_ADDR;
    assign coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_RDATA = OnChipMemory_30_rdata;
    assign OnChipMemory_30_wdata = coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_WDATA;
    assign OnChipMemory_30_wraddress = coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_ADDR;
    assign OnChipMemory_30_wren = coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_WREN;
    // OnChipMemory_31 assignments:
    assign OnChipMemory_31_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_31_rdaddress = OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_ADDR;
    assign OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_RDATA = OnChipMemory_31_rdata;
    assign OnChipMemory_31_wdata = OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_WDATA;
    assign OnChipMemory_31_wraddress = OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_ADDR;
    assign OnChipMemory_31_wren = OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_WREN;
    // OnChipMemory_4 assignments:
    assign OnChipMemory_4_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_4_rdaddress = coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_ADDR;
    assign coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_RDATA = OnChipMemory_4_rdata;
    assign OnChipMemory_4_wdata = coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_WDATA;
    assign OnChipMemory_4_wraddress = coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_ADDR;
    assign OnChipMemory_4_wren = coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_WREN;
    // OnChipMemory_5 assignments:
    assign OnChipMemory_5_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_5_rdaddress = OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_ADDR;
    assign OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_RDATA = OnChipMemory_5_rdata;
    assign OnChipMemory_5_wdata = OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_WDATA;
    assign OnChipMemory_5_wraddress = OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_ADDR;
    assign OnChipMemory_5_wren = OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_WREN;
    // OnChipMemory_6 assignments:
    assign OnChipMemory_6_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_6_rdaddress = coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_ADDR;
    assign coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_RDATA = OnChipMemory_6_rdata;
    assign OnChipMemory_6_wdata = coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_WDATA;
    assign OnChipMemory_6_wraddress = coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_ADDR;
    assign OnChipMemory_6_wren = coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_WREN;
    // OnChipMemory_7 assignments:
    assign OnChipMemory_7_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_7_rdaddress = OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_ADDR;
    assign OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_RDATA = OnChipMemory_7_rdata;
    assign OnChipMemory_7_wdata = OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_WDATA;
    assign OnChipMemory_7_wraddress = OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_ADDR;
    assign OnChipMemory_7_wren = OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_WREN;
    // OnChipMemory_8 assignments:
    assign OnChipMemory_8_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_8_rdaddress = coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_ADDR;
    assign coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_RDATA = OnChipMemory_8_rdata;
    assign OnChipMemory_8_wdata = coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_WDATA;
    assign OnChipMemory_8_wraddress = coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_ADDR;
    assign OnChipMemory_8_wren = coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_WREN;
    // OnChipMemory_9 assignments:
    assign OnChipMemory_9_clock = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign OnChipMemory_9_rdaddress = OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_ADDR;
    assign OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_RDATA = OnChipMemory_9_rdata;
    assign OnChipMemory_9_wdata = OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_WDATA;
    assign OnChipMemory_9_wraddress = OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_ADDR;
    assign OnChipMemory_9_wren = OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_WREN;
    // coeff_cost_core_0 assignments:
    assign coeff_cost_core_0_arst_n = coeff_cost_core_0_arst_n_to_bus_arst_n;
    assign coeff_cost_core_0_clk = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign coeff_cost_core_0_coeff_in_rsc_dat = coeff_cost_core_0_coeff_in_to_bus_3_DAT;
    assign coeff_cost_core_0_coeff_in_to_bus_3_RDY = coeff_cost_core_0_coeff_in_rsc_rdy;
    assign coeff_cost_core_0_coeff_in_rsc_vld = coeff_cost_core_0_coeff_in_to_bus_3_VLD;
    assign coeff_cost_core_0_coeff_out_to_fifo_0_data_in_DAT = coeff_cost_core_0_coeff_out_rsc_dat;
    assign coeff_cost_core_0_coeff_out_rsc_rdy = coeff_cost_core_0_coeff_out_to_fifo_0_data_in_RDY;
    assign coeff_cost_core_0_coeff_out_to_fifo_0_data_in_VLD = coeff_cost_core_0_coeff_out_rsc_vld;
    assign coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_0_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_0_q = coeff_cost_core_0_pull_0_to_OnChipMemory_0_mem_read_RDATA;
    assign coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_10_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_10_q = coeff_cost_core_0_pull_10_to_OnChipMemory_10_mem_read_RDATA;
    assign OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_ADDR = coeff_cost_core_0_trans_pull_rsc_0_11_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_11_q = OnChipMemory_11_mem_read_to_coeff_cost_core_0_pull_11_RDATA;
    assign OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_ADDR = coeff_cost_core_0_trans_pull_rsc_0_12_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_12_q = OnChipMemory_12_mem_read_to_coeff_cost_core_0_pull_12_RDATA;
    assign coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_13_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_13_q = coeff_cost_core_0_pull_13_to_OnChipMemory_13_mem_read_RDATA;
    assign OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_ADDR = coeff_cost_core_0_trans_pull_rsc_0_14_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_14_q = OnChipMemory_14_mem_read_to_coeff_cost_core_0_pull_14_RDATA;
    assign coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_15_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_15_q = coeff_cost_core_0_pull_15_to_OnChipMemory_15_mem_read_RDATA;
    assign coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_16_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_16_q = coeff_cost_core_0_pull_16_to_OnChipMemory_16_mem_read_RDATA;
    assign OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_ADDR = coeff_cost_core_0_trans_pull_rsc_0_17_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_17_q = OnChipMemory_17_mem_read_to_coeff_cost_core_0_pull_17_RDATA;
    assign coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_18_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_18_q = coeff_cost_core_0_pull_18_to_OnChipMemory_18_mem_read_RDATA;
    assign OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_ADDR = coeff_cost_core_0_trans_pull_rsc_0_19_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_19_q = OnChipMemory_19_mem_read_to_coeff_cost_core_0_pull_19_RDATA;
    assign OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_ADDR = coeff_cost_core_0_trans_pull_rsc_0_1_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_1_q = OnChipMemory_1_mem_read_to_coeff_cost_core_0_pull_1_RDATA;
    assign coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_20_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_20_q = coeff_cost_core_0_pull_20_to_OnChipMemory_20_mem_read_RDATA;
    assign OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_ADDR = coeff_cost_core_0_trans_pull_rsc_0_21_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_21_q = OnChipMemory_21_mem_read_to_coeff_cost_core_0_pull_21_RDATA;
    assign coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_22_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_22_q = coeff_cost_core_0_pull_22_to_OnChipMemory_22_mem_read_RDATA;
    assign OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_ADDR = coeff_cost_core_0_trans_pull_rsc_0_23_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_23_q = OnChipMemory_23_mem_read_to_coeff_cost_core_0_pull_23_RDATA;
    assign coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_24_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_24_q = coeff_cost_core_0_pull_24_to_OnChipMemory_24_mem_read_RDATA;
    assign OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_ADDR = coeff_cost_core_0_trans_pull_rsc_0_25_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_25_q = OnChipMemory_25_mem_read_to_coeff_cost_core_0_pull_25_RDATA;
    assign coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_26_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_26_q = coeff_cost_core_0_pull_26_to_OnChipMemory_26_mem_read_RDATA;
    assign OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_ADDR = coeff_cost_core_0_trans_pull_rsc_0_27_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_27_q = OnChipMemory_27_mem_read_to_coeff_cost_core_0_pull_27_RDATA;
    assign coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_28_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_28_q = coeff_cost_core_0_pull_28_to_OnChipMemory_28_mem_read_RDATA;
    assign OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_ADDR = coeff_cost_core_0_trans_pull_rsc_0_29_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_29_q = OnChipMemory_29_mem_read_to_coeff_cost_core_0_pull_29_RDATA;
    assign coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_2_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_2_q = coeff_cost_core_0_pull_2_to_OnChipMemory_2_mem_read_RDATA;
    assign coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_30_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_30_q = coeff_cost_core_0_pull_30_to_OnChipMemory_30_mem_read_RDATA;
    assign OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_ADDR = coeff_cost_core_0_trans_pull_rsc_0_31_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_31_q = OnChipMemory_31_mem_read_to_coeff_cost_core_0_pull_31_RDATA;
    assign OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_ADDR = coeff_cost_core_0_trans_pull_rsc_0_3_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_3_q = OnChipMemory_3_mem_read_to_coeff_cost_core_0_pull_3_RDATA;
    assign coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_4_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_4_q = coeff_cost_core_0_pull_4_to_OnChipMemory_4_mem_read_RDATA;
    assign OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_ADDR = coeff_cost_core_0_trans_pull_rsc_0_5_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_5_q = OnChipMemory_5_mem_read_to_coeff_cost_core_0_pull_5_RDATA;
    assign coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_6_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_6_q = coeff_cost_core_0_pull_6_to_OnChipMemory_6_mem_read_RDATA;
    assign OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_ADDR = coeff_cost_core_0_trans_pull_rsc_0_7_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_7_q = OnChipMemory_7_mem_read_to_coeff_cost_core_0_pull_7_RDATA;
    assign coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_ADDR = coeff_cost_core_0_trans_pull_rsc_0_8_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_8_q = coeff_cost_core_0_pull_8_to_OnChipMemory_8_mem_read_RDATA;
    assign OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_ADDR = coeff_cost_core_0_trans_pull_rsc_0_9_adr;
    assign coeff_cost_core_0_trans_pull_rsc_0_9_q = OnChipMemory_9_mem_read_to_coeff_cost_core_0_pull_9_RDATA;
    assign coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_0_adr;
    assign coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_0_d;
    assign coeff_cost_core_0_push_0_to_OnChipMemory_0_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_0_we;
    assign coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_10_adr;
    assign coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_10_d;
    assign coeff_cost_core_0_push_10_to_OnChipMemory_10_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_10_we;
    assign OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_ADDR = coeff_cost_core_0_trans_push_rsc_0_11_adr;
    assign OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_WDATA = coeff_cost_core_0_trans_push_rsc_0_11_d;
    assign OnChipMemory_11_mem_write_to_coeff_cost_core_0_push_11_WREN = coeff_cost_core_0_trans_push_rsc_0_11_we;
    assign coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_12_adr;
    assign coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_12_d;
    assign coeff_cost_core_0_push_12_to_OnChipMemory_12_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_12_we;
    assign OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_ADDR = coeff_cost_core_0_trans_push_rsc_0_13_adr;
    assign OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_WDATA = coeff_cost_core_0_trans_push_rsc_0_13_d;
    assign OnChipMemory_13_mem_write_to_coeff_cost_core_0_push_13_WREN = coeff_cost_core_0_trans_push_rsc_0_13_we;
    assign coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_14_adr;
    assign coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_14_d;
    assign coeff_cost_core_0_push_14_to_OnChipMemory_14_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_14_we;
    assign OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_ADDR = coeff_cost_core_0_trans_push_rsc_0_15_adr;
    assign OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_WDATA = coeff_cost_core_0_trans_push_rsc_0_15_d;
    assign OnChipMemory_15_mem_write_to_coeff_cost_core_0_push_15_WREN = coeff_cost_core_0_trans_push_rsc_0_15_we;
    assign coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_16_adr;
    assign coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_16_d;
    assign coeff_cost_core_0_push_16_to_OnChipMemory_16_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_16_we;
    assign OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_ADDR = coeff_cost_core_0_trans_push_rsc_0_17_adr;
    assign OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_WDATA = coeff_cost_core_0_trans_push_rsc_0_17_d;
    assign OnChipMemory_17_mem_write_to_coeff_cost_core_0_push_17_WREN = coeff_cost_core_0_trans_push_rsc_0_17_we;
    assign coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_18_adr;
    assign coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_18_d;
    assign coeff_cost_core_0_push_18_to_OnChipMemory_18_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_18_we;
    assign OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_ADDR = coeff_cost_core_0_trans_push_rsc_0_19_adr;
    assign OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_WDATA = coeff_cost_core_0_trans_push_rsc_0_19_d;
    assign OnChipMemory_19_mem_write_to_coeff_cost_core_0_push_19_WREN = coeff_cost_core_0_trans_push_rsc_0_19_we;
    assign OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_ADDR = coeff_cost_core_0_trans_push_rsc_0_1_adr;
    assign OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_WDATA = coeff_cost_core_0_trans_push_rsc_0_1_d;
    assign OnChipMemory_1_mem_write_to_coeff_cost_core_0_push_1_WREN = coeff_cost_core_0_trans_push_rsc_0_1_we;
    assign coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_20_adr;
    assign coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_20_d;
    assign coeff_cost_core_0_push_20_to_OnChipMemory_20_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_20_we;
    assign OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_ADDR = coeff_cost_core_0_trans_push_rsc_0_21_adr;
    assign OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_WDATA = coeff_cost_core_0_trans_push_rsc_0_21_d;
    assign OnChipMemory_21_mem_write_to_coeff_cost_core_0_push_21_WREN = coeff_cost_core_0_trans_push_rsc_0_21_we;
    assign coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_22_adr;
    assign coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_22_d;
    assign coeff_cost_core_0_push_22_to_OnChipMemory_22_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_22_we;
    assign OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_ADDR = coeff_cost_core_0_trans_push_rsc_0_23_adr;
    assign OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_WDATA = coeff_cost_core_0_trans_push_rsc_0_23_d;
    assign OnChipMemory_23_mem_write_to_coeff_cost_core_0_push_23_WREN = coeff_cost_core_0_trans_push_rsc_0_23_we;
    assign coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_24_adr;
    assign coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_24_d;
    assign coeff_cost_core_0_push_24_to_OnChipMemory_24_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_24_we;
    assign OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_ADDR = coeff_cost_core_0_trans_push_rsc_0_25_adr;
    assign OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_WDATA = coeff_cost_core_0_trans_push_rsc_0_25_d;
    assign OnChipMemory_25_mem_write_to_coeff_cost_core_0_push_25_WREN = coeff_cost_core_0_trans_push_rsc_0_25_we;
    assign coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_26_adr;
    assign coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_26_d;
    assign coeff_cost_core_0_push_26_to_OnChipMemory_26_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_26_we;
    assign OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_ADDR = coeff_cost_core_0_trans_push_rsc_0_27_adr;
    assign OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_WDATA = coeff_cost_core_0_trans_push_rsc_0_27_d;
    assign OnChipMemory_27_mem_write_to_coeff_cost_core_0_push_27_WREN = coeff_cost_core_0_trans_push_rsc_0_27_we;
    assign coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_28_adr;
    assign coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_28_d;
    assign coeff_cost_core_0_push_28_to_OnChipMemory_28_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_28_we;
    assign OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_ADDR = coeff_cost_core_0_trans_push_rsc_0_29_adr;
    assign OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_WDATA = coeff_cost_core_0_trans_push_rsc_0_29_d;
    assign OnChipMemory_29_mem_write_to_coeff_cost_core_0_push_29_WREN = coeff_cost_core_0_trans_push_rsc_0_29_we;
    assign coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_2_adr;
    assign coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_2_d;
    assign coeff_cost_core_0_push_2_to_OnChipMemory_2_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_2_we;
    assign coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_30_adr;
    assign coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_30_d;
    assign coeff_cost_core_0_push_30_to_OnChipMemory_30_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_30_we;
    assign OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_ADDR = coeff_cost_core_0_trans_push_rsc_0_31_adr;
    assign OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_WDATA = coeff_cost_core_0_trans_push_rsc_0_31_d;
    assign OnChipMemory_31_mem_write_to_coeff_cost_core_0_push_31_WREN = coeff_cost_core_0_trans_push_rsc_0_31_we;
    assign OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_ADDR = coeff_cost_core_0_trans_push_rsc_0_3_adr;
    assign OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_WDATA = coeff_cost_core_0_trans_push_rsc_0_3_d;
    assign OnChipMemory_3_mem_write_to_coeff_cost_core_0_push_3_WREN = coeff_cost_core_0_trans_push_rsc_0_3_we;
    assign coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_4_adr;
    assign coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_4_d;
    assign coeff_cost_core_0_push_4_to_OnChipMemory_4_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_4_we;
    assign OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_ADDR = coeff_cost_core_0_trans_push_rsc_0_5_adr;
    assign OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_WDATA = coeff_cost_core_0_trans_push_rsc_0_5_d;
    assign OnChipMemory_5_mem_write_to_coeff_cost_core_0_push_5_WREN = coeff_cost_core_0_trans_push_rsc_0_5_we;
    assign coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_6_adr;
    assign coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_6_d;
    assign coeff_cost_core_0_push_6_to_OnChipMemory_6_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_6_we;
    assign OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_ADDR = coeff_cost_core_0_trans_push_rsc_0_7_adr;
    assign OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_WDATA = coeff_cost_core_0_trans_push_rsc_0_7_d;
    assign OnChipMemory_7_mem_write_to_coeff_cost_core_0_push_7_WREN = coeff_cost_core_0_trans_push_rsc_0_7_we;
    assign coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_ADDR = coeff_cost_core_0_trans_push_rsc_0_8_adr;
    assign coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_WDATA = coeff_cost_core_0_trans_push_rsc_0_8_d;
    assign coeff_cost_core_0_push_8_to_OnChipMemory_8_mem_write_WREN = coeff_cost_core_0_trans_push_rsc_0_8_we;
    assign OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_ADDR = coeff_cost_core_0_trans_push_rsc_0_9_adr;
    assign OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_WDATA = coeff_cost_core_0_trans_push_rsc_0_9_d;
    assign OnChipMemory_9_mem_write_to_coeff_cost_core_0_push_9_WREN = coeff_cost_core_0_trans_push_rsc_0_9_we;
    // fifo_0 assignments:
    assign fifo_0_aclr_n = coeff_cost_core_0_arst_n_to_bus_arst_n;
    assign fifo_0_clk = coeff_cost_core_0_clk_to_bus_1_CLK;
    assign fifo_0_d = coeff_cost_core_0_coeff_out_to_fifo_0_data_in_DAT;
    assign coeff_cost_core_0_coeff_out_to_fifo_0_data_in_RDY = fifo_0_d_rdy;
    assign fifo_0_d_vld = coeff_cost_core_0_coeff_out_to_fifo_0_data_in_VLD;
    assign fifo_0_data_out_to_coeff_out_DAT = fifo_0_q;
    assign fifo_0_q_rdy = fifo_0_data_out_to_coeff_out_RDY;
    assign fifo_0_data_out_to_coeff_out_VLD = fifo_0_q_vld;

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_0(
        // Interface: clk
        .clock               (OnChipMemory_0_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_0_rdaddress),
        .rdata               (OnChipMemory_0_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_0_wdata),
        .wraddress           (OnChipMemory_0_wraddress),
        .wren                (OnChipMemory_0_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_1(
        // Interface: clk
        .clock               (OnChipMemory_1_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_1_rdaddress),
        .rdata               (OnChipMemory_1_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_1_wdata),
        .wraddress           (OnChipMemory_1_wraddress),
        .wren                (OnChipMemory_1_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_10(
        // Interface: clk
        .clock               (OnChipMemory_10_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_10_rdaddress),
        .rdata               (OnChipMemory_10_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_10_wdata),
        .wraddress           (OnChipMemory_10_wraddress),
        .wren                (OnChipMemory_10_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_11(
        // Interface: clk
        .clock               (OnChipMemory_11_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_11_rdaddress),
        .rdata               (OnChipMemory_11_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_11_wdata),
        .wraddress           (OnChipMemory_11_wraddress),
        .wren                (OnChipMemory_11_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_12(
        // Interface: clk
        .clock               (OnChipMemory_12_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_12_rdaddress),
        .rdata               (OnChipMemory_12_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_12_wdata),
        .wraddress           (OnChipMemory_12_wraddress),
        .wren                (OnChipMemory_12_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_13(
        // Interface: clk
        .clock               (OnChipMemory_13_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_13_rdaddress),
        .rdata               (OnChipMemory_13_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_13_wdata),
        .wraddress           (OnChipMemory_13_wraddress),
        .wren                (OnChipMemory_13_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_14(
        // Interface: clk
        .clock               (OnChipMemory_14_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_14_rdaddress),
        .rdata               (OnChipMemory_14_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_14_wdata),
        .wraddress           (OnChipMemory_14_wraddress),
        .wren                (OnChipMemory_14_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_15(
        // Interface: clk
        .clock               (OnChipMemory_15_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_15_rdaddress),
        .rdata               (OnChipMemory_15_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_15_wdata),
        .wraddress           (OnChipMemory_15_wraddress),
        .wren                (OnChipMemory_15_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_16(
        // Interface: clk
        .clock               (OnChipMemory_16_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_16_rdaddress),
        .rdata               (OnChipMemory_16_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_16_wdata),
        .wraddress           (OnChipMemory_16_wraddress),
        .wren                (OnChipMemory_16_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_17(
        // Interface: clk
        .clock               (OnChipMemory_17_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_17_rdaddress),
        .rdata               (OnChipMemory_17_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_17_wdata),
        .wraddress           (OnChipMemory_17_wraddress),
        .wren                (OnChipMemory_17_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_18(
        // Interface: clk
        .clock               (OnChipMemory_18_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_18_rdaddress),
        .rdata               (OnChipMemory_18_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_18_wdata),
        .wraddress           (OnChipMemory_18_wraddress),
        .wren                (OnChipMemory_18_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_19(
        // Interface: clk
        .clock               (OnChipMemory_19_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_19_rdaddress),
        .rdata               (OnChipMemory_19_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_19_wdata),
        .wraddress           (OnChipMemory_19_wraddress),
        .wren                (OnChipMemory_19_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_2(
        // Interface: clk
        .clock               (OnChipMemory_2_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_2_rdaddress),
        .rdata               (OnChipMemory_2_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_2_wdata),
        .wraddress           (OnChipMemory_2_wraddress),
        .wren                (OnChipMemory_2_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_20(
        // Interface: clk
        .clock               (OnChipMemory_20_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_20_rdaddress),
        .rdata               (OnChipMemory_20_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_20_wdata),
        .wraddress           (OnChipMemory_20_wraddress),
        .wren                (OnChipMemory_20_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_21(
        // Interface: clk
        .clock               (OnChipMemory_21_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_21_rdaddress),
        .rdata               (OnChipMemory_21_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_21_wdata),
        .wraddress           (OnChipMemory_21_wraddress),
        .wren                (OnChipMemory_21_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_22(
        // Interface: clk
        .clock               (OnChipMemory_22_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_22_rdaddress),
        .rdata               (OnChipMemory_22_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_22_wdata),
        .wraddress           (OnChipMemory_22_wraddress),
        .wren                (OnChipMemory_22_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_23(
        // Interface: clk
        .clock               (OnChipMemory_23_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_23_rdaddress),
        .rdata               (OnChipMemory_23_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_23_wdata),
        .wraddress           (OnChipMemory_23_wraddress),
        .wren                (OnChipMemory_23_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_24(
        // Interface: clk
        .clock               (OnChipMemory_24_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_24_rdaddress),
        .rdata               (OnChipMemory_24_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_24_wdata),
        .wraddress           (OnChipMemory_24_wraddress),
        .wren                (OnChipMemory_24_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_25(
        // Interface: clk
        .clock               (OnChipMemory_25_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_25_rdaddress),
        .rdata               (OnChipMemory_25_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_25_wdata),
        .wraddress           (OnChipMemory_25_wraddress),
        .wren                (OnChipMemory_25_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_26(
        // Interface: clk
        .clock               (OnChipMemory_26_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_26_rdaddress),
        .rdata               (OnChipMemory_26_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_26_wdata),
        .wraddress           (OnChipMemory_26_wraddress),
        .wren                (OnChipMemory_26_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_27(
        // Interface: clk
        .clock               (OnChipMemory_27_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_27_rdaddress),
        .rdata               (OnChipMemory_27_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_27_wdata),
        .wraddress           (OnChipMemory_27_wraddress),
        .wren                (OnChipMemory_27_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_28(
        // Interface: clk
        .clock               (OnChipMemory_28_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_28_rdaddress),
        .rdata               (OnChipMemory_28_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_28_wdata),
        .wraddress           (OnChipMemory_28_wraddress),
        .wren                (OnChipMemory_28_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_29(
        // Interface: clk
        .clock               (OnChipMemory_29_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_29_rdaddress),
        .rdata               (OnChipMemory_29_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_29_wdata),
        .wraddress           (OnChipMemory_29_wraddress),
        .wren                (OnChipMemory_29_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_3(
        // Interface: clk
        .clock               (OnChipMemory_3_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_3_rdaddress),
        .rdata               (OnChipMemory_3_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_3_wdata),
        .wraddress           (OnChipMemory_3_wraddress),
        .wren                (OnChipMemory_3_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_30(
        // Interface: clk
        .clock               (OnChipMemory_30_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_30_rdaddress),
        .rdata               (OnChipMemory_30_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_30_wdata),
        .wraddress           (OnChipMemory_30_wraddress),
        .wren                (OnChipMemory_30_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_31(
        // Interface: clk
        .clock               (OnChipMemory_31_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_31_rdaddress),
        .rdata               (OnChipMemory_31_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_31_wdata),
        .wraddress           (OnChipMemory_31_wraddress),
        .wren                (OnChipMemory_31_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_4(
        // Interface: clk
        .clock               (OnChipMemory_4_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_4_rdaddress),
        .rdata               (OnChipMemory_4_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_4_wdata),
        .wraddress           (OnChipMemory_4_wraddress),
        .wren                (OnChipMemory_4_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_5(
        // Interface: clk
        .clock               (OnChipMemory_5_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_5_rdaddress),
        .rdata               (OnChipMemory_5_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_5_wdata),
        .wraddress           (OnChipMemory_5_wraddress),
        .wren                (OnChipMemory_5_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_6(
        // Interface: clk
        .clock               (OnChipMemory_6_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_6_rdaddress),
        .rdata               (OnChipMemory_6_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_6_wdata),
        .wraddress           (OnChipMemory_6_wraddress),
        .wren                (OnChipMemory_6_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_7(
        // Interface: clk
        .clock               (OnChipMemory_7_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_7_rdaddress),
        .rdata               (OnChipMemory_7_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_7_wdata),
        .wraddress           (OnChipMemory_7_wraddress),
        .wren                (OnChipMemory_7_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_8(
        // Interface: clk
        .clock               (OnChipMemory_8_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_8_rdaddress),
        .rdata               (OnChipMemory_8_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_8_wdata),
        .wraddress           (OnChipMemory_8_wraddress),
        .wren                (OnChipMemory_8_wren));

    // IP-XACT VLNV: tuni.fi:Kvazaar:OnChipMemory:1.0
    OnChipMemory #(
        .width_g             (16),
        .addr_width_g        (7))
    OnChipMemory_9(
        // Interface: clk
        .clock               (OnChipMemory_9_clock),
        // Interface: mem_read
        .rdaddress           (OnChipMemory_9_rdaddress),
        .rdata               (OnChipMemory_9_rdata),
        // Interface: mem_write
        .wdata               (OnChipMemory_9_wdata),
        .wraddress           (OnChipMemory_9_wraddress),
        .wren                (OnChipMemory_9_wren));

    // IP-XACT VLNV: tuni.fi:KvazaarTransform:coeff_cost_core:1.0
    main_coeff_cost coeff_cost_core_0(
        // Interface: arst_n
        .arst_n              (coeff_cost_core_0_arst_n),
        // Interface: clk
        .clk                 (coeff_cost_core_0_clk),
        // Interface: coeff_in
        .coeff_in_rsc_dat    (coeff_cost_core_0_coeff_in_rsc_dat),
        .coeff_in_rsc_vld    (coeff_cost_core_0_coeff_in_rsc_vld),
        .coeff_in_rsc_rdy    (coeff_cost_core_0_coeff_in_rsc_rdy),
        // Interface: coeff_out
        .coeff_out_rsc_rdy   (coeff_cost_core_0_coeff_out_rsc_rdy),
        .coeff_out_rsc_dat   (coeff_cost_core_0_coeff_out_rsc_dat),
        .coeff_out_rsc_vld   (coeff_cost_core_0_coeff_out_rsc_vld),
        // Interface: pull_0
        .trans_pull_rsc_0_0_q(coeff_cost_core_0_trans_pull_rsc_0_0_q),
        .trans_pull_rsc_0_0_adr(coeff_cost_core_0_trans_pull_rsc_0_0_adr),
        .trans_pull_rsc_0_0_d(),
        .trans_pull_rsc_0_0_we(),
        // Interface: pull_1
        .trans_pull_rsc_0_1_q(coeff_cost_core_0_trans_pull_rsc_0_1_q),
        .trans_pull_rsc_0_1_adr(coeff_cost_core_0_trans_pull_rsc_0_1_adr),
        .trans_pull_rsc_0_1_d(),
        .trans_pull_rsc_0_1_we(),
        // Interface: pull_10
        .trans_pull_rsc_0_10_q(coeff_cost_core_0_trans_pull_rsc_0_10_q),
        .trans_pull_rsc_0_10_adr(coeff_cost_core_0_trans_pull_rsc_0_10_adr),
        .trans_pull_rsc_0_10_d(),
        .trans_pull_rsc_0_10_we(),
        // Interface: pull_11
        .trans_pull_rsc_0_11_q(coeff_cost_core_0_trans_pull_rsc_0_11_q),
        .trans_pull_rsc_0_11_adr(coeff_cost_core_0_trans_pull_rsc_0_11_adr),
        .trans_pull_rsc_0_11_d(),
        .trans_pull_rsc_0_11_we(),
        // Interface: pull_12
        .trans_pull_rsc_0_12_q(coeff_cost_core_0_trans_pull_rsc_0_12_q),
        .trans_pull_rsc_0_12_adr(coeff_cost_core_0_trans_pull_rsc_0_12_adr),
        .trans_pull_rsc_0_12_d(),
        .trans_pull_rsc_0_12_we(),
        // Interface: pull_13
        .trans_pull_rsc_0_13_q(coeff_cost_core_0_trans_pull_rsc_0_13_q),
        .trans_pull_rsc_0_13_adr(coeff_cost_core_0_trans_pull_rsc_0_13_adr),
        .trans_pull_rsc_0_13_d(),
        .trans_pull_rsc_0_13_we(),
        // Interface: pull_14
        .trans_pull_rsc_0_14_q(coeff_cost_core_0_trans_pull_rsc_0_14_q),
        .trans_pull_rsc_0_14_adr(coeff_cost_core_0_trans_pull_rsc_0_14_adr),
        .trans_pull_rsc_0_14_d(),
        .trans_pull_rsc_0_14_we(),
        // Interface: pull_15
        .trans_pull_rsc_0_15_q(coeff_cost_core_0_trans_pull_rsc_0_15_q),
        .trans_pull_rsc_0_15_adr(coeff_cost_core_0_trans_pull_rsc_0_15_adr),
        .trans_pull_rsc_0_15_d(),
        .trans_pull_rsc_0_15_we(),
        // Interface: pull_16
        .trans_pull_rsc_0_16_q(coeff_cost_core_0_trans_pull_rsc_0_16_q),
        .trans_pull_rsc_0_16_adr(coeff_cost_core_0_trans_pull_rsc_0_16_adr),
        .trans_pull_rsc_0_16_d(),
        .trans_pull_rsc_0_16_we(),
        // Interface: pull_17
        .trans_pull_rsc_0_17_q(coeff_cost_core_0_trans_pull_rsc_0_17_q),
        .trans_pull_rsc_0_17_adr(coeff_cost_core_0_trans_pull_rsc_0_17_adr),
        .trans_pull_rsc_0_17_d(),
        .trans_pull_rsc_0_17_we(),
        // Interface: pull_18
        .trans_pull_rsc_0_18_q(coeff_cost_core_0_trans_pull_rsc_0_18_q),
        .trans_pull_rsc_0_18_adr(coeff_cost_core_0_trans_pull_rsc_0_18_adr),
        .trans_pull_rsc_0_18_d(),
        .trans_pull_rsc_0_18_we(),
        // Interface: pull_19
        .trans_pull_rsc_0_19_q(coeff_cost_core_0_trans_pull_rsc_0_19_q),
        .trans_pull_rsc_0_19_adr(coeff_cost_core_0_trans_pull_rsc_0_19_adr),
        .trans_pull_rsc_0_19_d(),
        .trans_pull_rsc_0_19_we(),
        // Interface: pull_2
        .trans_pull_rsc_0_2_q(coeff_cost_core_0_trans_pull_rsc_0_2_q),
        .trans_pull_rsc_0_2_adr(coeff_cost_core_0_trans_pull_rsc_0_2_adr),
        .trans_pull_rsc_0_2_d(),
        .trans_pull_rsc_0_2_we(),
        // Interface: pull_20
        .trans_pull_rsc_0_20_q(coeff_cost_core_0_trans_pull_rsc_0_20_q),
        .trans_pull_rsc_0_20_adr(coeff_cost_core_0_trans_pull_rsc_0_20_adr),
        .trans_pull_rsc_0_20_d(),
        .trans_pull_rsc_0_20_we(),
        // Interface: pull_21
        .trans_pull_rsc_0_21_q(coeff_cost_core_0_trans_pull_rsc_0_21_q),
        .trans_pull_rsc_0_21_adr(coeff_cost_core_0_trans_pull_rsc_0_21_adr),
        .trans_pull_rsc_0_21_d(),
        .trans_pull_rsc_0_21_we(),
        // Interface: pull_22
        .trans_pull_rsc_0_22_q(coeff_cost_core_0_trans_pull_rsc_0_22_q),
        .trans_pull_rsc_0_22_adr(coeff_cost_core_0_trans_pull_rsc_0_22_adr),
        .trans_pull_rsc_0_22_d(),
        .trans_pull_rsc_0_22_we(),
        // Interface: pull_23
        .trans_pull_rsc_0_23_q(coeff_cost_core_0_trans_pull_rsc_0_23_q),
        .trans_pull_rsc_0_23_adr(coeff_cost_core_0_trans_pull_rsc_0_23_adr),
        .trans_pull_rsc_0_23_d(),
        .trans_pull_rsc_0_23_we(),
        // Interface: pull_24
        .trans_pull_rsc_0_24_q(coeff_cost_core_0_trans_pull_rsc_0_24_q),
        .trans_pull_rsc_0_24_adr(coeff_cost_core_0_trans_pull_rsc_0_24_adr),
        .trans_pull_rsc_0_24_d(),
        .trans_pull_rsc_0_24_we(),
        // Interface: pull_25
        .trans_pull_rsc_0_25_q(coeff_cost_core_0_trans_pull_rsc_0_25_q),
        .trans_pull_rsc_0_25_adr(coeff_cost_core_0_trans_pull_rsc_0_25_adr),
        .trans_pull_rsc_0_25_d(),
        .trans_pull_rsc_0_25_we(),
        // Interface: pull_26
        .trans_pull_rsc_0_26_q(coeff_cost_core_0_trans_pull_rsc_0_26_q),
        .trans_pull_rsc_0_26_adr(coeff_cost_core_0_trans_pull_rsc_0_26_adr),
        .trans_pull_rsc_0_26_d(),
        .trans_pull_rsc_0_26_we(),
        // Interface: pull_27
        .trans_pull_rsc_0_27_q(coeff_cost_core_0_trans_pull_rsc_0_27_q),
        .trans_pull_rsc_0_27_adr(coeff_cost_core_0_trans_pull_rsc_0_27_adr),
        .trans_pull_rsc_0_27_d(),
        .trans_pull_rsc_0_27_we(),
        // Interface: pull_28
        .trans_pull_rsc_0_28_q(coeff_cost_core_0_trans_pull_rsc_0_28_q),
        .trans_pull_rsc_0_28_adr(coeff_cost_core_0_trans_pull_rsc_0_28_adr),
        .trans_pull_rsc_0_28_d(),
        .trans_pull_rsc_0_28_we(),
        // Interface: pull_29
        .trans_pull_rsc_0_29_q(coeff_cost_core_0_trans_pull_rsc_0_29_q),
        .trans_pull_rsc_0_29_adr(coeff_cost_core_0_trans_pull_rsc_0_29_adr),
        .trans_pull_rsc_0_29_d(),
        .trans_pull_rsc_0_29_we(),
        // Interface: pull_3
        .trans_pull_rsc_0_3_q(coeff_cost_core_0_trans_pull_rsc_0_3_q),
        .trans_pull_rsc_0_3_adr(coeff_cost_core_0_trans_pull_rsc_0_3_adr),
        .trans_pull_rsc_0_3_d(),
        .trans_pull_rsc_0_3_we(),
        // Interface: pull_30
        .trans_pull_rsc_0_30_q(coeff_cost_core_0_trans_pull_rsc_0_30_q),
        .trans_pull_rsc_0_30_adr(coeff_cost_core_0_trans_pull_rsc_0_30_adr),
        .trans_pull_rsc_0_30_d(),
        .trans_pull_rsc_0_30_we(),
        // Interface: pull_31
        .trans_pull_rsc_0_31_q(coeff_cost_core_0_trans_pull_rsc_0_31_q),
        .trans_pull_rsc_0_31_adr(coeff_cost_core_0_trans_pull_rsc_0_31_adr),
        .trans_pull_rsc_0_31_d(),
        .trans_pull_rsc_0_31_we(),
        // Interface: pull_4
        .trans_pull_rsc_0_4_q(coeff_cost_core_0_trans_pull_rsc_0_4_q),
        .trans_pull_rsc_0_4_adr(coeff_cost_core_0_trans_pull_rsc_0_4_adr),
        .trans_pull_rsc_0_4_d(),
        .trans_pull_rsc_0_4_we(),
        // Interface: pull_5
        .trans_pull_rsc_0_5_q(coeff_cost_core_0_trans_pull_rsc_0_5_q),
        .trans_pull_rsc_0_5_adr(coeff_cost_core_0_trans_pull_rsc_0_5_adr),
        .trans_pull_rsc_0_5_d(),
        .trans_pull_rsc_0_5_we(),
        // Interface: pull_6
        .trans_pull_rsc_0_6_q(coeff_cost_core_0_trans_pull_rsc_0_6_q),
        .trans_pull_rsc_0_6_adr(coeff_cost_core_0_trans_pull_rsc_0_6_adr),
        .trans_pull_rsc_0_6_d(),
        .trans_pull_rsc_0_6_we(),
        // Interface: pull_7
        .trans_pull_rsc_0_7_q(coeff_cost_core_0_trans_pull_rsc_0_7_q),
        .trans_pull_rsc_0_7_adr(coeff_cost_core_0_trans_pull_rsc_0_7_adr),
        .trans_pull_rsc_0_7_d(),
        .trans_pull_rsc_0_7_we(),
        // Interface: pull_8
        .trans_pull_rsc_0_8_q(coeff_cost_core_0_trans_pull_rsc_0_8_q),
        .trans_pull_rsc_0_8_adr(coeff_cost_core_0_trans_pull_rsc_0_8_adr),
        .trans_pull_rsc_0_8_d(),
        .trans_pull_rsc_0_8_we(),
        // Interface: pull_9
        .trans_pull_rsc_0_9_q(coeff_cost_core_0_trans_pull_rsc_0_9_q),
        .trans_pull_rsc_0_9_adr(coeff_cost_core_0_trans_pull_rsc_0_9_adr),
        .trans_pull_rsc_0_9_d(),
        .trans_pull_rsc_0_9_we(),
        // Interface: push_0
        .trans_push_rsc_0_0_q(),
        .trans_push_rsc_0_0_adr(coeff_cost_core_0_trans_push_rsc_0_0_adr),
        .trans_push_rsc_0_0_d(coeff_cost_core_0_trans_push_rsc_0_0_d),
        .trans_push_rsc_0_0_we(coeff_cost_core_0_trans_push_rsc_0_0_we),
        // Interface: push_1
        .trans_push_rsc_0_1_q(),
        .trans_push_rsc_0_1_adr(coeff_cost_core_0_trans_push_rsc_0_1_adr),
        .trans_push_rsc_0_1_d(coeff_cost_core_0_trans_push_rsc_0_1_d),
        .trans_push_rsc_0_1_we(coeff_cost_core_0_trans_push_rsc_0_1_we),
        // Interface: push_10
        .trans_push_rsc_0_10_q(),
        .trans_push_rsc_0_10_adr(coeff_cost_core_0_trans_push_rsc_0_10_adr),
        .trans_push_rsc_0_10_d(coeff_cost_core_0_trans_push_rsc_0_10_d),
        .trans_push_rsc_0_10_we(coeff_cost_core_0_trans_push_rsc_0_10_we),
        // Interface: push_11
        .trans_push_rsc_0_11_q(),
        .trans_push_rsc_0_11_adr(coeff_cost_core_0_trans_push_rsc_0_11_adr),
        .trans_push_rsc_0_11_d(coeff_cost_core_0_trans_push_rsc_0_11_d),
        .trans_push_rsc_0_11_we(coeff_cost_core_0_trans_push_rsc_0_11_we),
        // Interface: push_12
        .trans_push_rsc_0_12_q(),
        .trans_push_rsc_0_12_adr(coeff_cost_core_0_trans_push_rsc_0_12_adr),
        .trans_push_rsc_0_12_d(coeff_cost_core_0_trans_push_rsc_0_12_d),
        .trans_push_rsc_0_12_we(coeff_cost_core_0_trans_push_rsc_0_12_we),
        // Interface: push_13
        .trans_push_rsc_0_13_q(),
        .trans_push_rsc_0_13_adr(coeff_cost_core_0_trans_push_rsc_0_13_adr),
        .trans_push_rsc_0_13_d(coeff_cost_core_0_trans_push_rsc_0_13_d),
        .trans_push_rsc_0_13_we(coeff_cost_core_0_trans_push_rsc_0_13_we),
        // Interface: push_14
        .trans_push_rsc_0_14_q(),
        .trans_push_rsc_0_14_adr(coeff_cost_core_0_trans_push_rsc_0_14_adr),
        .trans_push_rsc_0_14_d(coeff_cost_core_0_trans_push_rsc_0_14_d),
        .trans_push_rsc_0_14_we(coeff_cost_core_0_trans_push_rsc_0_14_we),
        // Interface: push_15
        .trans_push_rsc_0_15_q(),
        .trans_push_rsc_0_15_adr(coeff_cost_core_0_trans_push_rsc_0_15_adr),
        .trans_push_rsc_0_15_d(coeff_cost_core_0_trans_push_rsc_0_15_d),
        .trans_push_rsc_0_15_we(coeff_cost_core_0_trans_push_rsc_0_15_we),
        // Interface: push_16
        .trans_push_rsc_0_16_q(),
        .trans_push_rsc_0_16_adr(coeff_cost_core_0_trans_push_rsc_0_16_adr),
        .trans_push_rsc_0_16_d(coeff_cost_core_0_trans_push_rsc_0_16_d),
        .trans_push_rsc_0_16_we(coeff_cost_core_0_trans_push_rsc_0_16_we),
        // Interface: push_17
        .trans_push_rsc_0_17_q(),
        .trans_push_rsc_0_17_adr(coeff_cost_core_0_trans_push_rsc_0_17_adr),
        .trans_push_rsc_0_17_d(coeff_cost_core_0_trans_push_rsc_0_17_d),
        .trans_push_rsc_0_17_we(coeff_cost_core_0_trans_push_rsc_0_17_we),
        // Interface: push_18
        .trans_push_rsc_0_18_q(),
        .trans_push_rsc_0_18_adr(coeff_cost_core_0_trans_push_rsc_0_18_adr),
        .trans_push_rsc_0_18_d(coeff_cost_core_0_trans_push_rsc_0_18_d),
        .trans_push_rsc_0_18_we(coeff_cost_core_0_trans_push_rsc_0_18_we),
        // Interface: push_19
        .trans_push_rsc_0_19_q(),
        .trans_push_rsc_0_19_adr(coeff_cost_core_0_trans_push_rsc_0_19_adr),
        .trans_push_rsc_0_19_d(coeff_cost_core_0_trans_push_rsc_0_19_d),
        .trans_push_rsc_0_19_we(coeff_cost_core_0_trans_push_rsc_0_19_we),
        // Interface: push_2
        .trans_push_rsc_0_2_q(),
        .trans_push_rsc_0_2_adr(coeff_cost_core_0_trans_push_rsc_0_2_adr),
        .trans_push_rsc_0_2_d(coeff_cost_core_0_trans_push_rsc_0_2_d),
        .trans_push_rsc_0_2_we(coeff_cost_core_0_trans_push_rsc_0_2_we),
        // Interface: push_20
        .trans_push_rsc_0_20_q(),
        .trans_push_rsc_0_20_adr(coeff_cost_core_0_trans_push_rsc_0_20_adr),
        .trans_push_rsc_0_20_d(coeff_cost_core_0_trans_push_rsc_0_20_d),
        .trans_push_rsc_0_20_we(coeff_cost_core_0_trans_push_rsc_0_20_we),
        // Interface: push_21
        .trans_push_rsc_0_21_q(),
        .trans_push_rsc_0_21_adr(coeff_cost_core_0_trans_push_rsc_0_21_adr),
        .trans_push_rsc_0_21_d(coeff_cost_core_0_trans_push_rsc_0_21_d),
        .trans_push_rsc_0_21_we(coeff_cost_core_0_trans_push_rsc_0_21_we),
        // Interface: push_22
        .trans_push_rsc_0_22_q(),
        .trans_push_rsc_0_22_adr(coeff_cost_core_0_trans_push_rsc_0_22_adr),
        .trans_push_rsc_0_22_d(coeff_cost_core_0_trans_push_rsc_0_22_d),
        .trans_push_rsc_0_22_we(coeff_cost_core_0_trans_push_rsc_0_22_we),
        // Interface: push_23
        .trans_push_rsc_0_23_q(),
        .trans_push_rsc_0_23_adr(coeff_cost_core_0_trans_push_rsc_0_23_adr),
        .trans_push_rsc_0_23_d(coeff_cost_core_0_trans_push_rsc_0_23_d),
        .trans_push_rsc_0_23_we(coeff_cost_core_0_trans_push_rsc_0_23_we),
        // Interface: push_24
        .trans_push_rsc_0_24_q(),
        .trans_push_rsc_0_24_adr(coeff_cost_core_0_trans_push_rsc_0_24_adr),
        .trans_push_rsc_0_24_d(coeff_cost_core_0_trans_push_rsc_0_24_d),
        .trans_push_rsc_0_24_we(coeff_cost_core_0_trans_push_rsc_0_24_we),
        // Interface: push_25
        .trans_push_rsc_0_25_q(),
        .trans_push_rsc_0_25_adr(coeff_cost_core_0_trans_push_rsc_0_25_adr),
        .trans_push_rsc_0_25_d(coeff_cost_core_0_trans_push_rsc_0_25_d),
        .trans_push_rsc_0_25_we(coeff_cost_core_0_trans_push_rsc_0_25_we),
        // Interface: push_26
        .trans_push_rsc_0_26_q(),
        .trans_push_rsc_0_26_adr(coeff_cost_core_0_trans_push_rsc_0_26_adr),
        .trans_push_rsc_0_26_d(coeff_cost_core_0_trans_push_rsc_0_26_d),
        .trans_push_rsc_0_26_we(coeff_cost_core_0_trans_push_rsc_0_26_we),
        // Interface: push_27
        .trans_push_rsc_0_27_q(),
        .trans_push_rsc_0_27_adr(coeff_cost_core_0_trans_push_rsc_0_27_adr),
        .trans_push_rsc_0_27_d(coeff_cost_core_0_trans_push_rsc_0_27_d),
        .trans_push_rsc_0_27_we(coeff_cost_core_0_trans_push_rsc_0_27_we),
        // Interface: push_28
        .trans_push_rsc_0_28_q(),
        .trans_push_rsc_0_28_adr(coeff_cost_core_0_trans_push_rsc_0_28_adr),
        .trans_push_rsc_0_28_d(coeff_cost_core_0_trans_push_rsc_0_28_d),
        .trans_push_rsc_0_28_we(coeff_cost_core_0_trans_push_rsc_0_28_we),
        // Interface: push_29
        .trans_push_rsc_0_29_q(),
        .trans_push_rsc_0_29_adr(coeff_cost_core_0_trans_push_rsc_0_29_adr),
        .trans_push_rsc_0_29_d(coeff_cost_core_0_trans_push_rsc_0_29_d),
        .trans_push_rsc_0_29_we(coeff_cost_core_0_trans_push_rsc_0_29_we),
        // Interface: push_3
        .trans_push_rsc_0_3_q(),
        .trans_push_rsc_0_3_adr(coeff_cost_core_0_trans_push_rsc_0_3_adr),
        .trans_push_rsc_0_3_d(coeff_cost_core_0_trans_push_rsc_0_3_d),
        .trans_push_rsc_0_3_we(coeff_cost_core_0_trans_push_rsc_0_3_we),
        // Interface: push_30
        .trans_push_rsc_0_30_q(),
        .trans_push_rsc_0_30_adr(coeff_cost_core_0_trans_push_rsc_0_30_adr),
        .trans_push_rsc_0_30_d(coeff_cost_core_0_trans_push_rsc_0_30_d),
        .trans_push_rsc_0_30_we(coeff_cost_core_0_trans_push_rsc_0_30_we),
        // Interface: push_31
        .trans_push_rsc_0_31_q(),
        .trans_push_rsc_0_31_adr(coeff_cost_core_0_trans_push_rsc_0_31_adr),
        .trans_push_rsc_0_31_d(coeff_cost_core_0_trans_push_rsc_0_31_d),
        .trans_push_rsc_0_31_we(coeff_cost_core_0_trans_push_rsc_0_31_we),
        // Interface: push_4
        .trans_push_rsc_0_4_q(),
        .trans_push_rsc_0_4_adr(coeff_cost_core_0_trans_push_rsc_0_4_adr),
        .trans_push_rsc_0_4_d(coeff_cost_core_0_trans_push_rsc_0_4_d),
        .trans_push_rsc_0_4_we(coeff_cost_core_0_trans_push_rsc_0_4_we),
        // Interface: push_5
        .trans_push_rsc_0_5_q(),
        .trans_push_rsc_0_5_adr(coeff_cost_core_0_trans_push_rsc_0_5_adr),
        .trans_push_rsc_0_5_d(coeff_cost_core_0_trans_push_rsc_0_5_d),
        .trans_push_rsc_0_5_we(coeff_cost_core_0_trans_push_rsc_0_5_we),
        // Interface: push_6
        .trans_push_rsc_0_6_q(),
        .trans_push_rsc_0_6_adr(coeff_cost_core_0_trans_push_rsc_0_6_adr),
        .trans_push_rsc_0_6_d(coeff_cost_core_0_trans_push_rsc_0_6_d),
        .trans_push_rsc_0_6_we(coeff_cost_core_0_trans_push_rsc_0_6_we),
        // Interface: push_7
        .trans_push_rsc_0_7_q(),
        .trans_push_rsc_0_7_adr(coeff_cost_core_0_trans_push_rsc_0_7_adr),
        .trans_push_rsc_0_7_d(coeff_cost_core_0_trans_push_rsc_0_7_d),
        .trans_push_rsc_0_7_we(coeff_cost_core_0_trans_push_rsc_0_7_we),
        // Interface: push_8
        .trans_push_rsc_0_8_q(),
        .trans_push_rsc_0_8_adr(coeff_cost_core_0_trans_push_rsc_0_8_adr),
        .trans_push_rsc_0_8_d(coeff_cost_core_0_trans_push_rsc_0_8_d),
        .trans_push_rsc_0_8_we(coeff_cost_core_0_trans_push_rsc_0_8_we),
        // Interface: push_9
        .trans_push_rsc_0_9_q(),
        .trans_push_rsc_0_9_adr(coeff_cost_core_0_trans_push_rsc_0_9_adr),
        .trans_push_rsc_0_9_d(coeff_cost_core_0_trans_push_rsc_0_9_d),
        .trans_push_rsc_0_9_we(coeff_cost_core_0_trans_push_rsc_0_9_we));

    // IP-XACT VLNV: tuni.fi:Kvazaar:fifo:1.0
    FiFo #(
        .width_g             (512),
        .size_g              (256),
        .use_memory_g        ("ON"))
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


endmodule
