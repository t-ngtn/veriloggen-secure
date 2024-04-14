

module integrity_check
(
  input CLK,
  input RST,
  output reg [32-1:0] maxi_awaddr,
  output reg [8-1:0] maxi_awlen,
  output [3-1:0] maxi_awsize,
  output [2-1:0] maxi_awburst,
  output [1-1:0] maxi_awlock,
  output [4-1:0] maxi_awcache,
  output [3-1:0] maxi_awprot,
  output [4-1:0] maxi_awqos,
  output [2-1:0] maxi_awuser,
  output reg maxi_awvalid,
  input maxi_awready,
  output [256-1:0] maxi_wdata,
  output [32-1:0] maxi_wstrb,
  output maxi_wlast,
  output maxi_wvalid,
  input maxi_wready,
  input [2-1:0] maxi_bresp,
  input maxi_bvalid,
  output maxi_bready,
  output reg [32-1:0] maxi_araddr,
  output reg [8-1:0] maxi_arlen,
  output [3-1:0] maxi_arsize,
  output [2-1:0] maxi_arburst,
  output [1-1:0] maxi_arlock,
  output [4-1:0] maxi_arcache,
  output [3-1:0] maxi_arprot,
  output [4-1:0] maxi_arqos,
  output [2-1:0] maxi_aruser,
  output reg maxi_arvalid,
  input maxi_arready,
  input [256-1:0] maxi_rdata,
  input [2-1:0] maxi_rresp,
  input maxi_rlast,
  input maxi_rvalid,
  output maxi_rready,
  input [32-1:0] saxi_awaddr,
  input [4-1:0] saxi_awcache,
  input [3-1:0] saxi_awprot,
  input saxi_awvalid,
  output saxi_awready,
  input [32-1:0] saxi_wdata,
  input [4-1:0] saxi_wstrb,
  input saxi_wvalid,
  output saxi_wready,
  output [2-1:0] saxi_bresp,
  output reg saxi_bvalid,
  input saxi_bready,
  input [32-1:0] saxi_araddr,
  input [4-1:0] saxi_arcache,
  input [3-1:0] saxi_arprot,
  input saxi_arvalid,
  output saxi_arready,
  output reg [32-1:0] saxi_rdata,
  output [2-1:0] saxi_rresp,
  output reg saxi_rvalid,
  input saxi_rready
);

  wire [4-1:0] ram_a_0_addr;
  wire [256-1:0] ram_a_0_rdata;
  wire [256-1:0] ram_a_0_wdata;
  wire ram_a_0_wenable;
  wire ram_a_0_enable;

  ram_a
  inst_ram_a
  (
    .CLK(CLK),
    .ram_a_0_addr(ram_a_0_addr),
    .ram_a_0_rdata(ram_a_0_rdata),
    .ram_a_0_wdata(ram_a_0_wdata),
    .ram_a_0_wenable(ram_a_0_wenable),
    .ram_a_0_enable(ram_a_0_enable)
  );

  wire [4-1:0] ram_b_0_addr;
  wire [256-1:0] ram_b_0_rdata;
  wire [256-1:0] ram_b_0_wdata;
  wire ram_b_0_wenable;
  wire ram_b_0_enable;

  ram_b
  inst_ram_b
  (
    .CLK(CLK),
    .ram_b_0_addr(ram_b_0_addr),
    .ram_b_0_rdata(ram_b_0_rdata),
    .ram_b_0_wdata(ram_b_0_wdata),
    .ram_b_0_wenable(ram_b_0_wenable),
    .ram_b_0_enable(ram_b_0_enable)
  );

  assign maxi_awsize = 5;
  assign maxi_awburst = 1;
  assign maxi_awlock = 0;
  assign maxi_awcache = 3;
  assign maxi_awprot = 0;
  assign maxi_awqos = 0;
  assign maxi_awuser = 0;
  reg [256-1:0] _maxi_wdata_sb_0;
  reg [32-1:0] _maxi_wstrb_sb_0;
  reg _maxi_wlast_sb_0;
  reg _maxi_wvalid_sb_0;
  wire _maxi_wready_sb_0;
  wire _sb_maxi_writedata_s_value_0;
  assign _sb_maxi_writedata_s_value_0 = _maxi_wlast_sb_0;
  wire [32-1:0] _sb_maxi_writedata_s_value_1;
  assign _sb_maxi_writedata_s_value_1 = _maxi_wstrb_sb_0;
  wire [256-1:0] _sb_maxi_writedata_s_value_2;
  assign _sb_maxi_writedata_s_value_2 = _maxi_wdata_sb_0;
  wire [289-1:0] _sb_maxi_writedata_s_data_3;
  assign _sb_maxi_writedata_s_data_3 = { _sb_maxi_writedata_s_value_0, _sb_maxi_writedata_s_value_1, _sb_maxi_writedata_s_value_2 };
  wire _sb_maxi_writedata_s_valid_4;
  assign _sb_maxi_writedata_s_valid_4 = _maxi_wvalid_sb_0;
  wire _sb_maxi_writedata_m_ready_5;
  assign _sb_maxi_writedata_m_ready_5 = maxi_wready;
  reg [289-1:0] _sb_maxi_writedata_data_6;
  reg _sb_maxi_writedata_valid_7;
  wire _sb_maxi_writedata_ready_8;
  reg [289-1:0] _sb_maxi_writedata_tmp_data_9;
  reg _sb_maxi_writedata_tmp_valid_10;
  wire [289-1:0] _sb_maxi_writedata_next_data_11;
  wire _sb_maxi_writedata_next_valid_12;
  assign _sb_maxi_writedata_ready_8 = !_sb_maxi_writedata_tmp_valid_10;
  assign _sb_maxi_writedata_next_data_11 = (_sb_maxi_writedata_tmp_valid_10)? _sb_maxi_writedata_tmp_data_9 : _sb_maxi_writedata_s_data_3;
  assign _sb_maxi_writedata_next_valid_12 = _sb_maxi_writedata_tmp_valid_10 || _sb_maxi_writedata_s_valid_4;
  wire _sb_maxi_writedata_m_value_13;
  assign _sb_maxi_writedata_m_value_13 = _sb_maxi_writedata_data_6[288:288];
  wire [32-1:0] _sb_maxi_writedata_m_value_14;
  assign _sb_maxi_writedata_m_value_14 = _sb_maxi_writedata_data_6[287:256];
  wire [256-1:0] _sb_maxi_writedata_m_value_15;
  assign _sb_maxi_writedata_m_value_15 = _sb_maxi_writedata_data_6[255:0];
  assign _maxi_wready_sb_0 = _sb_maxi_writedata_ready_8;
  assign maxi_wdata = _sb_maxi_writedata_m_value_15;
  assign maxi_wstrb = _sb_maxi_writedata_m_value_14;
  assign maxi_wlast = _sb_maxi_writedata_m_value_13;
  assign maxi_wvalid = _sb_maxi_writedata_valid_7;
  assign maxi_bready = 1;
  assign maxi_arsize = 5;
  assign maxi_arburst = 1;
  assign maxi_arlock = 0;
  assign maxi_arcache = 3;
  assign maxi_arprot = 0;
  assign maxi_arqos = 0;
  assign maxi_aruser = 0;
  wire [256-1:0] _maxi_rdata_sb_0;
  wire _maxi_rlast_sb_0;
  wire _maxi_rvalid_sb_0;
  wire _maxi_rready_sb_0;
  wire _sb_maxi_readdata_s_value_16;
  assign _sb_maxi_readdata_s_value_16 = maxi_rlast;
  wire [256-1:0] _sb_maxi_readdata_s_value_17;
  assign _sb_maxi_readdata_s_value_17 = maxi_rdata;
  wire [257-1:0] _sb_maxi_readdata_s_data_18;
  assign _sb_maxi_readdata_s_data_18 = { _sb_maxi_readdata_s_value_16, _sb_maxi_readdata_s_value_17 };
  wire _sb_maxi_readdata_s_valid_19;
  assign _sb_maxi_readdata_s_valid_19 = maxi_rvalid;
  wire _sb_maxi_readdata_m_ready_20;
  assign _sb_maxi_readdata_m_ready_20 = _maxi_rready_sb_0;
  reg [257-1:0] _sb_maxi_readdata_data_21;
  reg _sb_maxi_readdata_valid_22;
  wire _sb_maxi_readdata_ready_23;
  reg [257-1:0] _sb_maxi_readdata_tmp_data_24;
  reg _sb_maxi_readdata_tmp_valid_25;
  wire [257-1:0] _sb_maxi_readdata_next_data_26;
  wire _sb_maxi_readdata_next_valid_27;
  assign _sb_maxi_readdata_ready_23 = !_sb_maxi_readdata_tmp_valid_25;
  assign _sb_maxi_readdata_next_data_26 = (_sb_maxi_readdata_tmp_valid_25)? _sb_maxi_readdata_tmp_data_24 : _sb_maxi_readdata_s_data_18;
  assign _sb_maxi_readdata_next_valid_27 = _sb_maxi_readdata_tmp_valid_25 || _sb_maxi_readdata_s_valid_19;
  wire _sb_maxi_readdata_m_value_28;
  assign _sb_maxi_readdata_m_value_28 = _sb_maxi_readdata_data_21[256:256];
  wire [256-1:0] _sb_maxi_readdata_m_value_29;
  assign _sb_maxi_readdata_m_value_29 = _sb_maxi_readdata_data_21[255:0];
  assign _maxi_rdata_sb_0 = _sb_maxi_readdata_m_value_29;
  assign _maxi_rlast_sb_0 = _sb_maxi_readdata_m_value_28;
  assign _maxi_rvalid_sb_0 = _sb_maxi_readdata_valid_22;
  assign maxi_rready = _sb_maxi_readdata_ready_23;
  reg [3-1:0] _maxi_outstanding_wcount;
  wire _maxi_has_outstanding_write;
  assign _maxi_has_outstanding_write = (_maxi_outstanding_wcount > 0) || maxi_awvalid;
  reg _maxi_read_start;
  reg [8-1:0] _maxi_read_op_sel;
  reg [32-1:0] _maxi_read_global_addr;
  reg [33-1:0] _maxi_read_global_size;
  reg [32-1:0] _maxi_read_local_addr;
  reg [32-1:0] _maxi_read_local_stride;
  reg [33-1:0] _maxi_read_local_size;
  reg [32-1:0] _maxi_read_local_blocksize;
  wire _maxi_read_req_fifo_enq;
  wire [137-1:0] _maxi_read_req_fifo_wdata;
  wire _maxi_read_req_fifo_full;
  wire _maxi_read_req_fifo_almost_full;
  wire _maxi_read_req_fifo_deq;
  wire [137-1:0] _maxi_read_req_fifo_rdata;
  wire _maxi_read_req_fifo_empty;
  wire _maxi_read_req_fifo_almost_empty;

  _maxi_read_req_fifo
  inst__maxi_read_req_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._maxi_read_req_fifo_enq(_maxi_read_req_fifo_enq),
    ._maxi_read_req_fifo_wdata(_maxi_read_req_fifo_wdata),
    ._maxi_read_req_fifo_full(_maxi_read_req_fifo_full),
    ._maxi_read_req_fifo_almost_full(_maxi_read_req_fifo_almost_full),
    ._maxi_read_req_fifo_deq(_maxi_read_req_fifo_deq),
    ._maxi_read_req_fifo_rdata(_maxi_read_req_fifo_rdata),
    ._maxi_read_req_fifo_empty(_maxi_read_req_fifo_empty),
    ._maxi_read_req_fifo_almost_empty(_maxi_read_req_fifo_almost_empty)
  );

  reg [4-1:0] count__maxi_read_req_fifo;
  wire [8-1:0] _maxi_read_op_sel_fifo;
  wire [32-1:0] _maxi_read_local_addr_fifo;
  wire [32-1:0] _maxi_read_local_stride_fifo;
  wire [33-1:0] _maxi_read_local_size_fifo;
  wire [32-1:0] _maxi_read_local_blocksize_fifo;
  wire [8-1:0] unpack_read_req_op_sel_30;
  wire [32-1:0] unpack_read_req_local_addr_31;
  wire [32-1:0] unpack_read_req_local_stride_32;
  wire [33-1:0] unpack_read_req_local_size_33;
  wire [32-1:0] unpack_read_req_local_blocksize_34;
  assign unpack_read_req_op_sel_30 = _maxi_read_req_fifo_rdata[136:129];
  assign unpack_read_req_local_addr_31 = _maxi_read_req_fifo_rdata[128:97];
  assign unpack_read_req_local_stride_32 = _maxi_read_req_fifo_rdata[96:65];
  assign unpack_read_req_local_size_33 = _maxi_read_req_fifo_rdata[64:32];
  assign unpack_read_req_local_blocksize_34 = _maxi_read_req_fifo_rdata[31:0];
  assign _maxi_read_op_sel_fifo = unpack_read_req_op_sel_30;
  assign _maxi_read_local_addr_fifo = unpack_read_req_local_addr_31;
  assign _maxi_read_local_stride_fifo = unpack_read_req_local_stride_32;
  assign _maxi_read_local_size_fifo = unpack_read_req_local_size_33;
  assign _maxi_read_local_blocksize_fifo = unpack_read_req_local_blocksize_34;
  reg [8-1:0] _maxi_read_op_sel_buf;
  reg [32-1:0] _maxi_read_local_addr_buf;
  reg [32-1:0] _maxi_read_local_stride_buf;
  reg [33-1:0] _maxi_read_local_size_buf;
  reg [32-1:0] _maxi_read_local_blocksize_buf;
  reg _maxi_read_req_busy;
  reg _maxi_read_data_busy;
  wire _maxi_read_req_idle;
  wire _maxi_read_data_idle;
  wire _maxi_read_idle;
  assign _maxi_read_req_idle = !_maxi_read_start && !_maxi_read_req_busy;
  assign _maxi_read_data_idle = _maxi_read_req_fifo_empty && !_maxi_read_data_busy;
  assign _maxi_read_idle = _maxi_read_req_idle && _maxi_read_data_idle;
  reg _maxi_write_start;
  reg [8-1:0] _maxi_write_op_sel;
  reg [32-1:0] _maxi_write_global_addr;
  reg [33-1:0] _maxi_write_global_size;
  reg [32-1:0] _maxi_write_local_addr;
  reg [32-1:0] _maxi_write_local_stride;
  reg [33-1:0] _maxi_write_local_size;
  reg [32-1:0] _maxi_write_local_blocksize;
  wire _maxi_write_req_fifo_enq;
  wire [137-1:0] _maxi_write_req_fifo_wdata;
  wire _maxi_write_req_fifo_full;
  wire _maxi_write_req_fifo_almost_full;
  wire _maxi_write_req_fifo_deq;
  wire [137-1:0] _maxi_write_req_fifo_rdata;
  wire _maxi_write_req_fifo_empty;
  wire _maxi_write_req_fifo_almost_empty;

  _maxi_write_req_fifo
  inst__maxi_write_req_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._maxi_write_req_fifo_enq(_maxi_write_req_fifo_enq),
    ._maxi_write_req_fifo_wdata(_maxi_write_req_fifo_wdata),
    ._maxi_write_req_fifo_full(_maxi_write_req_fifo_full),
    ._maxi_write_req_fifo_almost_full(_maxi_write_req_fifo_almost_full),
    ._maxi_write_req_fifo_deq(_maxi_write_req_fifo_deq),
    ._maxi_write_req_fifo_rdata(_maxi_write_req_fifo_rdata),
    ._maxi_write_req_fifo_empty(_maxi_write_req_fifo_empty),
    ._maxi_write_req_fifo_almost_empty(_maxi_write_req_fifo_almost_empty)
  );

  reg [4-1:0] count__maxi_write_req_fifo;
  wire [8-1:0] _maxi_write_op_sel_fifo;
  wire [32-1:0] _maxi_write_local_addr_fifo;
  wire [32-1:0] _maxi_write_local_stride_fifo;
  wire [33-1:0] _maxi_write_size_fifo;
  wire [32-1:0] _maxi_write_local_blocksize_fifo;
  wire [8-1:0] unpack_write_req_op_sel_35;
  wire [32-1:0] unpack_write_req_local_addr_36;
  wire [32-1:0] unpack_write_req_local_stride_37;
  wire [33-1:0] unpack_write_req_size_38;
  wire [32-1:0] unpack_write_req_local_blocksize_39;
  assign unpack_write_req_op_sel_35 = _maxi_write_req_fifo_rdata[136:129];
  assign unpack_write_req_local_addr_36 = _maxi_write_req_fifo_rdata[128:97];
  assign unpack_write_req_local_stride_37 = _maxi_write_req_fifo_rdata[96:65];
  assign unpack_write_req_size_38 = _maxi_write_req_fifo_rdata[64:32];
  assign unpack_write_req_local_blocksize_39 = _maxi_write_req_fifo_rdata[31:0];
  assign _maxi_write_op_sel_fifo = unpack_write_req_op_sel_35;
  assign _maxi_write_local_addr_fifo = unpack_write_req_local_addr_36;
  assign _maxi_write_local_stride_fifo = unpack_write_req_local_stride_37;
  assign _maxi_write_size_fifo = unpack_write_req_size_38;
  assign _maxi_write_local_blocksize_fifo = unpack_write_req_local_blocksize_39;
  reg [8-1:0] _maxi_write_op_sel_buf;
  reg [32-1:0] _maxi_write_local_addr_buf;
  reg [32-1:0] _maxi_write_local_stride_buf;
  reg [33-1:0] _maxi_write_size_buf;
  reg [32-1:0] _maxi_write_local_blocksize_buf;
  reg _maxi_write_req_busy;
  reg _maxi_write_data_busy;
  wire _maxi_write_req_idle;
  wire _maxi_write_data_idle;
  wire _maxi_write_idle;
  assign _maxi_write_req_idle = !_maxi_write_start && !_maxi_write_req_busy;
  assign _maxi_write_data_idle = _maxi_write_req_fifo_empty && !_maxi_write_data_busy;
  assign _maxi_write_idle = _maxi_write_req_idle && _maxi_write_data_idle;
  wire [10-1:0] tmp_ram_0_addr;
  wire [256-1:0] tmp_ram_0_rdata;
  wire [256-1:0] tmp_ram_0_wdata;
  wire tmp_ram_0_wenable;
  wire tmp_ram_0_enable;

  tmp_ram
  inst_tmp_ram
  (
    .CLK(CLK),
    .tmp_ram_0_addr(tmp_ram_0_addr),
    .tmp_ram_0_rdata(tmp_ram_0_rdata),
    .tmp_ram_0_wdata(tmp_ram_0_wdata),
    .tmp_ram_0_wenable(tmp_ram_0_wenable),
    .tmp_ram_0_enable(tmp_ram_0_enable)
  );

  reg [512-1:0] s_tdata_i;
  reg s_tlast_i;
  reg s_tvalid_i;
  wire s_tready_o;
  wire [256-1:0] digest_o;
  wire digest_valid_o;
  wire [1-1:0] mode;
  reg [256-1:0] mac;

  sha256_stream
  sha256_stream
  (
    .clk(CLK),
    .rst(RST),
    .s_tdata_i(s_tdata_i),
    .s_tlast_i(s_tlast_i),
    .s_tvalid_i(s_tvalid_i),
    .s_tready_o(s_tready_o),
    .digest_o(digest_o),
    .digest_valid_o(digest_valid_o),
    .mode(mode)
  );

  wire [1-1:0] data_ram_0_addr;
  wire [256-1:0] data_ram_0_rdata;
  wire [256-1:0] data_ram_0_wdata;
  wire data_ram_0_wenable;
  wire data_ram_0_enable;

  data_ram
  inst_data_ram
  (
    .CLK(CLK),
    .data_ram_0_addr(data_ram_0_addr),
    .data_ram_0_rdata(data_ram_0_rdata),
    .data_ram_0_wdata(data_ram_0_wdata),
    .data_ram_0_wenable(data_ram_0_wenable),
    .data_ram_0_enable(data_ram_0_enable)
  );

  wire [2-1:0] mac_ram_0_addr;
  wire [256-1:0] mac_ram_0_rdata;
  wire [256-1:0] mac_ram_0_wdata;
  wire mac_ram_0_wenable;
  wire mac_ram_0_enable;

  mac_ram
  inst_mac_ram
  (
    .CLK(CLK),
    .mac_ram_0_addr(mac_ram_0_addr),
    .mac_ram_0_rdata(mac_ram_0_rdata),
    .mac_ram_0_wdata(mac_ram_0_wdata),
    .mac_ram_0_wenable(mac_ram_0_wenable),
    .mac_ram_0_enable(mac_ram_0_enable)
  );

  wire [1-1:0] calc_mac_ram_0_addr;
  wire [256-1:0] calc_mac_ram_0_rdata;
  wire [256-1:0] calc_mac_ram_0_wdata;
  wire calc_mac_ram_0_wenable;
  wire calc_mac_ram_0_enable;

  calc_mac_ram
  inst_calc_mac_ram
  (
    .CLK(CLK),
    .calc_mac_ram_0_addr(calc_mac_ram_0_addr),
    .calc_mac_ram_0_rdata(calc_mac_ram_0_rdata),
    .calc_mac_ram_0_wdata(calc_mac_ram_0_wdata),
    .calc_mac_ram_0_wenable(calc_mac_ram_0_wenable),
    .calc_mac_ram_0_enable(calc_mac_ram_0_enable)
  );

  reg [256-1:0] root;
  reg [256-1:0] hash_calc_reg;
  reg [3-1:0] hidx;
  reg is_secure;
  reg [32-1:0] i;
  assign saxi_bresp = 0;
  assign saxi_rresp = 0;
  reg signed [32-1:0] _saxi_register_0;
  reg signed [32-1:0] _saxi_register_1;
  reg signed [32-1:0] _saxi_register_2;
  reg signed [32-1:0] _saxi_register_3;
  reg _saxi_flag_0;
  reg _saxi_flag_1;
  reg _saxi_flag_2;
  reg _saxi_flag_3;
  reg signed [32-1:0] _saxi_resetval_0;
  reg signed [32-1:0] _saxi_resetval_1;
  reg signed [32-1:0] _saxi_resetval_2;
  reg signed [32-1:0] _saxi_resetval_3;
  localparam _saxi_maskwidth = 2;
  localparam _saxi_mask = { _saxi_maskwidth{ 1'd1 } };
  localparam _saxi_shift = 2;
  reg [32-1:0] _saxi_register_fsm;
  localparam _saxi_register_fsm_init = 0;
  reg [32-1:0] addr_40;
  reg writevalid_41;
  reg readvalid_42;
  reg prev_awvalid_43;
  reg prev_arvalid_44;
  assign saxi_awready = (_saxi_register_fsm == 0) && (!writevalid_41 && !readvalid_42 && !saxi_bvalid && prev_awvalid_43);
  assign saxi_arready = (_saxi_register_fsm == 0) && (!readvalid_42 && !writevalid_41 && prev_arvalid_44 && !prev_awvalid_43);
  reg [_saxi_maskwidth-1:0] axis_maskaddr_45;
  wire signed [32-1:0] axislite_rdata_46;
  assign axislite_rdata_46 = (axis_maskaddr_45 == 0)? _saxi_register_0 : 
                             (axis_maskaddr_45 == 1)? _saxi_register_1 : 
                             (axis_maskaddr_45 == 2)? _saxi_register_2 : 
                             (axis_maskaddr_45 == 3)? _saxi_register_3 : 'hx;
  wire axislite_flag_47;
  assign axislite_flag_47 = (axis_maskaddr_45 == 0)? _saxi_flag_0 : 
                            (axis_maskaddr_45 == 1)? _saxi_flag_1 : 
                            (axis_maskaddr_45 == 2)? _saxi_flag_2 : 
                            (axis_maskaddr_45 == 3)? _saxi_flag_3 : 'hx;
  wire signed [32-1:0] axislite_resetval_48;
  assign axislite_resetval_48 = (axis_maskaddr_45 == 0)? _saxi_resetval_0 : 
                                (axis_maskaddr_45 == 1)? _saxi_resetval_1 : 
                                (axis_maskaddr_45 == 2)? _saxi_resetval_2 : 
                                (axis_maskaddr_45 == 3)? _saxi_resetval_3 : 'hx;
  reg _saxi_rdata_cond_0_1;
  assign saxi_wready = _saxi_register_fsm == 3;
  reg [32-1:0] th_count;
  localparam th_count_init = 0;
  wire [32-1:0] mask_addr_shifted_49;
  assign mask_addr_shifted_49 = 0;
  wire [32-1:0] mask_addr_masked_50;
  assign mask_addr_masked_50 = mask_addr_shifted_49 << 5;
  reg [32-1:0] _maxi_read_req_fsm;
  localparam _maxi_read_req_fsm_init = 0;
  reg [33-1:0] _maxi_read_cur_global_size;
  reg _maxi_read_cont;
  wire [8-1:0] pack_read_req_op_sel_51;
  wire [32-1:0] pack_read_req_local_addr_52;
  wire [32-1:0] pack_read_req_local_stride_53;
  wire [33-1:0] pack_read_req_local_size_54;
  wire [32-1:0] pack_read_req_local_blocksize_55;
  assign pack_read_req_op_sel_51 = _maxi_read_op_sel;
  assign pack_read_req_local_addr_52 = _maxi_read_local_addr;
  assign pack_read_req_local_stride_53 = _maxi_read_local_stride;
  assign pack_read_req_local_size_54 = _maxi_read_local_size;
  assign pack_read_req_local_blocksize_55 = _maxi_read_local_blocksize;
  wire [137-1:0] pack_read_req_packed_56;
  assign pack_read_req_packed_56 = { pack_read_req_op_sel_51, pack_read_req_local_addr_52, pack_read_req_local_stride_53, pack_read_req_local_size_54, pack_read_req_local_blocksize_55 };
  assign _maxi_read_req_fifo_wdata = ((_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full)? pack_read_req_packed_56 : 'hx;
  assign _maxi_read_req_fifo_enq = ((_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full)? (_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full && !_maxi_read_req_fifo_almost_full : 0;
  localparam _tmp_57 = 1;
  wire [_tmp_57-1:0] _tmp_58;
  assign _tmp_58 = !_maxi_read_req_fifo_almost_full;
  reg [_tmp_57-1:0] __tmp_58_1;
  wire [32-1:0] mask_addr_shifted_59;
  assign mask_addr_shifted_59 = _maxi_read_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_60;
  assign mask_addr_masked_60 = mask_addr_shifted_59 << 5;
  wire [32-1:0] mask_addr_shifted_61;
  assign mask_addr_shifted_61 = _maxi_read_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_62;
  assign mask_addr_masked_62 = mask_addr_shifted_61 << 5;
  wire [32-1:0] mask_addr_shifted_63;
  assign mask_addr_shifted_63 = _maxi_read_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_64;
  assign mask_addr_masked_64 = mask_addr_shifted_63 << 5;
  wire [32-1:0] mask_addr_shifted_65;
  assign mask_addr_shifted_65 = _maxi_read_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_66;
  assign mask_addr_masked_66 = mask_addr_shifted_65 << 5;
  wire [32-1:0] mask_addr_shifted_67;
  assign mask_addr_shifted_67 = _maxi_read_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_68;
  assign mask_addr_masked_68 = mask_addr_shifted_67 << 5;
  wire [32-1:0] mask_addr_shifted_69;
  assign mask_addr_shifted_69 = _maxi_read_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_70;
  assign mask_addr_masked_70 = mask_addr_shifted_69 << 5;
  reg _maxi_raddr_cond_0_1;
  reg [32-1:0] _maxi_read_data_fsm;
  localparam _maxi_read_data_fsm_init = 0;
  reg [32-1:0] write_burst_fsm_0;
  localparam write_burst_fsm_0_init = 0;
  reg [1-1:0] write_burst_addr_71;
  reg [1-1:0] write_burst_stride_72;
  reg [33-1:0] write_burst_length_73;
  reg write_burst_done_74;
  assign data_ram_0_wdata = ((write_burst_fsm_0 == 1) && _maxi_rvalid_sb_0)? _maxi_rdata_sb_0 : 'hx;
  assign data_ram_0_wenable = ((write_burst_fsm_0 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  localparam _tmp_75 = 1;
  wire [_tmp_75-1:0] _tmp_76;
  assign _tmp_76 = th_count == 6;
  reg [_tmp_75-1:0] __tmp_76_1;
  reg signed [256-1:0] read_rdata_77;
  wire [32-1:0] mask_addr_shifted_78;
  assign mask_addr_shifted_78 = 7;
  wire [32-1:0] mask_addr_masked_79;
  assign mask_addr_masked_79 = mask_addr_shifted_78 << 5;
  reg [32-1:0] _maxi_write_req_fsm;
  localparam _maxi_write_req_fsm_init = 0;
  reg [33-1:0] _maxi_write_cur_global_size;
  reg _maxi_write_cont;
  wire [8-1:0] pack_write_req_op_sel_80;
  wire [32-1:0] pack_write_req_local_addr_81;
  wire [32-1:0] pack_write_req_local_stride_82;
  wire [33-1:0] pack_write_req_size_83;
  wire [32-1:0] pack_write_req_local_blocksize_84;
  assign pack_write_req_op_sel_80 = _maxi_write_op_sel;
  assign pack_write_req_local_addr_81 = _maxi_write_local_addr;
  assign pack_write_req_local_stride_82 = _maxi_write_local_stride;
  assign pack_write_req_size_83 = _maxi_write_local_size;
  assign pack_write_req_local_blocksize_84 = _maxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_85;
  assign pack_write_req_packed_85 = { pack_write_req_op_sel_80, pack_write_req_local_addr_81, pack_write_req_local_stride_82, pack_write_req_size_83, pack_write_req_local_blocksize_84 };
  localparam _tmp_86 = 1;
  wire [_tmp_86-1:0] _tmp_87;
  assign _tmp_87 = !_maxi_write_req_fifo_almost_full;
  reg [_tmp_86-1:0] __tmp_87_1;
  wire [32-1:0] mask_addr_shifted_88;
  assign mask_addr_shifted_88 = _maxi_write_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_89;
  assign mask_addr_masked_89 = mask_addr_shifted_88 << 5;
  wire [32-1:0] mask_addr_shifted_90;
  assign mask_addr_shifted_90 = _maxi_write_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_91;
  assign mask_addr_masked_91 = mask_addr_shifted_90 << 5;
  wire [32-1:0] mask_addr_shifted_92;
  assign mask_addr_shifted_92 = _maxi_write_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_93;
  assign mask_addr_masked_93 = mask_addr_shifted_92 << 5;
  wire [32-1:0] mask_addr_shifted_94;
  assign mask_addr_shifted_94 = _maxi_write_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_95;
  assign mask_addr_masked_95 = mask_addr_shifted_94 << 5;
  wire [32-1:0] mask_addr_shifted_96;
  assign mask_addr_shifted_96 = _maxi_write_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_97;
  assign mask_addr_masked_97 = mask_addr_shifted_96 << 5;
  wire [32-1:0] mask_addr_shifted_98;
  assign mask_addr_shifted_98 = _maxi_write_global_addr >> 5;
  wire [32-1:0] mask_addr_masked_99;
  assign mask_addr_masked_99 = mask_addr_shifted_98 << 5;
  wire [8-1:0] pack_write_req_op_sel_100;
  wire [32-1:0] pack_write_req_local_addr_101;
  wire [32-1:0] pack_write_req_local_stride_102;
  wire [33-1:0] pack_write_req_size_103;
  wire [32-1:0] pack_write_req_local_blocksize_104;
  assign pack_write_req_op_sel_100 = _maxi_write_op_sel;
  assign pack_write_req_local_addr_101 = _maxi_write_local_addr;
  assign pack_write_req_local_stride_102 = _maxi_write_local_stride;
  assign pack_write_req_size_103 = _maxi_write_cur_global_size;
  assign pack_write_req_local_blocksize_104 = _maxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_105;
  assign pack_write_req_packed_105 = { pack_write_req_op_sel_100, pack_write_req_local_addr_101, pack_write_req_local_stride_102, pack_write_req_size_103, pack_write_req_local_blocksize_104 };
  assign _maxi_write_req_fifo_wdata = ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6))? pack_write_req_packed_105 : 
                                      ((_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full)? pack_write_req_packed_85 : 'hx;
  assign _maxi_write_req_fifo_enq = ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6))? (_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6) && !_maxi_write_req_fifo_almost_full : 
                                    ((_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full)? (_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full && !_maxi_write_req_fifo_almost_full : 0;
  localparam _tmp_106 = 1;
  wire [_tmp_106-1:0] _tmp_107;
  assign _tmp_107 = !_maxi_write_req_fifo_almost_full;
  reg [_tmp_106-1:0] __tmp_107_1;
  reg _maxi_waddr_cond_0_1;
  reg [32-1:0] _maxi_write_data_fsm;
  localparam _maxi_write_data_fsm_init = 0;
  reg [32-1:0] read_burst_fsm_1;
  localparam read_burst_fsm_1_init = 0;
  reg [2-1:0] read_burst_addr_108;
  reg [2-1:0] read_burst_stride_109;
  reg [33-1:0] read_burst_length_110;
  reg read_burst_rvalid_111;
  reg read_burst_rlast_112;
  localparam _tmp_113 = 1;
  wire [_tmp_113-1:0] _tmp_114;
  assign _tmp_114 = (read_burst_fsm_1 == 1) && (!read_burst_rvalid_111 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_113-1:0] __tmp_114_1;
  wire [256-1:0] read_burst_rdata_115;
  assign read_burst_rdata_115 = mac_ram_0_rdata;
  reg _maxi_wdata_cond_0_1;
  wire [32-1:0] mask_addr_shifted_116;
  assign mask_addr_shifted_116 = 1;
  wire [32-1:0] mask_addr_masked_117;
  assign mask_addr_masked_117 = mask_addr_shifted_116 << 5;
  localparam _tmp_118 = 1;
  wire [_tmp_118-1:0] _tmp_119;
  assign _tmp_119 = th_count == 19;
  reg [_tmp_118-1:0] __tmp_119_1;
  reg signed [256-1:0] read_rdata_120;
  wire [32-1:0] mask_addr_shifted_121;
  assign mask_addr_shifted_121 = 8;
  wire [32-1:0] mask_addr_masked_122;
  assign mask_addr_masked_122 = mask_addr_shifted_121 << 5;
  wire [32-1:0] mask_addr_shifted_123;
  assign mask_addr_shifted_123 = 2;
  wire [32-1:0] mask_addr_masked_124;
  assign mask_addr_masked_124 = mask_addr_shifted_123 << 5;
  localparam _tmp_125 = 1;
  wire [_tmp_125-1:0] _tmp_126;
  assign _tmp_126 = th_count == 32;
  reg [_tmp_125-1:0] __tmp_126_1;
  reg signed [256-1:0] read_rdata_127;
  wire [32-1:0] mask_addr_shifted_128;
  assign mask_addr_shifted_128 = 9;
  wire [32-1:0] mask_addr_masked_129;
  assign mask_addr_masked_129 = mask_addr_shifted_128 << 5;
  wire [32-1:0] mask_addr_shifted_130;
  assign mask_addr_shifted_130 = 3;
  wire [32-1:0] mask_addr_masked_131;
  assign mask_addr_masked_131 = mask_addr_shifted_130 << 5;
  assign data_ram_0_addr = (th_count == 45)? 0 : 
                           (th_count == 32)? 0 : 
                           (th_count == 19)? 0 : 
                           (th_count == 6)? 0 : 
                           ((write_burst_fsm_0 == 1) && _maxi_rvalid_sb_0)? write_burst_addr_71 : 'hx;
  assign data_ram_0_enable = (th_count == 45)? 1'd1 : 
                             (th_count == 32)? 1'd1 : 
                             (th_count == 19)? 1'd1 : 
                             (th_count == 6)? 1'd1 : 
                             ((write_burst_fsm_0 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  localparam _tmp_132 = 1;
  wire [_tmp_132-1:0] _tmp_133;
  assign _tmp_133 = th_count == 45;
  reg [_tmp_132-1:0] __tmp_133_1;
  reg signed [256-1:0] read_rdata_134;
  wire [32-1:0] mask_addr_shifted_135;
  assign mask_addr_shifted_135 = 10;
  wire [32-1:0] mask_addr_masked_136;
  assign mask_addr_masked_136 = mask_addr_shifted_135 << 5;
  wire [32-1:0] mask_addr_shifted_137;
  assign mask_addr_shifted_137 = 7;
  wire [32-1:0] mask_addr_masked_138;
  assign mask_addr_masked_138 = mask_addr_shifted_137 << 5;
  reg [32-1:0] write_burst_fsm_2;
  localparam write_burst_fsm_2_init = 0;
  reg [2-1:0] write_burst_addr_139;
  reg [2-1:0] write_burst_stride_140;
  reg [33-1:0] write_burst_length_141;
  reg write_burst_done_142;
  localparam _tmp_143 = 1;
  wire [_tmp_143-1:0] _tmp_144;
  assign _tmp_144 = th_count == 58;
  reg [_tmp_143-1:0] __tmp_144_1;
  reg signed [256-1:0] read_rdata_145;
  wire [32-1:0] mask_addr_shifted_146;
  assign mask_addr_shifted_146 = 8;
  wire [32-1:0] mask_addr_masked_147;
  assign mask_addr_masked_147 = mask_addr_shifted_146 << 5;
  localparam _tmp_148 = 1;
  wire [_tmp_148-1:0] _tmp_149;
  assign _tmp_149 = th_count == 61;
  reg [_tmp_148-1:0] __tmp_149_1;
  reg signed [256-1:0] read_rdata_150;
  wire [32-1:0] mask_addr_shifted_151;
  assign mask_addr_shifted_151 = 5;
  wire [32-1:0] mask_addr_masked_152;
  assign mask_addr_masked_152 = mask_addr_shifted_151 << 5;
  wire [32-1:0] mask_addr_shifted_153;
  assign mask_addr_shifted_153 = 9;
  wire [32-1:0] mask_addr_masked_154;
  assign mask_addr_masked_154 = mask_addr_shifted_153 << 5;
  localparam _tmp_155 = 1;
  wire [_tmp_155-1:0] _tmp_156;
  assign _tmp_156 = th_count == 75;
  reg [_tmp_155-1:0] __tmp_156_1;
  reg signed [256-1:0] read_rdata_157;
  wire [32-1:0] mask_addr_shifted_158;
  assign mask_addr_shifted_158 = 10;
  wire [32-1:0] mask_addr_masked_159;
  assign mask_addr_masked_159 = mask_addr_shifted_158 << 5;
  localparam _tmp_160 = 1;
  wire [_tmp_160-1:0] _tmp_161;
  assign _tmp_161 = th_count == 78;
  reg [_tmp_160-1:0] __tmp_161_1;
  reg signed [256-1:0] read_rdata_162;
  wire [32-1:0] mask_addr_shifted_163;
  assign mask_addr_shifted_163 = 6;
  wire [32-1:0] mask_addr_masked_164;
  assign mask_addr_masked_164 = mask_addr_shifted_163 << 5;
  wire [32-1:0] mask_addr_shifted_165;
  assign mask_addr_shifted_165 = 5;
  wire [32-1:0] mask_addr_masked_166;
  assign mask_addr_masked_166 = mask_addr_shifted_165 << 5;
  localparam _tmp_167 = 1;
  wire [_tmp_167-1:0] _tmp_168;
  assign _tmp_168 = th_count == 92;
  reg [_tmp_167-1:0] __tmp_168_1;
  reg signed [256-1:0] read_rdata_169;
  wire [32-1:0] mask_addr_shifted_170;
  assign mask_addr_shifted_170 = 6;
  wire [32-1:0] mask_addr_masked_171;
  assign mask_addr_masked_171 = mask_addr_shifted_170 << 5;
  localparam _tmp_172 = 1;
  wire [_tmp_172-1:0] _tmp_173;
  assign _tmp_173 = th_count == 95;
  reg [_tmp_172-1:0] __tmp_173_1;
  reg signed [256-1:0] read_rdata_174;
  assign mac_ram_0_wdata = (th_count == 104)? hash_calc_reg : 
                           (th_count == 87)? hash_calc_reg : 
                           (th_count == 70)? hash_calc_reg : 
                           ((write_burst_fsm_2 == 1) && _maxi_rvalid_sb_0)? _maxi_rdata_sb_0 : 
                           (th_count == 53)? hash_calc_reg : 
                           (th_count == 40)? hash_calc_reg : 
                           (th_count == 27)? hash_calc_reg : 
                           (th_count == 14)? hash_calc_reg : 'hx;
  assign mac_ram_0_wenable = (th_count == 104)? 1'd1 : 
                             (th_count == 87)? 1'd1 : 
                             (th_count == 70)? 1'd1 : 
                             ((write_burst_fsm_2 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 
                             (th_count == 53)? 1'd1 : 
                             (th_count == 40)? 1'd1 : 
                             (th_count == 27)? 1'd1 : 
                             (th_count == 14)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_175;
  assign mask_addr_shifted_175 = 4;
  wire [32-1:0] mask_addr_masked_176;
  assign mask_addr_masked_176 = mask_addr_shifted_175 << 5;
  wire [32-1:0] mask_addr_shifted_177;
  assign mask_addr_shifted_177 = 0;
  wire [32-1:0] mask_addr_masked_178;
  assign mask_addr_masked_178 = mask_addr_shifted_177 << 5;
  assign _maxi_read_req_fifo_deq = ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1)) && !_maxi_read_req_fifo_empty)? 1 : 0;
  reg [32-1:0] write_burst_fsm_3;
  localparam write_burst_fsm_3_init = 0;
  reg [10-1:0] write_burst_addr_179;
  reg [10-1:0] write_burst_stride_180;
  reg [33-1:0] write_burst_length_181;
  reg write_burst_done_182;
  assign tmp_ram_0_wdata = ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? _maxi_rdata_sb_0 : 'hx;
  assign tmp_ram_0_wenable = ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  assign _maxi_rready_sb_0 = (_maxi_read_data_fsm == 2) || (_maxi_read_data_fsm == 2) || (_maxi_read_data_fsm == 2);
  localparam _tmp_183 = 1;
  wire [_tmp_183-1:0] _tmp_184;
  assign _tmp_184 = th_count == 112;
  reg [_tmp_183-1:0] __tmp_184_1;
  reg signed [256-1:0] read_rdata_185;
  wire [32-1:0] mask_addr_shifted_186;
  assign mask_addr_shifted_186 = 128 + (3 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_187;
  assign mask_addr_masked_187 = mask_addr_shifted_186 << 5;
  localparam _tmp_188 = 1;
  wire [_tmp_188-1:0] _tmp_189;
  assign _tmp_189 = th_count == 123;
  reg [_tmp_188-1:0] __tmp_189_1;
  reg signed [256-1:0] read_rdata_190;
  wire [32-1:0] mask_addr_shifted_191;
  assign mask_addr_shifted_191 = 128 + (3 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_192;
  assign mask_addr_masked_192 = mask_addr_shifted_191 << 5;
  localparam _tmp_193 = 1;
  wire [_tmp_193-1:0] _tmp_194;
  assign _tmp_194 = th_count == 134;
  reg [_tmp_193-1:0] __tmp_194_1;
  reg signed [256-1:0] read_rdata_195;
  wire [32-1:0] mask_addr_shifted_196;
  assign mask_addr_shifted_196 = 128 + ((3 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_197;
  assign mask_addr_masked_197 = mask_addr_shifted_196 << 5;
  localparam _tmp_198 = 1;
  wire [_tmp_198-1:0] _tmp_199;
  assign _tmp_199 = th_count == 147;
  reg [_tmp_198-1:0] __tmp_199_1;
  reg signed [256-1:0] read_rdata_200;
  wire [32-1:0] mask_addr_shifted_201;
  assign mask_addr_shifted_201 = 128 + ((3 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_202;
  assign mask_addr_masked_202 = mask_addr_shifted_201 << 5;
  localparam _tmp_203 = 1;
  wire [_tmp_203-1:0] _tmp_204;
  assign _tmp_204 = th_count == 158;
  reg [_tmp_203-1:0] __tmp_204_1;
  reg signed [256-1:0] read_rdata_205;
  wire [32-1:0] mask_addr_shifted_206;
  assign mask_addr_shifted_206 = 0 + i * 32 >> 5;
  wire [32-1:0] mask_addr_masked_207;
  assign mask_addr_masked_207 = mask_addr_shifted_206 << 5;
  reg [32-1:0] read_burst_fsm_4;
  localparam read_burst_fsm_4_init = 0;
  reg [4-1:0] read_burst_addr_208;
  reg [4-1:0] read_burst_stride_209;
  reg [33-1:0] read_burst_length_210;
  reg read_burst_rvalid_211;
  reg read_burst_rlast_212;
  localparam _tmp_213 = 1;
  wire [_tmp_213-1:0] _tmp_214;
  assign _tmp_214 = (read_burst_fsm_4 == 1) && (!read_burst_rvalid_211 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_213-1:0] __tmp_214_1;
  wire [256-1:0] read_burst_rdata_215;
  assign read_burst_rdata_215 = ram_a_0_rdata;
  reg _maxi_wdata_cond_1_1;
  localparam _tmp_216 = 1;
  wire [_tmp_216-1:0] _tmp_217;
  assign _tmp_217 = th_count == 171;
  reg [_tmp_216-1:0] __tmp_217_1;
  reg signed [256-1:0] read_rdata_218;
  wire [32-1:0] mask_addr_shifted_219;
  assign mask_addr_shifted_219 = 128 + (3 + i) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_220;
  assign mask_addr_masked_220 = mask_addr_shifted_219 << 5;
  reg [32-1:0] read_burst_fsm_5;
  localparam read_burst_fsm_5_init = 0;
  reg [1-1:0] read_burst_addr_221;
  reg [1-1:0] read_burst_stride_222;
  reg [33-1:0] read_burst_length_223;
  reg read_burst_rvalid_224;
  reg read_burst_rlast_225;
  localparam _tmp_226 = 1;
  wire [_tmp_226-1:0] _tmp_227;
  assign _tmp_227 = (read_burst_fsm_5 == 1) && (!read_burst_rvalid_224 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_226-1:0] __tmp_227_1;
  wire [256-1:0] read_burst_rdata_228;
  assign read_burst_rdata_228 = calc_mac_ram_0_rdata;
  reg _maxi_wdata_cond_2_1;
  localparam _tmp_229 = 1;
  wire [_tmp_229-1:0] _tmp_230;
  assign _tmp_230 = th_count == 182;
  reg [_tmp_229-1:0] __tmp_230_1;
  reg signed [256-1:0] read_rdata_231;
  wire [32-1:0] mask_addr_shifted_232;
  assign mask_addr_shifted_232 = 128 + (3 + i - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_233;
  assign mask_addr_masked_233 = mask_addr_shifted_232 << 5;
  localparam _tmp_234 = 1;
  wire [_tmp_234-1:0] _tmp_235;
  assign _tmp_235 = th_count == 204;
  reg [_tmp_234-1:0] __tmp_235_1;
  reg signed [256-1:0] read_rdata_236;
  wire [32-1:0] mask_addr_shifted_237;
  assign mask_addr_shifted_237 = 128 + ((3 + i - 1) / 2 - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_238;
  assign mask_addr_masked_238 = mask_addr_shifted_237 << 5;
  wire [32-1:0] mask_addr_shifted_239;
  assign mask_addr_shifted_239 = 1;
  wire [32-1:0] mask_addr_masked_240;
  assign mask_addr_masked_240 = mask_addr_shifted_239 << 5;
  localparam _tmp_241 = 1;
  wire [_tmp_241-1:0] _tmp_242;
  assign _tmp_242 = th_count == 233;
  reg [_tmp_241-1:0] __tmp_242_1;
  reg signed [256-1:0] read_rdata_243;
  wire [32-1:0] mask_addr_shifted_244;
  assign mask_addr_shifted_244 = 128 + (4 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_245;
  assign mask_addr_masked_245 = mask_addr_shifted_244 << 5;
  localparam _tmp_246 = 1;
  wire [_tmp_246-1:0] _tmp_247;
  assign _tmp_247 = th_count == 244;
  reg [_tmp_246-1:0] __tmp_247_1;
  reg signed [256-1:0] read_rdata_248;
  wire [32-1:0] mask_addr_shifted_249;
  assign mask_addr_shifted_249 = 128 + (4 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_250;
  assign mask_addr_masked_250 = mask_addr_shifted_249 << 5;
  localparam _tmp_251 = 1;
  wire [_tmp_251-1:0] _tmp_252;
  assign _tmp_252 = th_count == 255;
  reg [_tmp_251-1:0] __tmp_252_1;
  reg signed [256-1:0] read_rdata_253;
  wire [32-1:0] mask_addr_shifted_254;
  assign mask_addr_shifted_254 = 128 + ((4 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_255;
  assign mask_addr_masked_255 = mask_addr_shifted_254 << 5;
  localparam _tmp_256 = 1;
  wire [_tmp_256-1:0] _tmp_257;
  assign _tmp_257 = th_count == 268;
  reg [_tmp_256-1:0] __tmp_257_1;
  reg signed [256-1:0] read_rdata_258;
  wire [32-1:0] mask_addr_shifted_259;
  assign mask_addr_shifted_259 = 128 + ((4 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_260;
  assign mask_addr_masked_260 = mask_addr_shifted_259 << 5;
  localparam _tmp_261 = 1;
  wire [_tmp_261-1:0] _tmp_262;
  assign _tmp_262 = th_count == 279;
  reg [_tmp_261-1:0] __tmp_262_1;
  reg signed [256-1:0] read_rdata_263;
  wire [32-1:0] mask_addr_shifted_264;
  assign mask_addr_shifted_264 = 32 + i * 32 >> 5;
  wire [32-1:0] mask_addr_masked_265;
  assign mask_addr_masked_265 = mask_addr_shifted_264 << 5;
  localparam _tmp_266 = 1;
  wire [_tmp_266-1:0] _tmp_267;
  assign _tmp_267 = th_count == 292;
  reg [_tmp_266-1:0] __tmp_267_1;
  reg signed [256-1:0] read_rdata_268;
  wire [32-1:0] mask_addr_shifted_269;
  assign mask_addr_shifted_269 = 128 + (4 + i) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_270;
  assign mask_addr_masked_270 = mask_addr_shifted_269 << 5;
  localparam _tmp_271 = 1;
  wire [_tmp_271-1:0] _tmp_272;
  assign _tmp_272 = th_count == 303;
  reg [_tmp_271-1:0] __tmp_272_1;
  reg signed [256-1:0] read_rdata_273;
  wire [32-1:0] mask_addr_shifted_274;
  assign mask_addr_shifted_274 = 128 + (4 + i - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_275;
  assign mask_addr_masked_275 = mask_addr_shifted_274 << 5;
  localparam _tmp_276 = 1;
  wire [_tmp_276-1:0] _tmp_277;
  assign _tmp_277 = th_count == 325;
  reg [_tmp_276-1:0] __tmp_277_1;
  reg signed [256-1:0] read_rdata_278;
  wire [32-1:0] mask_addr_shifted_279;
  assign mask_addr_shifted_279 = 128 + ((4 + i - 1) / 2 - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_280;
  assign mask_addr_masked_280 = mask_addr_shifted_279 << 5;
  assign ram_a_0_wdata = (th_count == 350)? 64 : 
                         (th_count == 229)? 32 : 
                         (th_count == 108)? 16 : 'hx;
  assign ram_a_0_wenable = (th_count == 350)? 1'd1 : 
                           (th_count == 229)? 1'd1 : 
                           (th_count == 108)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_281;
  assign mask_addr_shifted_281 = 2;
  wire [32-1:0] mask_addr_masked_282;
  assign mask_addr_masked_282 = mask_addr_shifted_281 << 5;
  localparam _tmp_283 = 1;
  wire [_tmp_283-1:0] _tmp_284;
  assign _tmp_284 = th_count == 354;
  reg [_tmp_283-1:0] __tmp_284_1;
  reg signed [256-1:0] read_rdata_285;
  wire [32-1:0] mask_addr_shifted_286;
  assign mask_addr_shifted_286 = 128 + (5 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_287;
  assign mask_addr_masked_287 = mask_addr_shifted_286 << 5;
  localparam _tmp_288 = 1;
  wire [_tmp_288-1:0] _tmp_289;
  assign _tmp_289 = th_count == 365;
  reg [_tmp_288-1:0] __tmp_289_1;
  reg signed [256-1:0] read_rdata_290;
  wire [32-1:0] mask_addr_shifted_291;
  assign mask_addr_shifted_291 = 128 + (5 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_292;
  assign mask_addr_masked_292 = mask_addr_shifted_291 << 5;
  localparam _tmp_293 = 1;
  wire [_tmp_293-1:0] _tmp_294;
  assign _tmp_294 = th_count == 376;
  reg [_tmp_293-1:0] __tmp_294_1;
  reg signed [256-1:0] read_rdata_295;
  wire [32-1:0] mask_addr_shifted_296;
  assign mask_addr_shifted_296 = 128 + ((5 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_297;
  assign mask_addr_masked_297 = mask_addr_shifted_296 << 5;
  localparam _tmp_298 = 1;
  wire [_tmp_298-1:0] _tmp_299;
  assign _tmp_299 = th_count == 389;
  reg [_tmp_298-1:0] __tmp_299_1;
  reg signed [256-1:0] read_rdata_300;
  wire [32-1:0] mask_addr_shifted_301;
  assign mask_addr_shifted_301 = 128 + ((5 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_302;
  assign mask_addr_masked_302 = mask_addr_shifted_301 << 5;
  localparam _tmp_303 = 1;
  wire [_tmp_303-1:0] _tmp_304;
  assign _tmp_304 = th_count == 400;
  reg [_tmp_303-1:0] __tmp_304_1;
  reg signed [256-1:0] read_rdata_305;
  wire [32-1:0] mask_addr_shifted_306;
  assign mask_addr_shifted_306 = 64 + i * 32 >> 5;
  wire [32-1:0] mask_addr_masked_307;
  assign mask_addr_masked_307 = mask_addr_shifted_306 << 5;
  assign ram_a_0_addr = (th_count == 413)? 2 + i : 
                        (th_count == 350)? 2 : 
                        (th_count == 292)? 1 + i : 
                        (th_count == 229)? 1 : 
                        (th_count == 171)? 0 + i : 
                        ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_211 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_addr_208 : 
                        (th_count == 108)? 0 : 'hx;
  assign ram_a_0_enable = (th_count == 413)? 1'd1 : 
                          (th_count == 350)? 1'd1 : 
                          (th_count == 292)? 1'd1 : 
                          (th_count == 229)? 1'd1 : 
                          (th_count == 171)? 1'd1 : 
                          ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_211 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                          (th_count == 108)? 1'd1 : 0;
  localparam _tmp_308 = 1;
  wire [_tmp_308-1:0] _tmp_309;
  assign _tmp_309 = th_count == 413;
  reg [_tmp_308-1:0] __tmp_309_1;
  reg signed [256-1:0] read_rdata_310;
  wire [32-1:0] mask_addr_shifted_311;
  assign mask_addr_shifted_311 = 128 + (5 + i) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_312;
  assign mask_addr_masked_312 = mask_addr_shifted_311 << 5;
  localparam _tmp_313 = 1;
  wire [_tmp_313-1:0] _tmp_314;
  assign _tmp_314 = th_count == 424;
  reg [_tmp_313-1:0] __tmp_314_1;
  reg signed [256-1:0] read_rdata_315;
  wire [32-1:0] mask_addr_shifted_316;
  assign mask_addr_shifted_316 = 128 + (5 + i - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_317;
  assign mask_addr_masked_317 = mask_addr_shifted_316 << 5;
  localparam _tmp_318 = 1;
  wire [_tmp_318-1:0] _tmp_319;
  assign _tmp_319 = th_count == 446;
  reg [_tmp_318-1:0] __tmp_319_1;
  reg signed [256-1:0] read_rdata_320;
  wire [32-1:0] mask_addr_shifted_321;
  assign mask_addr_shifted_321 = 128 + ((5 + i - 1) / 2 - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_322;
  assign mask_addr_masked_322 = mask_addr_shifted_321 << 5;
  reg signed [32-1:0] _th_count_sum_0;
  wire [32-1:0] mask_addr_shifted_323;
  assign mask_addr_shifted_323 = 0;
  wire [32-1:0] mask_addr_masked_324;
  assign mask_addr_masked_324 = mask_addr_shifted_323 << 5;
  localparam _tmp_325 = 1;
  wire [_tmp_325-1:0] _tmp_326;
  assign _tmp_326 = th_count == 475;
  reg [_tmp_325-1:0] __tmp_326_1;
  reg signed [256-1:0] read_rdata_327;
  wire [32-1:0] mask_addr_shifted_328;
  assign mask_addr_shifted_328 = 128 + (3 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_329;
  assign mask_addr_masked_329 = mask_addr_shifted_328 << 5;
  localparam _tmp_330 = 1;
  wire [_tmp_330-1:0] _tmp_331;
  assign _tmp_331 = th_count == 486;
  reg [_tmp_330-1:0] __tmp_331_1;
  reg signed [256-1:0] read_rdata_332;
  wire [32-1:0] mask_addr_shifted_333;
  assign mask_addr_shifted_333 = 128 + (3 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_334;
  assign mask_addr_masked_334 = mask_addr_shifted_333 << 5;
  localparam _tmp_335 = 1;
  wire [_tmp_335-1:0] _tmp_336;
  assign _tmp_336 = th_count == 497;
  reg [_tmp_335-1:0] __tmp_336_1;
  reg signed [256-1:0] read_rdata_337;
  wire [32-1:0] mask_addr_shifted_338;
  assign mask_addr_shifted_338 = 128 + ((3 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_339;
  assign mask_addr_masked_339 = mask_addr_shifted_338 << 5;
  localparam _tmp_340 = 1;
  wire [_tmp_340-1:0] _tmp_341;
  assign _tmp_341 = th_count == 510;
  reg [_tmp_340-1:0] __tmp_341_1;
  reg signed [256-1:0] read_rdata_342;
  wire [32-1:0] mask_addr_shifted_343;
  assign mask_addr_shifted_343 = 128 + ((3 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_344;
  assign mask_addr_masked_344 = mask_addr_shifted_343 << 5;
  localparam _tmp_345 = 1;
  wire [_tmp_345-1:0] _tmp_346;
  assign _tmp_346 = th_count == 521;
  reg [_tmp_345-1:0] __tmp_346_1;
  reg signed [256-1:0] read_rdata_347;
  reg _copy_tmp_ram_ram_b_stream_ivalid;
  wire _copy_tmp_ram_ram_b_stream_oready;
  wire _copy_tmp_ram_ram_b_stream_internal_oready;
  assign _copy_tmp_ram_ram_b_stream_internal_oready = 1;
  assign _copy_tmp_ram_ram_b_stream_oready = _copy_tmp_ram_ram_b_stream_internal_oready;
  reg [32-1:0] _copy_tmp_ram_ram_b_fsm;
  localparam _copy_tmp_ram_ram_b_fsm_init = 0;
  wire _copy_tmp_ram_ram_b_run_flag;
  reg _copy_tmp_ram_ram_b_source_start;
  wire _copy_tmp_ram_ram_b_source_stop;
  reg _copy_tmp_ram_ram_b_source_busy;
  wire _copy_tmp_ram_ram_b_sink_start;
  wire _copy_tmp_ram_ram_b_sink_stop;
  wire _copy_tmp_ram_ram_b_sink_busy;
  wire _copy_tmp_ram_ram_b_busy;
  reg _copy_tmp_ram_ram_b_busy_reg;
  wire _copy_tmp_ram_ram_b_is_root;
  assign _copy_tmp_ram_ram_b_is_root = 1;
  reg _copy_tmp_ram_ram_b_src_idle;
  reg [33-1:0] _copy_tmp_ram_ram_b_src_source_count;
  reg [5-1:0] _copy_tmp_ram_ram_b_src_source_mode;
  reg [16-1:0] _copy_tmp_ram_ram_b_src_source_generator_id;
  reg [32-1:0] _copy_tmp_ram_ram_b_src_source_offset;
  reg [33-1:0] _copy_tmp_ram_ram_b_src_source_size;
  reg [32-1:0] _copy_tmp_ram_ram_b_src_source_stride;
  reg [32-1:0] _copy_tmp_ram_ram_b_src_source_offset_buf;
  reg [33-1:0] _copy_tmp_ram_ram_b_src_source_size_buf;
  reg [32-1:0] _copy_tmp_ram_ram_b_src_source_stride_buf;
  reg [8-1:0] _copy_tmp_ram_ram_b_src_source_sel;
  reg [32-1:0] _copy_tmp_ram_ram_b_src_source_ram_raddr;
  reg _copy_tmp_ram_ram_b_src_source_ram_renable;
  wire [256-1:0] _copy_tmp_ram_ram_b_src_source_ram_rdata;
  reg _copy_tmp_ram_ram_b_src_source_fifo_deq;
  wire [256-1:0] _copy_tmp_ram_ram_b_src_source_fifo_rdata;
  reg [256-1:0] _copy_tmp_ram_ram_b_src_source_empty_data;
  reg [33-1:0] _copy_tmp_ram_ram_b_dst_sink_count;
  reg [5-1:0] _copy_tmp_ram_ram_b_dst_sink_mode;
  reg [16-1:0] _copy_tmp_ram_ram_b_dst_sink_generator_id;
  reg [32-1:0] _copy_tmp_ram_ram_b_dst_sink_offset;
  reg [33-1:0] _copy_tmp_ram_ram_b_dst_sink_size;
  reg [32-1:0] _copy_tmp_ram_ram_b_dst_sink_stride;
  reg [32-1:0] _copy_tmp_ram_ram_b_dst_sink_offset_buf;
  reg [33-1:0] _copy_tmp_ram_ram_b_dst_sink_size_buf;
  reg [32-1:0] _copy_tmp_ram_ram_b_dst_sink_stride_buf;
  reg [8-1:0] _copy_tmp_ram_ram_b_dst_sink_sel;
  reg [32-1:0] _copy_tmp_ram_ram_b_dst_sink_waddr;
  reg _copy_tmp_ram_ram_b_dst_sink_wenable;
  reg [256-1:0] _copy_tmp_ram_ram_b_dst_sink_wdata;
  reg _copy_tmp_ram_ram_b_dst_sink_fifo_enq;
  reg [256-1:0] _copy_tmp_ram_ram_b_dst_sink_fifo_wdata;
  reg [256-1:0] _copy_tmp_ram_ram_b_dst_sink_immediate;
  wire signed [256-1:0] copy_tmp_ram_ram_b_src_data;
  wire signed [256-1:0] copy_tmp_ram_ram_b_dst_data;
  assign copy_tmp_ram_ram_b_dst_data = copy_tmp_ram_ram_b_src_data;
  wire _set_flag_348;
  assign _set_flag_348 = th_count == 534;
  localparam _tmp_349 = 1;
  wire [_tmp_349-1:0] _tmp_350;
  assign _tmp_350 = _copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_src_source_ram_renable && (_copy_tmp_ram_ram_b_src_source_sel == 1);
  reg [_tmp_349-1:0] __tmp_350_1;
  assign _copy_tmp_ram_ram_b_src_source_ram_rdata = (_copy_tmp_ram_ram_b_src_source_sel == 1)? tmp_ram_0_rdata : 'hx;
  reg signed [256-1:0] __variable_wdata_0;
  assign copy_tmp_ram_ram_b_src_data = __variable_wdata_0;
  reg [32-1:0] _copy_tmp_ram_ram_b_src_source_fsm_0;
  localparam _copy_tmp_ram_ram_b_src_source_fsm_0_init = 0;
  wire _set_flag_351;
  assign _set_flag_351 = th_count == 535;
  reg _tmp_352;
  reg _tmp_353;
  reg [32-1:0] _copy_tmp_ram_ram_b_dst_sink_fsm_1;
  localparam _copy_tmp_ram_ram_b_dst_sink_fsm_1_init = 0;
  wire _set_flag_354;
  assign _set_flag_354 = th_count == 536;
  reg _tmp_355;
  reg _tmp_356;
  reg _tmp_357;
  assign _copy_tmp_ram_ram_b_source_stop = _copy_tmp_ram_ram_b_stream_oready && (_copy_tmp_ram_ram_b_src_idle && (_copy_tmp_ram_ram_b_fsm == 3));
  localparam _tmp_358 = 1;
  wire [_tmp_358-1:0] _tmp_359;
  assign _tmp_359 = _copy_tmp_ram_ram_b_src_idle && (_copy_tmp_ram_ram_b_fsm == 3);
  reg [_tmp_358-1:0] _tmp_360;
  reg _tmp_361;
  reg _tmp_362;
  assign _copy_tmp_ram_ram_b_sink_start = _tmp_362;
  reg _tmp_363;
  reg _tmp_364;
  assign _copy_tmp_ram_ram_b_sink_stop = _tmp_364;
  reg _tmp_365;
  reg _tmp_366;
  assign _copy_tmp_ram_ram_b_sink_busy = _tmp_366;
  reg _tmp_367;
  assign _copy_tmp_ram_ram_b_busy = _copy_tmp_ram_ram_b_source_busy || _copy_tmp_ram_ram_b_sink_busy || _copy_tmp_ram_ram_b_busy_reg;
  localparam _tmp_368 = 1;
  wire [_tmp_368-1:0] _tmp_369;
  assign _tmp_369 = th_count == 539;
  reg [_tmp_368-1:0] __tmp_369_1;
  reg signed [256-1:0] read_rdata_370;
  wire [32-1:0] mask_addr_shifted_371;
  assign mask_addr_shifted_371 = 1;
  wire [32-1:0] mask_addr_masked_372;
  assign mask_addr_masked_372 = mask_addr_shifted_371 << 5;
  localparam _tmp_373 = 1;
  wire [_tmp_373-1:0] _tmp_374;
  assign _tmp_374 = th_count == 544;
  reg [_tmp_373-1:0] __tmp_374_1;
  reg signed [256-1:0] read_rdata_375;
  wire [32-1:0] mask_addr_shifted_376;
  assign mask_addr_shifted_376 = 128 + (4 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_377;
  assign mask_addr_masked_377 = mask_addr_shifted_376 << 5;
  localparam _tmp_378 = 1;
  wire [_tmp_378-1:0] _tmp_379;
  assign _tmp_379 = th_count == 555;
  reg [_tmp_378-1:0] __tmp_379_1;
  reg signed [256-1:0] read_rdata_380;
  wire [32-1:0] mask_addr_shifted_381;
  assign mask_addr_shifted_381 = 128 + (4 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_382;
  assign mask_addr_masked_382 = mask_addr_shifted_381 << 5;
  localparam _tmp_383 = 1;
  wire [_tmp_383-1:0] _tmp_384;
  assign _tmp_384 = th_count == 566;
  reg [_tmp_383-1:0] __tmp_384_1;
  reg signed [256-1:0] read_rdata_385;
  wire [32-1:0] mask_addr_shifted_386;
  assign mask_addr_shifted_386 = 128 + ((4 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_387;
  assign mask_addr_masked_387 = mask_addr_shifted_386 << 5;
  localparam _tmp_388 = 1;
  wire [_tmp_388-1:0] _tmp_389;
  assign _tmp_389 = th_count == 579;
  reg [_tmp_388-1:0] __tmp_389_1;
  reg signed [256-1:0] read_rdata_390;
  wire [32-1:0] mask_addr_shifted_391;
  assign mask_addr_shifted_391 = 128 + ((4 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_392;
  assign mask_addr_masked_392 = mask_addr_shifted_391 << 5;
  localparam _tmp_393 = 1;
  wire [_tmp_393-1:0] _tmp_394;
  assign _tmp_394 = th_count == 590;
  reg [_tmp_393-1:0] __tmp_394_1;
  reg signed [256-1:0] read_rdata_395;
  wire _set_flag_396;
  assign _set_flag_396 = th_count == 603;
  wire _set_flag_397;
  assign _set_flag_397 = th_count == 604;
  reg _tmp_398;
  reg _tmp_399;
  wire _set_flag_400;
  assign _set_flag_400 = th_count == 605;
  localparam _tmp_401 = 1;
  wire [_tmp_401-1:0] _tmp_402;
  assign _tmp_402 = th_count == 608;
  reg [_tmp_401-1:0] __tmp_402_1;
  reg signed [256-1:0] read_rdata_403;
  wire [32-1:0] mask_addr_shifted_404;
  assign mask_addr_shifted_404 = 2;
  wire [32-1:0] mask_addr_masked_405;
  assign mask_addr_masked_405 = mask_addr_shifted_404 << 5;
  localparam _tmp_406 = 1;
  wire [_tmp_406-1:0] _tmp_407;
  assign _tmp_407 = th_count == 613;
  reg [_tmp_406-1:0] __tmp_407_1;
  reg signed [256-1:0] read_rdata_408;
  wire [32-1:0] mask_addr_shifted_409;
  assign mask_addr_shifted_409 = 128 + (5 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_410;
  assign mask_addr_masked_410 = mask_addr_shifted_409 << 5;
  localparam _tmp_411 = 1;
  wire [_tmp_411-1:0] _tmp_412;
  assign _tmp_412 = th_count == 624;
  reg [_tmp_411-1:0] __tmp_412_1;
  reg signed [256-1:0] read_rdata_413;
  wire [32-1:0] mask_addr_shifted_414;
  assign mask_addr_shifted_414 = 128 + (5 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_415;
  assign mask_addr_masked_415 = mask_addr_shifted_414 << 5;
  localparam _tmp_416 = 1;
  wire [_tmp_416-1:0] _tmp_417;
  assign _tmp_417 = th_count == 635;
  reg [_tmp_416-1:0] __tmp_417_1;
  reg signed [256-1:0] read_rdata_418;
  wire [32-1:0] mask_addr_shifted_419;
  assign mask_addr_shifted_419 = 128 + ((5 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_420;
  assign mask_addr_masked_420 = mask_addr_shifted_419 << 5;
  localparam _tmp_421 = 1;
  wire [_tmp_421-1:0] _tmp_422;
  assign _tmp_422 = th_count == 648;
  reg [_tmp_421-1:0] __tmp_422_1;
  reg signed [256-1:0] read_rdata_423;
  wire [32-1:0] mask_addr_shifted_424;
  assign mask_addr_shifted_424 = 128 + ((5 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_425;
  assign mask_addr_masked_425 = mask_addr_shifted_424 << 5;
  localparam _tmp_426 = 1;
  wire [_tmp_426-1:0] _tmp_427;
  assign _tmp_427 = th_count == 659;
  reg [_tmp_426-1:0] __tmp_427_1;
  reg signed [256-1:0] read_rdata_428;
  wire _set_flag_429;
  assign _set_flag_429 = th_count == 672;
  wire _set_flag_430;
  assign _set_flag_430 = th_count == 673;
  reg _tmp_431;
  reg _tmp_432;
  wire _set_flag_433;
  assign _set_flag_433 = th_count == 674;
  localparam _tmp_434 = 1;
  wire [_tmp_434-1:0] _tmp_435;
  assign _tmp_435 = th_count == 677;
  reg [_tmp_434-1:0] __tmp_435_1;
  reg signed [256-1:0] read_rdata_436;
  wire [32-1:0] mask_addr_shifted_437;
  assign mask_addr_shifted_437 = 0;
  wire [32-1:0] mask_addr_masked_438;
  assign mask_addr_masked_438 = mask_addr_shifted_437 << 5;
  localparam _tmp_439 = 1;
  wire [_tmp_439-1:0] _tmp_440;
  assign _tmp_440 = th_count == 683;
  reg [_tmp_439-1:0] __tmp_440_1;
  reg signed [256-1:0] read_rdata_441;
  wire [32-1:0] mask_addr_shifted_442;
  assign mask_addr_shifted_442 = 128 + (3 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_443;
  assign mask_addr_masked_443 = mask_addr_shifted_442 << 5;
  localparam _tmp_444 = 1;
  wire [_tmp_444-1:0] _tmp_445;
  assign _tmp_445 = th_count == 694;
  reg [_tmp_444-1:0] __tmp_445_1;
  reg signed [256-1:0] read_rdata_446;
  wire [32-1:0] mask_addr_shifted_447;
  assign mask_addr_shifted_447 = 128 + (3 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_448;
  assign mask_addr_masked_448 = mask_addr_shifted_447 << 5;
  localparam _tmp_449 = 1;
  wire [_tmp_449-1:0] _tmp_450;
  assign _tmp_450 = th_count == 705;
  reg [_tmp_449-1:0] __tmp_450_1;
  reg signed [256-1:0] read_rdata_451;
  wire [32-1:0] mask_addr_shifted_452;
  assign mask_addr_shifted_452 = 128 + ((3 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_453;
  assign mask_addr_masked_453 = mask_addr_shifted_452 << 5;
  localparam _tmp_454 = 1;
  wire [_tmp_454-1:0] _tmp_455;
  assign _tmp_455 = th_count == 718;
  reg [_tmp_454-1:0] __tmp_455_1;
  reg signed [256-1:0] read_rdata_456;
  wire [32-1:0] mask_addr_shifted_457;
  assign mask_addr_shifted_457 = 128 + ((3 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_458;
  assign mask_addr_masked_458 = mask_addr_shifted_457 << 5;
  localparam _tmp_459 = 1;
  wire [_tmp_459-1:0] _tmp_460;
  assign _tmp_460 = th_count == 729;
  reg [_tmp_459-1:0] __tmp_460_1;
  reg signed [256-1:0] read_rdata_461;
  wire [32-1:0] mask_addr_shifted_462;
  assign mask_addr_shifted_462 = 0 + i * 32 >> 5;
  wire [32-1:0] mask_addr_masked_463;
  assign mask_addr_masked_463 = mask_addr_shifted_462 << 5;
  reg [32-1:0] read_burst_fsm_6;
  localparam read_burst_fsm_6_init = 0;
  reg [4-1:0] read_burst_addr_464;
  reg [4-1:0] read_burst_stride_465;
  reg [33-1:0] read_burst_length_466;
  reg read_burst_rvalid_467;
  reg read_burst_rlast_468;
  localparam _tmp_469 = 1;
  wire [_tmp_469-1:0] _tmp_470;
  assign _tmp_470 = (read_burst_fsm_6 == 1) && (!read_burst_rvalid_467 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0));
  reg [_tmp_469-1:0] __tmp_470_1;
  wire [256-1:0] read_burst_rdata_471;
  assign read_burst_rdata_471 = ram_b_0_rdata;
  assign _maxi_write_req_fifo_deq = ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 4)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 3)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 2)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1)) && !_maxi_write_req_fifo_empty)? 1 : 0;
  reg _maxi_wdata_cond_3_1;
  localparam _tmp_472 = 1;
  wire [_tmp_472-1:0] _tmp_473;
  assign _tmp_473 = th_count == 742;
  reg [_tmp_472-1:0] __tmp_473_1;
  reg signed [256-1:0] read_rdata_474;
  wire [32-1:0] mask_addr_shifted_475;
  assign mask_addr_shifted_475 = 128 + (3 + i) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_476;
  assign mask_addr_masked_476 = mask_addr_shifted_475 << 5;
  localparam _tmp_477 = 1;
  wire [_tmp_477-1:0] _tmp_478;
  assign _tmp_478 = th_count == 753;
  reg [_tmp_477-1:0] __tmp_478_1;
  reg signed [256-1:0] read_rdata_479;
  wire [32-1:0] mask_addr_shifted_480;
  assign mask_addr_shifted_480 = 128 + (3 + i - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_481;
  assign mask_addr_masked_481 = mask_addr_shifted_480 << 5;
  localparam _tmp_482 = 1;
  wire [_tmp_482-1:0] _tmp_483;
  assign _tmp_483 = th_count == 775;
  reg [_tmp_482-1:0] __tmp_483_1;
  reg signed [256-1:0] read_rdata_484;
  assign calc_mac_ram_0_addr = (th_count == 794)? 0 : 
                               (th_count == 772)? 0 : 
                               (th_count == 750)? 0 : 
                               (th_count == 465)? 0 : 
                               (th_count == 443)? 0 : 
                               (th_count == 421)? 0 : 
                               (th_count == 344)? 0 : 
                               (th_count == 322)? 0 : 
                               (th_count == 300)? 0 : 
                               (th_count == 223)? 0 : 
                               (th_count == 201)? 0 : 
                               ((read_burst_fsm_5 == 1) && (!read_burst_rvalid_224 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_addr_221 : 
                               (th_count == 179)? 0 : 'hx;
  assign calc_mac_ram_0_wdata = (th_count == 794)? hash_calc_reg : 
                                (th_count == 772)? hash_calc_reg : 
                                (th_count == 750)? hash_calc_reg : 
                                (th_count == 465)? hash_calc_reg : 
                                (th_count == 443)? hash_calc_reg : 
                                (th_count == 421)? hash_calc_reg : 
                                (th_count == 344)? hash_calc_reg : 
                                (th_count == 322)? hash_calc_reg : 
                                (th_count == 300)? hash_calc_reg : 
                                (th_count == 223)? hash_calc_reg : 
                                (th_count == 201)? hash_calc_reg : 
                                (th_count == 179)? hash_calc_reg : 'hx;
  assign calc_mac_ram_0_wenable = (th_count == 794)? 1'd1 : 
                                  (th_count == 772)? 1'd1 : 
                                  (th_count == 750)? 1'd1 : 
                                  (th_count == 465)? 1'd1 : 
                                  (th_count == 443)? 1'd1 : 
                                  (th_count == 421)? 1'd1 : 
                                  (th_count == 344)? 1'd1 : 
                                  (th_count == 322)? 1'd1 : 
                                  (th_count == 300)? 1'd1 : 
                                  (th_count == 223)? 1'd1 : 
                                  (th_count == 201)? 1'd1 : 
                                  (th_count == 179)? 1'd1 : 0;
  assign calc_mac_ram_0_enable = (th_count == 794)? 1'd1 : 
                                 (th_count == 772)? 1'd1 : 
                                 (th_count == 750)? 1'd1 : 
                                 (th_count == 465)? 1'd1 : 
                                 (th_count == 443)? 1'd1 : 
                                 (th_count == 421)? 1'd1 : 
                                 (th_count == 344)? 1'd1 : 
                                 (th_count == 322)? 1'd1 : 
                                 (th_count == 300)? 1'd1 : 
                                 (th_count == 223)? 1'd1 : 
                                 (th_count == 201)? 1'd1 : 
                                 ((read_burst_fsm_5 == 1) && (!read_burst_rvalid_224 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                                 (th_count == 179)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_485;
  assign mask_addr_shifted_485 = 128 + ((3 + i - 1) / 2 - 1) / 2 * 32 >> 5;
  wire [32-1:0] mask_addr_masked_486;
  assign mask_addr_masked_486 = mask_addr_shifted_485 << 5;
  assign ram_b_0_addr = (th_count == 800)? 0 : 
                        (th_count == 742)? 0 + i : 
                        ((read_burst_fsm_6 == 1) && (!read_burst_rvalid_467 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_addr_464 : 
                        (th_count == 679)? 0 : 
                        (th_count == 677)? 2 : 
                        (th_count == 608)? 1 : 
                        (th_count == 539)? 0 : 
                        (_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_dst_sink_wenable && (_copy_tmp_ram_ram_b_dst_sink_sel == 2))? _copy_tmp_ram_ram_b_dst_sink_waddr : 'hx;
  assign ram_b_0_wdata = (th_count == 800)? 0 : 
                         (th_count == 679)? _th_count_sum_0 : 
                         (_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_dst_sink_wenable && (_copy_tmp_ram_ram_b_dst_sink_sel == 2))? _copy_tmp_ram_ram_b_dst_sink_wdata : 'hx;
  assign ram_b_0_wenable = (th_count == 800)? 1'd1 : 
                           (th_count == 679)? 1'd1 : 
                           (_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_dst_sink_wenable && (_copy_tmp_ram_ram_b_dst_sink_sel == 2))? 1'd1 : 0;
  assign ram_b_0_enable = (th_count == 800)? 1'd1 : 
                          (th_count == 742)? 1'd1 : 
                          ((read_burst_fsm_6 == 1) && (!read_burst_rvalid_467 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                          (th_count == 679)? 1'd1 : 
                          (th_count == 677)? 1'd1 : 
                          (th_count == 608)? 1'd1 : 
                          (th_count == 539)? 1'd1 : 
                          (_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_dst_sink_wenable && (_copy_tmp_ram_ram_b_dst_sink_sel == 2))? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_487;
  assign mask_addr_shifted_487 = 0;
  wire [32-1:0] mask_addr_masked_488;
  assign mask_addr_masked_488 = mask_addr_shifted_487 << 5;
  wire [32-1:0] mask_addr_shifted_489;
  assign mask_addr_shifted_489 = 0;
  wire [32-1:0] mask_addr_masked_490;
  assign mask_addr_masked_490 = mask_addr_shifted_489 << 5;
  assign tmp_ram_0_addr = (th_count == 806)? i : 
                          (th_count == 683)? i : 
                          (th_count == 613)? i : 
                          (th_count == 544)? i : 
                          (_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_src_source_ram_renable && (_copy_tmp_ram_ram_b_src_source_sel == 1))? _copy_tmp_ram_ram_b_src_source_ram_raddr : 
                          (th_count == 475)? i : 
                          (th_count == 354)? i : 
                          (th_count == 233)? i : 
                          (th_count == 112)? i : 
                          ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? write_burst_addr_179 : 'hx;
  assign tmp_ram_0_enable = (th_count == 806)? 1'd1 : 
                            (th_count == 683)? 1'd1 : 
                            (th_count == 613)? 1'd1 : 
                            (th_count == 544)? 1'd1 : 
                            (_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_src_source_ram_renable && (_copy_tmp_ram_ram_b_src_source_sel == 1))? 1'd1 : 
                            (th_count == 475)? 1'd1 : 
                            (th_count == 354)? 1'd1 : 
                            (th_count == 233)? 1'd1 : 
                            (th_count == 112)? 1'd1 : 
                            ((write_burst_fsm_3 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 0;
  localparam _tmp_491 = 1;
  wire [_tmp_491-1:0] _tmp_492;
  assign _tmp_492 = th_count == 806;
  reg [_tmp_491-1:0] __tmp_492_1;
  reg signed [256-1:0] read_rdata_493;
  wire [32-1:0] mask_addr_shifted_494;
  assign mask_addr_shifted_494 = 128 + (3 + i + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_495;
  assign mask_addr_masked_495 = mask_addr_shifted_494 << 5;
  localparam _tmp_496 = 1;
  wire [_tmp_496-1:0] _tmp_497;
  assign _tmp_497 = th_count == 817;
  reg [_tmp_496-1:0] __tmp_497_1;
  reg signed [256-1:0] read_rdata_498;
  wire [32-1:0] mask_addr_shifted_499;
  assign mask_addr_shifted_499 = 128 + (3 + i - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_500;
  assign mask_addr_masked_500 = mask_addr_shifted_499 << 5;
  localparam _tmp_501 = 1;
  wire [_tmp_501-1:0] _tmp_502;
  assign _tmp_502 = th_count == 828;
  reg [_tmp_501-1:0] __tmp_502_1;
  reg signed [256-1:0] read_rdata_503;
  wire [32-1:0] mask_addr_shifted_504;
  assign mask_addr_shifted_504 = 128 + ((3 + i - 1) / 2 + 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_505;
  assign mask_addr_masked_505 = mask_addr_shifted_504 << 5;
  localparam _tmp_506 = 1;
  wire [_tmp_506-1:0] _tmp_507;
  assign _tmp_507 = th_count == 841;
  reg [_tmp_506-1:0] __tmp_507_1;
  reg signed [256-1:0] read_rdata_508;
  wire [32-1:0] mask_addr_shifted_509;
  assign mask_addr_shifted_509 = 128 + ((3 + i - 1) / 2 - 1) * 32 >> 5;
  wire [32-1:0] mask_addr_masked_510;
  assign mask_addr_masked_510 = mask_addr_shifted_509 << 5;
  assign mac_ram_0_addr = (th_count == 852)? 1 : 
                          (th_count == 841)? 1 : 
                          (th_count == 828)? 0 : 
                          (th_count == 817)? 0 : 
                          (th_count == 775)? 1 : 
                          (th_count == 753)? 0 : 
                          (th_count == 729)? 1 : 
                          (th_count == 718)? 1 : 
                          (th_count == 705)? 0 : 
                          (th_count == 694)? 0 : 
                          (th_count == 659)? 1 : 
                          (th_count == 648)? 1 : 
                          (th_count == 635)? 0 : 
                          (th_count == 624)? 0 : 
                          (th_count == 590)? 1 : 
                          (th_count == 579)? 1 : 
                          (th_count == 566)? 0 : 
                          (th_count == 555)? 0 : 
                          (th_count == 521)? 1 : 
                          (th_count == 510)? 1 : 
                          (th_count == 497)? 0 : 
                          (th_count == 486)? 0 : 
                          (th_count == 446)? 1 : 
                          (th_count == 424)? 0 : 
                          (th_count == 400)? 1 : 
                          (th_count == 389)? 1 : 
                          (th_count == 376)? 0 : 
                          (th_count == 365)? 0 : 
                          (th_count == 325)? 1 : 
                          (th_count == 303)? 0 : 
                          (th_count == 279)? 1 : 
                          (th_count == 268)? 1 : 
                          (th_count == 255)? 0 : 
                          (th_count == 244)? 0 : 
                          (th_count == 204)? 1 : 
                          (th_count == 182)? 0 : 
                          (th_count == 158)? 1 : 
                          (th_count == 147)? 1 : 
                          (th_count == 134)? 0 : 
                          (th_count == 123)? 0 : 
                          (th_count == 104)? 0 : 
                          (th_count == 95)? 1 : 
                          (th_count == 92)? 0 : 
                          (th_count == 87)? 0 : 
                          (th_count == 78)? 1 : 
                          (th_count == 75)? 0 : 
                          (th_count == 70)? 0 : 
                          (th_count == 61)? 1 : 
                          (th_count == 58)? 0 : 
                          ((write_burst_fsm_2 == 1) && _maxi_rvalid_sb_0)? write_burst_addr_139 : 
                          (th_count == 53)? 0 : 
                          (th_count == 40)? 0 : 
                          (th_count == 27)? 0 : 
                          ((read_burst_fsm_1 == 1) && (!read_burst_rvalid_111 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? read_burst_addr_108 : 
                          (th_count == 14)? 0 : 'hx;
  assign mac_ram_0_enable = (th_count == 852)? 1'd1 : 
                            (th_count == 841)? 1'd1 : 
                            (th_count == 828)? 1'd1 : 
                            (th_count == 817)? 1'd1 : 
                            (th_count == 775)? 1'd1 : 
                            (th_count == 753)? 1'd1 : 
                            (th_count == 729)? 1'd1 : 
                            (th_count == 718)? 1'd1 : 
                            (th_count == 705)? 1'd1 : 
                            (th_count == 694)? 1'd1 : 
                            (th_count == 659)? 1'd1 : 
                            (th_count == 648)? 1'd1 : 
                            (th_count == 635)? 1'd1 : 
                            (th_count == 624)? 1'd1 : 
                            (th_count == 590)? 1'd1 : 
                            (th_count == 579)? 1'd1 : 
                            (th_count == 566)? 1'd1 : 
                            (th_count == 555)? 1'd1 : 
                            (th_count == 521)? 1'd1 : 
                            (th_count == 510)? 1'd1 : 
                            (th_count == 497)? 1'd1 : 
                            (th_count == 486)? 1'd1 : 
                            (th_count == 446)? 1'd1 : 
                            (th_count == 424)? 1'd1 : 
                            (th_count == 400)? 1'd1 : 
                            (th_count == 389)? 1'd1 : 
                            (th_count == 376)? 1'd1 : 
                            (th_count == 365)? 1'd1 : 
                            (th_count == 325)? 1'd1 : 
                            (th_count == 303)? 1'd1 : 
                            (th_count == 279)? 1'd1 : 
                            (th_count == 268)? 1'd1 : 
                            (th_count == 255)? 1'd1 : 
                            (th_count == 244)? 1'd1 : 
                            (th_count == 204)? 1'd1 : 
                            (th_count == 182)? 1'd1 : 
                            (th_count == 158)? 1'd1 : 
                            (th_count == 147)? 1'd1 : 
                            (th_count == 134)? 1'd1 : 
                            (th_count == 123)? 1'd1 : 
                            (th_count == 104)? 1'd1 : 
                            (th_count == 95)? 1'd1 : 
                            (th_count == 92)? 1'd1 : 
                            (th_count == 87)? 1'd1 : 
                            (th_count == 78)? 1'd1 : 
                            (th_count == 75)? 1'd1 : 
                            (th_count == 70)? 1'd1 : 
                            (th_count == 61)? 1'd1 : 
                            (th_count == 58)? 1'd1 : 
                            ((write_burst_fsm_2 == 1) && _maxi_rvalid_sb_0)? 1'd1 : 
                            (th_count == 53)? 1'd1 : 
                            (th_count == 40)? 1'd1 : 
                            (th_count == 27)? 1'd1 : 
                            ((read_burst_fsm_1 == 1) && (!read_burst_rvalid_111 || (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                            (th_count == 14)? 1'd1 : 0;
  localparam _tmp_511 = 1;
  wire [_tmp_511-1:0] _tmp_512;
  assign _tmp_512 = th_count == 852;
  reg [_tmp_511-1:0] __tmp_512_1;
  reg signed [256-1:0] read_rdata_513;
  wire _set_flag_514;
  assign _set_flag_514 = th_count == 865;
  wire _set_flag_515;
  assign _set_flag_515 = th_count == 866;
  reg _tmp_516;
  reg _tmp_517;
  wire _set_flag_518;
  assign _set_flag_518 = th_count == 867;
  assign _copy_tmp_ram_ram_b_run_flag = (_set_flag_518)? 1 : 
                                        (_set_flag_433)? 1 : 
                                        (_set_flag_400)? 1 : 
                                        (_set_flag_354)? 1 : 0;

  always @(posedge CLK) begin
    if(RST) begin
      __tmp_214_1 <= 0;
      __tmp_217_1 <= 0;
      __tmp_267_1 <= 0;
      __tmp_309_1 <= 0;
    end else begin
      __tmp_214_1 <= _tmp_214;
      __tmp_217_1 <= _tmp_217;
      __tmp_267_1 <= _tmp_267;
      __tmp_309_1 <= _tmp_309;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_369_1 <= 0;
      __tmp_402_1 <= 0;
      __tmp_435_1 <= 0;
      __tmp_470_1 <= 0;
      __tmp_473_1 <= 0;
    end else begin
      __tmp_369_1 <= _tmp_369;
      __tmp_402_1 <= _tmp_402;
      __tmp_435_1 <= _tmp_435;
      __tmp_470_1 <= _tmp_470;
      __tmp_473_1 <= _tmp_473;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      maxi_awaddr <= 0;
      maxi_awlen <= 0;
      maxi_awvalid <= 0;
      _maxi_waddr_cond_0_1 <= 0;
    end else begin
      if(_maxi_waddr_cond_0_1) begin
        maxi_awvalid <= 0;
      end 
      if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (_maxi_outstanding_wcount < 6) && ((_maxi_outstanding_wcount < 6) && (maxi_awready || !maxi_awvalid))) begin
        maxi_awaddr <= _maxi_write_global_addr;
        maxi_awlen <= _maxi_write_cur_global_size - 1;
        maxi_awvalid <= 1;
      end 
      if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (_maxi_outstanding_wcount < 6) && ((_maxi_outstanding_wcount < 6) && (maxi_awready || !maxi_awvalid)) && (_maxi_write_cur_global_size == 0)) begin
        maxi_awvalid <= 0;
      end 
      _maxi_waddr_cond_0_1 <= 1;
      if(maxi_awvalid && !maxi_awready) begin
        maxi_awvalid <= maxi_awvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _maxi_wdata_sb_0 <= 0;
      _maxi_wvalid_sb_0 <= 0;
      _maxi_wlast_sb_0 <= 0;
      _maxi_wstrb_sb_0 <= 0;
      _maxi_wdata_cond_0_1 <= 0;
      _maxi_wdata_cond_1_1 <= 0;
      _maxi_wdata_cond_2_1 <= 0;
      _maxi_wdata_cond_3_1 <= 0;
    end else begin
      if(_maxi_wdata_cond_0_1) begin
        _maxi_wvalid_sb_0 <= 0;
        _maxi_wlast_sb_0 <= 0;
      end 
      if(_maxi_wdata_cond_1_1) begin
        _maxi_wvalid_sb_0 <= 0;
        _maxi_wlast_sb_0 <= 0;
      end 
      if(_maxi_wdata_cond_2_1) begin
        _maxi_wvalid_sb_0 <= 0;
        _maxi_wlast_sb_0 <= 0;
      end 
      if(_maxi_wdata_cond_3_1) begin
        _maxi_wvalid_sb_0 <= 0;
        _maxi_wlast_sb_0 <= 0;
      end 
      if((_maxi_write_op_sel_buf == 1) && read_burst_rvalid_111 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0)) begin
        _maxi_wdata_sb_0 <= read_burst_rdata_115;
        _maxi_wvalid_sb_0 <= 1;
        _maxi_wlast_sb_0 <= read_burst_rlast_112 || (_maxi_write_size_buf == 1);
        _maxi_wstrb_sb_0 <= { 32{ 1'd1 } };
      end 
      _maxi_wdata_cond_0_1 <= 1;
      if(_maxi_wvalid_sb_0 && !_maxi_wready_sb_0) begin
        _maxi_wvalid_sb_0 <= _maxi_wvalid_sb_0;
        _maxi_wlast_sb_0 <= _maxi_wlast_sb_0;
      end 
      if((_maxi_write_op_sel_buf == 2) && read_burst_rvalid_211 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0)) begin
        _maxi_wdata_sb_0 <= read_burst_rdata_215;
        _maxi_wvalid_sb_0 <= 1;
        _maxi_wlast_sb_0 <= read_burst_rlast_212 || (_maxi_write_size_buf == 1);
        _maxi_wstrb_sb_0 <= { 32{ 1'd1 } };
      end 
      _maxi_wdata_cond_1_1 <= 1;
      if(_maxi_wvalid_sb_0 && !_maxi_wready_sb_0) begin
        _maxi_wvalid_sb_0 <= _maxi_wvalid_sb_0;
        _maxi_wlast_sb_0 <= _maxi_wlast_sb_0;
      end 
      if((_maxi_write_op_sel_buf == 3) && read_burst_rvalid_224 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0)) begin
        _maxi_wdata_sb_0 <= read_burst_rdata_228;
        _maxi_wvalid_sb_0 <= 1;
        _maxi_wlast_sb_0 <= read_burst_rlast_225 || (_maxi_write_size_buf == 1);
        _maxi_wstrb_sb_0 <= { 32{ 1'd1 } };
      end 
      _maxi_wdata_cond_2_1 <= 1;
      if(_maxi_wvalid_sb_0 && !_maxi_wready_sb_0) begin
        _maxi_wvalid_sb_0 <= _maxi_wvalid_sb_0;
        _maxi_wlast_sb_0 <= _maxi_wlast_sb_0;
      end 
      if((_maxi_write_op_sel_buf == 4) && read_burst_rvalid_467 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && (_maxi_wready_sb_0 || !_maxi_wvalid_sb_0)) begin
        _maxi_wdata_sb_0 <= read_burst_rdata_471;
        _maxi_wvalid_sb_0 <= 1;
        _maxi_wlast_sb_0 <= read_burst_rlast_468 || (_maxi_write_size_buf == 1);
        _maxi_wstrb_sb_0 <= { 32{ 1'd1 } };
      end 
      _maxi_wdata_cond_3_1 <= 1;
      if(_maxi_wvalid_sb_0 && !_maxi_wready_sb_0) begin
        _maxi_wvalid_sb_0 <= _maxi_wvalid_sb_0;
        _maxi_wlast_sb_0 <= _maxi_wlast_sb_0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _sb_maxi_writedata_data_6 <= 0;
      _sb_maxi_writedata_valid_7 <= 0;
      _sb_maxi_writedata_tmp_data_9 <= 0;
      _sb_maxi_writedata_tmp_valid_10 <= 0;
    end else begin
      if(_sb_maxi_writedata_m_ready_5 || !_sb_maxi_writedata_valid_7) begin
        _sb_maxi_writedata_data_6 <= _sb_maxi_writedata_next_data_11;
        _sb_maxi_writedata_valid_7 <= _sb_maxi_writedata_next_valid_12;
      end 
      if(!_sb_maxi_writedata_tmp_valid_10 && _sb_maxi_writedata_valid_7 && !_sb_maxi_writedata_m_ready_5) begin
        _sb_maxi_writedata_tmp_data_9 <= _sb_maxi_writedata_s_data_3;
        _sb_maxi_writedata_tmp_valid_10 <= _sb_maxi_writedata_s_valid_4;
      end 
      if(_sb_maxi_writedata_tmp_valid_10 && _sb_maxi_writedata_m_ready_5) begin
        _sb_maxi_writedata_tmp_valid_10 <= 0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      maxi_araddr <= 0;
      maxi_arlen <= 0;
      maxi_arvalid <= 0;
      _maxi_raddr_cond_0_1 <= 0;
    end else begin
      if(_maxi_raddr_cond_0_1) begin
        maxi_arvalid <= 0;
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid)) begin
        maxi_araddr <= _maxi_read_global_addr;
        maxi_arlen <= _maxi_read_cur_global_size - 1;
        maxi_arvalid <= 1;
      end 
      _maxi_raddr_cond_0_1 <= 1;
      if(maxi_arvalid && !maxi_arready) begin
        maxi_arvalid <= maxi_arvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _sb_maxi_readdata_data_21 <= 0;
      _sb_maxi_readdata_valid_22 <= 0;
      _sb_maxi_readdata_tmp_data_24 <= 0;
      _sb_maxi_readdata_tmp_valid_25 <= 0;
    end else begin
      if(_sb_maxi_readdata_m_ready_20 || !_sb_maxi_readdata_valid_22) begin
        _sb_maxi_readdata_data_21 <= _sb_maxi_readdata_next_data_26;
        _sb_maxi_readdata_valid_22 <= _sb_maxi_readdata_next_valid_27;
      end 
      if(!_sb_maxi_readdata_tmp_valid_25 && _sb_maxi_readdata_valid_22 && !_sb_maxi_readdata_m_ready_20) begin
        _sb_maxi_readdata_tmp_data_24 <= _sb_maxi_readdata_s_data_18;
        _sb_maxi_readdata_tmp_valid_25 <= _sb_maxi_readdata_s_valid_19;
      end 
      if(_sb_maxi_readdata_tmp_valid_25 && _sb_maxi_readdata_m_ready_20) begin
        _sb_maxi_readdata_tmp_valid_25 <= 0;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _maxi_outstanding_wcount <= 0;
      _maxi_read_start <= 0;
      _maxi_write_start <= 0;
      _maxi_read_op_sel <= 0;
      _maxi_read_global_addr <= 0;
      _maxi_read_global_size <= 0;
      _maxi_read_local_addr <= 0;
      _maxi_read_local_stride <= 0;
      _maxi_read_local_size <= 0;
      _maxi_read_local_blocksize <= 0;
      _maxi_read_req_busy <= 0;
      _maxi_read_cur_global_size <= 0;
      _maxi_read_data_busy <= 0;
      _maxi_read_op_sel_buf <= 0;
      _maxi_read_local_addr_buf <= 0;
      _maxi_read_local_stride_buf <= 0;
      _maxi_read_local_size_buf <= 0;
      _maxi_read_local_blocksize_buf <= 0;
      _maxi_write_op_sel <= 0;
      _maxi_write_global_addr <= 0;
      _maxi_write_global_size <= 0;
      _maxi_write_local_addr <= 0;
      _maxi_write_local_stride <= 0;
      _maxi_write_local_size <= 0;
      _maxi_write_local_blocksize <= 0;
      _maxi_write_req_busy <= 0;
      _maxi_write_cur_global_size <= 0;
      _maxi_write_data_busy <= 0;
      _maxi_write_op_sel_buf <= 0;
      _maxi_write_local_addr_buf <= 0;
      _maxi_write_local_stride_buf <= 0;
      _maxi_write_size_buf <= 0;
      _maxi_write_local_blocksize_buf <= 0;
    end else begin
      if(maxi_awvalid && maxi_awready && !(maxi_bvalid && maxi_bready) && (_maxi_outstanding_wcount < 7)) begin
        _maxi_outstanding_wcount <= _maxi_outstanding_wcount + 1;
      end 
      if(!(maxi_awvalid && maxi_awready) && (maxi_bvalid && maxi_bready) && (_maxi_outstanding_wcount > 0)) begin
        _maxi_outstanding_wcount <= _maxi_outstanding_wcount - 1;
      end 
      _maxi_read_start <= 0;
      _maxi_write_start <= 0;
      if((th_count == 4) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_50;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_req_fsm == 0) && _maxi_read_start) begin
        _maxi_read_req_busy <= 1;
      end 
      if(_maxi_read_start && _maxi_read_req_fifo_almost_full) begin
        _maxi_read_start <= 1;
      end 
      if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && (_maxi_read_global_size <= 256) && ((mask_addr_masked_60 & 4095) + (_maxi_read_global_size << 5) >= 4096)) begin
        _maxi_read_cur_global_size <= 4096 - (mask_addr_masked_62 & 4095) >> 5;
        _maxi_read_global_size <= _maxi_read_global_size - (4096 - (mask_addr_masked_64 & 4095) >> 5);
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && (_maxi_read_global_size <= 256)) begin
        _maxi_read_cur_global_size <= _maxi_read_global_size;
        _maxi_read_global_size <= 0;
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && ((mask_addr_masked_66 & 4095) + 8192 >= 4096)) begin
        _maxi_read_cur_global_size <= 4096 - (mask_addr_masked_68 & 4095) >> 5;
        _maxi_read_global_size <= _maxi_read_global_size - (4096 - (mask_addr_masked_70 & 4095) >> 5);
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full) begin
        _maxi_read_cur_global_size <= 256;
        _maxi_read_global_size <= _maxi_read_global_size - 256;
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid)) begin
        _maxi_read_global_addr <= _maxi_read_global_addr + (_maxi_read_cur_global_size << 5);
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid) && (_maxi_read_global_size == 0)) begin
        _maxi_read_req_busy <= 0;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((th_count == 15) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_79;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_req_fsm == 0) && _maxi_write_start) begin
        _maxi_write_req_busy <= 1;
      end 
      if(_maxi_write_start && _maxi_write_req_fifo_almost_full) begin
        _maxi_write_start <= 1;
      end 
      if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && (_maxi_write_global_size <= 256) && ((mask_addr_masked_89 & 4095) + (_maxi_write_global_size << 5) >= 4096)) begin
        _maxi_write_cur_global_size <= 4096 - (mask_addr_masked_91 & 4095) >> 5;
        _maxi_write_global_size <= _maxi_write_global_size - (4096 - (mask_addr_masked_93 & 4095) >> 5);
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && (_maxi_write_global_size <= 256)) begin
        _maxi_write_cur_global_size <= _maxi_write_global_size;
        _maxi_write_global_size <= 0;
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && ((mask_addr_masked_95 & 4095) + 8192 >= 4096)) begin
        _maxi_write_cur_global_size <= 4096 - (mask_addr_masked_97 & 4095) >> 5;
        _maxi_write_global_size <= _maxi_write_global_size - (4096 - (mask_addr_masked_99 & 4095) >> 5);
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full) begin
        _maxi_write_cur_global_size <= 256;
        _maxi_write_global_size <= _maxi_write_global_size - 256;
      end 
      if((_maxi_write_req_fsm == 1) && ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6))) begin
        _maxi_write_global_addr <= _maxi_write_global_addr + (_maxi_write_cur_global_size << 5);
      end 
      if((_maxi_write_req_fsm == 1) && ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6)) && (_maxi_write_global_size == 0)) begin
        _maxi_write_req_busy <= 0;
      end 
      if((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1))) begin
        _maxi_write_data_busy <= 1;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_rvalid_111 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 1) && read_burst_rvalid_111 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) && read_burst_rlast_112) begin
        _maxi_write_data_busy <= 0;
      end 
      if((th_count == 17) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_117;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 28) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_122;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 30) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_124;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 41) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_129;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 43) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_131;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 54) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_136;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 56) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_138;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((th_count == 59) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_147;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 71) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_152;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 73) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_154;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 76) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_159;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 88) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_164;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 90) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_166;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 93) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_171;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 105) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_176;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 109) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_178;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_fsm == 0) && (!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3))) begin
        _maxi_read_data_busy <= 1;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_fsm == 2) && _maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
        _maxi_read_data_busy <= 0;
      end 
      if((th_count == 121) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_187;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 132) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_192;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 145) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_197;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 156) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_202;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 169) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 2;
        _maxi_write_global_addr <= mask_addr_masked_207;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0 + i;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 2))) begin
        _maxi_write_data_busy <= 1;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_rvalid_211 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 2) && read_burst_rvalid_211 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) && read_burst_rlast_212) begin
        _maxi_write_data_busy <= 0;
      end 
      if((th_count == 180) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_220;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 3))) begin
        _maxi_write_data_busy <= 1;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_rvalid_224 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 3) && read_burst_rvalid_224 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) && read_burst_rlast_225) begin
        _maxi_write_data_busy <= 0;
      end 
      if((th_count == 202) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_233;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 224) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_238;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 230) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_240;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 242) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_245;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 253) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_250;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 266) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_255;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 277) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_260;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 290) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 2;
        _maxi_write_global_addr <= mask_addr_masked_265;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 1 + i;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 301) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_270;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 323) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_275;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 345) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_280;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 351) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_282;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 363) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_287;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 374) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_292;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 387) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_297;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 398) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_302;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 411) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 2;
        _maxi_write_global_addr <= mask_addr_masked_307;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 2 + i;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 422) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_312;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 444) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_317;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 466) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_322;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 472) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_324;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 484) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_329;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 495) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_334;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 508) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_339;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 519) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_344;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 541) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_372;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 553) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_377;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 564) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_382;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 577) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_387;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 588) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_392;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 610) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_405;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 622) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_410;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 633) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_415;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 646) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_420;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 657) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_425;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 680) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_438;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 692) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_443;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 703) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_448;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 716) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_453;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 727) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_458;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 740) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 4;
        _maxi_write_global_addr <= mask_addr_masked_463;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0 + i;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_data_fsm == 0) && (!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 4))) begin
        _maxi_write_data_busy <= 1;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_rvalid_467 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 4) && read_burst_rvalid_467 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) && read_burst_rlast_468) begin
        _maxi_write_data_busy <= 0;
      end 
      if((th_count == 751) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_476;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 773) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_481;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 795) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 3;
        _maxi_write_global_addr <= mask_addr_masked_486;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 801) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 4;
        _maxi_write_global_addr <= mask_addr_masked_488;
        _maxi_write_global_size <= 1;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 1;
        _maxi_write_local_blocksize <= 1;
      end 
      if((th_count == 803) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_490;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 815) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_495;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 826) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_500;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 839) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_505;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
      if((th_count == 850) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_510;
        _maxi_read_global_size <= 1;
        _maxi_read_local_addr <= 1;
        _maxi_read_local_stride <= 1;
        _maxi_read_local_size <= 1;
        _maxi_read_local_blocksize <= 1;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__maxi_read_req_fifo <= 0;
      __tmp_58_1 <= 0;
    end else begin
      if(_maxi_read_req_fifo_enq && !_maxi_read_req_fifo_full && (_maxi_read_req_fifo_deq && !_maxi_read_req_fifo_empty)) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo;
      end else if(_maxi_read_req_fifo_enq && !_maxi_read_req_fifo_full) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo + 1;
      end else if(_maxi_read_req_fifo_deq && !_maxi_read_req_fifo_empty) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo - 1;
      end 
      __tmp_58_1 <= _tmp_58;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__maxi_write_req_fifo <= 0;
      __tmp_87_1 <= 0;
      __tmp_107_1 <= 0;
    end else begin
      if(_maxi_write_req_fifo_enq && !_maxi_write_req_fifo_full && (_maxi_write_req_fifo_deq && !_maxi_write_req_fifo_empty)) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo;
      end else if(_maxi_write_req_fifo_enq && !_maxi_write_req_fifo_full) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo + 1;
      end else if(_maxi_write_req_fifo_deq && !_maxi_write_req_fifo_empty) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo - 1;
      end 
      __tmp_87_1 <= _tmp_87;
      __tmp_107_1 <= _tmp_107;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_184_1 <= 0;
      __tmp_242_1 <= 0;
      __tmp_284_1 <= 0;
      __tmp_326_1 <= 0;
      __tmp_350_1 <= 0;
      __tmp_374_1 <= 0;
      __tmp_407_1 <= 0;
      __tmp_440_1 <= 0;
      __tmp_492_1 <= 0;
    end else begin
      __tmp_184_1 <= _tmp_184;
      __tmp_242_1 <= _tmp_242;
      __tmp_284_1 <= _tmp_284;
      __tmp_326_1 <= _tmp_326;
      __tmp_350_1 <= _tmp_350;
      __tmp_374_1 <= _tmp_374;
      __tmp_407_1 <= _tmp_407;
      __tmp_440_1 <= _tmp_440;
      __tmp_492_1 <= _tmp_492;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_76_1 <= 0;
      __tmp_119_1 <= 0;
      __tmp_126_1 <= 0;
      __tmp_133_1 <= 0;
    end else begin
      __tmp_76_1 <= _tmp_76;
      __tmp_119_1 <= _tmp_119;
      __tmp_126_1 <= _tmp_126;
      __tmp_133_1 <= _tmp_133;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_114_1 <= 0;
      __tmp_144_1 <= 0;
      __tmp_149_1 <= 0;
      __tmp_156_1 <= 0;
      __tmp_161_1 <= 0;
      __tmp_168_1 <= 0;
      __tmp_173_1 <= 0;
      __tmp_189_1 <= 0;
      __tmp_194_1 <= 0;
      __tmp_199_1 <= 0;
      __tmp_204_1 <= 0;
      __tmp_230_1 <= 0;
      __tmp_235_1 <= 0;
      __tmp_247_1 <= 0;
      __tmp_252_1 <= 0;
      __tmp_257_1 <= 0;
      __tmp_262_1 <= 0;
      __tmp_272_1 <= 0;
      __tmp_277_1 <= 0;
      __tmp_289_1 <= 0;
      __tmp_294_1 <= 0;
      __tmp_299_1 <= 0;
      __tmp_304_1 <= 0;
      __tmp_314_1 <= 0;
      __tmp_319_1 <= 0;
      __tmp_331_1 <= 0;
      __tmp_336_1 <= 0;
      __tmp_341_1 <= 0;
      __tmp_346_1 <= 0;
      __tmp_379_1 <= 0;
      __tmp_384_1 <= 0;
      __tmp_389_1 <= 0;
      __tmp_394_1 <= 0;
      __tmp_412_1 <= 0;
      __tmp_417_1 <= 0;
      __tmp_422_1 <= 0;
      __tmp_427_1 <= 0;
      __tmp_445_1 <= 0;
      __tmp_450_1 <= 0;
      __tmp_455_1 <= 0;
      __tmp_460_1 <= 0;
      __tmp_478_1 <= 0;
      __tmp_483_1 <= 0;
      __tmp_497_1 <= 0;
      __tmp_502_1 <= 0;
      __tmp_507_1 <= 0;
      __tmp_512_1 <= 0;
    end else begin
      __tmp_114_1 <= _tmp_114;
      __tmp_144_1 <= _tmp_144;
      __tmp_149_1 <= _tmp_149;
      __tmp_156_1 <= _tmp_156;
      __tmp_161_1 <= _tmp_161;
      __tmp_168_1 <= _tmp_168;
      __tmp_173_1 <= _tmp_173;
      __tmp_189_1 <= _tmp_189;
      __tmp_194_1 <= _tmp_194;
      __tmp_199_1 <= _tmp_199;
      __tmp_204_1 <= _tmp_204;
      __tmp_230_1 <= _tmp_230;
      __tmp_235_1 <= _tmp_235;
      __tmp_247_1 <= _tmp_247;
      __tmp_252_1 <= _tmp_252;
      __tmp_257_1 <= _tmp_257;
      __tmp_262_1 <= _tmp_262;
      __tmp_272_1 <= _tmp_272;
      __tmp_277_1 <= _tmp_277;
      __tmp_289_1 <= _tmp_289;
      __tmp_294_1 <= _tmp_294;
      __tmp_299_1 <= _tmp_299;
      __tmp_304_1 <= _tmp_304;
      __tmp_314_1 <= _tmp_314;
      __tmp_319_1 <= _tmp_319;
      __tmp_331_1 <= _tmp_331;
      __tmp_336_1 <= _tmp_336;
      __tmp_341_1 <= _tmp_341;
      __tmp_346_1 <= _tmp_346;
      __tmp_379_1 <= _tmp_379;
      __tmp_384_1 <= _tmp_384;
      __tmp_389_1 <= _tmp_389;
      __tmp_394_1 <= _tmp_394;
      __tmp_412_1 <= _tmp_412;
      __tmp_417_1 <= _tmp_417;
      __tmp_422_1 <= _tmp_422;
      __tmp_427_1 <= _tmp_427;
      __tmp_445_1 <= _tmp_445;
      __tmp_450_1 <= _tmp_450;
      __tmp_455_1 <= _tmp_455;
      __tmp_460_1 <= _tmp_460;
      __tmp_478_1 <= _tmp_478;
      __tmp_483_1 <= _tmp_483;
      __tmp_497_1 <= _tmp_497;
      __tmp_502_1 <= _tmp_502;
      __tmp_507_1 <= _tmp_507;
      __tmp_512_1 <= _tmp_512;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_227_1 <= 0;
    end else begin
      __tmp_227_1 <= _tmp_227;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      saxi_rdata <= 0;
      saxi_rvalid <= 0;
      _saxi_rdata_cond_0_1 <= 0;
    end else begin
      if(_saxi_rdata_cond_0_1) begin
        saxi_rvalid <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid)) begin
        saxi_rdata <= axislite_rdata_46;
        saxi_rvalid <= 1;
      end 
      _saxi_rdata_cond_0_1 <= 1;
      if(saxi_rvalid && !saxi_rready) begin
        saxi_rvalid <= saxi_rvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      saxi_bvalid <= 0;
      prev_awvalid_43 <= 0;
      prev_arvalid_44 <= 0;
      writevalid_41 <= 0;
      readvalid_42 <= 0;
      addr_40 <= 0;
      _saxi_register_0 <= 0;
      _saxi_flag_0 <= 0;
      _saxi_register_1 <= 0;
      _saxi_flag_1 <= 0;
      _saxi_register_2 <= 0;
      _saxi_flag_2 <= 0;
      _saxi_register_3 <= 0;
      _saxi_flag_3 <= 0;
    end else begin
      if(saxi_bvalid && saxi_bready) begin
        saxi_bvalid <= 0;
      end 
      if(saxi_wvalid && saxi_wready) begin
        saxi_bvalid <= 1;
      end 
      prev_awvalid_43 <= saxi_awvalid;
      prev_arvalid_44 <= saxi_arvalid;
      writevalid_41 <= 0;
      readvalid_42 <= 0;
      if(saxi_awready && saxi_awvalid && !saxi_bvalid) begin
        addr_40 <= saxi_awaddr;
        writevalid_41 <= 1;
      end else if(saxi_arready && saxi_arvalid) begin
        addr_40 <= saxi_araddr;
        readvalid_42 <= 1;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 0)) begin
        _saxi_register_0 <= axislite_resetval_48;
        _saxi_flag_0 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 1)) begin
        _saxi_register_1 <= axislite_resetval_48;
        _saxi_flag_1 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 2)) begin
        _saxi_register_2 <= axislite_resetval_48;
        _saxi_flag_2 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_47 && (axis_maskaddr_45 == 3)) begin
        _saxi_register_3 <= axislite_resetval_48;
        _saxi_flag_3 <= 0;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 0)) begin
        _saxi_register_0 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 1)) begin
        _saxi_register_1 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 2)) begin
        _saxi_register_2 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 3) && saxi_wvalid && (axis_maskaddr_45 == 3)) begin
        _saxi_register_3 <= saxi_wdata;
      end 
      if((_saxi_register_0 == 1) && (th_count == 2) && 1) begin
        _saxi_register_0 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_count == 2) && 0) begin
        _saxi_register_1 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_count == 2) && 0) begin
        _saxi_register_2 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_count == 2) && 0) begin
        _saxi_register_3 <= 0;
      end 
      if((th_count == 3) && 0) begin
        _saxi_register_0 <= 1;
        _saxi_flag_0 <= 0;
      end 
      if((th_count == 3) && 1) begin
        _saxi_register_1 <= 1;
        _saxi_flag_1 <= 0;
      end 
      if((th_count == 3) && 0) begin
        _saxi_register_2 <= 1;
        _saxi_flag_2 <= 0;
      end 
      if((th_count == 3) && 0) begin
        _saxi_register_3 <= 1;
        _saxi_flag_3 <= 0;
      end 
      if((th_count == 870) && 0) begin
        _saxi_register_0 <= 0;
        _saxi_flag_0 <= 0;
      end 
      if((th_count == 870) && 1) begin
        _saxi_register_1 <= 0;
        _saxi_flag_1 <= 0;
      end 
      if((th_count == 870) && 0) begin
        _saxi_register_2 <= 0;
        _saxi_flag_2 <= 0;
      end 
      if((th_count == 870) && 0) begin
        _saxi_register_3 <= 0;
        _saxi_flag_3 <= 0;
      end 
      if((th_count == 871) && 0) begin
        _saxi_register_0 <= is_secure;
        _saxi_flag_0 <= 0;
      end 
      if((th_count == 871) && 0) begin
        _saxi_register_1 <= is_secure;
        _saxi_flag_1 <= 0;
      end 
      if((th_count == 871) && 1) begin
        _saxi_register_2 <= is_secure;
        _saxi_flag_2 <= 0;
      end 
      if((th_count == 871) && 0) begin
        _saxi_register_3 <= is_secure;
        _saxi_flag_3 <= 0;
      end 
    end
  end

  localparam _saxi_register_fsm_1 = 1;
  localparam _saxi_register_fsm_2 = 2;
  localparam _saxi_register_fsm_3 = 3;
  localparam _saxi_register_fsm_4 = 4;

  always @(posedge CLK) begin
    if(RST) begin
      _saxi_register_fsm <= _saxi_register_fsm_init;
      axis_maskaddr_45 <= 0;
    end else begin
      case(_saxi_register_fsm)
        _saxi_register_fsm_init: begin
          if(readvalid_42 || writevalid_41) begin
            axis_maskaddr_45 <= (addr_40 >> _saxi_shift) & _saxi_mask;
          end 
          if(readvalid_42) begin
            _saxi_register_fsm <= _saxi_register_fsm_1;
          end 
          if(writevalid_41) begin
            _saxi_register_fsm <= _saxi_register_fsm_3;
          end 
        end
        _saxi_register_fsm_1: begin
          if(saxi_rready || !saxi_rvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_2;
          end 
        end
        _saxi_register_fsm_2: begin
          if(saxi_rready && saxi_rvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end 
        end
        _saxi_register_fsm_3: begin
          if(saxi_wvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_4;
          end 
        end
        _saxi_register_fsm_4: begin
          if(saxi_bready && saxi_bvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam th_count_1 = 1;
  localparam th_count_2 = 2;
  localparam th_count_3 = 3;
  localparam th_count_4 = 4;
  localparam th_count_5 = 5;
  localparam th_count_6 = 6;
  localparam th_count_7 = 7;
  localparam th_count_8 = 8;
  localparam th_count_9 = 9;
  localparam th_count_10 = 10;
  localparam th_count_11 = 11;
  localparam th_count_12 = 12;
  localparam th_count_13 = 13;
  localparam th_count_14 = 14;
  localparam th_count_15 = 15;
  localparam th_count_16 = 16;
  localparam th_count_17 = 17;
  localparam th_count_18 = 18;
  localparam th_count_19 = 19;
  localparam th_count_20 = 20;
  localparam th_count_21 = 21;
  localparam th_count_22 = 22;
  localparam th_count_23 = 23;
  localparam th_count_24 = 24;
  localparam th_count_25 = 25;
  localparam th_count_26 = 26;
  localparam th_count_27 = 27;
  localparam th_count_28 = 28;
  localparam th_count_29 = 29;
  localparam th_count_30 = 30;
  localparam th_count_31 = 31;
  localparam th_count_32 = 32;
  localparam th_count_33 = 33;
  localparam th_count_34 = 34;
  localparam th_count_35 = 35;
  localparam th_count_36 = 36;
  localparam th_count_37 = 37;
  localparam th_count_38 = 38;
  localparam th_count_39 = 39;
  localparam th_count_40 = 40;
  localparam th_count_41 = 41;
  localparam th_count_42 = 42;
  localparam th_count_43 = 43;
  localparam th_count_44 = 44;
  localparam th_count_45 = 45;
  localparam th_count_46 = 46;
  localparam th_count_47 = 47;
  localparam th_count_48 = 48;
  localparam th_count_49 = 49;
  localparam th_count_50 = 50;
  localparam th_count_51 = 51;
  localparam th_count_52 = 52;
  localparam th_count_53 = 53;
  localparam th_count_54 = 54;
  localparam th_count_55 = 55;
  localparam th_count_56 = 56;
  localparam th_count_57 = 57;
  localparam th_count_58 = 58;
  localparam th_count_59 = 59;
  localparam th_count_60 = 60;
  localparam th_count_61 = 61;
  localparam th_count_62 = 62;
  localparam th_count_63 = 63;
  localparam th_count_64 = 64;
  localparam th_count_65 = 65;
  localparam th_count_66 = 66;
  localparam th_count_67 = 67;
  localparam th_count_68 = 68;
  localparam th_count_69 = 69;
  localparam th_count_70 = 70;
  localparam th_count_71 = 71;
  localparam th_count_72 = 72;
  localparam th_count_73 = 73;
  localparam th_count_74 = 74;
  localparam th_count_75 = 75;
  localparam th_count_76 = 76;
  localparam th_count_77 = 77;
  localparam th_count_78 = 78;
  localparam th_count_79 = 79;
  localparam th_count_80 = 80;
  localparam th_count_81 = 81;
  localparam th_count_82 = 82;
  localparam th_count_83 = 83;
  localparam th_count_84 = 84;
  localparam th_count_85 = 85;
  localparam th_count_86 = 86;
  localparam th_count_87 = 87;
  localparam th_count_88 = 88;
  localparam th_count_89 = 89;
  localparam th_count_90 = 90;
  localparam th_count_91 = 91;
  localparam th_count_92 = 92;
  localparam th_count_93 = 93;
  localparam th_count_94 = 94;
  localparam th_count_95 = 95;
  localparam th_count_96 = 96;
  localparam th_count_97 = 97;
  localparam th_count_98 = 98;
  localparam th_count_99 = 99;
  localparam th_count_100 = 100;
  localparam th_count_101 = 101;
  localparam th_count_102 = 102;
  localparam th_count_103 = 103;
  localparam th_count_104 = 104;
  localparam th_count_105 = 105;
  localparam th_count_106 = 106;
  localparam th_count_107 = 107;
  localparam th_count_108 = 108;
  localparam th_count_109 = 109;
  localparam th_count_110 = 110;
  localparam th_count_111 = 111;
  localparam th_count_112 = 112;
  localparam th_count_113 = 113;
  localparam th_count_114 = 114;
  localparam th_count_115 = 115;
  localparam th_count_116 = 116;
  localparam th_count_117 = 117;
  localparam th_count_118 = 118;
  localparam th_count_119 = 119;
  localparam th_count_120 = 120;
  localparam th_count_121 = 121;
  localparam th_count_122 = 122;
  localparam th_count_123 = 123;
  localparam th_count_124 = 124;
  localparam th_count_125 = 125;
  localparam th_count_126 = 126;
  localparam th_count_127 = 127;
  localparam th_count_128 = 128;
  localparam th_count_129 = 129;
  localparam th_count_130 = 130;
  localparam th_count_131 = 131;
  localparam th_count_132 = 132;
  localparam th_count_133 = 133;
  localparam th_count_134 = 134;
  localparam th_count_135 = 135;
  localparam th_count_136 = 136;
  localparam th_count_137 = 137;
  localparam th_count_138 = 138;
  localparam th_count_139 = 139;
  localparam th_count_140 = 140;
  localparam th_count_141 = 141;
  localparam th_count_142 = 142;
  localparam th_count_143 = 143;
  localparam th_count_144 = 144;
  localparam th_count_145 = 145;
  localparam th_count_146 = 146;
  localparam th_count_147 = 147;
  localparam th_count_148 = 148;
  localparam th_count_149 = 149;
  localparam th_count_150 = 150;
  localparam th_count_151 = 151;
  localparam th_count_152 = 152;
  localparam th_count_153 = 153;
  localparam th_count_154 = 154;
  localparam th_count_155 = 155;
  localparam th_count_156 = 156;
  localparam th_count_157 = 157;
  localparam th_count_158 = 158;
  localparam th_count_159 = 159;
  localparam th_count_160 = 160;
  localparam th_count_161 = 161;
  localparam th_count_162 = 162;
  localparam th_count_163 = 163;
  localparam th_count_164 = 164;
  localparam th_count_165 = 165;
  localparam th_count_166 = 166;
  localparam th_count_167 = 167;
  localparam th_count_168 = 168;
  localparam th_count_169 = 169;
  localparam th_count_170 = 170;
  localparam th_count_171 = 171;
  localparam th_count_172 = 172;
  localparam th_count_173 = 173;
  localparam th_count_174 = 174;
  localparam th_count_175 = 175;
  localparam th_count_176 = 176;
  localparam th_count_177 = 177;
  localparam th_count_178 = 178;
  localparam th_count_179 = 179;
  localparam th_count_180 = 180;
  localparam th_count_181 = 181;
  localparam th_count_182 = 182;
  localparam th_count_183 = 183;
  localparam th_count_184 = 184;
  localparam th_count_185 = 185;
  localparam th_count_186 = 186;
  localparam th_count_187 = 187;
  localparam th_count_188 = 188;
  localparam th_count_189 = 189;
  localparam th_count_190 = 190;
  localparam th_count_191 = 191;
  localparam th_count_192 = 192;
  localparam th_count_193 = 193;
  localparam th_count_194 = 194;
  localparam th_count_195 = 195;
  localparam th_count_196 = 196;
  localparam th_count_197 = 197;
  localparam th_count_198 = 198;
  localparam th_count_199 = 199;
  localparam th_count_200 = 200;
  localparam th_count_201 = 201;
  localparam th_count_202 = 202;
  localparam th_count_203 = 203;
  localparam th_count_204 = 204;
  localparam th_count_205 = 205;
  localparam th_count_206 = 206;
  localparam th_count_207 = 207;
  localparam th_count_208 = 208;
  localparam th_count_209 = 209;
  localparam th_count_210 = 210;
  localparam th_count_211 = 211;
  localparam th_count_212 = 212;
  localparam th_count_213 = 213;
  localparam th_count_214 = 214;
  localparam th_count_215 = 215;
  localparam th_count_216 = 216;
  localparam th_count_217 = 217;
  localparam th_count_218 = 218;
  localparam th_count_219 = 219;
  localparam th_count_220 = 220;
  localparam th_count_221 = 221;
  localparam th_count_222 = 222;
  localparam th_count_223 = 223;
  localparam th_count_224 = 224;
  localparam th_count_225 = 225;
  localparam th_count_226 = 226;
  localparam th_count_227 = 227;
  localparam th_count_228 = 228;
  localparam th_count_229 = 229;
  localparam th_count_230 = 230;
  localparam th_count_231 = 231;
  localparam th_count_232 = 232;
  localparam th_count_233 = 233;
  localparam th_count_234 = 234;
  localparam th_count_235 = 235;
  localparam th_count_236 = 236;
  localparam th_count_237 = 237;
  localparam th_count_238 = 238;
  localparam th_count_239 = 239;
  localparam th_count_240 = 240;
  localparam th_count_241 = 241;
  localparam th_count_242 = 242;
  localparam th_count_243 = 243;
  localparam th_count_244 = 244;
  localparam th_count_245 = 245;
  localparam th_count_246 = 246;
  localparam th_count_247 = 247;
  localparam th_count_248 = 248;
  localparam th_count_249 = 249;
  localparam th_count_250 = 250;
  localparam th_count_251 = 251;
  localparam th_count_252 = 252;
  localparam th_count_253 = 253;
  localparam th_count_254 = 254;
  localparam th_count_255 = 255;
  localparam th_count_256 = 256;
  localparam th_count_257 = 257;
  localparam th_count_258 = 258;
  localparam th_count_259 = 259;
  localparam th_count_260 = 260;
  localparam th_count_261 = 261;
  localparam th_count_262 = 262;
  localparam th_count_263 = 263;
  localparam th_count_264 = 264;
  localparam th_count_265 = 265;
  localparam th_count_266 = 266;
  localparam th_count_267 = 267;
  localparam th_count_268 = 268;
  localparam th_count_269 = 269;
  localparam th_count_270 = 270;
  localparam th_count_271 = 271;
  localparam th_count_272 = 272;
  localparam th_count_273 = 273;
  localparam th_count_274 = 274;
  localparam th_count_275 = 275;
  localparam th_count_276 = 276;
  localparam th_count_277 = 277;
  localparam th_count_278 = 278;
  localparam th_count_279 = 279;
  localparam th_count_280 = 280;
  localparam th_count_281 = 281;
  localparam th_count_282 = 282;
  localparam th_count_283 = 283;
  localparam th_count_284 = 284;
  localparam th_count_285 = 285;
  localparam th_count_286 = 286;
  localparam th_count_287 = 287;
  localparam th_count_288 = 288;
  localparam th_count_289 = 289;
  localparam th_count_290 = 290;
  localparam th_count_291 = 291;
  localparam th_count_292 = 292;
  localparam th_count_293 = 293;
  localparam th_count_294 = 294;
  localparam th_count_295 = 295;
  localparam th_count_296 = 296;
  localparam th_count_297 = 297;
  localparam th_count_298 = 298;
  localparam th_count_299 = 299;
  localparam th_count_300 = 300;
  localparam th_count_301 = 301;
  localparam th_count_302 = 302;
  localparam th_count_303 = 303;
  localparam th_count_304 = 304;
  localparam th_count_305 = 305;
  localparam th_count_306 = 306;
  localparam th_count_307 = 307;
  localparam th_count_308 = 308;
  localparam th_count_309 = 309;
  localparam th_count_310 = 310;
  localparam th_count_311 = 311;
  localparam th_count_312 = 312;
  localparam th_count_313 = 313;
  localparam th_count_314 = 314;
  localparam th_count_315 = 315;
  localparam th_count_316 = 316;
  localparam th_count_317 = 317;
  localparam th_count_318 = 318;
  localparam th_count_319 = 319;
  localparam th_count_320 = 320;
  localparam th_count_321 = 321;
  localparam th_count_322 = 322;
  localparam th_count_323 = 323;
  localparam th_count_324 = 324;
  localparam th_count_325 = 325;
  localparam th_count_326 = 326;
  localparam th_count_327 = 327;
  localparam th_count_328 = 328;
  localparam th_count_329 = 329;
  localparam th_count_330 = 330;
  localparam th_count_331 = 331;
  localparam th_count_332 = 332;
  localparam th_count_333 = 333;
  localparam th_count_334 = 334;
  localparam th_count_335 = 335;
  localparam th_count_336 = 336;
  localparam th_count_337 = 337;
  localparam th_count_338 = 338;
  localparam th_count_339 = 339;
  localparam th_count_340 = 340;
  localparam th_count_341 = 341;
  localparam th_count_342 = 342;
  localparam th_count_343 = 343;
  localparam th_count_344 = 344;
  localparam th_count_345 = 345;
  localparam th_count_346 = 346;
  localparam th_count_347 = 347;
  localparam th_count_348 = 348;
  localparam th_count_349 = 349;
  localparam th_count_350 = 350;
  localparam th_count_351 = 351;
  localparam th_count_352 = 352;
  localparam th_count_353 = 353;
  localparam th_count_354 = 354;
  localparam th_count_355 = 355;
  localparam th_count_356 = 356;
  localparam th_count_357 = 357;
  localparam th_count_358 = 358;
  localparam th_count_359 = 359;
  localparam th_count_360 = 360;
  localparam th_count_361 = 361;
  localparam th_count_362 = 362;
  localparam th_count_363 = 363;
  localparam th_count_364 = 364;
  localparam th_count_365 = 365;
  localparam th_count_366 = 366;
  localparam th_count_367 = 367;
  localparam th_count_368 = 368;
  localparam th_count_369 = 369;
  localparam th_count_370 = 370;
  localparam th_count_371 = 371;
  localparam th_count_372 = 372;
  localparam th_count_373 = 373;
  localparam th_count_374 = 374;
  localparam th_count_375 = 375;
  localparam th_count_376 = 376;
  localparam th_count_377 = 377;
  localparam th_count_378 = 378;
  localparam th_count_379 = 379;
  localparam th_count_380 = 380;
  localparam th_count_381 = 381;
  localparam th_count_382 = 382;
  localparam th_count_383 = 383;
  localparam th_count_384 = 384;
  localparam th_count_385 = 385;
  localparam th_count_386 = 386;
  localparam th_count_387 = 387;
  localparam th_count_388 = 388;
  localparam th_count_389 = 389;
  localparam th_count_390 = 390;
  localparam th_count_391 = 391;
  localparam th_count_392 = 392;
  localparam th_count_393 = 393;
  localparam th_count_394 = 394;
  localparam th_count_395 = 395;
  localparam th_count_396 = 396;
  localparam th_count_397 = 397;
  localparam th_count_398 = 398;
  localparam th_count_399 = 399;
  localparam th_count_400 = 400;
  localparam th_count_401 = 401;
  localparam th_count_402 = 402;
  localparam th_count_403 = 403;
  localparam th_count_404 = 404;
  localparam th_count_405 = 405;
  localparam th_count_406 = 406;
  localparam th_count_407 = 407;
  localparam th_count_408 = 408;
  localparam th_count_409 = 409;
  localparam th_count_410 = 410;
  localparam th_count_411 = 411;
  localparam th_count_412 = 412;
  localparam th_count_413 = 413;
  localparam th_count_414 = 414;
  localparam th_count_415 = 415;
  localparam th_count_416 = 416;
  localparam th_count_417 = 417;
  localparam th_count_418 = 418;
  localparam th_count_419 = 419;
  localparam th_count_420 = 420;
  localparam th_count_421 = 421;
  localparam th_count_422 = 422;
  localparam th_count_423 = 423;
  localparam th_count_424 = 424;
  localparam th_count_425 = 425;
  localparam th_count_426 = 426;
  localparam th_count_427 = 427;
  localparam th_count_428 = 428;
  localparam th_count_429 = 429;
  localparam th_count_430 = 430;
  localparam th_count_431 = 431;
  localparam th_count_432 = 432;
  localparam th_count_433 = 433;
  localparam th_count_434 = 434;
  localparam th_count_435 = 435;
  localparam th_count_436 = 436;
  localparam th_count_437 = 437;
  localparam th_count_438 = 438;
  localparam th_count_439 = 439;
  localparam th_count_440 = 440;
  localparam th_count_441 = 441;
  localparam th_count_442 = 442;
  localparam th_count_443 = 443;
  localparam th_count_444 = 444;
  localparam th_count_445 = 445;
  localparam th_count_446 = 446;
  localparam th_count_447 = 447;
  localparam th_count_448 = 448;
  localparam th_count_449 = 449;
  localparam th_count_450 = 450;
  localparam th_count_451 = 451;
  localparam th_count_452 = 452;
  localparam th_count_453 = 453;
  localparam th_count_454 = 454;
  localparam th_count_455 = 455;
  localparam th_count_456 = 456;
  localparam th_count_457 = 457;
  localparam th_count_458 = 458;
  localparam th_count_459 = 459;
  localparam th_count_460 = 460;
  localparam th_count_461 = 461;
  localparam th_count_462 = 462;
  localparam th_count_463 = 463;
  localparam th_count_464 = 464;
  localparam th_count_465 = 465;
  localparam th_count_466 = 466;
  localparam th_count_467 = 467;
  localparam th_count_468 = 468;
  localparam th_count_469 = 469;
  localparam th_count_470 = 470;
  localparam th_count_471 = 471;
  localparam th_count_472 = 472;
  localparam th_count_473 = 473;
  localparam th_count_474 = 474;
  localparam th_count_475 = 475;
  localparam th_count_476 = 476;
  localparam th_count_477 = 477;
  localparam th_count_478 = 478;
  localparam th_count_479 = 479;
  localparam th_count_480 = 480;
  localparam th_count_481 = 481;
  localparam th_count_482 = 482;
  localparam th_count_483 = 483;
  localparam th_count_484 = 484;
  localparam th_count_485 = 485;
  localparam th_count_486 = 486;
  localparam th_count_487 = 487;
  localparam th_count_488 = 488;
  localparam th_count_489 = 489;
  localparam th_count_490 = 490;
  localparam th_count_491 = 491;
  localparam th_count_492 = 492;
  localparam th_count_493 = 493;
  localparam th_count_494 = 494;
  localparam th_count_495 = 495;
  localparam th_count_496 = 496;
  localparam th_count_497 = 497;
  localparam th_count_498 = 498;
  localparam th_count_499 = 499;
  localparam th_count_500 = 500;
  localparam th_count_501 = 501;
  localparam th_count_502 = 502;
  localparam th_count_503 = 503;
  localparam th_count_504 = 504;
  localparam th_count_505 = 505;
  localparam th_count_506 = 506;
  localparam th_count_507 = 507;
  localparam th_count_508 = 508;
  localparam th_count_509 = 509;
  localparam th_count_510 = 510;
  localparam th_count_511 = 511;
  localparam th_count_512 = 512;
  localparam th_count_513 = 513;
  localparam th_count_514 = 514;
  localparam th_count_515 = 515;
  localparam th_count_516 = 516;
  localparam th_count_517 = 517;
  localparam th_count_518 = 518;
  localparam th_count_519 = 519;
  localparam th_count_520 = 520;
  localparam th_count_521 = 521;
  localparam th_count_522 = 522;
  localparam th_count_523 = 523;
  localparam th_count_524 = 524;
  localparam th_count_525 = 525;
  localparam th_count_526 = 526;
  localparam th_count_527 = 527;
  localparam th_count_528 = 528;
  localparam th_count_529 = 529;
  localparam th_count_530 = 530;
  localparam th_count_531 = 531;
  localparam th_count_532 = 532;
  localparam th_count_533 = 533;
  localparam th_count_534 = 534;
  localparam th_count_535 = 535;
  localparam th_count_536 = 536;
  localparam th_count_537 = 537;
  localparam th_count_538 = 538;
  localparam th_count_539 = 539;
  localparam th_count_540 = 540;
  localparam th_count_541 = 541;
  localparam th_count_542 = 542;
  localparam th_count_543 = 543;
  localparam th_count_544 = 544;
  localparam th_count_545 = 545;
  localparam th_count_546 = 546;
  localparam th_count_547 = 547;
  localparam th_count_548 = 548;
  localparam th_count_549 = 549;
  localparam th_count_550 = 550;
  localparam th_count_551 = 551;
  localparam th_count_552 = 552;
  localparam th_count_553 = 553;
  localparam th_count_554 = 554;
  localparam th_count_555 = 555;
  localparam th_count_556 = 556;
  localparam th_count_557 = 557;
  localparam th_count_558 = 558;
  localparam th_count_559 = 559;
  localparam th_count_560 = 560;
  localparam th_count_561 = 561;
  localparam th_count_562 = 562;
  localparam th_count_563 = 563;
  localparam th_count_564 = 564;
  localparam th_count_565 = 565;
  localparam th_count_566 = 566;
  localparam th_count_567 = 567;
  localparam th_count_568 = 568;
  localparam th_count_569 = 569;
  localparam th_count_570 = 570;
  localparam th_count_571 = 571;
  localparam th_count_572 = 572;
  localparam th_count_573 = 573;
  localparam th_count_574 = 574;
  localparam th_count_575 = 575;
  localparam th_count_576 = 576;
  localparam th_count_577 = 577;
  localparam th_count_578 = 578;
  localparam th_count_579 = 579;
  localparam th_count_580 = 580;
  localparam th_count_581 = 581;
  localparam th_count_582 = 582;
  localparam th_count_583 = 583;
  localparam th_count_584 = 584;
  localparam th_count_585 = 585;
  localparam th_count_586 = 586;
  localparam th_count_587 = 587;
  localparam th_count_588 = 588;
  localparam th_count_589 = 589;
  localparam th_count_590 = 590;
  localparam th_count_591 = 591;
  localparam th_count_592 = 592;
  localparam th_count_593 = 593;
  localparam th_count_594 = 594;
  localparam th_count_595 = 595;
  localparam th_count_596 = 596;
  localparam th_count_597 = 597;
  localparam th_count_598 = 598;
  localparam th_count_599 = 599;
  localparam th_count_600 = 600;
  localparam th_count_601 = 601;
  localparam th_count_602 = 602;
  localparam th_count_603 = 603;
  localparam th_count_604 = 604;
  localparam th_count_605 = 605;
  localparam th_count_606 = 606;
  localparam th_count_607 = 607;
  localparam th_count_608 = 608;
  localparam th_count_609 = 609;
  localparam th_count_610 = 610;
  localparam th_count_611 = 611;
  localparam th_count_612 = 612;
  localparam th_count_613 = 613;
  localparam th_count_614 = 614;
  localparam th_count_615 = 615;
  localparam th_count_616 = 616;
  localparam th_count_617 = 617;
  localparam th_count_618 = 618;
  localparam th_count_619 = 619;
  localparam th_count_620 = 620;
  localparam th_count_621 = 621;
  localparam th_count_622 = 622;
  localparam th_count_623 = 623;
  localparam th_count_624 = 624;
  localparam th_count_625 = 625;
  localparam th_count_626 = 626;
  localparam th_count_627 = 627;
  localparam th_count_628 = 628;
  localparam th_count_629 = 629;
  localparam th_count_630 = 630;
  localparam th_count_631 = 631;
  localparam th_count_632 = 632;
  localparam th_count_633 = 633;
  localparam th_count_634 = 634;
  localparam th_count_635 = 635;
  localparam th_count_636 = 636;
  localparam th_count_637 = 637;
  localparam th_count_638 = 638;
  localparam th_count_639 = 639;
  localparam th_count_640 = 640;
  localparam th_count_641 = 641;
  localparam th_count_642 = 642;
  localparam th_count_643 = 643;
  localparam th_count_644 = 644;
  localparam th_count_645 = 645;
  localparam th_count_646 = 646;
  localparam th_count_647 = 647;
  localparam th_count_648 = 648;
  localparam th_count_649 = 649;
  localparam th_count_650 = 650;
  localparam th_count_651 = 651;
  localparam th_count_652 = 652;
  localparam th_count_653 = 653;
  localparam th_count_654 = 654;
  localparam th_count_655 = 655;
  localparam th_count_656 = 656;
  localparam th_count_657 = 657;
  localparam th_count_658 = 658;
  localparam th_count_659 = 659;
  localparam th_count_660 = 660;
  localparam th_count_661 = 661;
  localparam th_count_662 = 662;
  localparam th_count_663 = 663;
  localparam th_count_664 = 664;
  localparam th_count_665 = 665;
  localparam th_count_666 = 666;
  localparam th_count_667 = 667;
  localparam th_count_668 = 668;
  localparam th_count_669 = 669;
  localparam th_count_670 = 670;
  localparam th_count_671 = 671;
  localparam th_count_672 = 672;
  localparam th_count_673 = 673;
  localparam th_count_674 = 674;
  localparam th_count_675 = 675;
  localparam th_count_676 = 676;
  localparam th_count_677 = 677;
  localparam th_count_678 = 678;
  localparam th_count_679 = 679;
  localparam th_count_680 = 680;
  localparam th_count_681 = 681;
  localparam th_count_682 = 682;
  localparam th_count_683 = 683;
  localparam th_count_684 = 684;
  localparam th_count_685 = 685;
  localparam th_count_686 = 686;
  localparam th_count_687 = 687;
  localparam th_count_688 = 688;
  localparam th_count_689 = 689;
  localparam th_count_690 = 690;
  localparam th_count_691 = 691;
  localparam th_count_692 = 692;
  localparam th_count_693 = 693;
  localparam th_count_694 = 694;
  localparam th_count_695 = 695;
  localparam th_count_696 = 696;
  localparam th_count_697 = 697;
  localparam th_count_698 = 698;
  localparam th_count_699 = 699;
  localparam th_count_700 = 700;
  localparam th_count_701 = 701;
  localparam th_count_702 = 702;
  localparam th_count_703 = 703;
  localparam th_count_704 = 704;
  localparam th_count_705 = 705;
  localparam th_count_706 = 706;
  localparam th_count_707 = 707;
  localparam th_count_708 = 708;
  localparam th_count_709 = 709;
  localparam th_count_710 = 710;
  localparam th_count_711 = 711;
  localparam th_count_712 = 712;
  localparam th_count_713 = 713;
  localparam th_count_714 = 714;
  localparam th_count_715 = 715;
  localparam th_count_716 = 716;
  localparam th_count_717 = 717;
  localparam th_count_718 = 718;
  localparam th_count_719 = 719;
  localparam th_count_720 = 720;
  localparam th_count_721 = 721;
  localparam th_count_722 = 722;
  localparam th_count_723 = 723;
  localparam th_count_724 = 724;
  localparam th_count_725 = 725;
  localparam th_count_726 = 726;
  localparam th_count_727 = 727;
  localparam th_count_728 = 728;
  localparam th_count_729 = 729;
  localparam th_count_730 = 730;
  localparam th_count_731 = 731;
  localparam th_count_732 = 732;
  localparam th_count_733 = 733;
  localparam th_count_734 = 734;
  localparam th_count_735 = 735;
  localparam th_count_736 = 736;
  localparam th_count_737 = 737;
  localparam th_count_738 = 738;
  localparam th_count_739 = 739;
  localparam th_count_740 = 740;
  localparam th_count_741 = 741;
  localparam th_count_742 = 742;
  localparam th_count_743 = 743;
  localparam th_count_744 = 744;
  localparam th_count_745 = 745;
  localparam th_count_746 = 746;
  localparam th_count_747 = 747;
  localparam th_count_748 = 748;
  localparam th_count_749 = 749;
  localparam th_count_750 = 750;
  localparam th_count_751 = 751;
  localparam th_count_752 = 752;
  localparam th_count_753 = 753;
  localparam th_count_754 = 754;
  localparam th_count_755 = 755;
  localparam th_count_756 = 756;
  localparam th_count_757 = 757;
  localparam th_count_758 = 758;
  localparam th_count_759 = 759;
  localparam th_count_760 = 760;
  localparam th_count_761 = 761;
  localparam th_count_762 = 762;
  localparam th_count_763 = 763;
  localparam th_count_764 = 764;
  localparam th_count_765 = 765;
  localparam th_count_766 = 766;
  localparam th_count_767 = 767;
  localparam th_count_768 = 768;
  localparam th_count_769 = 769;
  localparam th_count_770 = 770;
  localparam th_count_771 = 771;
  localparam th_count_772 = 772;
  localparam th_count_773 = 773;
  localparam th_count_774 = 774;
  localparam th_count_775 = 775;
  localparam th_count_776 = 776;
  localparam th_count_777 = 777;
  localparam th_count_778 = 778;
  localparam th_count_779 = 779;
  localparam th_count_780 = 780;
  localparam th_count_781 = 781;
  localparam th_count_782 = 782;
  localparam th_count_783 = 783;
  localparam th_count_784 = 784;
  localparam th_count_785 = 785;
  localparam th_count_786 = 786;
  localparam th_count_787 = 787;
  localparam th_count_788 = 788;
  localparam th_count_789 = 789;
  localparam th_count_790 = 790;
  localparam th_count_791 = 791;
  localparam th_count_792 = 792;
  localparam th_count_793 = 793;
  localparam th_count_794 = 794;
  localparam th_count_795 = 795;
  localparam th_count_796 = 796;
  localparam th_count_797 = 797;
  localparam th_count_798 = 798;
  localparam th_count_799 = 799;
  localparam th_count_800 = 800;
  localparam th_count_801 = 801;
  localparam th_count_802 = 802;
  localparam th_count_803 = 803;
  localparam th_count_804 = 804;
  localparam th_count_805 = 805;
  localparam th_count_806 = 806;
  localparam th_count_807 = 807;
  localparam th_count_808 = 808;
  localparam th_count_809 = 809;
  localparam th_count_810 = 810;
  localparam th_count_811 = 811;
  localparam th_count_812 = 812;
  localparam th_count_813 = 813;
  localparam th_count_814 = 814;
  localparam th_count_815 = 815;
  localparam th_count_816 = 816;
  localparam th_count_817 = 817;
  localparam th_count_818 = 818;
  localparam th_count_819 = 819;
  localparam th_count_820 = 820;
  localparam th_count_821 = 821;
  localparam th_count_822 = 822;
  localparam th_count_823 = 823;
  localparam th_count_824 = 824;
  localparam th_count_825 = 825;
  localparam th_count_826 = 826;
  localparam th_count_827 = 827;
  localparam th_count_828 = 828;
  localparam th_count_829 = 829;
  localparam th_count_830 = 830;
  localparam th_count_831 = 831;
  localparam th_count_832 = 832;
  localparam th_count_833 = 833;
  localparam th_count_834 = 834;
  localparam th_count_835 = 835;
  localparam th_count_836 = 836;
  localparam th_count_837 = 837;
  localparam th_count_838 = 838;
  localparam th_count_839 = 839;
  localparam th_count_840 = 840;
  localparam th_count_841 = 841;
  localparam th_count_842 = 842;
  localparam th_count_843 = 843;
  localparam th_count_844 = 844;
  localparam th_count_845 = 845;
  localparam th_count_846 = 846;
  localparam th_count_847 = 847;
  localparam th_count_848 = 848;
  localparam th_count_849 = 849;
  localparam th_count_850 = 850;
  localparam th_count_851 = 851;
  localparam th_count_852 = 852;
  localparam th_count_853 = 853;
  localparam th_count_854 = 854;
  localparam th_count_855 = 855;
  localparam th_count_856 = 856;
  localparam th_count_857 = 857;
  localparam th_count_858 = 858;
  localparam th_count_859 = 859;
  localparam th_count_860 = 860;
  localparam th_count_861 = 861;
  localparam th_count_862 = 862;
  localparam th_count_863 = 863;
  localparam th_count_864 = 864;
  localparam th_count_865 = 865;
  localparam th_count_866 = 866;
  localparam th_count_867 = 867;
  localparam th_count_868 = 868;
  localparam th_count_869 = 869;
  localparam th_count_870 = 870;
  localparam th_count_871 = 871;
  localparam th_count_872 = 872;
  localparam th_count_873 = 873;

  always @(posedge CLK) begin
    if(RST) begin
      th_count <= th_count_init;
      read_rdata_77 <= 0;
      read_rdata_120 <= 0;
      read_rdata_127 <= 0;
      read_rdata_134 <= 0;
      read_rdata_145 <= 0;
      read_rdata_150 <= 0;
      read_rdata_157 <= 0;
      read_rdata_162 <= 0;
      read_rdata_169 <= 0;
      read_rdata_174 <= 0;
      i <= 0;
      read_rdata_185 <= 0;
      read_rdata_190 <= 0;
      read_rdata_195 <= 0;
      read_rdata_200 <= 0;
      read_rdata_205 <= 0;
      is_secure <= 1;
      read_rdata_218 <= 0;
      read_rdata_231 <= 0;
      read_rdata_236 <= 0;
      read_rdata_243 <= 0;
      read_rdata_248 <= 0;
      read_rdata_253 <= 0;
      read_rdata_258 <= 0;
      read_rdata_263 <= 0;
      read_rdata_268 <= 0;
      read_rdata_273 <= 0;
      read_rdata_278 <= 0;
      read_rdata_285 <= 0;
      read_rdata_290 <= 0;
      read_rdata_295 <= 0;
      read_rdata_300 <= 0;
      read_rdata_305 <= 0;
      read_rdata_310 <= 0;
      read_rdata_315 <= 0;
      read_rdata_320 <= 0;
      _th_count_sum_0 <= 0;
      read_rdata_327 <= 0;
      read_rdata_332 <= 0;
      read_rdata_337 <= 0;
      read_rdata_342 <= 0;
      read_rdata_347 <= 0;
      read_rdata_370 <= 0;
      read_rdata_375 <= 0;
      read_rdata_380 <= 0;
      read_rdata_385 <= 0;
      read_rdata_390 <= 0;
      read_rdata_395 <= 0;
      read_rdata_403 <= 0;
      read_rdata_408 <= 0;
      read_rdata_413 <= 0;
      read_rdata_418 <= 0;
      read_rdata_423 <= 0;
      read_rdata_428 <= 0;
      read_rdata_436 <= 0;
      read_rdata_441 <= 0;
      read_rdata_446 <= 0;
      read_rdata_451 <= 0;
      read_rdata_456 <= 0;
      read_rdata_461 <= 0;
      read_rdata_474 <= 0;
      read_rdata_479 <= 0;
      read_rdata_484 <= 0;
      read_rdata_493 <= 0;
      read_rdata_498 <= 0;
      read_rdata_503 <= 0;
      read_rdata_508 <= 0;
      read_rdata_513 <= 0;
    end else begin
      case(th_count)
        th_count_init: begin
          th_count <= th_count_1;
        end
        th_count_1: begin
          if(1) begin
            th_count <= th_count_2;
          end else begin
            th_count <= th_count_873;
          end
        end
        th_count_2: begin
          if(_saxi_register_0 == 1) begin
            th_count <= th_count_3;
          end 
        end
        th_count_3: begin
          th_count <= th_count_4;
        end
        th_count_4: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_5;
          end 
        end
        th_count_5: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_6;
          end 
        end
        th_count_6: begin
          if(__tmp_76_1) begin
            read_rdata_77 <= data_ram_0_rdata;
          end 
          if(__tmp_76_1) begin
            th_count <= th_count_7;
          end 
        end
        th_count_7: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_8;
          end 
        end
        th_count_8: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_77 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_9;
          end 
        end
        th_count_9: begin
          s_tvalid_i <= 0;
          th_count <= th_count_10;
        end
        th_count_10: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_11;
          end 
        end
        th_count_11: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_12;
          end 
        end
        th_count_12: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_13;
          end 
        end
        th_count_13: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_14;
          end 
        end
        th_count_14: begin
          th_count <= th_count_15;
        end
        th_count_15: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_16;
          end 
        end
        th_count_16: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_17;
          end 
        end
        th_count_17: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_18;
          end 
        end
        th_count_18: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_19;
          end 
        end
        th_count_19: begin
          if(__tmp_119_1) begin
            read_rdata_120 <= data_ram_0_rdata;
          end 
          if(__tmp_119_1) begin
            th_count <= th_count_20;
          end 
        end
        th_count_20: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_21;
          end 
        end
        th_count_21: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_120 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_22;
          end 
        end
        th_count_22: begin
          s_tvalid_i <= 0;
          th_count <= th_count_23;
        end
        th_count_23: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_24;
          end 
        end
        th_count_24: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_25;
          end 
        end
        th_count_25: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_26;
          end 
        end
        th_count_26: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_27;
          end 
        end
        th_count_27: begin
          th_count <= th_count_28;
        end
        th_count_28: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_29;
          end 
        end
        th_count_29: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_30;
          end 
        end
        th_count_30: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_31;
          end 
        end
        th_count_31: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_32;
          end 
        end
        th_count_32: begin
          if(__tmp_126_1) begin
            read_rdata_127 <= data_ram_0_rdata;
          end 
          if(__tmp_126_1) begin
            th_count <= th_count_33;
          end 
        end
        th_count_33: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_34;
          end 
        end
        th_count_34: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_127 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_35;
          end 
        end
        th_count_35: begin
          s_tvalid_i <= 0;
          th_count <= th_count_36;
        end
        th_count_36: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_37;
          end 
        end
        th_count_37: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_38;
          end 
        end
        th_count_38: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_39;
          end 
        end
        th_count_39: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_40;
          end 
        end
        th_count_40: begin
          th_count <= th_count_41;
        end
        th_count_41: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_42;
          end 
        end
        th_count_42: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_43;
          end 
        end
        th_count_43: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_44;
          end 
        end
        th_count_44: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_45;
          end 
        end
        th_count_45: begin
          if(__tmp_133_1) begin
            read_rdata_134 <= data_ram_0_rdata;
          end 
          if(__tmp_133_1) begin
            th_count <= th_count_46;
          end 
        end
        th_count_46: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_47;
          end 
        end
        th_count_47: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_134 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_48;
          end 
        end
        th_count_48: begin
          s_tvalid_i <= 0;
          th_count <= th_count_49;
        end
        th_count_49: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_50;
          end 
        end
        th_count_50: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_51;
          end 
        end
        th_count_51: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_52;
          end 
        end
        th_count_52: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_53;
          end 
        end
        th_count_53: begin
          th_count <= th_count_54;
        end
        th_count_54: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_55;
          end 
        end
        th_count_55: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_56;
          end 
        end
        th_count_56: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_57;
          end 
        end
        th_count_57: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_58;
          end 
        end
        th_count_58: begin
          if(__tmp_144_1) begin
            read_rdata_145 <= mac_ram_0_rdata;
          end 
          if(__tmp_144_1) begin
            th_count <= th_count_59;
          end 
        end
        th_count_59: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_60;
          end 
        end
        th_count_60: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_61;
          end 
        end
        th_count_61: begin
          if(__tmp_149_1) begin
            read_rdata_150 <= mac_ram_0_rdata;
          end 
          if(__tmp_149_1) begin
            th_count <= th_count_62;
          end 
        end
        th_count_62: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_63;
          end 
        end
        th_count_63: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_145 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_64;
          end 
        end
        th_count_64: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_150 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_65;
          end 
        end
        th_count_65: begin
          s_tvalid_i <= 0;
          th_count <= th_count_66;
        end
        th_count_66: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_67;
          end 
        end
        th_count_67: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_68;
          end 
        end
        th_count_68: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_69;
          end 
        end
        th_count_69: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_70;
          end 
        end
        th_count_70: begin
          th_count <= th_count_71;
        end
        th_count_71: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_72;
          end 
        end
        th_count_72: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_73;
          end 
        end
        th_count_73: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_74;
          end 
        end
        th_count_74: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_75;
          end 
        end
        th_count_75: begin
          if(__tmp_156_1) begin
            read_rdata_157 <= mac_ram_0_rdata;
          end 
          if(__tmp_156_1) begin
            th_count <= th_count_76;
          end 
        end
        th_count_76: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_77;
          end 
        end
        th_count_77: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_78;
          end 
        end
        th_count_78: begin
          if(__tmp_161_1) begin
            read_rdata_162 <= mac_ram_0_rdata;
          end 
          if(__tmp_161_1) begin
            th_count <= th_count_79;
          end 
        end
        th_count_79: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_80;
          end 
        end
        th_count_80: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_157 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_81;
          end 
        end
        th_count_81: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_162 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_82;
          end 
        end
        th_count_82: begin
          s_tvalid_i <= 0;
          th_count <= th_count_83;
        end
        th_count_83: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_84;
          end 
        end
        th_count_84: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_85;
          end 
        end
        th_count_85: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_86;
          end 
        end
        th_count_86: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_87;
          end 
        end
        th_count_87: begin
          th_count <= th_count_88;
        end
        th_count_88: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_89;
          end 
        end
        th_count_89: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_90;
          end 
        end
        th_count_90: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_91;
          end 
        end
        th_count_91: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_92;
          end 
        end
        th_count_92: begin
          if(__tmp_168_1) begin
            read_rdata_169 <= mac_ram_0_rdata;
          end 
          if(__tmp_168_1) begin
            th_count <= th_count_93;
          end 
        end
        th_count_93: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_94;
          end 
        end
        th_count_94: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_95;
          end 
        end
        th_count_95: begin
          if(__tmp_173_1) begin
            read_rdata_174 <= mac_ram_0_rdata;
          end 
          if(__tmp_173_1) begin
            th_count <= th_count_96;
          end 
        end
        th_count_96: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_97;
          end 
        end
        th_count_97: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_169 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_98;
          end 
        end
        th_count_98: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_174 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_99;
          end 
        end
        th_count_99: begin
          s_tvalid_i <= 0;
          th_count <= th_count_100;
        end
        th_count_100: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_101;
          end 
        end
        th_count_101: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_102;
          end 
        end
        th_count_102: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_103;
          end 
        end
        th_count_103: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_104;
          end 
        end
        th_count_104: begin
          th_count <= th_count_105;
        end
        th_count_105: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_106;
          end 
        end
        th_count_106: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_107;
          end 
        end
        th_count_107: begin
          root <= hash_calc_reg;
          th_count <= th_count_108;
        end
        th_count_108: begin
          th_count <= th_count_109;
        end
        th_count_109: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_110;
          end 
        end
        th_count_110: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_111;
          end 
        end
        th_count_111: begin
          i <= 0;
          th_count <= th_count_112;
        end
        th_count_112: begin
          if(__tmp_184_1) begin
            read_rdata_185 <= tmp_ram_0_rdata;
          end 
          if(__tmp_184_1) begin
            th_count <= th_count_113;
          end 
        end
        th_count_113: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_114;
          end 
        end
        th_count_114: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_185 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_115;
          end 
        end
        th_count_115: begin
          s_tvalid_i <= 0;
          th_count <= th_count_116;
        end
        th_count_116: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_117;
          end 
        end
        th_count_117: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_118;
          end 
        end
        th_count_118: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_119;
          end 
        end
        th_count_119: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_120;
          end 
        end
        th_count_120: begin
          if(3 + i & 1) begin
            th_count <= th_count_121;
          end 
          if(!(3 + i & 1)) begin
            th_count <= th_count_132;
          end 
        end
        th_count_121: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_122;
          end 
        end
        th_count_122: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_123;
          end 
        end
        th_count_123: begin
          if(__tmp_189_1) begin
            read_rdata_190 <= mac_ram_0_rdata;
          end 
          if(__tmp_189_1) begin
            th_count <= th_count_124;
          end 
        end
        th_count_124: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_125;
          end 
        end
        th_count_125: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_126;
          end 
        end
        th_count_126: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_190 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_127;
          end 
        end
        th_count_127: begin
          s_tvalid_i <= 0;
          th_count <= th_count_128;
        end
        th_count_128: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_129;
          end 
        end
        th_count_129: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_130;
          end 
        end
        th_count_130: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_131;
          end 
        end
        th_count_131: begin
          th_count <= th_count_143;
        end
        th_count_132: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_133;
          end 
        end
        th_count_133: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_134;
          end 
        end
        th_count_134: begin
          if(__tmp_194_1) begin
            read_rdata_195 <= mac_ram_0_rdata;
          end 
          if(__tmp_194_1) begin
            th_count <= th_count_135;
          end 
        end
        th_count_135: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_136;
          end 
        end
        th_count_136: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_195 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_137;
          end 
        end
        th_count_137: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_138;
          end 
        end
        th_count_138: begin
          s_tvalid_i <= 0;
          th_count <= th_count_139;
        end
        th_count_139: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_140;
          end 
        end
        th_count_140: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_141;
          end 
        end
        th_count_141: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_142;
          end 
        end
        th_count_142: begin
          th_count <= th_count_143;
        end
        th_count_143: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_144;
          end 
        end
        th_count_144: begin
          if((3 + i - 1) / 2 & 1) begin
            th_count <= th_count_145;
          end 
          if(!((3 + i - 1) / 2 & 1)) begin
            th_count <= th_count_156;
          end 
        end
        th_count_145: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_146;
          end 
        end
        th_count_146: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_147;
          end 
        end
        th_count_147: begin
          if(__tmp_199_1) begin
            read_rdata_200 <= mac_ram_0_rdata;
          end 
          if(__tmp_199_1) begin
            th_count <= th_count_148;
          end 
        end
        th_count_148: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_149;
          end 
        end
        th_count_149: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_150;
          end 
        end
        th_count_150: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_200 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_151;
          end 
        end
        th_count_151: begin
          s_tvalid_i <= 0;
          th_count <= th_count_152;
        end
        th_count_152: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_153;
          end 
        end
        th_count_153: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_154;
          end 
        end
        th_count_154: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_155;
          end 
        end
        th_count_155: begin
          th_count <= th_count_167;
        end
        th_count_156: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_157;
          end 
        end
        th_count_157: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_158;
          end 
        end
        th_count_158: begin
          if(__tmp_204_1) begin
            read_rdata_205 <= mac_ram_0_rdata;
          end 
          if(__tmp_204_1) begin
            th_count <= th_count_159;
          end 
        end
        th_count_159: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_160;
          end 
        end
        th_count_160: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_205 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_161;
          end 
        end
        th_count_161: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_162;
          end 
        end
        th_count_162: begin
          s_tvalid_i <= 0;
          th_count <= th_count_163;
        end
        th_count_163: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_164;
          end 
        end
        th_count_164: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_165;
          end 
        end
        th_count_165: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_166;
          end 
        end
        th_count_166: begin
          th_count <= th_count_167;
        end
        th_count_167: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_168;
          end 
        end
        th_count_168: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_169;
        end
        th_count_169: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_170;
          end 
        end
        th_count_170: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_171;
          end 
        end
        th_count_171: begin
          if(__tmp_217_1) begin
            read_rdata_218 <= ram_a_0_rdata;
          end 
          if(__tmp_217_1) begin
            th_count <= th_count_172;
          end 
        end
        th_count_172: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_173;
          end 
        end
        th_count_173: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_218 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_174;
          end 
        end
        th_count_174: begin
          s_tvalid_i <= 0;
          th_count <= th_count_175;
        end
        th_count_175: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_176;
          end 
        end
        th_count_176: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_177;
          end 
        end
        th_count_177: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_178;
          end 
        end
        th_count_178: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_179;
          end 
        end
        th_count_179: begin
          th_count <= th_count_180;
        end
        th_count_180: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_181;
          end 
        end
        th_count_181: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_182;
          end 
        end
        th_count_182: begin
          if(__tmp_230_1) begin
            read_rdata_231 <= mac_ram_0_rdata;
          end 
          if(__tmp_230_1) begin
            th_count <= th_count_183;
          end 
        end
        th_count_183: begin
          if(3 + i & 1) begin
            th_count <= th_count_184;
          end 
          if(!(3 + i & 1)) begin
            th_count <= th_count_192;
          end 
        end
        th_count_184: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_185;
          end 
        end
        th_count_185: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_186;
          end 
        end
        th_count_186: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_231 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_187;
          end 
        end
        th_count_187: begin
          s_tvalid_i <= 0;
          th_count <= th_count_188;
        end
        th_count_188: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_189;
          end 
        end
        th_count_189: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_190;
          end 
        end
        th_count_190: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_191;
          end 
        end
        th_count_191: begin
          th_count <= th_count_200;
        end
        th_count_192: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_193;
          end 
        end
        th_count_193: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_231 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_194;
          end 
        end
        th_count_194: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_195;
          end 
        end
        th_count_195: begin
          s_tvalid_i <= 0;
          th_count <= th_count_196;
        end
        th_count_196: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_197;
          end 
        end
        th_count_197: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_198;
          end 
        end
        th_count_198: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_199;
          end 
        end
        th_count_199: begin
          th_count <= th_count_200;
        end
        th_count_200: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_201;
          end 
        end
        th_count_201: begin
          th_count <= th_count_202;
        end
        th_count_202: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_203;
          end 
        end
        th_count_203: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_204;
          end 
        end
        th_count_204: begin
          if(__tmp_235_1) begin
            read_rdata_236 <= mac_ram_0_rdata;
          end 
          if(__tmp_235_1) begin
            th_count <= th_count_205;
          end 
        end
        th_count_205: begin
          if((3 + i - 1) / 2 & 1) begin
            th_count <= th_count_206;
          end 
          if(!((3 + i - 1) / 2 & 1)) begin
            th_count <= th_count_214;
          end 
        end
        th_count_206: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_207;
          end 
        end
        th_count_207: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_208;
          end 
        end
        th_count_208: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_236 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_209;
          end 
        end
        th_count_209: begin
          s_tvalid_i <= 0;
          th_count <= th_count_210;
        end
        th_count_210: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_211;
          end 
        end
        th_count_211: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_212;
          end 
        end
        th_count_212: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_213;
          end 
        end
        th_count_213: begin
          th_count <= th_count_222;
        end
        th_count_214: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_215;
          end 
        end
        th_count_215: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_236 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_216;
          end 
        end
        th_count_216: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_217;
          end 
        end
        th_count_217: begin
          s_tvalid_i <= 0;
          th_count <= th_count_218;
        end
        th_count_218: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_219;
          end 
        end
        th_count_219: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_220;
          end 
        end
        th_count_220: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_221;
          end 
        end
        th_count_221: begin
          th_count <= th_count_222;
        end
        th_count_222: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_223;
          end 
        end
        th_count_223: begin
          th_count <= th_count_224;
        end
        th_count_224: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_225;
          end 
        end
        th_count_225: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_226;
          end 
        end
        th_count_226: begin
          root <= hash_calc_reg;
          th_count <= th_count_227;
        end
        th_count_227: begin
          i <= i + 1;
          th_count <= th_count_228;
        end
        th_count_228: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_112;
          end 
          if(i == 1) begin
            th_count <= th_count_229;
          end 
        end
        th_count_229: begin
          th_count <= th_count_230;
        end
        th_count_230: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_231;
          end 
        end
        th_count_231: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_232;
          end 
        end
        th_count_232: begin
          i <= 0;
          th_count <= th_count_233;
        end
        th_count_233: begin
          if(__tmp_242_1) begin
            read_rdata_243 <= tmp_ram_0_rdata;
          end 
          if(__tmp_242_1) begin
            th_count <= th_count_234;
          end 
        end
        th_count_234: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_235;
          end 
        end
        th_count_235: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_243 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_236;
          end 
        end
        th_count_236: begin
          s_tvalid_i <= 0;
          th_count <= th_count_237;
        end
        th_count_237: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_238;
          end 
        end
        th_count_238: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_239;
          end 
        end
        th_count_239: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_240;
          end 
        end
        th_count_240: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_241;
          end 
        end
        th_count_241: begin
          if(4 + i & 1) begin
            th_count <= th_count_242;
          end 
          if(!(4 + i & 1)) begin
            th_count <= th_count_253;
          end 
        end
        th_count_242: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_243;
          end 
        end
        th_count_243: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_244;
          end 
        end
        th_count_244: begin
          if(__tmp_247_1) begin
            read_rdata_248 <= mac_ram_0_rdata;
          end 
          if(__tmp_247_1) begin
            th_count <= th_count_245;
          end 
        end
        th_count_245: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_246;
          end 
        end
        th_count_246: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_247;
          end 
        end
        th_count_247: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_248 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_248;
          end 
        end
        th_count_248: begin
          s_tvalid_i <= 0;
          th_count <= th_count_249;
        end
        th_count_249: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_250;
          end 
        end
        th_count_250: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_251;
          end 
        end
        th_count_251: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_252;
          end 
        end
        th_count_252: begin
          th_count <= th_count_264;
        end
        th_count_253: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_254;
          end 
        end
        th_count_254: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_255;
          end 
        end
        th_count_255: begin
          if(__tmp_252_1) begin
            read_rdata_253 <= mac_ram_0_rdata;
          end 
          if(__tmp_252_1) begin
            th_count <= th_count_256;
          end 
        end
        th_count_256: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_257;
          end 
        end
        th_count_257: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_253 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_258;
          end 
        end
        th_count_258: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_259;
          end 
        end
        th_count_259: begin
          s_tvalid_i <= 0;
          th_count <= th_count_260;
        end
        th_count_260: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_261;
          end 
        end
        th_count_261: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_262;
          end 
        end
        th_count_262: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_263;
          end 
        end
        th_count_263: begin
          th_count <= th_count_264;
        end
        th_count_264: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_265;
          end 
        end
        th_count_265: begin
          if((4 + i - 1) / 2 & 1) begin
            th_count <= th_count_266;
          end 
          if(!((4 + i - 1) / 2 & 1)) begin
            th_count <= th_count_277;
          end 
        end
        th_count_266: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_267;
          end 
        end
        th_count_267: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_268;
          end 
        end
        th_count_268: begin
          if(__tmp_257_1) begin
            read_rdata_258 <= mac_ram_0_rdata;
          end 
          if(__tmp_257_1) begin
            th_count <= th_count_269;
          end 
        end
        th_count_269: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_270;
          end 
        end
        th_count_270: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_271;
          end 
        end
        th_count_271: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_258 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_272;
          end 
        end
        th_count_272: begin
          s_tvalid_i <= 0;
          th_count <= th_count_273;
        end
        th_count_273: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_274;
          end 
        end
        th_count_274: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_275;
          end 
        end
        th_count_275: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_276;
          end 
        end
        th_count_276: begin
          th_count <= th_count_288;
        end
        th_count_277: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_278;
          end 
        end
        th_count_278: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_279;
          end 
        end
        th_count_279: begin
          if(__tmp_262_1) begin
            read_rdata_263 <= mac_ram_0_rdata;
          end 
          if(__tmp_262_1) begin
            th_count <= th_count_280;
          end 
        end
        th_count_280: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_281;
          end 
        end
        th_count_281: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_263 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_282;
          end 
        end
        th_count_282: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_283;
          end 
        end
        th_count_283: begin
          s_tvalid_i <= 0;
          th_count <= th_count_284;
        end
        th_count_284: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_285;
          end 
        end
        th_count_285: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_286;
          end 
        end
        th_count_286: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_287;
          end 
        end
        th_count_287: begin
          th_count <= th_count_288;
        end
        th_count_288: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_289;
          end 
        end
        th_count_289: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_290;
        end
        th_count_290: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_291;
          end 
        end
        th_count_291: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_292;
          end 
        end
        th_count_292: begin
          if(__tmp_267_1) begin
            read_rdata_268 <= ram_a_0_rdata;
          end 
          if(__tmp_267_1) begin
            th_count <= th_count_293;
          end 
        end
        th_count_293: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_294;
          end 
        end
        th_count_294: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_268 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_295;
          end 
        end
        th_count_295: begin
          s_tvalid_i <= 0;
          th_count <= th_count_296;
        end
        th_count_296: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_297;
          end 
        end
        th_count_297: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_298;
          end 
        end
        th_count_298: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_299;
          end 
        end
        th_count_299: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_300;
          end 
        end
        th_count_300: begin
          th_count <= th_count_301;
        end
        th_count_301: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_302;
          end 
        end
        th_count_302: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_303;
          end 
        end
        th_count_303: begin
          if(__tmp_272_1) begin
            read_rdata_273 <= mac_ram_0_rdata;
          end 
          if(__tmp_272_1) begin
            th_count <= th_count_304;
          end 
        end
        th_count_304: begin
          if(4 + i & 1) begin
            th_count <= th_count_305;
          end 
          if(!(4 + i & 1)) begin
            th_count <= th_count_313;
          end 
        end
        th_count_305: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_306;
          end 
        end
        th_count_306: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_307;
          end 
        end
        th_count_307: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_273 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_308;
          end 
        end
        th_count_308: begin
          s_tvalid_i <= 0;
          th_count <= th_count_309;
        end
        th_count_309: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_310;
          end 
        end
        th_count_310: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_311;
          end 
        end
        th_count_311: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_312;
          end 
        end
        th_count_312: begin
          th_count <= th_count_321;
        end
        th_count_313: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_314;
          end 
        end
        th_count_314: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_273 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_315;
          end 
        end
        th_count_315: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_316;
          end 
        end
        th_count_316: begin
          s_tvalid_i <= 0;
          th_count <= th_count_317;
        end
        th_count_317: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_318;
          end 
        end
        th_count_318: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_319;
          end 
        end
        th_count_319: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_320;
          end 
        end
        th_count_320: begin
          th_count <= th_count_321;
        end
        th_count_321: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_322;
          end 
        end
        th_count_322: begin
          th_count <= th_count_323;
        end
        th_count_323: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_324;
          end 
        end
        th_count_324: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_325;
          end 
        end
        th_count_325: begin
          if(__tmp_277_1) begin
            read_rdata_278 <= mac_ram_0_rdata;
          end 
          if(__tmp_277_1) begin
            th_count <= th_count_326;
          end 
        end
        th_count_326: begin
          if((4 + i - 1) / 2 & 1) begin
            th_count <= th_count_327;
          end 
          if(!((4 + i - 1) / 2 & 1)) begin
            th_count <= th_count_335;
          end 
        end
        th_count_327: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_328;
          end 
        end
        th_count_328: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_329;
          end 
        end
        th_count_329: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_278 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_330;
          end 
        end
        th_count_330: begin
          s_tvalid_i <= 0;
          th_count <= th_count_331;
        end
        th_count_331: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_332;
          end 
        end
        th_count_332: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_333;
          end 
        end
        th_count_333: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_334;
          end 
        end
        th_count_334: begin
          th_count <= th_count_343;
        end
        th_count_335: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_336;
          end 
        end
        th_count_336: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_278 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_337;
          end 
        end
        th_count_337: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_338;
          end 
        end
        th_count_338: begin
          s_tvalid_i <= 0;
          th_count <= th_count_339;
        end
        th_count_339: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_340;
          end 
        end
        th_count_340: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_341;
          end 
        end
        th_count_341: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_342;
          end 
        end
        th_count_342: begin
          th_count <= th_count_343;
        end
        th_count_343: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_344;
          end 
        end
        th_count_344: begin
          th_count <= th_count_345;
        end
        th_count_345: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_346;
          end 
        end
        th_count_346: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_347;
          end 
        end
        th_count_347: begin
          root <= hash_calc_reg;
          th_count <= th_count_348;
        end
        th_count_348: begin
          i <= i + 1;
          th_count <= th_count_349;
        end
        th_count_349: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_233;
          end 
          if(i == 1) begin
            th_count <= th_count_350;
          end 
        end
        th_count_350: begin
          th_count <= th_count_351;
        end
        th_count_351: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_352;
          end 
        end
        th_count_352: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_353;
          end 
        end
        th_count_353: begin
          i <= 0;
          th_count <= th_count_354;
        end
        th_count_354: begin
          if(__tmp_284_1) begin
            read_rdata_285 <= tmp_ram_0_rdata;
          end 
          if(__tmp_284_1) begin
            th_count <= th_count_355;
          end 
        end
        th_count_355: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_356;
          end 
        end
        th_count_356: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_285 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_357;
          end 
        end
        th_count_357: begin
          s_tvalid_i <= 0;
          th_count <= th_count_358;
        end
        th_count_358: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_359;
          end 
        end
        th_count_359: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_360;
          end 
        end
        th_count_360: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_361;
          end 
        end
        th_count_361: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_362;
          end 
        end
        th_count_362: begin
          if(5 + i & 1) begin
            th_count <= th_count_363;
          end 
          if(!(5 + i & 1)) begin
            th_count <= th_count_374;
          end 
        end
        th_count_363: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_364;
          end 
        end
        th_count_364: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_365;
          end 
        end
        th_count_365: begin
          if(__tmp_289_1) begin
            read_rdata_290 <= mac_ram_0_rdata;
          end 
          if(__tmp_289_1) begin
            th_count <= th_count_366;
          end 
        end
        th_count_366: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_367;
          end 
        end
        th_count_367: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_368;
          end 
        end
        th_count_368: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_290 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_369;
          end 
        end
        th_count_369: begin
          s_tvalid_i <= 0;
          th_count <= th_count_370;
        end
        th_count_370: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_371;
          end 
        end
        th_count_371: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_372;
          end 
        end
        th_count_372: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_373;
          end 
        end
        th_count_373: begin
          th_count <= th_count_385;
        end
        th_count_374: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_375;
          end 
        end
        th_count_375: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_376;
          end 
        end
        th_count_376: begin
          if(__tmp_294_1) begin
            read_rdata_295 <= mac_ram_0_rdata;
          end 
          if(__tmp_294_1) begin
            th_count <= th_count_377;
          end 
        end
        th_count_377: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_378;
          end 
        end
        th_count_378: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_295 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_379;
          end 
        end
        th_count_379: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_380;
          end 
        end
        th_count_380: begin
          s_tvalid_i <= 0;
          th_count <= th_count_381;
        end
        th_count_381: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_382;
          end 
        end
        th_count_382: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_383;
          end 
        end
        th_count_383: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_384;
          end 
        end
        th_count_384: begin
          th_count <= th_count_385;
        end
        th_count_385: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_386;
          end 
        end
        th_count_386: begin
          if((5 + i - 1) / 2 & 1) begin
            th_count <= th_count_387;
          end 
          if(!((5 + i - 1) / 2 & 1)) begin
            th_count <= th_count_398;
          end 
        end
        th_count_387: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_388;
          end 
        end
        th_count_388: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_389;
          end 
        end
        th_count_389: begin
          if(__tmp_299_1) begin
            read_rdata_300 <= mac_ram_0_rdata;
          end 
          if(__tmp_299_1) begin
            th_count <= th_count_390;
          end 
        end
        th_count_390: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_391;
          end 
        end
        th_count_391: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_392;
          end 
        end
        th_count_392: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_300 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_393;
          end 
        end
        th_count_393: begin
          s_tvalid_i <= 0;
          th_count <= th_count_394;
        end
        th_count_394: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_395;
          end 
        end
        th_count_395: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_396;
          end 
        end
        th_count_396: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_397;
          end 
        end
        th_count_397: begin
          th_count <= th_count_409;
        end
        th_count_398: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_399;
          end 
        end
        th_count_399: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_400;
          end 
        end
        th_count_400: begin
          if(__tmp_304_1) begin
            read_rdata_305 <= mac_ram_0_rdata;
          end 
          if(__tmp_304_1) begin
            th_count <= th_count_401;
          end 
        end
        th_count_401: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_402;
          end 
        end
        th_count_402: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_305 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_403;
          end 
        end
        th_count_403: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_404;
          end 
        end
        th_count_404: begin
          s_tvalid_i <= 0;
          th_count <= th_count_405;
        end
        th_count_405: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_406;
          end 
        end
        th_count_406: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_407;
          end 
        end
        th_count_407: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_408;
          end 
        end
        th_count_408: begin
          th_count <= th_count_409;
        end
        th_count_409: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_410;
          end 
        end
        th_count_410: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_411;
        end
        th_count_411: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_412;
          end 
        end
        th_count_412: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_413;
          end 
        end
        th_count_413: begin
          if(__tmp_309_1) begin
            read_rdata_310 <= ram_a_0_rdata;
          end 
          if(__tmp_309_1) begin
            th_count <= th_count_414;
          end 
        end
        th_count_414: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_415;
          end 
        end
        th_count_415: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_310 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_416;
          end 
        end
        th_count_416: begin
          s_tvalid_i <= 0;
          th_count <= th_count_417;
        end
        th_count_417: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_418;
          end 
        end
        th_count_418: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_419;
          end 
        end
        th_count_419: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_420;
          end 
        end
        th_count_420: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_421;
          end 
        end
        th_count_421: begin
          th_count <= th_count_422;
        end
        th_count_422: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_423;
          end 
        end
        th_count_423: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_424;
          end 
        end
        th_count_424: begin
          if(__tmp_314_1) begin
            read_rdata_315 <= mac_ram_0_rdata;
          end 
          if(__tmp_314_1) begin
            th_count <= th_count_425;
          end 
        end
        th_count_425: begin
          if(5 + i & 1) begin
            th_count <= th_count_426;
          end 
          if(!(5 + i & 1)) begin
            th_count <= th_count_434;
          end 
        end
        th_count_426: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_427;
          end 
        end
        th_count_427: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_428;
          end 
        end
        th_count_428: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_315 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_429;
          end 
        end
        th_count_429: begin
          s_tvalid_i <= 0;
          th_count <= th_count_430;
        end
        th_count_430: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_431;
          end 
        end
        th_count_431: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_432;
          end 
        end
        th_count_432: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_433;
          end 
        end
        th_count_433: begin
          th_count <= th_count_442;
        end
        th_count_434: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_435;
          end 
        end
        th_count_435: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_315 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_436;
          end 
        end
        th_count_436: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_437;
          end 
        end
        th_count_437: begin
          s_tvalid_i <= 0;
          th_count <= th_count_438;
        end
        th_count_438: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_439;
          end 
        end
        th_count_439: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_440;
          end 
        end
        th_count_440: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_441;
          end 
        end
        th_count_441: begin
          th_count <= th_count_442;
        end
        th_count_442: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_443;
          end 
        end
        th_count_443: begin
          th_count <= th_count_444;
        end
        th_count_444: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_445;
          end 
        end
        th_count_445: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_446;
          end 
        end
        th_count_446: begin
          if(__tmp_319_1) begin
            read_rdata_320 <= mac_ram_0_rdata;
          end 
          if(__tmp_319_1) begin
            th_count <= th_count_447;
          end 
        end
        th_count_447: begin
          if((5 + i - 1) / 2 & 1) begin
            th_count <= th_count_448;
          end 
          if(!((5 + i - 1) / 2 & 1)) begin
            th_count <= th_count_456;
          end 
        end
        th_count_448: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_449;
          end 
        end
        th_count_449: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_450;
          end 
        end
        th_count_450: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_320 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_451;
          end 
        end
        th_count_451: begin
          s_tvalid_i <= 0;
          th_count <= th_count_452;
        end
        th_count_452: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_453;
          end 
        end
        th_count_453: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_454;
          end 
        end
        th_count_454: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_455;
          end 
        end
        th_count_455: begin
          th_count <= th_count_464;
        end
        th_count_456: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_457;
          end 
        end
        th_count_457: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_320 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_458;
          end 
        end
        th_count_458: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_459;
          end 
        end
        th_count_459: begin
          s_tvalid_i <= 0;
          th_count <= th_count_460;
        end
        th_count_460: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_461;
          end 
        end
        th_count_461: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_462;
          end 
        end
        th_count_462: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_463;
          end 
        end
        th_count_463: begin
          th_count <= th_count_464;
        end
        th_count_464: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_465;
          end 
        end
        th_count_465: begin
          th_count <= th_count_466;
        end
        th_count_466: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_467;
          end 
        end
        th_count_467: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_468;
          end 
        end
        th_count_468: begin
          root <= hash_calc_reg;
          th_count <= th_count_469;
        end
        th_count_469: begin
          i <= i + 1;
          th_count <= th_count_470;
        end
        th_count_470: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_354;
          end 
          if(i == 1) begin
            th_count <= th_count_471;
          end 
        end
        th_count_471: begin
          _th_count_sum_0 <= 0;
          th_count <= th_count_472;
        end
        th_count_472: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_473;
          end 
        end
        th_count_473: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_474;
          end 
        end
        th_count_474: begin
          i <= 0;
          th_count <= th_count_475;
        end
        th_count_475: begin
          if(__tmp_326_1) begin
            read_rdata_327 <= tmp_ram_0_rdata;
          end 
          if(__tmp_326_1) begin
            th_count <= th_count_476;
          end 
        end
        th_count_476: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_477;
          end 
        end
        th_count_477: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_327 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_478;
          end 
        end
        th_count_478: begin
          s_tvalid_i <= 0;
          th_count <= th_count_479;
        end
        th_count_479: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_480;
          end 
        end
        th_count_480: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_481;
          end 
        end
        th_count_481: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_482;
          end 
        end
        th_count_482: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_483;
          end 
        end
        th_count_483: begin
          if(3 + i & 1) begin
            th_count <= th_count_484;
          end 
          if(!(3 + i & 1)) begin
            th_count <= th_count_495;
          end 
        end
        th_count_484: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_485;
          end 
        end
        th_count_485: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_486;
          end 
        end
        th_count_486: begin
          if(__tmp_331_1) begin
            read_rdata_332 <= mac_ram_0_rdata;
          end 
          if(__tmp_331_1) begin
            th_count <= th_count_487;
          end 
        end
        th_count_487: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_488;
          end 
        end
        th_count_488: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_489;
          end 
        end
        th_count_489: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_332 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_490;
          end 
        end
        th_count_490: begin
          s_tvalid_i <= 0;
          th_count <= th_count_491;
        end
        th_count_491: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_492;
          end 
        end
        th_count_492: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_493;
          end 
        end
        th_count_493: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_494;
          end 
        end
        th_count_494: begin
          th_count <= th_count_506;
        end
        th_count_495: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_496;
          end 
        end
        th_count_496: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_497;
          end 
        end
        th_count_497: begin
          if(__tmp_336_1) begin
            read_rdata_337 <= mac_ram_0_rdata;
          end 
          if(__tmp_336_1) begin
            th_count <= th_count_498;
          end 
        end
        th_count_498: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_499;
          end 
        end
        th_count_499: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_337 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_500;
          end 
        end
        th_count_500: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_501;
          end 
        end
        th_count_501: begin
          s_tvalid_i <= 0;
          th_count <= th_count_502;
        end
        th_count_502: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_503;
          end 
        end
        th_count_503: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_504;
          end 
        end
        th_count_504: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_505;
          end 
        end
        th_count_505: begin
          th_count <= th_count_506;
        end
        th_count_506: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_507;
          end 
        end
        th_count_507: begin
          if((3 + i - 1) / 2 & 1) begin
            th_count <= th_count_508;
          end 
          if(!((3 + i - 1) / 2 & 1)) begin
            th_count <= th_count_519;
          end 
        end
        th_count_508: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_509;
          end 
        end
        th_count_509: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_510;
          end 
        end
        th_count_510: begin
          if(__tmp_341_1) begin
            read_rdata_342 <= mac_ram_0_rdata;
          end 
          if(__tmp_341_1) begin
            th_count <= th_count_511;
          end 
        end
        th_count_511: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_512;
          end 
        end
        th_count_512: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_513;
          end 
        end
        th_count_513: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_342 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_514;
          end 
        end
        th_count_514: begin
          s_tvalid_i <= 0;
          th_count <= th_count_515;
        end
        th_count_515: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_516;
          end 
        end
        th_count_516: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_517;
          end 
        end
        th_count_517: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_518;
          end 
        end
        th_count_518: begin
          th_count <= th_count_530;
        end
        th_count_519: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_520;
          end 
        end
        th_count_520: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_521;
          end 
        end
        th_count_521: begin
          if(__tmp_346_1) begin
            read_rdata_347 <= mac_ram_0_rdata;
          end 
          if(__tmp_346_1) begin
            th_count <= th_count_522;
          end 
        end
        th_count_522: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_523;
          end 
        end
        th_count_523: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_347 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_524;
          end 
        end
        th_count_524: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_525;
          end 
        end
        th_count_525: begin
          s_tvalid_i <= 0;
          th_count <= th_count_526;
        end
        th_count_526: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_527;
          end 
        end
        th_count_527: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_528;
          end 
        end
        th_count_528: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_529;
          end 
        end
        th_count_529: begin
          th_count <= th_count_530;
        end
        th_count_530: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_531;
          end 
        end
        th_count_531: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_532;
        end
        th_count_532: begin
          i <= i + 1;
          th_count <= th_count_533;
        end
        th_count_533: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_475;
          end 
          if(i == 1) begin
            th_count <= th_count_534;
          end 
        end
        th_count_534: begin
          th_count <= th_count_535;
        end
        th_count_535: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            th_count <= th_count_536;
          end 
        end
        th_count_536: begin
          th_count <= th_count_537;
        end
        th_count_537: begin
          if(_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_538;
          end 
        end
        th_count_538: begin
          if(!_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_539;
          end 
        end
        th_count_539: begin
          if(__tmp_369_1) begin
            read_rdata_370 <= ram_b_0_rdata;
          end 
          if(__tmp_369_1) begin
            th_count <= th_count_540;
          end 
        end
        th_count_540: begin
          _th_count_sum_0 <= _th_count_sum_0 + read_rdata_370;
          th_count <= th_count_541;
        end
        th_count_541: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_542;
          end 
        end
        th_count_542: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_543;
          end 
        end
        th_count_543: begin
          i <= 0;
          th_count <= th_count_544;
        end
        th_count_544: begin
          if(__tmp_374_1) begin
            read_rdata_375 <= tmp_ram_0_rdata;
          end 
          if(__tmp_374_1) begin
            th_count <= th_count_545;
          end 
        end
        th_count_545: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_546;
          end 
        end
        th_count_546: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_375 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_547;
          end 
        end
        th_count_547: begin
          s_tvalid_i <= 0;
          th_count <= th_count_548;
        end
        th_count_548: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_549;
          end 
        end
        th_count_549: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_550;
          end 
        end
        th_count_550: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_551;
          end 
        end
        th_count_551: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_552;
          end 
        end
        th_count_552: begin
          if(4 + i & 1) begin
            th_count <= th_count_553;
          end 
          if(!(4 + i & 1)) begin
            th_count <= th_count_564;
          end 
        end
        th_count_553: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_554;
          end 
        end
        th_count_554: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_555;
          end 
        end
        th_count_555: begin
          if(__tmp_379_1) begin
            read_rdata_380 <= mac_ram_0_rdata;
          end 
          if(__tmp_379_1) begin
            th_count <= th_count_556;
          end 
        end
        th_count_556: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_557;
          end 
        end
        th_count_557: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_558;
          end 
        end
        th_count_558: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_380 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_559;
          end 
        end
        th_count_559: begin
          s_tvalid_i <= 0;
          th_count <= th_count_560;
        end
        th_count_560: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_561;
          end 
        end
        th_count_561: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_562;
          end 
        end
        th_count_562: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_563;
          end 
        end
        th_count_563: begin
          th_count <= th_count_575;
        end
        th_count_564: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_565;
          end 
        end
        th_count_565: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_566;
          end 
        end
        th_count_566: begin
          if(__tmp_384_1) begin
            read_rdata_385 <= mac_ram_0_rdata;
          end 
          if(__tmp_384_1) begin
            th_count <= th_count_567;
          end 
        end
        th_count_567: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_568;
          end 
        end
        th_count_568: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_385 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_569;
          end 
        end
        th_count_569: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_570;
          end 
        end
        th_count_570: begin
          s_tvalid_i <= 0;
          th_count <= th_count_571;
        end
        th_count_571: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_572;
          end 
        end
        th_count_572: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_573;
          end 
        end
        th_count_573: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_574;
          end 
        end
        th_count_574: begin
          th_count <= th_count_575;
        end
        th_count_575: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_576;
          end 
        end
        th_count_576: begin
          if((4 + i - 1) / 2 & 1) begin
            th_count <= th_count_577;
          end 
          if(!((4 + i - 1) / 2 & 1)) begin
            th_count <= th_count_588;
          end 
        end
        th_count_577: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_578;
          end 
        end
        th_count_578: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_579;
          end 
        end
        th_count_579: begin
          if(__tmp_389_1) begin
            read_rdata_390 <= mac_ram_0_rdata;
          end 
          if(__tmp_389_1) begin
            th_count <= th_count_580;
          end 
        end
        th_count_580: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_581;
          end 
        end
        th_count_581: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_582;
          end 
        end
        th_count_582: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_390 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_583;
          end 
        end
        th_count_583: begin
          s_tvalid_i <= 0;
          th_count <= th_count_584;
        end
        th_count_584: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_585;
          end 
        end
        th_count_585: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_586;
          end 
        end
        th_count_586: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_587;
          end 
        end
        th_count_587: begin
          th_count <= th_count_599;
        end
        th_count_588: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_589;
          end 
        end
        th_count_589: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_590;
          end 
        end
        th_count_590: begin
          if(__tmp_394_1) begin
            read_rdata_395 <= mac_ram_0_rdata;
          end 
          if(__tmp_394_1) begin
            th_count <= th_count_591;
          end 
        end
        th_count_591: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_592;
          end 
        end
        th_count_592: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_395 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_593;
          end 
        end
        th_count_593: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_594;
          end 
        end
        th_count_594: begin
          s_tvalid_i <= 0;
          th_count <= th_count_595;
        end
        th_count_595: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_596;
          end 
        end
        th_count_596: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_597;
          end 
        end
        th_count_597: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_598;
          end 
        end
        th_count_598: begin
          th_count <= th_count_599;
        end
        th_count_599: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_600;
          end 
        end
        th_count_600: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_601;
        end
        th_count_601: begin
          i <= i + 1;
          th_count <= th_count_602;
        end
        th_count_602: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_544;
          end 
          if(i == 1) begin
            th_count <= th_count_603;
          end 
        end
        th_count_603: begin
          th_count <= th_count_604;
        end
        th_count_604: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            th_count <= th_count_605;
          end 
        end
        th_count_605: begin
          th_count <= th_count_606;
        end
        th_count_606: begin
          if(_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_607;
          end 
        end
        th_count_607: begin
          if(!_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_608;
          end 
        end
        th_count_608: begin
          if(__tmp_402_1) begin
            read_rdata_403 <= ram_b_0_rdata;
          end 
          if(__tmp_402_1) begin
            th_count <= th_count_609;
          end 
        end
        th_count_609: begin
          _th_count_sum_0 <= _th_count_sum_0 + read_rdata_403;
          th_count <= th_count_610;
        end
        th_count_610: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_611;
          end 
        end
        th_count_611: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_612;
          end 
        end
        th_count_612: begin
          i <= 0;
          th_count <= th_count_613;
        end
        th_count_613: begin
          if(__tmp_407_1) begin
            read_rdata_408 <= tmp_ram_0_rdata;
          end 
          if(__tmp_407_1) begin
            th_count <= th_count_614;
          end 
        end
        th_count_614: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_615;
          end 
        end
        th_count_615: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_408 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_616;
          end 
        end
        th_count_616: begin
          s_tvalid_i <= 0;
          th_count <= th_count_617;
        end
        th_count_617: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_618;
          end 
        end
        th_count_618: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_619;
          end 
        end
        th_count_619: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_620;
          end 
        end
        th_count_620: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_621;
          end 
        end
        th_count_621: begin
          if(5 + i & 1) begin
            th_count <= th_count_622;
          end 
          if(!(5 + i & 1)) begin
            th_count <= th_count_633;
          end 
        end
        th_count_622: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_623;
          end 
        end
        th_count_623: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_624;
          end 
        end
        th_count_624: begin
          if(__tmp_412_1) begin
            read_rdata_413 <= mac_ram_0_rdata;
          end 
          if(__tmp_412_1) begin
            th_count <= th_count_625;
          end 
        end
        th_count_625: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_626;
          end 
        end
        th_count_626: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_627;
          end 
        end
        th_count_627: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_413 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_628;
          end 
        end
        th_count_628: begin
          s_tvalid_i <= 0;
          th_count <= th_count_629;
        end
        th_count_629: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_630;
          end 
        end
        th_count_630: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_631;
          end 
        end
        th_count_631: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_632;
          end 
        end
        th_count_632: begin
          th_count <= th_count_644;
        end
        th_count_633: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_634;
          end 
        end
        th_count_634: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_635;
          end 
        end
        th_count_635: begin
          if(__tmp_417_1) begin
            read_rdata_418 <= mac_ram_0_rdata;
          end 
          if(__tmp_417_1) begin
            th_count <= th_count_636;
          end 
        end
        th_count_636: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_637;
          end 
        end
        th_count_637: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_418 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_638;
          end 
        end
        th_count_638: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_639;
          end 
        end
        th_count_639: begin
          s_tvalid_i <= 0;
          th_count <= th_count_640;
        end
        th_count_640: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_641;
          end 
        end
        th_count_641: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_642;
          end 
        end
        th_count_642: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_643;
          end 
        end
        th_count_643: begin
          th_count <= th_count_644;
        end
        th_count_644: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_645;
          end 
        end
        th_count_645: begin
          if((5 + i - 1) / 2 & 1) begin
            th_count <= th_count_646;
          end 
          if(!((5 + i - 1) / 2 & 1)) begin
            th_count <= th_count_657;
          end 
        end
        th_count_646: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_647;
          end 
        end
        th_count_647: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_648;
          end 
        end
        th_count_648: begin
          if(__tmp_422_1) begin
            read_rdata_423 <= mac_ram_0_rdata;
          end 
          if(__tmp_422_1) begin
            th_count <= th_count_649;
          end 
        end
        th_count_649: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_650;
          end 
        end
        th_count_650: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_651;
          end 
        end
        th_count_651: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_423 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_652;
          end 
        end
        th_count_652: begin
          s_tvalid_i <= 0;
          th_count <= th_count_653;
        end
        th_count_653: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_654;
          end 
        end
        th_count_654: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_655;
          end 
        end
        th_count_655: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_656;
          end 
        end
        th_count_656: begin
          th_count <= th_count_668;
        end
        th_count_657: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_658;
          end 
        end
        th_count_658: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_659;
          end 
        end
        th_count_659: begin
          if(__tmp_427_1) begin
            read_rdata_428 <= mac_ram_0_rdata;
          end 
          if(__tmp_427_1) begin
            th_count <= th_count_660;
          end 
        end
        th_count_660: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_661;
          end 
        end
        th_count_661: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_428 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_662;
          end 
        end
        th_count_662: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_663;
          end 
        end
        th_count_663: begin
          s_tvalid_i <= 0;
          th_count <= th_count_664;
        end
        th_count_664: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_665;
          end 
        end
        th_count_665: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_666;
          end 
        end
        th_count_666: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_667;
          end 
        end
        th_count_667: begin
          th_count <= th_count_668;
        end
        th_count_668: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_669;
          end 
        end
        th_count_669: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_670;
        end
        th_count_670: begin
          i <= i + 1;
          th_count <= th_count_671;
        end
        th_count_671: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_613;
          end 
          if(i == 1) begin
            th_count <= th_count_672;
          end 
        end
        th_count_672: begin
          th_count <= th_count_673;
        end
        th_count_673: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            th_count <= th_count_674;
          end 
        end
        th_count_674: begin
          th_count <= th_count_675;
        end
        th_count_675: begin
          if(_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_676;
          end 
        end
        th_count_676: begin
          if(!_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_677;
          end 
        end
        th_count_677: begin
          if(__tmp_435_1) begin
            read_rdata_436 <= ram_b_0_rdata;
          end 
          if(__tmp_435_1) begin
            th_count <= th_count_678;
          end 
        end
        th_count_678: begin
          _th_count_sum_0 <= _th_count_sum_0 + read_rdata_436;
          th_count <= th_count_679;
        end
        th_count_679: begin
          th_count <= th_count_680;
        end
        th_count_680: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_681;
          end 
        end
        th_count_681: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_682;
          end 
        end
        th_count_682: begin
          i <= 0;
          th_count <= th_count_683;
        end
        th_count_683: begin
          if(__tmp_440_1) begin
            read_rdata_441 <= tmp_ram_0_rdata;
          end 
          if(__tmp_440_1) begin
            th_count <= th_count_684;
          end 
        end
        th_count_684: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_685;
          end 
        end
        th_count_685: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_441 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_686;
          end 
        end
        th_count_686: begin
          s_tvalid_i <= 0;
          th_count <= th_count_687;
        end
        th_count_687: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_688;
          end 
        end
        th_count_688: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_689;
          end 
        end
        th_count_689: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_690;
          end 
        end
        th_count_690: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_691;
          end 
        end
        th_count_691: begin
          if(3 + i & 1) begin
            th_count <= th_count_692;
          end 
          if(!(3 + i & 1)) begin
            th_count <= th_count_703;
          end 
        end
        th_count_692: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_693;
          end 
        end
        th_count_693: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_694;
          end 
        end
        th_count_694: begin
          if(__tmp_445_1) begin
            read_rdata_446 <= mac_ram_0_rdata;
          end 
          if(__tmp_445_1) begin
            th_count <= th_count_695;
          end 
        end
        th_count_695: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_696;
          end 
        end
        th_count_696: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_697;
          end 
        end
        th_count_697: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_446 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_698;
          end 
        end
        th_count_698: begin
          s_tvalid_i <= 0;
          th_count <= th_count_699;
        end
        th_count_699: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_700;
          end 
        end
        th_count_700: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_701;
          end 
        end
        th_count_701: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_702;
          end 
        end
        th_count_702: begin
          th_count <= th_count_714;
        end
        th_count_703: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_704;
          end 
        end
        th_count_704: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_705;
          end 
        end
        th_count_705: begin
          if(__tmp_450_1) begin
            read_rdata_451 <= mac_ram_0_rdata;
          end 
          if(__tmp_450_1) begin
            th_count <= th_count_706;
          end 
        end
        th_count_706: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_707;
          end 
        end
        th_count_707: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_451 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_708;
          end 
        end
        th_count_708: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_709;
          end 
        end
        th_count_709: begin
          s_tvalid_i <= 0;
          th_count <= th_count_710;
        end
        th_count_710: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_711;
          end 
        end
        th_count_711: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_712;
          end 
        end
        th_count_712: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_713;
          end 
        end
        th_count_713: begin
          th_count <= th_count_714;
        end
        th_count_714: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_715;
          end 
        end
        th_count_715: begin
          if((3 + i - 1) / 2 & 1) begin
            th_count <= th_count_716;
          end 
          if(!((3 + i - 1) / 2 & 1)) begin
            th_count <= th_count_727;
          end 
        end
        th_count_716: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_717;
          end 
        end
        th_count_717: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_718;
          end 
        end
        th_count_718: begin
          if(__tmp_455_1) begin
            read_rdata_456 <= mac_ram_0_rdata;
          end 
          if(__tmp_455_1) begin
            th_count <= th_count_719;
          end 
        end
        th_count_719: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_720;
          end 
        end
        th_count_720: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_721;
          end 
        end
        th_count_721: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_456 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_722;
          end 
        end
        th_count_722: begin
          s_tvalid_i <= 0;
          th_count <= th_count_723;
        end
        th_count_723: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_724;
          end 
        end
        th_count_724: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_725;
          end 
        end
        th_count_725: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_726;
          end 
        end
        th_count_726: begin
          th_count <= th_count_738;
        end
        th_count_727: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_728;
          end 
        end
        th_count_728: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_729;
          end 
        end
        th_count_729: begin
          if(__tmp_460_1) begin
            read_rdata_461 <= mac_ram_0_rdata;
          end 
          if(__tmp_460_1) begin
            th_count <= th_count_730;
          end 
        end
        th_count_730: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_731;
          end 
        end
        th_count_731: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_461 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_732;
          end 
        end
        th_count_732: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_733;
          end 
        end
        th_count_733: begin
          s_tvalid_i <= 0;
          th_count <= th_count_734;
        end
        th_count_734: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_735;
          end 
        end
        th_count_735: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_736;
          end 
        end
        th_count_736: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_737;
          end 
        end
        th_count_737: begin
          th_count <= th_count_738;
        end
        th_count_738: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_739;
          end 
        end
        th_count_739: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_740;
        end
        th_count_740: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_741;
          end 
        end
        th_count_741: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_742;
          end 
        end
        th_count_742: begin
          if(__tmp_473_1) begin
            read_rdata_474 <= ram_b_0_rdata;
          end 
          if(__tmp_473_1) begin
            th_count <= th_count_743;
          end 
        end
        th_count_743: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_744;
          end 
        end
        th_count_744: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_474 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_745;
          end 
        end
        th_count_745: begin
          s_tvalid_i <= 0;
          th_count <= th_count_746;
        end
        th_count_746: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_747;
          end 
        end
        th_count_747: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_748;
          end 
        end
        th_count_748: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_749;
          end 
        end
        th_count_749: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_750;
          end 
        end
        th_count_750: begin
          th_count <= th_count_751;
        end
        th_count_751: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_752;
          end 
        end
        th_count_752: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_753;
          end 
        end
        th_count_753: begin
          if(__tmp_478_1) begin
            read_rdata_479 <= mac_ram_0_rdata;
          end 
          if(__tmp_478_1) begin
            th_count <= th_count_754;
          end 
        end
        th_count_754: begin
          if(3 + i & 1) begin
            th_count <= th_count_755;
          end 
          if(!(3 + i & 1)) begin
            th_count <= th_count_763;
          end 
        end
        th_count_755: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_756;
          end 
        end
        th_count_756: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_757;
          end 
        end
        th_count_757: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_479 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_758;
          end 
        end
        th_count_758: begin
          s_tvalid_i <= 0;
          th_count <= th_count_759;
        end
        th_count_759: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_760;
          end 
        end
        th_count_760: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_761;
          end 
        end
        th_count_761: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_762;
          end 
        end
        th_count_762: begin
          th_count <= th_count_771;
        end
        th_count_763: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_764;
          end 
        end
        th_count_764: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_479 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_765;
          end 
        end
        th_count_765: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_766;
          end 
        end
        th_count_766: begin
          s_tvalid_i <= 0;
          th_count <= th_count_767;
        end
        th_count_767: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_768;
          end 
        end
        th_count_768: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_769;
          end 
        end
        th_count_769: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_770;
          end 
        end
        th_count_770: begin
          th_count <= th_count_771;
        end
        th_count_771: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_772;
          end 
        end
        th_count_772: begin
          th_count <= th_count_773;
        end
        th_count_773: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_774;
          end 
        end
        th_count_774: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_775;
          end 
        end
        th_count_775: begin
          if(__tmp_483_1) begin
            read_rdata_484 <= mac_ram_0_rdata;
          end 
          if(__tmp_483_1) begin
            th_count <= th_count_776;
          end 
        end
        th_count_776: begin
          if((3 + i - 1) / 2 & 1) begin
            th_count <= th_count_777;
          end 
          if(!((3 + i - 1) / 2 & 1)) begin
            th_count <= th_count_785;
          end 
        end
        th_count_777: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_778;
          end 
        end
        th_count_778: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_779;
          end 
        end
        th_count_779: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_484 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_780;
          end 
        end
        th_count_780: begin
          s_tvalid_i <= 0;
          th_count <= th_count_781;
        end
        th_count_781: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_782;
          end 
        end
        th_count_782: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_783;
          end 
        end
        th_count_783: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_784;
          end 
        end
        th_count_784: begin
          th_count <= th_count_793;
        end
        th_count_785: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_786;
          end 
        end
        th_count_786: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_484 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_787;
          end 
        end
        th_count_787: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_788;
          end 
        end
        th_count_788: begin
          s_tvalid_i <= 0;
          th_count <= th_count_789;
        end
        th_count_789: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_790;
          end 
        end
        th_count_790: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_791;
          end 
        end
        th_count_791: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_792;
          end 
        end
        th_count_792: begin
          th_count <= th_count_793;
        end
        th_count_793: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_794;
          end 
        end
        th_count_794: begin
          th_count <= th_count_795;
        end
        th_count_795: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_796;
          end 
        end
        th_count_796: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_797;
          end 
        end
        th_count_797: begin
          root <= hash_calc_reg;
          th_count <= th_count_798;
        end
        th_count_798: begin
          i <= i + 1;
          th_count <= th_count_799;
        end
        th_count_799: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_683;
          end 
          if(i == 1) begin
            th_count <= th_count_800;
          end 
        end
        th_count_800: begin
          th_count <= th_count_801;
        end
        th_count_801: begin
          if(_maxi_write_req_idle) begin
            th_count <= th_count_802;
          end 
        end
        th_count_802: begin
          if(_maxi_write_idle && !_maxi_has_outstanding_write) begin
            th_count <= th_count_803;
          end 
        end
        th_count_803: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_804;
          end 
        end
        th_count_804: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_805;
          end 
        end
        th_count_805: begin
          i <= 0;
          th_count <= th_count_806;
        end
        th_count_806: begin
          if(__tmp_492_1) begin
            read_rdata_493 <= tmp_ram_0_rdata;
          end 
          if(__tmp_492_1) begin
            th_count <= th_count_807;
          end 
        end
        th_count_807: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_808;
          end 
        end
        th_count_808: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= read_rdata_493 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_809;
          end 
        end
        th_count_809: begin
          s_tvalid_i <= 0;
          th_count <= th_count_810;
        end
        th_count_810: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_811;
          end 
        end
        th_count_811: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_812;
          end 
        end
        th_count_812: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_813;
          end 
        end
        th_count_813: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_814;
          end 
        end
        th_count_814: begin
          if(3 + i & 1) begin
            th_count <= th_count_815;
          end 
          if(!(3 + i & 1)) begin
            th_count <= th_count_826;
          end 
        end
        th_count_815: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_816;
          end 
        end
        th_count_816: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_817;
          end 
        end
        th_count_817: begin
          if(__tmp_497_1) begin
            read_rdata_498 <= mac_ram_0_rdata;
          end 
          if(__tmp_497_1) begin
            th_count <= th_count_818;
          end 
        end
        th_count_818: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_819;
          end 
        end
        th_count_819: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_820;
          end 
        end
        th_count_820: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_498 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_821;
          end 
        end
        th_count_821: begin
          s_tvalid_i <= 0;
          th_count <= th_count_822;
        end
        th_count_822: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_823;
          end 
        end
        th_count_823: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_824;
          end 
        end
        th_count_824: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_825;
          end 
        end
        th_count_825: begin
          th_count <= th_count_837;
        end
        th_count_826: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_827;
          end 
        end
        th_count_827: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_828;
          end 
        end
        th_count_828: begin
          if(__tmp_502_1) begin
            read_rdata_503 <= mac_ram_0_rdata;
          end 
          if(__tmp_502_1) begin
            th_count <= th_count_829;
          end 
        end
        th_count_829: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_830;
          end 
        end
        th_count_830: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_503 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_831;
          end 
        end
        th_count_831: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_832;
          end 
        end
        th_count_832: begin
          s_tvalid_i <= 0;
          th_count <= th_count_833;
        end
        th_count_833: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_834;
          end 
        end
        th_count_834: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_835;
          end 
        end
        th_count_835: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_836;
          end 
        end
        th_count_836: begin
          th_count <= th_count_837;
        end
        th_count_837: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_838;
          end 
        end
        th_count_838: begin
          if((3 + i - 1) / 2 & 1) begin
            th_count <= th_count_839;
          end 
          if(!((3 + i - 1) / 2 & 1)) begin
            th_count <= th_count_850;
          end 
        end
        th_count_839: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_840;
          end 
        end
        th_count_840: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_841;
          end 
        end
        th_count_841: begin
          if(__tmp_507_1) begin
            read_rdata_508 <= mac_ram_0_rdata;
          end 
          if(__tmp_507_1) begin
            th_count <= th_count_842;
          end 
        end
        th_count_842: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_843;
          end 
        end
        th_count_843: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_844;
          end 
        end
        th_count_844: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_508 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_845;
          end 
        end
        th_count_845: begin
          s_tvalid_i <= 0;
          th_count <= th_count_846;
        end
        th_count_846: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_847;
          end 
        end
        th_count_847: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_848;
          end 
        end
        th_count_848: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_849;
          end 
        end
        th_count_849: begin
          th_count <= th_count_861;
        end
        th_count_850: begin
          if(_maxi_read_req_idle) begin
            th_count <= th_count_851;
          end 
        end
        th_count_851: begin
          if(_maxi_read_idle) begin
            th_count <= th_count_852;
          end 
        end
        th_count_852: begin
          if(__tmp_512_1) begin
            read_rdata_513 <= mac_ram_0_rdata;
          end 
          if(__tmp_512_1) begin
            th_count <= th_count_853;
          end 
        end
        th_count_853: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h36363636363636363636363636363636;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_854;
          end 
        end
        th_count_854: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= read_rdata_513 & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_855;
          end 
        end
        th_count_855: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= hash_calc_reg & 512'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_856;
          end 
        end
        th_count_856: begin
          s_tvalid_i <= 0;
          th_count <= th_count_857;
        end
        th_count_857: begin
          if(digest_valid_o) begin
            mac <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_858;
          end 
        end
        th_count_858: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 0;
          s_tdata_i <= 128'h597208cf39e5664c ^ 128'h5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c5c;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_859;
          end 
        end
        th_count_859: begin
          s_tvalid_i <= 1;
          s_tlast_i <= 1;
          s_tdata_i <= mac;
          if(s_tvalid_i & s_tready_o) begin
            th_count <= th_count_860;
          end 
        end
        th_count_860: begin
          th_count <= th_count_861;
        end
        th_count_861: begin
          if(digest_valid_o) begin
            hash_calc_reg <= digest_o;
          end 
          if(digest_valid_o) begin
            th_count <= th_count_862;
          end 
        end
        th_count_862: begin
          if(hash_calc_reg != root) begin
            is_secure <= 0;
          end 
          th_count <= th_count_863;
        end
        th_count_863: begin
          i <= i + 1;
          th_count <= th_count_864;
        end
        th_count_864: begin
          if(i == 1) begin
            i <= 0;
          end 
          if(i < 1) begin
            th_count <= th_count_806;
          end 
          if(i == 1) begin
            th_count <= th_count_865;
          end 
        end
        th_count_865: begin
          th_count <= th_count_866;
        end
        th_count_866: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            th_count <= th_count_867;
          end 
        end
        th_count_867: begin
          th_count <= th_count_868;
        end
        th_count_868: begin
          if(_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_869;
          end 
        end
        th_count_869: begin
          if(!_copy_tmp_ram_ram_b_busy) begin
            th_count <= th_count_870;
          end 
        end
        th_count_870: begin
          th_count <= th_count_871;
        end
        th_count_871: begin
          th_count <= th_count_872;
        end
        th_count_872: begin
          th_count <= th_count_1;
        end
      endcase
    end
  end

  localparam _maxi_read_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_read_req_fsm <= _maxi_read_req_fsm_init;
      _maxi_read_cont <= 0;
    end else begin
      case(_maxi_read_req_fsm)
        _maxi_read_req_fsm_init: begin
          if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full) begin
            _maxi_read_req_fsm <= _maxi_read_req_fsm_1;
          end 
        end
        _maxi_read_req_fsm_1: begin
          if(maxi_arready || !maxi_arvalid) begin
            _maxi_read_cont <= 1;
          end 
          if((maxi_arready || !maxi_arvalid) && (_maxi_read_global_size == 0)) begin
            _maxi_read_cont <= 0;
          end 
          if(maxi_arready || !maxi_arvalid) begin
            _maxi_read_req_fsm <= _maxi_read_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_read_data_fsm_1 = 1;
  localparam _maxi_read_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
    end else begin
      case(_maxi_read_data_fsm)
        _maxi_read_data_fsm_init: begin
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
          if(!_maxi_read_data_busy && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_1;
          end 
        end
        _maxi_read_data_fsm_1: begin
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
          _maxi_read_data_fsm <= _maxi_read_data_fsm_2;
        end
        _maxi_read_data_fsm_2: begin
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
          if(_maxi_rvalid_sb_0 && (_maxi_read_local_size_buf <= 1)) begin
            _maxi_read_data_fsm <= _maxi_read_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_0_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_0 <= write_burst_fsm_0_init;
      write_burst_addr_71 <= 0;
      write_burst_stride_72 <= 0;
      write_burst_length_73 <= 0;
      write_burst_done_74 <= 0;
    end else begin
      case(write_burst_fsm_0)
        write_burst_fsm_0_init: begin
          write_burst_addr_71 <= _maxi_read_local_addr_buf;
          write_burst_stride_72 <= _maxi_read_local_stride_buf;
          write_burst_length_73 <= _maxi_read_local_size_buf;
          write_burst_done_74 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 1) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_0 <= write_burst_fsm_0_1;
          end 
        end
        write_burst_fsm_0_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_addr_71 <= write_burst_addr_71 + write_burst_stride_72;
            write_burst_length_73 <= write_burst_length_73 - 1;
            write_burst_done_74 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_73 <= 1)) begin
            write_burst_done_74 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_done_74 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_73 <= 1)) begin
            write_burst_fsm_0 <= write_burst_fsm_0_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_fsm_0 <= write_burst_fsm_0_init;
          end 
          if(0) begin
            write_burst_fsm_0 <= write_burst_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_write_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_write_req_fsm <= _maxi_write_req_fsm_init;
      _maxi_write_cont <= 0;
    end else begin
      case(_maxi_write_req_fsm)
        _maxi_write_req_fsm_init: begin
          if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full) begin
            _maxi_write_req_fsm <= _maxi_write_req_fsm_1;
          end 
        end
        _maxi_write_req_fsm_1: begin
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6)) begin
            _maxi_write_cont <= 1;
          end 
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6) && (_maxi_write_global_size == 0)) begin
            _maxi_write_cont <= 0;
          end 
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (_maxi_outstanding_wcount < 6)) begin
            _maxi_write_req_fsm <= _maxi_write_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_write_data_fsm_1 = 1;
  localparam _maxi_write_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
    end else begin
      case(_maxi_write_data_fsm)
        _maxi_write_data_fsm_init: begin
          if(!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
          if(!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 2)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
          if(!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 3)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
          if(!_maxi_write_data_busy && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 4)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
        end
        _maxi_write_data_fsm_1: begin
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
        end
        _maxi_write_data_fsm_2: begin
          if((_maxi_write_op_sel_buf == 1) && read_burst_rvalid_111 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && read_burst_rlast_112) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
          if((_maxi_write_op_sel_buf == 2) && read_burst_rvalid_211 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && read_burst_rlast_212) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
          if((_maxi_write_op_sel_buf == 3) && read_burst_rvalid_224 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && read_burst_rlast_225) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
          if((_maxi_write_op_sel_buf == 4) && read_burst_rvalid_467 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0)) && read_burst_rlast_468) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_1_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_1 <= read_burst_fsm_1_init;
      read_burst_addr_108 <= 0;
      read_burst_stride_109 <= 0;
      read_burst_length_110 <= 0;
      read_burst_rvalid_111 <= 0;
      read_burst_rlast_112 <= 0;
    end else begin
      case(read_burst_fsm_1)
        read_burst_fsm_1_init: begin
          read_burst_addr_108 <= _maxi_write_local_addr_buf;
          read_burst_stride_109 <= _maxi_write_local_stride_buf;
          read_burst_length_110 <= _maxi_write_size_buf;
          read_burst_rvalid_111 <= 0;
          read_burst_rlast_112 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 1) && (_maxi_write_size_buf > 0)) begin
            read_burst_fsm_1 <= read_burst_fsm_1_1;
          end 
        end
        read_burst_fsm_1_1: begin
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_110 > 0)) begin
            read_burst_addr_108 <= read_burst_addr_108 + read_burst_stride_109;
            read_burst_length_110 <= read_burst_length_110 - 1;
            read_burst_rvalid_111 <= 1;
          end 
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_110 <= 1)) begin
            read_burst_rlast_112 <= 1;
          end 
          if(read_burst_rlast_112 && read_burst_rvalid_111 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_rvalid_111 <= 0;
            read_burst_rlast_112 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_111 <= 0;
            read_burst_rlast_112 <= 0;
          end 
          if(read_burst_rlast_112 && read_burst_rvalid_111 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_fsm_1 <= read_burst_fsm_1_init;
          end 
          if(0) begin
            read_burst_fsm_1 <= read_burst_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_2_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_2 <= write_burst_fsm_2_init;
      write_burst_addr_139 <= 0;
      write_burst_stride_140 <= 0;
      write_burst_length_141 <= 0;
      write_burst_done_142 <= 0;
    end else begin
      case(write_burst_fsm_2)
        write_burst_fsm_2_init: begin
          write_burst_addr_139 <= _maxi_read_local_addr_buf;
          write_burst_stride_140 <= _maxi_read_local_stride_buf;
          write_burst_length_141 <= _maxi_read_local_size_buf;
          write_burst_done_142 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 2) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_2 <= write_burst_fsm_2_1;
          end 
        end
        write_burst_fsm_2_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_addr_139 <= write_burst_addr_139 + write_burst_stride_140;
            write_burst_length_141 <= write_burst_length_141 - 1;
            write_burst_done_142 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_141 <= 1)) begin
            write_burst_done_142 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_done_142 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_141 <= 1)) begin
            write_burst_fsm_2 <= write_burst_fsm_2_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_fsm_2 <= write_burst_fsm_2_init;
          end 
          if(0) begin
            write_burst_fsm_2 <= write_burst_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_3_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_3 <= write_burst_fsm_3_init;
      write_burst_addr_179 <= 0;
      write_burst_stride_180 <= 0;
      write_burst_length_181 <= 0;
      write_burst_done_182 <= 0;
    end else begin
      case(write_burst_fsm_3)
        write_burst_fsm_3_init: begin
          write_burst_addr_179 <= _maxi_read_local_addr_buf;
          write_burst_stride_180 <= _maxi_read_local_stride_buf;
          write_burst_length_181 <= _maxi_read_local_size_buf;
          write_burst_done_182 <= 0;
          if((_maxi_read_data_fsm == 1) && (_maxi_read_op_sel_buf == 3) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_fsm_3 <= write_burst_fsm_3_1;
          end 
        end
        write_burst_fsm_3_1: begin
          if(_maxi_rvalid_sb_0) begin
            write_burst_addr_179 <= write_burst_addr_179 + write_burst_stride_180;
            write_burst_length_181 <= write_burst_length_181 - 1;
            write_burst_done_182 <= 0;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_181 <= 1)) begin
            write_burst_done_182 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_done_182 <= 1;
          end 
          if(_maxi_rvalid_sb_0 && (write_burst_length_181 <= 1)) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
          if(_maxi_rvalid_sb_0 && 0) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
          if(0) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_4_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_4 <= read_burst_fsm_4_init;
      read_burst_addr_208 <= 0;
      read_burst_stride_209 <= 0;
      read_burst_length_210 <= 0;
      read_burst_rvalid_211 <= 0;
      read_burst_rlast_212 <= 0;
    end else begin
      case(read_burst_fsm_4)
        read_burst_fsm_4_init: begin
          read_burst_addr_208 <= _maxi_write_local_addr_buf;
          read_burst_stride_209 <= _maxi_write_local_stride_buf;
          read_burst_length_210 <= _maxi_write_size_buf;
          read_burst_rvalid_211 <= 0;
          read_burst_rlast_212 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 2) && (_maxi_write_size_buf > 0)) begin
            read_burst_fsm_4 <= read_burst_fsm_4_1;
          end 
        end
        read_burst_fsm_4_1: begin
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_210 > 0)) begin
            read_burst_addr_208 <= read_burst_addr_208 + read_burst_stride_209;
            read_burst_length_210 <= read_burst_length_210 - 1;
            read_burst_rvalid_211 <= 1;
          end 
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_210 <= 1)) begin
            read_burst_rlast_212 <= 1;
          end 
          if(read_burst_rlast_212 && read_burst_rvalid_211 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_rvalid_211 <= 0;
            read_burst_rlast_212 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_211 <= 0;
            read_burst_rlast_212 <= 0;
          end 
          if(read_burst_rlast_212 && read_burst_rvalid_211 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_fsm_4 <= read_burst_fsm_4_init;
          end 
          if(0) begin
            read_burst_fsm_4 <= read_burst_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_5_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_5 <= read_burst_fsm_5_init;
      read_burst_addr_221 <= 0;
      read_burst_stride_222 <= 0;
      read_burst_length_223 <= 0;
      read_burst_rvalid_224 <= 0;
      read_burst_rlast_225 <= 0;
    end else begin
      case(read_burst_fsm_5)
        read_burst_fsm_5_init: begin
          read_burst_addr_221 <= _maxi_write_local_addr_buf;
          read_burst_stride_222 <= _maxi_write_local_stride_buf;
          read_burst_length_223 <= _maxi_write_size_buf;
          read_burst_rvalid_224 <= 0;
          read_burst_rlast_225 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 3) && (_maxi_write_size_buf > 0)) begin
            read_burst_fsm_5 <= read_burst_fsm_5_1;
          end 
        end
        read_burst_fsm_5_1: begin
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_223 > 0)) begin
            read_burst_addr_221 <= read_burst_addr_221 + read_burst_stride_222;
            read_burst_length_223 <= read_burst_length_223 - 1;
            read_burst_rvalid_224 <= 1;
          end 
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_223 <= 1)) begin
            read_burst_rlast_225 <= 1;
          end 
          if(read_burst_rlast_225 && read_burst_rvalid_224 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_rvalid_224 <= 0;
            read_burst_rlast_225 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_224 <= 0;
            read_burst_rlast_225 <= 0;
          end 
          if(read_burst_rlast_225 && read_burst_rvalid_224 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_fsm_5 <= read_burst_fsm_5_init;
          end 
          if(0) begin
            read_burst_fsm_5 <= read_burst_fsm_5_init;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _copy_tmp_ram_ram_b_src_source_ram_renable <= 0;
      _copy_tmp_ram_ram_b_src_source_fifo_deq <= 0;
      _copy_tmp_ram_ram_b_src_idle <= 1;
      _copy_tmp_ram_ram_b_dst_sink_wenable <= 0;
      _copy_tmp_ram_ram_b_dst_sink_fifo_enq <= 0;
      _copy_tmp_ram_ram_b_src_source_mode <= 5'b0;
      _copy_tmp_ram_ram_b_src_source_offset <= 0;
      _copy_tmp_ram_ram_b_src_source_size <= 0;
      _copy_tmp_ram_ram_b_src_source_stride <= 0;
      _copy_tmp_ram_ram_b_src_source_sel <= 0;
      _copy_tmp_ram_ram_b_src_source_offset_buf <= 0;
      _copy_tmp_ram_ram_b_src_source_size_buf <= 0;
      _copy_tmp_ram_ram_b_src_source_stride_buf <= 0;
      __variable_wdata_0 <= 0;
      _copy_tmp_ram_ram_b_src_source_ram_raddr <= 0;
      _copy_tmp_ram_ram_b_src_source_count <= 0;
      _tmp_352 <= 0;
      _tmp_353 <= 0;
      _copy_tmp_ram_ram_b_dst_sink_mode <= 5'b0;
      _copy_tmp_ram_ram_b_dst_sink_offset <= 0;
      _copy_tmp_ram_ram_b_dst_sink_size <= 0;
      _copy_tmp_ram_ram_b_dst_sink_stride <= 0;
      _copy_tmp_ram_ram_b_dst_sink_sel <= 0;
      _copy_tmp_ram_ram_b_dst_sink_offset_buf <= 0;
      _copy_tmp_ram_ram_b_dst_sink_size_buf <= 0;
      _copy_tmp_ram_ram_b_dst_sink_stride_buf <= 0;
      _copy_tmp_ram_ram_b_dst_sink_waddr <= 0;
      _copy_tmp_ram_ram_b_dst_sink_count <= 0;
      _copy_tmp_ram_ram_b_dst_sink_wdata <= 0;
      _tmp_355 <= 0;
      _tmp_356 <= 0;
      _tmp_357 <= 0;
      _tmp_360 <= 0;
      _tmp_361 <= 0;
      _tmp_362 <= 0;
      _tmp_363 <= 0;
      _tmp_364 <= 0;
      _tmp_365 <= 0;
      _tmp_366 <= 0;
      _tmp_367 <= 0;
      _copy_tmp_ram_ram_b_busy_reg <= 0;
      _tmp_398 <= 0;
      _tmp_399 <= 0;
      _tmp_431 <= 0;
      _tmp_432 <= 0;
      _tmp_516 <= 0;
      _tmp_517 <= 0;
    end else begin
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_src_source_ram_renable <= 0;
        _copy_tmp_ram_ram_b_src_source_fifo_deq <= 0;
      end 
      _copy_tmp_ram_ram_b_src_idle <= _copy_tmp_ram_ram_b_src_idle;
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_dst_sink_wenable <= 0;
        _copy_tmp_ram_ram_b_dst_sink_fifo_enq <= 0;
      end 
      if(_set_flag_348) begin
        _copy_tmp_ram_ram_b_src_source_mode <= 5'b1;
        _copy_tmp_ram_ram_b_src_source_offset <= 0;
        _copy_tmp_ram_ram_b_src_source_size <= 1;
        _copy_tmp_ram_ram_b_src_source_stride <= 1;
      end 
      if(_set_flag_348) begin
        _copy_tmp_ram_ram_b_src_source_sel <= 1;
      end 
      if(_copy_tmp_ram_ram_b_source_start && _copy_tmp_ram_ram_b_src_source_mode & 5'b1 && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_src_source_offset_buf <= _copy_tmp_ram_ram_b_src_source_offset;
        _copy_tmp_ram_ram_b_src_source_size_buf <= _copy_tmp_ram_ram_b_src_source_size;
        _copy_tmp_ram_ram_b_src_source_stride_buf <= _copy_tmp_ram_ram_b_src_source_stride;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready && _copy_tmp_ram_ram_b_source_busy && _copy_tmp_ram_ram_b_is_root) begin
        __variable_wdata_0 <= _copy_tmp_ram_ram_b_src_source_ram_rdata;
      end 
      if((_copy_tmp_ram_ram_b_src_source_fsm_0 == 1) && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_src_idle <= 0;
        _copy_tmp_ram_ram_b_src_source_ram_raddr <= _copy_tmp_ram_ram_b_src_source_offset_buf;
        _copy_tmp_ram_ram_b_src_source_ram_renable <= 1;
        _copy_tmp_ram_ram_b_src_source_count <= _copy_tmp_ram_ram_b_src_source_size_buf;
      end 
      if((_copy_tmp_ram_ram_b_src_source_fsm_0 == 2) && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_src_source_ram_raddr <= _copy_tmp_ram_ram_b_src_source_ram_raddr + _copy_tmp_ram_ram_b_src_source_stride_buf;
        _copy_tmp_ram_ram_b_src_source_ram_renable <= 1;
        _copy_tmp_ram_ram_b_src_source_count <= _copy_tmp_ram_ram_b_src_source_count - 1;
      end 
      if((_copy_tmp_ram_ram_b_src_source_fsm_0 == 2) && (_copy_tmp_ram_ram_b_src_source_count == 1) && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_src_source_ram_renable <= 0;
        _copy_tmp_ram_ram_b_src_idle <= 1;
      end 
      if((_copy_tmp_ram_ram_b_src_source_fsm_0 == 2) && _copy_tmp_ram_ram_b_source_stop && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_src_source_ram_renable <= 0;
        _copy_tmp_ram_ram_b_src_idle <= 1;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_352 <= _set_flag_351;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_353 <= _tmp_352;
      end 
      if(_tmp_353) begin
        _copy_tmp_ram_ram_b_dst_sink_mode <= 5'b1;
        _copy_tmp_ram_ram_b_dst_sink_offset <= 0;
        _copy_tmp_ram_ram_b_dst_sink_size <= 1;
        _copy_tmp_ram_ram_b_dst_sink_stride <= 1;
      end 
      if(_tmp_353) begin
        _copy_tmp_ram_ram_b_dst_sink_sel <= 2;
      end 
      if(_copy_tmp_ram_ram_b_sink_start && _copy_tmp_ram_ram_b_dst_sink_mode & 5'b1 && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_dst_sink_offset_buf <= _copy_tmp_ram_ram_b_dst_sink_offset;
        _copy_tmp_ram_ram_b_dst_sink_size_buf <= _copy_tmp_ram_ram_b_dst_sink_size;
        _copy_tmp_ram_ram_b_dst_sink_stride_buf <= _copy_tmp_ram_ram_b_dst_sink_stride;
      end 
      if((_copy_tmp_ram_ram_b_dst_sink_fsm_1 == 1) && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_dst_sink_waddr <= _copy_tmp_ram_ram_b_dst_sink_offset_buf - _copy_tmp_ram_ram_b_dst_sink_stride_buf;
        _copy_tmp_ram_ram_b_dst_sink_count <= _copy_tmp_ram_ram_b_dst_sink_size_buf;
      end 
      if((_copy_tmp_ram_ram_b_dst_sink_fsm_1 == 2) && _copy_tmp_ram_ram_b_stream_oready) begin
        _copy_tmp_ram_ram_b_dst_sink_waddr <= _copy_tmp_ram_ram_b_dst_sink_waddr + _copy_tmp_ram_ram_b_dst_sink_stride_buf;
        _copy_tmp_ram_ram_b_dst_sink_wdata <= copy_tmp_ram_ram_b_dst_data;
        _copy_tmp_ram_ram_b_dst_sink_wenable <= 1;
        _copy_tmp_ram_ram_b_dst_sink_count <= _copy_tmp_ram_ram_b_dst_sink_count - 1;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_355 <= _copy_tmp_ram_ram_b_source_start;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_356 <= _tmp_355;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_357 <= _tmp_356;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_360 <= _tmp_359;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_361 <= _copy_tmp_ram_ram_b_source_start;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_362 <= _tmp_361;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_363 <= _copy_tmp_ram_ram_b_source_stop;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_364 <= _tmp_363;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_365 <= _copy_tmp_ram_ram_b_source_busy;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_366 <= _tmp_365;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_367 <= _copy_tmp_ram_ram_b_sink_busy;
      end 
      if(!_copy_tmp_ram_ram_b_sink_busy && _tmp_367) begin
        _copy_tmp_ram_ram_b_busy_reg <= 0;
      end 
      if(_copy_tmp_ram_ram_b_source_busy) begin
        _copy_tmp_ram_ram_b_busy_reg <= 1;
      end 
      if(_set_flag_396) begin
        _copy_tmp_ram_ram_b_src_source_mode <= 5'b1;
        _copy_tmp_ram_ram_b_src_source_offset <= 0;
        _copy_tmp_ram_ram_b_src_source_size <= 1;
        _copy_tmp_ram_ram_b_src_source_stride <= 1;
      end 
      if(_set_flag_396) begin
        _copy_tmp_ram_ram_b_src_source_sel <= 1;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_398 <= _set_flag_397;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_399 <= _tmp_398;
      end 
      if(_tmp_399) begin
        _copy_tmp_ram_ram_b_dst_sink_mode <= 5'b1;
        _copy_tmp_ram_ram_b_dst_sink_offset <= 1;
        _copy_tmp_ram_ram_b_dst_sink_size <= 1;
        _copy_tmp_ram_ram_b_dst_sink_stride <= 1;
      end 
      if(_tmp_399) begin
        _copy_tmp_ram_ram_b_dst_sink_sel <= 2;
      end 
      if(_set_flag_429) begin
        _copy_tmp_ram_ram_b_src_source_mode <= 5'b1;
        _copy_tmp_ram_ram_b_src_source_offset <= 0;
        _copy_tmp_ram_ram_b_src_source_size <= 1;
        _copy_tmp_ram_ram_b_src_source_stride <= 1;
      end 
      if(_set_flag_429) begin
        _copy_tmp_ram_ram_b_src_source_sel <= 1;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_431 <= _set_flag_430;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_432 <= _tmp_431;
      end 
      if(_tmp_432) begin
        _copy_tmp_ram_ram_b_dst_sink_mode <= 5'b1;
        _copy_tmp_ram_ram_b_dst_sink_offset <= 2;
        _copy_tmp_ram_ram_b_dst_sink_size <= 1;
        _copy_tmp_ram_ram_b_dst_sink_stride <= 1;
      end 
      if(_tmp_432) begin
        _copy_tmp_ram_ram_b_dst_sink_sel <= 2;
      end 
      if(_set_flag_514) begin
        _copy_tmp_ram_ram_b_src_source_mode <= 5'b1;
        _copy_tmp_ram_ram_b_src_source_offset <= 0;
        _copy_tmp_ram_ram_b_src_source_size <= 1;
        _copy_tmp_ram_ram_b_src_source_stride <= 1;
      end 
      if(_set_flag_514) begin
        _copy_tmp_ram_ram_b_src_source_sel <= 1;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_516 <= _set_flag_515;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready) begin
        _tmp_517 <= _tmp_516;
      end 
      if(_tmp_517) begin
        _copy_tmp_ram_ram_b_dst_sink_mode <= 5'b1;
        _copy_tmp_ram_ram_b_dst_sink_offset <= 0;
        _copy_tmp_ram_ram_b_dst_sink_size <= 1;
        _copy_tmp_ram_ram_b_dst_sink_stride <= 1;
      end 
      if(_tmp_517) begin
        _copy_tmp_ram_ram_b_dst_sink_sel <= 2;
      end 
    end
  end

  localparam _copy_tmp_ram_ram_b_fsm_1 = 1;
  localparam _copy_tmp_ram_ram_b_fsm_2 = 2;
  localparam _copy_tmp_ram_ram_b_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _copy_tmp_ram_ram_b_fsm <= _copy_tmp_ram_ram_b_fsm_init;
      _copy_tmp_ram_ram_b_source_start <= 0;
      _copy_tmp_ram_ram_b_source_busy <= 0;
      _copy_tmp_ram_ram_b_stream_ivalid <= 0;
    end else begin
      if(_copy_tmp_ram_ram_b_stream_oready && _tmp_357) begin
        _copy_tmp_ram_ram_b_stream_ivalid <= 1;
      end 
      if(_copy_tmp_ram_ram_b_stream_oready && _tmp_360) begin
        _copy_tmp_ram_ram_b_stream_ivalid <= 0;
      end 
      case(_copy_tmp_ram_ram_b_fsm)
        _copy_tmp_ram_ram_b_fsm_init: begin
          if(_copy_tmp_ram_ram_b_run_flag) begin
            _copy_tmp_ram_ram_b_source_start <= 1;
          end 
          if(_copy_tmp_ram_ram_b_run_flag) begin
            _copy_tmp_ram_ram_b_fsm <= _copy_tmp_ram_ram_b_fsm_1;
          end 
        end
        _copy_tmp_ram_ram_b_fsm_1: begin
          if(_copy_tmp_ram_ram_b_source_start && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_source_start <= 0;
            _copy_tmp_ram_ram_b_source_busy <= 1;
          end 
          if(_copy_tmp_ram_ram_b_source_start && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_fsm <= _copy_tmp_ram_ram_b_fsm_2;
          end 
        end
        _copy_tmp_ram_ram_b_fsm_2: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_fsm <= _copy_tmp_ram_ram_b_fsm_3;
          end 
        end
        _copy_tmp_ram_ram_b_fsm_3: begin
          if(_copy_tmp_ram_ram_b_stream_oready && (_copy_tmp_ram_ram_b_src_idle && (_copy_tmp_ram_ram_b_fsm == 3))) begin
            _copy_tmp_ram_ram_b_source_busy <= 0;
          end 
          if(_copy_tmp_ram_ram_b_stream_oready && (_copy_tmp_ram_ram_b_src_idle && (_copy_tmp_ram_ram_b_fsm == 3)) && _copy_tmp_ram_ram_b_run_flag) begin
            _copy_tmp_ram_ram_b_source_start <= 1;
          end 
          if(_copy_tmp_ram_ram_b_stream_oready && (_copy_tmp_ram_ram_b_src_idle && (_copy_tmp_ram_ram_b_fsm == 3))) begin
            _copy_tmp_ram_ram_b_fsm <= _copy_tmp_ram_ram_b_fsm_init;
          end 
          if(_copy_tmp_ram_ram_b_stream_oready && (_copy_tmp_ram_ram_b_src_idle && (_copy_tmp_ram_ram_b_fsm == 3)) && _copy_tmp_ram_ram_b_run_flag) begin
            _copy_tmp_ram_ram_b_fsm <= _copy_tmp_ram_ram_b_fsm_1;
          end 
        end
      endcase
    end
  end

  localparam _copy_tmp_ram_ram_b_src_source_fsm_0_1 = 1;
  localparam _copy_tmp_ram_ram_b_src_source_fsm_0_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _copy_tmp_ram_ram_b_src_source_fsm_0 <= _copy_tmp_ram_ram_b_src_source_fsm_0_init;
    end else begin
      case(_copy_tmp_ram_ram_b_src_source_fsm_0)
        _copy_tmp_ram_ram_b_src_source_fsm_0_init: begin
          if(_copy_tmp_ram_ram_b_source_start && _copy_tmp_ram_ram_b_src_source_mode & 5'b1 && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_src_source_fsm_0 <= _copy_tmp_ram_ram_b_src_source_fsm_0_1;
          end 
        end
        _copy_tmp_ram_ram_b_src_source_fsm_0_1: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_src_source_fsm_0 <= _copy_tmp_ram_ram_b_src_source_fsm_0_2;
          end 
        end
        _copy_tmp_ram_ram_b_src_source_fsm_0_2: begin
          if((_copy_tmp_ram_ram_b_src_source_count == 1) && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_src_source_fsm_0 <= _copy_tmp_ram_ram_b_src_source_fsm_0_init;
          end 
          if(_copy_tmp_ram_ram_b_source_stop && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_src_source_fsm_0 <= _copy_tmp_ram_ram_b_src_source_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam _copy_tmp_ram_ram_b_dst_sink_fsm_1_1 = 1;
  localparam _copy_tmp_ram_ram_b_dst_sink_fsm_1_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _copy_tmp_ram_ram_b_dst_sink_fsm_1 <= _copy_tmp_ram_ram_b_dst_sink_fsm_1_init;
    end else begin
      case(_copy_tmp_ram_ram_b_dst_sink_fsm_1)
        _copy_tmp_ram_ram_b_dst_sink_fsm_1_init: begin
          if(_copy_tmp_ram_ram_b_sink_start && _copy_tmp_ram_ram_b_dst_sink_mode & 5'b1 && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_dst_sink_fsm_1 <= _copy_tmp_ram_ram_b_dst_sink_fsm_1_1;
          end 
        end
        _copy_tmp_ram_ram_b_dst_sink_fsm_1_1: begin
          if(_copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_dst_sink_fsm_1 <= _copy_tmp_ram_ram_b_dst_sink_fsm_1_2;
          end 
        end
        _copy_tmp_ram_ram_b_dst_sink_fsm_1_2: begin
          if((_copy_tmp_ram_ram_b_dst_sink_count == 1) && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_dst_sink_fsm_1 <= _copy_tmp_ram_ram_b_dst_sink_fsm_1_init;
          end 
          if(_copy_tmp_ram_ram_b_sink_stop && _copy_tmp_ram_ram_b_stream_oready) begin
            _copy_tmp_ram_ram_b_dst_sink_fsm_1 <= _copy_tmp_ram_ram_b_dst_sink_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_6_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_6 <= read_burst_fsm_6_init;
      read_burst_addr_464 <= 0;
      read_burst_stride_465 <= 0;
      read_burst_length_466 <= 0;
      read_burst_rvalid_467 <= 0;
      read_burst_rlast_468 <= 0;
    end else begin
      case(read_burst_fsm_6)
        read_burst_fsm_6_init: begin
          read_burst_addr_464 <= _maxi_write_local_addr_buf;
          read_burst_stride_465 <= _maxi_write_local_stride_buf;
          read_burst_length_466 <= _maxi_write_size_buf;
          read_burst_rvalid_467 <= 0;
          read_burst_rlast_468 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 4) && (_maxi_write_size_buf > 0)) begin
            read_burst_fsm_6 <= read_burst_fsm_6_1;
          end 
        end
        read_burst_fsm_6_1: begin
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_466 > 0)) begin
            read_burst_addr_464 <= read_burst_addr_464 + read_burst_stride_465;
            read_burst_length_466 <= read_burst_length_466 - 1;
            read_burst_rvalid_467 <= 1;
          end 
          if((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0) && (read_burst_length_466 <= 1)) begin
            read_burst_rlast_468 <= 1;
          end 
          if(read_burst_rlast_468 && read_burst_rvalid_467 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_rvalid_467 <= 0;
            read_burst_rlast_468 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_467 <= 0;
            read_burst_rlast_468 <= 0;
          end 
          if(read_burst_rlast_468 && read_burst_rvalid_467 && ((_maxi_wready_sb_0 || !_maxi_wvalid_sb_0) && (_maxi_write_size_buf > 0))) begin
            read_burst_fsm_6 <= read_burst_fsm_6_init;
          end 
          if(0) begin
            read_burst_fsm_6 <= read_burst_fsm_6_init;
          end 
        end
      endcase
    end
  end


endmodule



module ram_a
(
  input CLK,
  input [4-1:0] ram_a_0_addr,
  output [256-1:0] ram_a_0_rdata,
  input [256-1:0] ram_a_0_wdata,
  input ram_a_0_wenable,
  input ram_a_0_enable
);

  reg [256-1:0] ram_a_0_rdata_out;
  assign ram_a_0_rdata = ram_a_0_rdata_out;
  reg [256-1:0] mem [0:16-1];

  always @(posedge CLK) begin
    if(ram_a_0_enable) begin
      if(ram_a_0_wenable) begin
        mem[ram_a_0_addr] <= ram_a_0_wdata;
        ram_a_0_rdata_out <= ram_a_0_wdata;
      end else begin
        ram_a_0_rdata_out <= mem[ram_a_0_addr];
      end
    end 
  end


endmodule



module ram_b
(
  input CLK,
  input [4-1:0] ram_b_0_addr,
  output [256-1:0] ram_b_0_rdata,
  input [256-1:0] ram_b_0_wdata,
  input ram_b_0_wenable,
  input ram_b_0_enable
);

  reg [256-1:0] ram_b_0_rdata_out;
  assign ram_b_0_rdata = ram_b_0_rdata_out;
  reg [256-1:0] mem [0:16-1];

  always @(posedge CLK) begin
    if(ram_b_0_enable) begin
      if(ram_b_0_wenable) begin
        mem[ram_b_0_addr] <= ram_b_0_wdata;
        ram_b_0_rdata_out <= ram_b_0_wdata;
      end else begin
        ram_b_0_rdata_out <= mem[ram_b_0_addr];
      end
    end 
  end


endmodule



module _maxi_read_req_fifo
(
  input CLK,
  input RST,
  input _maxi_read_req_fifo_enq,
  input [137-1:0] _maxi_read_req_fifo_wdata,
  output _maxi_read_req_fifo_full,
  output _maxi_read_req_fifo_almost_full,
  input _maxi_read_req_fifo_deq,
  output [137-1:0] _maxi_read_req_fifo_rdata,
  output _maxi_read_req_fifo_empty,
  output _maxi_read_req_fifo_almost_empty
);

  reg [137-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [137-1:0] rdata;
  assign _maxi_read_req_fifo_full = is_full;
  assign _maxi_read_req_fifo_almost_full = is_almost_full || is_full;
  assign _maxi_read_req_fifo_empty = is_empty;
  assign _maxi_read_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _maxi_read_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_maxi_read_req_fifo_enq && !is_full) begin
        mem[head] <= _maxi_read_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_maxi_read_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module _maxi_write_req_fifo
(
  input CLK,
  input RST,
  input _maxi_write_req_fifo_enq,
  input [137-1:0] _maxi_write_req_fifo_wdata,
  output _maxi_write_req_fifo_full,
  output _maxi_write_req_fifo_almost_full,
  input _maxi_write_req_fifo_deq,
  output [137-1:0] _maxi_write_req_fifo_rdata,
  output _maxi_write_req_fifo_empty,
  output _maxi_write_req_fifo_almost_empty
);

  reg [137-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [137-1:0] rdata;
  assign _maxi_write_req_fifo_full = is_full;
  assign _maxi_write_req_fifo_almost_full = is_almost_full || is_full;
  assign _maxi_write_req_fifo_empty = is_empty;
  assign _maxi_write_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _maxi_write_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_maxi_write_req_fifo_enq && !is_full) begin
        mem[head] <= _maxi_write_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_maxi_write_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module tmp_ram
(
  input CLK,
  input [10-1:0] tmp_ram_0_addr,
  output [256-1:0] tmp_ram_0_rdata,
  input [256-1:0] tmp_ram_0_wdata,
  input tmp_ram_0_wenable,
  input tmp_ram_0_enable
);

  reg [256-1:0] tmp_ram_0_rdata_out;
  assign tmp_ram_0_rdata = tmp_ram_0_rdata_out;
  reg [256-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(tmp_ram_0_enable) begin
      if(tmp_ram_0_wenable) begin
        mem[tmp_ram_0_addr] <= tmp_ram_0_wdata;
        tmp_ram_0_rdata_out <= tmp_ram_0_wdata;
      end else begin
        tmp_ram_0_rdata_out <= mem[tmp_ram_0_addr];
      end
    end 
  end


endmodule



module data_ram
(
  input CLK,
  input [1-1:0] data_ram_0_addr,
  output [256-1:0] data_ram_0_rdata,
  input [256-1:0] data_ram_0_wdata,
  input data_ram_0_wenable,
  input data_ram_0_enable
);

  reg [256-1:0] data_ram_0_rdata_out;
  assign data_ram_0_rdata = data_ram_0_rdata_out;
  reg [256-1:0] mem [0:2-1];

  always @(posedge CLK) begin
    if(data_ram_0_enable) begin
      if(data_ram_0_wenable) begin
        mem[data_ram_0_addr] <= data_ram_0_wdata;
        data_ram_0_rdata_out <= data_ram_0_wdata;
      end else begin
        data_ram_0_rdata_out <= mem[data_ram_0_addr];
      end
    end 
  end


endmodule



module mac_ram
(
  input CLK,
  input [2-1:0] mac_ram_0_addr,
  output [256-1:0] mac_ram_0_rdata,
  input [256-1:0] mac_ram_0_wdata,
  input mac_ram_0_wenable,
  input mac_ram_0_enable
);

  reg [256-1:0] mac_ram_0_rdata_out;
  assign mac_ram_0_rdata = mac_ram_0_rdata_out;
  reg [256-1:0] mem [0:4-1];

  always @(posedge CLK) begin
    if(mac_ram_0_enable) begin
      if(mac_ram_0_wenable) begin
        mem[mac_ram_0_addr] <= mac_ram_0_wdata;
        mac_ram_0_rdata_out <= mac_ram_0_wdata;
      end else begin
        mac_ram_0_rdata_out <= mem[mac_ram_0_addr];
      end
    end 
  end


endmodule



module calc_mac_ram
(
  input CLK,
  input [1-1:0] calc_mac_ram_0_addr,
  output [256-1:0] calc_mac_ram_0_rdata,
  input [256-1:0] calc_mac_ram_0_wdata,
  input calc_mac_ram_0_wenable,
  input calc_mac_ram_0_enable
);

  reg [256-1:0] calc_mac_ram_0_rdata_out;
  assign calc_mac_ram_0_rdata = calc_mac_ram_0_rdata_out;
  reg [256-1:0] mem [0:2-1];

  always @(posedge CLK) begin
    if(calc_mac_ram_0_enable) begin
      if(calc_mac_ram_0_wenable) begin
        mem[calc_mac_ram_0_addr] <= calc_mac_ram_0_wdata;
        calc_mac_ram_0_rdata_out <= calc_mac_ram_0_wdata;
      end else begin
        calc_mac_ram_0_rdata_out <= mem[calc_mac_ram_0_addr];
      end
    end 
  end


endmodule

//======================================================================
//
// sha256_stream.v
// --------
// Top level wrapper for the SHA-256 hash function providing
// a simple stream interface with 512 bit data access.
//
//
// Author: Olof Kindgren
// Copyright (c) 2016, Olof Kindgren
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or 
// without modification, are permitted provided that the following 
// conditions are met: 
// 
// 1. Redistributions of source code must retain the above copyright 
//    notice, this list of conditions and the following disclaimer. 
// 
// 2. Redistributions in binary form must reproduce the above copyright 
//    notice, this list of conditions and the following disclaimer in 
//    the documentation and/or other materials provided with the 
//    distribution. 
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module sha256_stream
  (input 	  clk,
   input 	  rst,
   input 	  mode,
   input [511:0]  s_tdata_i,
   input 	  s_tlast_i,
   input 	  s_tvalid_i,
   output 	  s_tready_o,
   output [255:0] digest_o,
   output 	  digest_valid_o);

   reg 		  first_block;

   always @(posedge clk) begin
      if (s_tvalid_i & s_tready_o)
	first_block <= s_tlast_i;

      if (rst) begin
	 first_block <= 1'b1;
      end
   end
   
   sha256_core core
     (.clk     (clk),
      .reset_n (~rst),

      .init(s_tvalid_i & first_block),
      .next(s_tvalid_i & !first_block),
      .mode (mode),

      .block(s_tdata_i),

      .ready(s_tready_o),

      .digest       (digest_o),
      .digest_valid (digest_valid_o));

endmodule


//======================================================================
//
// sha256.v
// --------
// Top level wrapper for the SHA-256 hash function providing
// a simple memory like interface with 32 bit data access.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2013, 201, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module sha256(
              // Clock and reset.
              input wire           clk,
              input wire           reset_n,

              // Control.
              input wire           cs,
              input wire           we,

              // Data ports.
              input wire  [7 : 0]  address,
              input wire  [31 : 0] write_data,
              output wire [31 : 0] read_data,
              output wire          error
             );

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam ADDR_NAME0       = 8'h00;
  localparam ADDR_NAME1       = 8'h01;
  localparam ADDR_VERSION     = 8'h02;

  localparam ADDR_CTRL        = 8'h08;
  localparam CTRL_INIT_BIT    = 0;
  localparam CTRL_NEXT_BIT    = 1;
  localparam CTRL_MODE_BIT    = 2;

  localparam ADDR_STATUS      = 8'h09;
  localparam STATUS_READY_BIT = 0;
  localparam STATUS_VALID_BIT = 1;

  localparam ADDR_BLOCK0    = 8'h10;
  localparam ADDR_BLOCK15   = 8'h1f;

  localparam ADDR_DIGEST0   = 8'h20;
  localparam ADDR_DIGEST7   = 8'h27;

  localparam CORE_NAME0     = 32'h73686132; // "sha2"
  localparam CORE_NAME1     = 32'h2d323536; // "-256"
  localparam CORE_VERSION   = 32'h312e3830; // "1.80"

  localparam MODE_SHA_224   = 1'h0;
  localparam MODE_SHA_256   = 1'h1;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg init_reg;
  reg init_new;

  reg next_reg;
  reg next_new;

  reg mode_reg;
  reg mode_new;
  reg mode_we;

  reg ready_reg;

  reg [31 : 0] block_reg [0 : 15];
  reg          block_we;

  reg [255 : 0] digest_reg;

  reg digest_valid_reg;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  wire           core_ready;
  wire [511 : 0] core_block;
  wire [255 : 0] core_digest;
  wire           core_digest_valid;

  reg [31 : 0]   tmp_read_data;
  reg            tmp_error;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign core_block = {block_reg[00], block_reg[01], block_reg[02], block_reg[03],
                       block_reg[04], block_reg[05], block_reg[06], block_reg[07],
                       block_reg[08], block_reg[09], block_reg[10], block_reg[11],
                       block_reg[12], block_reg[13], block_reg[14], block_reg[15]};

  assign read_data = tmp_read_data;
  assign error     = tmp_error;


  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  sha256_core core(
                   .clk(clk),
                   .reset_n(reset_n),

                   .init(init_reg),
                   .next(next_reg),
                   .mode(mode_reg),

                   .block(core_block),

                   .ready(core_ready),

                   .digest(core_digest),
                   .digest_valid(core_digest_valid)
                  );


  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      integer i;

      if (!reset_n)
        begin
          for (i = 0 ; i < 16 ; i = i + 1)
            block_reg[i] <= 32'h0;

          init_reg         <= 0;
          next_reg         <= 0;
          ready_reg        <= 0;
          mode_reg         <= MODE_SHA_256;
          digest_reg       <= 256'h0;
          digest_valid_reg <= 0;
        end
      else
        begin
          ready_reg        <= core_ready;
          digest_valid_reg <= core_digest_valid;
          init_reg         <= init_new;
          next_reg         <= next_new;

          if (mode_we)
            mode_reg <= mode_new;

          if (core_digest_valid)
            digest_reg <= core_digest;

          if (block_we)
            block_reg[address[3 : 0]] <= write_data;
        end
    end // reg_update


  //----------------------------------------------------------------
  // api_logic
  //
  // Implementation of the api logic. If cs is enabled will either
  // try to write to or read from the internal registers.
  //----------------------------------------------------------------
  always @*
    begin : api_logic
      init_new      = 0;
      next_new      = 0;
      mode_new      = 0;
      mode_we       = 0;
      block_we      = 0;
      tmp_read_data = 32'h0;
      tmp_error     = 0;

      if (cs)
        begin
          if (we)
            begin
              if (address == ADDR_CTRL)
                begin
                  init_new = write_data[CTRL_INIT_BIT];
                  next_new = write_data[CTRL_NEXT_BIT];
                  mode_new = write_data[CTRL_MODE_BIT];
                  mode_we  = 1;
                end

              if ((address >= ADDR_BLOCK0) && (address <= ADDR_BLOCK15))
                block_we = 1;
            end // if (we)

          else
            begin
              if ((address >= ADDR_BLOCK0) && (address <= ADDR_BLOCK15))
                tmp_read_data = block_reg[address[3 : 0]];

              if ((address >= ADDR_DIGEST0) && (address <= ADDR_DIGEST7))
                tmp_read_data = digest_reg[(7 - (address - ADDR_DIGEST0)) * 32 +: 32];

              case (address)
                // Read operations.
                ADDR_NAME0:
                  tmp_read_data = CORE_NAME0;

                ADDR_NAME1:
                  tmp_read_data = CORE_NAME1;

                ADDR_VERSION:
                  tmp_read_data = CORE_VERSION;

                ADDR_CTRL:
                  tmp_read_data = {29'h0, mode_reg, next_reg, init_reg};

                ADDR_STATUS:
                  tmp_read_data = {30'h0, digest_valid_reg, ready_reg};

                default:
                  begin
                  end
              endcase // case (address)
            end
        end
    end // addr_decoder
endmodule // sha256

//======================================================================
// EOF sha256.v
//======================================================================


//======================================================================
//
// sha256_core.v
// -------------
// Verilog 2001 implementation of the SHA-256 hash function.
// This is the internal core with wide interfaces.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2013, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module sha256_core(
                   input wire            clk,
                   input wire            reset_n,

                   input wire            init,
                   input wire            next,
                   input wire            mode,

                   input wire [511 : 0]  block,

                   output wire           ready,
                   output wire [255 : 0] digest,
                   output wire           digest_valid
                  );


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam SHA224_H0_0 = 32'hc1059ed8;
  localparam SHA224_H0_1 = 32'h367cd507;
  localparam SHA224_H0_2 = 32'h3070dd17;
  localparam SHA224_H0_3 = 32'hf70e5939;
  localparam SHA224_H0_4 = 32'hffc00b31;
  localparam SHA224_H0_5 = 32'h68581511;
  localparam SHA224_H0_6 = 32'h64f98fa7;
  localparam SHA224_H0_7 = 32'hbefa4fa4;

  localparam SHA256_H0_0 = 32'h6a09e667;
  localparam SHA256_H0_1 = 32'hbb67ae85;
  localparam SHA256_H0_2 = 32'h3c6ef372;
  localparam SHA256_H0_3 = 32'ha54ff53a;
  localparam SHA256_H0_4 = 32'h510e527f;
  localparam SHA256_H0_5 = 32'h9b05688c;
  localparam SHA256_H0_6 = 32'h1f83d9ab;
  localparam SHA256_H0_7 = 32'h5be0cd19;

  localparam SHA256_ROUNDS = 63;

  localparam CTRL_IDLE   = 0;
  localparam CTRL_ROUNDS = 1;
  localparam CTRL_DONE   = 2;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [31 : 0] a_reg;
  reg [31 : 0] a_new;
  reg [31 : 0] b_reg;
  reg [31 : 0] b_new;
  reg [31 : 0] c_reg;
  reg [31 : 0] c_new;
  reg [31 : 0] d_reg;
  reg [31 : 0] d_new;
  reg [31 : 0] e_reg;
  reg [31 : 0] e_new;
  reg [31 : 0] f_reg;
  reg [31 : 0] f_new;
  reg [31 : 0] g_reg;
  reg [31 : 0] g_new;
  reg [31 : 0] h_reg;
  reg [31 : 0] h_new;
  reg          a_h_we;

  reg [31 : 0] H0_reg;
  reg [31 : 0] H0_new;
  reg [31 : 0] H1_reg;
  reg [31 : 0] H1_new;
  reg [31 : 0] H2_reg;
  reg [31 : 0] H2_new;
  reg [31 : 0] H3_reg;
  reg [31 : 0] H3_new;
  reg [31 : 0] H4_reg;
  reg [31 : 0] H4_new;
  reg [31 : 0] H5_reg;
  reg [31 : 0] H5_new;
  reg [31 : 0] H6_reg;
  reg [31 : 0] H6_new;
  reg [31 : 0] H7_reg;
  reg [31 : 0] H7_new;
  reg          H_we;

  reg [5 : 0] t_ctr_reg;
  reg [5 : 0] t_ctr_new;
  reg         t_ctr_we;
  reg         t_ctr_inc;
  reg         t_ctr_rst;

  reg digest_valid_reg;
  reg digest_valid_new;
  reg digest_valid_we;

  reg [1 : 0] sha256_ctrl_reg;
  reg [1 : 0] sha256_ctrl_new;
  reg         sha256_ctrl_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg digest_init;
  reg digest_update;

  reg state_init;
  reg state_update;

  reg first_block;

  reg ready_flag;

  reg [31 : 0] t1;
  reg [31 : 0] t2;

  wire [31 : 0] k_data;

  reg           w_init;
  reg           w_next;
  reg [5 : 0]   w_round;
  wire [31 : 0] w_data;


  //----------------------------------------------------------------
  // Module instantiantions.
  //----------------------------------------------------------------
  sha256_k_constants k_constants_inst(
                                      .round(t_ctr_reg),
                                      .K(k_data)
                                     );


  sha256_w_mem w_mem_inst(
                          .clk(clk),
                          .reset_n(reset_n),

                          .block(block),
                          .round(t_ctr_reg),

                          .init(w_init),
                          .next(w_next),
                          .w(w_data)
                         );


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign ready = ready_flag;

  assign digest = {H0_reg, H1_reg, H2_reg, H3_reg,
                   H4_reg, H5_reg, H6_reg, H7_reg};

  assign digest_valid = digest_valid_reg;


  //----------------------------------------------------------------
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      if (!reset_n)
        begin
          a_reg            <= 32'h0;
          b_reg            <= 32'h0;
          c_reg            <= 32'h0;
          d_reg            <= 32'h0;
          e_reg            <= 32'h0;
          f_reg            <= 32'h0;
          g_reg            <= 32'h0;
          h_reg            <= 32'h0;
          H0_reg           <= 32'h0;
          H1_reg           <= 32'h0;
          H2_reg           <= 32'h0;
          H3_reg           <= 32'h0;
          H4_reg           <= 32'h0;
          H5_reg           <= 32'h0;
          H6_reg           <= 32'h0;
          H7_reg           <= 32'h0;
          digest_valid_reg <= 0;
          t_ctr_reg        <= 6'h0;
          sha256_ctrl_reg  <= CTRL_IDLE;
        end
      else
        begin

          if (a_h_we)
            begin
              a_reg <= a_new;
              b_reg <= b_new;
              c_reg <= c_new;
              d_reg <= d_new;
              e_reg <= e_new;
              f_reg <= f_new;
              g_reg <= g_new;
              h_reg <= h_new;
            end

          if (H_we)
            begin
              H0_reg <= H0_new;
              H1_reg <= H1_new;
              H2_reg <= H2_new;
              H3_reg <= H3_new;
              H4_reg <= H4_new;
              H5_reg <= H5_new;
              H6_reg <= H6_new;
              H7_reg <= H7_new;
            end

          if (t_ctr_we)
            t_ctr_reg <= t_ctr_new;

          if (digest_valid_we)
            digest_valid_reg <= digest_valid_new;

          if (sha256_ctrl_we)
            sha256_ctrl_reg <= sha256_ctrl_new;
        end
    end // reg_update


  //----------------------------------------------------------------
  // digest_logic
  //
  // The logic needed to init as well as update the digest.
  //----------------------------------------------------------------
  always @*
    begin : digest_logic
      H0_new = 32'h0;
      H1_new = 32'h0;
      H2_new = 32'h0;
      H3_new = 32'h0;
      H4_new = 32'h0;
      H5_new = 32'h0;
      H6_new = 32'h0;
      H7_new = 32'h0;
      H_we = 0;

      if (digest_init)
        begin
          H_we = 1;
          if (mode)
            begin
              H0_new = SHA256_H0_0;
              H1_new = SHA256_H0_1;
              H2_new = SHA256_H0_2;
              H3_new = SHA256_H0_3;
              H4_new = SHA256_H0_4;
              H5_new = SHA256_H0_5;
              H6_new = SHA256_H0_6;
              H7_new = SHA256_H0_7;
            end
          else
            begin
              H0_new = SHA224_H0_0;
              H1_new = SHA224_H0_1;
              H2_new = SHA224_H0_2;
              H3_new = SHA224_H0_3;
              H4_new = SHA224_H0_4;
              H5_new = SHA224_H0_5;
              H6_new = SHA224_H0_6;
              H7_new = SHA224_H0_7;
            end
        end

      if (digest_update)
        begin
          H0_new = H0_reg + a_reg;
          H1_new = H1_reg + b_reg;
          H2_new = H2_reg + c_reg;
          H3_new = H3_reg + d_reg;
          H4_new = H4_reg + e_reg;
          H5_new = H5_reg + f_reg;
          H6_new = H6_reg + g_reg;
          H7_new = H7_reg + h_reg;
          H_we = 1;
        end
    end // digest_logic


  //----------------------------------------------------------------
  // t1_logic
  //
  // The logic for the T1 function.
  //----------------------------------------------------------------
  always @*
    begin : t1_logic
      reg [31 : 0] sum1;
      reg [31 : 0] ch;

      sum1 = {e_reg[5  : 0], e_reg[31 :  6]} ^
             {e_reg[10 : 0], e_reg[31 : 11]} ^
             {e_reg[24 : 0], e_reg[31 : 25]};

      ch = (e_reg & f_reg) ^ ((~e_reg) & g_reg);

      t1 = h_reg + sum1 + ch + w_data + k_data;
    end // t1_logic


  //----------------------------------------------------------------
  // t2_logic
  //
  // The logic for the T2 function
  //----------------------------------------------------------------
  always @*
    begin : t2_logic
      reg [31 : 0] sum0;
      reg [31 : 0] maj;

      sum0 = {a_reg[1  : 0], a_reg[31 :  2]} ^
             {a_reg[12 : 0], a_reg[31 : 13]} ^
             {a_reg[21 : 0], a_reg[31 : 22]};

      maj = (a_reg & b_reg) ^ (a_reg & c_reg) ^ (b_reg & c_reg);

      t2 = sum0 + maj;
    end // t2_logic


  //----------------------------------------------------------------
  // state_logic
  //
  // The logic needed to init as well as update the state during
  // round processing.
  //----------------------------------------------------------------
  always @*
    begin : state_logic
      a_new  = 32'h0;
      b_new  = 32'h0;
      c_new  = 32'h0;
      d_new  = 32'h0;
      e_new  = 32'h0;
      f_new  = 32'h0;
      g_new  = 32'h0;
      h_new  = 32'h0;
      a_h_we = 0;

      if (state_init)
        begin
          a_h_we = 1;
          if (first_block)
            begin
              if (mode)
                begin
                  a_new  = SHA256_H0_0;
                  b_new  = SHA256_H0_1;
                  c_new  = SHA256_H0_2;
                  d_new  = SHA256_H0_3;
                  e_new  = SHA256_H0_4;
                  f_new  = SHA256_H0_5;
                  g_new  = SHA256_H0_6;
                  h_new  = SHA256_H0_7;
                end
              else
                begin
                  a_new  = SHA224_H0_0;
                  b_new  = SHA224_H0_1;
                  c_new  = SHA224_H0_2;
                  d_new  = SHA224_H0_3;
                  e_new  = SHA224_H0_4;
                  f_new  = SHA224_H0_5;
                  g_new  = SHA224_H0_6;
                  h_new  = SHA224_H0_7;
                end
            end
          else
            begin
              a_new  = H0_reg;
              b_new  = H1_reg;
              c_new  = H2_reg;
              d_new  = H3_reg;
              e_new  = H4_reg;
              f_new  = H5_reg;
              g_new  = H6_reg;
              h_new  = H7_reg;
            end
        end

      if (state_update)
        begin
          a_new  = t1 + t2;
          b_new  = a_reg;
          c_new  = b_reg;
          d_new  = c_reg;
          e_new  = d_reg + t1;
          f_new  = e_reg;
          g_new  = f_reg;
          h_new  = g_reg;
          a_h_we = 1;
        end
    end // state_logic


  //----------------------------------------------------------------
  // t_ctr
  //
  // Update logic for the round counter, a monotonically
  // increasing counter with reset.
  //----------------------------------------------------------------
  always @*
    begin : t_ctr
      t_ctr_new = 0;
      t_ctr_we  = 0;

      if (t_ctr_rst)
        begin
          t_ctr_new = 0;
          t_ctr_we  = 1;
        end

      if (t_ctr_inc)
        begin
          t_ctr_new = t_ctr_reg + 1'b1;
          t_ctr_we  = 1;
        end
    end // t_ctr


  //----------------------------------------------------------------
  // sha256_ctrl_fsm
  //
  // Logic for the state machine controlling the core behaviour.
  //----------------------------------------------------------------
  always @*
    begin : sha256_ctrl_fsm
      digest_init      = 0;
      digest_update    = 0;

      state_init       = 0;
      state_update     = 0;

      first_block      = 0;
      ready_flag       = 0;

      w_init           = 0;
      w_next           = 0;

      t_ctr_inc        = 0;
      t_ctr_rst        = 0;

      digest_valid_new = 0;
      digest_valid_we  = 0;

      sha256_ctrl_new  = CTRL_IDLE;
      sha256_ctrl_we   = 0;


      case (sha256_ctrl_reg)
        CTRL_IDLE:
          begin
            ready_flag = 1;

            if (init)
              begin
                digest_init      = 1;
                w_init           = 1;
                state_init       = 1;
                first_block      = 1;
                t_ctr_rst        = 1;
                digest_valid_new = 0;
                digest_valid_we  = 1;
                sha256_ctrl_new  = CTRL_ROUNDS;
                sha256_ctrl_we   = 1;
              end

            if (next)
              begin
                t_ctr_rst        = 1;
                w_init           = 1;
                state_init       = 1;
                digest_valid_new = 0;
                digest_valid_we  = 1;
                sha256_ctrl_new  = CTRL_ROUNDS;
                sha256_ctrl_we   = 1;
              end
          end


        CTRL_ROUNDS:
          begin
            w_next       = 1;
            state_update = 1;
            t_ctr_inc    = 1;

            if (t_ctr_reg == SHA256_ROUNDS)
              begin
                sha256_ctrl_new = CTRL_DONE;
                sha256_ctrl_we  = 1;
              end
          end


        CTRL_DONE:
          begin
            digest_update    = 1;
            digest_valid_new = 1;
            digest_valid_we  = 1;

            sha256_ctrl_new  = CTRL_IDLE;
            sha256_ctrl_we   = 1;
          end
      endcase // case (sha256_ctrl_reg)
    end // sha256_ctrl_fsm

endmodule // sha256_core

//======================================================================
// EOF sha256_core.v
//======================================================================


//======================================================================
//
// sha256_k_constants.v
// --------------------
// The table K with constants in the SHA-256 hash function.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2013, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module sha256_k_constants(
                          input wire  [5 : 0] round,
                          output wire [31 : 0] K
                         );

  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [31 : 0] tmp_K;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign K = tmp_K;


  //----------------------------------------------------------------
  // round_mux
  //----------------------------------------------------------------
  always @*
    begin : round_mux
      case(round)
        00: tmp_K = 32'h428a2f98;
        01: tmp_K = 32'h71374491;
        02: tmp_K = 32'hb5c0fbcf;
        03: tmp_K = 32'he9b5dba5;
        04: tmp_K = 32'h3956c25b;
        05: tmp_K = 32'h59f111f1;
        06: tmp_K = 32'h923f82a4;
        07: tmp_K = 32'hab1c5ed5;
        08: tmp_K = 32'hd807aa98;
        09: tmp_K = 32'h12835b01;
        10: tmp_K = 32'h243185be;
        11: tmp_K = 32'h550c7dc3;
        12: tmp_K = 32'h72be5d74;
        13: tmp_K = 32'h80deb1fe;
        14: tmp_K = 32'h9bdc06a7;
        15: tmp_K = 32'hc19bf174;
        16: tmp_K = 32'he49b69c1;
        17: tmp_K = 32'hefbe4786;
        18: tmp_K = 32'h0fc19dc6;
        19: tmp_K = 32'h240ca1cc;
        20: tmp_K = 32'h2de92c6f;
        21: tmp_K = 32'h4a7484aa;
        22: tmp_K = 32'h5cb0a9dc;
        23: tmp_K = 32'h76f988da;
        24: tmp_K = 32'h983e5152;
        25: tmp_K = 32'ha831c66d;
        26: tmp_K = 32'hb00327c8;
        27: tmp_K = 32'hbf597fc7;
        28: tmp_K = 32'hc6e00bf3;
        29: tmp_K = 32'hd5a79147;
        30: tmp_K = 32'h06ca6351;
        31: tmp_K = 32'h14292967;
        32: tmp_K = 32'h27b70a85;
        33: tmp_K = 32'h2e1b2138;
        34: tmp_K = 32'h4d2c6dfc;
        35: tmp_K = 32'h53380d13;
        36: tmp_K = 32'h650a7354;
        37: tmp_K = 32'h766a0abb;
        38: tmp_K = 32'h81c2c92e;
        39: tmp_K = 32'h92722c85;
        40: tmp_K = 32'ha2bfe8a1;
        41: tmp_K = 32'ha81a664b;
        42: tmp_K = 32'hc24b8b70;
        43: tmp_K = 32'hc76c51a3;
        44: tmp_K = 32'hd192e819;
        45: tmp_K = 32'hd6990624;
        46: tmp_K = 32'hf40e3585;
        47: tmp_K = 32'h106aa070;
        48: tmp_K = 32'h19a4c116;
        49: tmp_K = 32'h1e376c08;
        50: tmp_K = 32'h2748774c;
        51: tmp_K = 32'h34b0bcb5;
        52: tmp_K = 32'h391c0cb3;
        53: tmp_K = 32'h4ed8aa4a;
        54: tmp_K = 32'h5b9cca4f;
        55: tmp_K = 32'h682e6ff3;
        56: tmp_K = 32'h748f82ee;
        57: tmp_K = 32'h78a5636f;
        58: tmp_K = 32'h84c87814;
        59: tmp_K = 32'h8cc70208;
        60: tmp_K = 32'h90befffa;
        61: tmp_K = 32'ha4506ceb;
        62: tmp_K = 32'hbef9a3f7;
        63: tmp_K = 32'hc67178f2;
      endcase // case (round)
    end // block: round_mux
endmodule // sha256_k_constants

//======================================================================
// sha256_k_constants.v
//======================================================================


//======================================================================
//
// sha256_w_mem_regs.v
// -------------------
// The W memory. This version uses 16 32-bit registers as a sliding
// window to generate the 64 words.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2013, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module sha256_w_mem(
                    input wire           clk,
                    input wire           reset_n,

                    input wire [511 : 0] block,
                    input wire [5 : 0]   round,

                    input wire           init,
                    input wire           next,
                    output wire [31 : 0] w
                   );


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [31 : 0] w_mem [0 : 15];
  reg [31 : 0] w_mem00_new;
  reg [31 : 0] w_mem01_new;
  reg [31 : 0] w_mem02_new;
  reg [31 : 0] w_mem03_new;
  reg [31 : 0] w_mem04_new;
  reg [31 : 0] w_mem05_new;
  reg [31 : 0] w_mem06_new;
  reg [31 : 0] w_mem07_new;
  reg [31 : 0] w_mem08_new;
  reg [31 : 0] w_mem09_new;
  reg [31 : 0] w_mem10_new;
  reg [31 : 0] w_mem11_new;
  reg [31 : 0] w_mem12_new;
  reg [31 : 0] w_mem13_new;
  reg [31 : 0] w_mem14_new;
  reg [31 : 0] w_mem15_new;
  reg          w_mem_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [31 : 0] w_tmp;
  reg [31 : 0] w_new;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign w = w_tmp;


  //----------------------------------------------------------------
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with synchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      integer i;

      if (!reset_n)
        begin
          for (i = 0 ; i < 16 ; i = i + 1) begin
            w_mem[i] <= 32'h0;
	  end
        end
      else
        begin
          if (w_mem_we)
            begin
              w_mem[00] <= w_mem00_new;
              w_mem[01] <= w_mem01_new;
              w_mem[02] <= w_mem02_new;
              w_mem[03] <= w_mem03_new;
              w_mem[04] <= w_mem04_new;
              w_mem[05] <= w_mem05_new;
              w_mem[06] <= w_mem06_new;
              w_mem[07] <= w_mem07_new;
              w_mem[08] <= w_mem08_new;
              w_mem[09] <= w_mem09_new;
              w_mem[10] <= w_mem10_new;
              w_mem[11] <= w_mem11_new;
              w_mem[12] <= w_mem12_new;
              w_mem[13] <= w_mem13_new;
              w_mem[14] <= w_mem14_new;
              w_mem[15] <= w_mem15_new;
            end
        end
    end // reg_update


  //----------------------------------------------------------------
  // select_w
  //
  // Mux for the external read operation. This is where we exract
  // the W variable.
  //----------------------------------------------------------------
  always @*
    begin : select_w
      if (round < 16)
        w_tmp = w_mem[round[3 : 0]];
      else
        w_tmp = w_new;
    end // select_w


  //----------------------------------------------------------------
  // w_new_logic
  //
  // Logic that calculates the next value to be inserted into
  // the sliding window of the memory.
  //----------------------------------------------------------------
  always @*
    begin : w_mem_update_logic
      reg [31 : 0] w_0;
      reg [31 : 0] w_1;
      reg [31 : 0] w_9;
      reg [31 : 0] w_14;
      reg [31 : 0] d0;
      reg [31 : 0] d1;

      w_mem00_new = 32'h0;
      w_mem01_new = 32'h0;
      w_mem02_new = 32'h0;
      w_mem03_new = 32'h0;
      w_mem04_new = 32'h0;
      w_mem05_new = 32'h0;
      w_mem06_new = 32'h0;
      w_mem07_new = 32'h0;
      w_mem08_new = 32'h0;
      w_mem09_new = 32'h0;
      w_mem10_new = 32'h0;
      w_mem11_new = 32'h0;
      w_mem12_new = 32'h0;
      w_mem13_new = 32'h0;
      w_mem14_new = 32'h0;
      w_mem15_new = 32'h0;
      w_mem_we    = 0;

      w_0  = w_mem[0];
      w_1  = w_mem[1];
      w_9  = w_mem[9];
      w_14 = w_mem[14];

      d0 = {w_1[6  : 0], w_1[31 :  7]} ^
           {w_1[17 : 0], w_1[31 : 18]} ^
           {3'b000, w_1[31 : 3]};

      d1 = {w_14[16 : 0], w_14[31 : 17]} ^
           {w_14[18 : 0], w_14[31 : 19]} ^
           {10'b0000000000, w_14[31 : 10]};

      w_new = d1 + w_9 + d0 + w_0;

      if (init)
        begin
          w_mem00_new = block[511 : 480];
          w_mem01_new = block[479 : 448];
          w_mem02_new = block[447 : 416];
          w_mem03_new = block[415 : 384];
          w_mem04_new = block[383 : 352];
          w_mem05_new = block[351 : 320];
          w_mem06_new = block[319 : 288];
          w_mem07_new = block[287 : 256];
          w_mem08_new = block[255 : 224];
          w_mem09_new = block[223 : 192];
          w_mem10_new = block[191 : 160];
          w_mem11_new = block[159 : 128];
          w_mem12_new = block[127 :  96];
          w_mem13_new = block[95  :  64];
          w_mem14_new = block[63  :  32];
          w_mem15_new = block[31  :   0];
          w_mem_we    = 1;
        end

      if (next && (round > 15))
        begin
          w_mem00_new = w_mem[01];
          w_mem01_new = w_mem[02];
          w_mem02_new = w_mem[03];
          w_mem03_new = w_mem[04];
          w_mem04_new = w_mem[05];
          w_mem05_new = w_mem[06];
          w_mem06_new = w_mem[07];
          w_mem07_new = w_mem[08];
          w_mem08_new = w_mem[09];
          w_mem09_new = w_mem[10];
          w_mem10_new = w_mem[11];
          w_mem11_new = w_mem[12];
          w_mem12_new = w_mem[13];
          w_mem13_new = w_mem[14];
          w_mem14_new = w_mem[15];
          w_mem15_new = w_new;
          w_mem_we    = 1;
        end
    end // w_mem_update_logic
endmodule // sha256_w_mem

//======================================================================
// sha256_w_mem.v
//======================================================================


