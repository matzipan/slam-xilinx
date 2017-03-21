// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:toplevel:1.0
// IP Revision: 1703151138

(* X_CORE_INFO = "toplevel,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "design_1_toplevel_0_2,toplevel,{}" *)
(* CORE_GENERATION_INFO = "design_1_toplevel_0_2,toplevel,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=toplevel,x_ipVersion=1.0,x_ipCoreRevision=1703151138,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_ADDR_WIDTH=5,C_S_AXI_CONTROL_DATA_WIDTH=32,C_M_AXI_OCM_ID_WIDTH=1,C_M_AXI_OCM_ADDR_WIDTH=32,C_M_AXI_OCM_DATA_WIDTH=32,C_M_AXI_OCM_AWUSER_WIDTH=1,C_M_AXI_OCM_ARUSER_WIDTH=1,C_M_AXI_OCM_WUSER_WIDTH=1,C_M_AXI_OCM_RUSER_WIDTH=1,C_M_AXI_OCM_BUSER_WIDTH=1,C_M_AXI_OCM_USER_VALUE=0x00000000\
,C_M_AXI_OCM_PROT_VALUE=000,C_M_AXI_OCM_CACHE_VALUE=0011,C_M_AXI_OCM_TARGET_ADDR=0xFFFC0000}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_toplevel_0_2 (
  s_axi_control_AWADDR,
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_BRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_ARADDR,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_ocm_AWADDR,
  m_axi_ocm_AWLEN,
  m_axi_ocm_AWSIZE,
  m_axi_ocm_AWBURST,
  m_axi_ocm_AWLOCK,
  m_axi_ocm_AWREGION,
  m_axi_ocm_AWCACHE,
  m_axi_ocm_AWPROT,
  m_axi_ocm_AWQOS,
  m_axi_ocm_AWVALID,
  m_axi_ocm_AWREADY,
  m_axi_ocm_WDATA,
  m_axi_ocm_WSTRB,
  m_axi_ocm_WLAST,
  m_axi_ocm_WVALID,
  m_axi_ocm_WREADY,
  m_axi_ocm_BRESP,
  m_axi_ocm_BVALID,
  m_axi_ocm_BREADY,
  m_axi_ocm_ARADDR,
  m_axi_ocm_ARLEN,
  m_axi_ocm_ARSIZE,
  m_axi_ocm_ARBURST,
  m_axi_ocm_ARLOCK,
  m_axi_ocm_ARREGION,
  m_axi_ocm_ARCACHE,
  m_axi_ocm_ARPROT,
  m_axi_ocm_ARQOS,
  m_axi_ocm_ARVALID,
  m_axi_ocm_ARREADY,
  m_axi_ocm_RDATA,
  m_axi_ocm_RRESP,
  m_axi_ocm_RLAST,
  m_axi_ocm_RVALID,
  m_axi_ocm_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [4 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [4 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWADDR" *)
output wire [31 : 0] m_axi_ocm_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWLEN" *)
output wire [7 : 0] m_axi_ocm_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWSIZE" *)
output wire [2 : 0] m_axi_ocm_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWBURST" *)
output wire [1 : 0] m_axi_ocm_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWLOCK" *)
output wire [1 : 0] m_axi_ocm_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWREGION" *)
output wire [3 : 0] m_axi_ocm_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWCACHE" *)
output wire [3 : 0] m_axi_ocm_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWPROT" *)
output wire [2 : 0] m_axi_ocm_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWQOS" *)
output wire [3 : 0] m_axi_ocm_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWVALID" *)
output wire m_axi_ocm_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm AWREADY" *)
input wire m_axi_ocm_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm WDATA" *)
output wire [31 : 0] m_axi_ocm_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm WSTRB" *)
output wire [3 : 0] m_axi_ocm_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm WLAST" *)
output wire m_axi_ocm_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm WVALID" *)
output wire m_axi_ocm_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm WREADY" *)
input wire m_axi_ocm_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm BRESP" *)
input wire [1 : 0] m_axi_ocm_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm BVALID" *)
input wire m_axi_ocm_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm BREADY" *)
output wire m_axi_ocm_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARADDR" *)
output wire [31 : 0] m_axi_ocm_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARLEN" *)
output wire [7 : 0] m_axi_ocm_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARSIZE" *)
output wire [2 : 0] m_axi_ocm_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARBURST" *)
output wire [1 : 0] m_axi_ocm_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARLOCK" *)
output wire [1 : 0] m_axi_ocm_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARREGION" *)
output wire [3 : 0] m_axi_ocm_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARCACHE" *)
output wire [3 : 0] m_axi_ocm_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARPROT" *)
output wire [2 : 0] m_axi_ocm_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARQOS" *)
output wire [3 : 0] m_axi_ocm_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARVALID" *)
output wire m_axi_ocm_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm ARREADY" *)
input wire m_axi_ocm_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm RDATA" *)
input wire [31 : 0] m_axi_ocm_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm RRESP" *)
input wire [1 : 0] m_axi_ocm_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm RLAST" *)
input wire m_axi_ocm_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm RVALID" *)
input wire m_axi_ocm_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm RREADY" *)
output wire m_axi_ocm_RREADY;

  toplevel #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(5),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_M_AXI_OCM_ID_WIDTH(1),
    .C_M_AXI_OCM_ADDR_WIDTH(32),
    .C_M_AXI_OCM_DATA_WIDTH(32),
    .C_M_AXI_OCM_AWUSER_WIDTH(1),
    .C_M_AXI_OCM_ARUSER_WIDTH(1),
    .C_M_AXI_OCM_WUSER_WIDTH(1),
    .C_M_AXI_OCM_RUSER_WIDTH(1),
    .C_M_AXI_OCM_BUSER_WIDTH(1),
    .C_M_AXI_OCM_USER_VALUE('H00000000),
    .C_M_AXI_OCM_PROT_VALUE('B000),
    .C_M_AXI_OCM_CACHE_VALUE('B0011),
    .C_M_AXI_OCM_TARGET_ADDR('HFFFC0000)
  ) inst (
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_ocm_AWID(),
    .m_axi_ocm_AWADDR(m_axi_ocm_AWADDR),
    .m_axi_ocm_AWLEN(m_axi_ocm_AWLEN),
    .m_axi_ocm_AWSIZE(m_axi_ocm_AWSIZE),
    .m_axi_ocm_AWBURST(m_axi_ocm_AWBURST),
    .m_axi_ocm_AWLOCK(m_axi_ocm_AWLOCK),
    .m_axi_ocm_AWREGION(m_axi_ocm_AWREGION),
    .m_axi_ocm_AWCACHE(m_axi_ocm_AWCACHE),
    .m_axi_ocm_AWPROT(m_axi_ocm_AWPROT),
    .m_axi_ocm_AWQOS(m_axi_ocm_AWQOS),
    .m_axi_ocm_AWUSER(),
    .m_axi_ocm_AWVALID(m_axi_ocm_AWVALID),
    .m_axi_ocm_AWREADY(m_axi_ocm_AWREADY),
    .m_axi_ocm_WID(),
    .m_axi_ocm_WDATA(m_axi_ocm_WDATA),
    .m_axi_ocm_WSTRB(m_axi_ocm_WSTRB),
    .m_axi_ocm_WLAST(m_axi_ocm_WLAST),
    .m_axi_ocm_WUSER(),
    .m_axi_ocm_WVALID(m_axi_ocm_WVALID),
    .m_axi_ocm_WREADY(m_axi_ocm_WREADY),
    .m_axi_ocm_BID(1'B0),
    .m_axi_ocm_BRESP(m_axi_ocm_BRESP),
    .m_axi_ocm_BUSER(1'B0),
    .m_axi_ocm_BVALID(m_axi_ocm_BVALID),
    .m_axi_ocm_BREADY(m_axi_ocm_BREADY),
    .m_axi_ocm_ARID(),
    .m_axi_ocm_ARADDR(m_axi_ocm_ARADDR),
    .m_axi_ocm_ARLEN(m_axi_ocm_ARLEN),
    .m_axi_ocm_ARSIZE(m_axi_ocm_ARSIZE),
    .m_axi_ocm_ARBURST(m_axi_ocm_ARBURST),
    .m_axi_ocm_ARLOCK(m_axi_ocm_ARLOCK),
    .m_axi_ocm_ARREGION(m_axi_ocm_ARREGION),
    .m_axi_ocm_ARCACHE(m_axi_ocm_ARCACHE),
    .m_axi_ocm_ARPROT(m_axi_ocm_ARPROT),
    .m_axi_ocm_ARQOS(m_axi_ocm_ARQOS),
    .m_axi_ocm_ARUSER(),
    .m_axi_ocm_ARVALID(m_axi_ocm_ARVALID),
    .m_axi_ocm_ARREADY(m_axi_ocm_ARREADY),
    .m_axi_ocm_RID(1'B0),
    .m_axi_ocm_RDATA(m_axi_ocm_RDATA),
    .m_axi_ocm_RRESP(m_axi_ocm_RRESP),
    .m_axi_ocm_RLAST(m_axi_ocm_RLAST),
    .m_axi_ocm_RUSER(1'B0),
    .m_axi_ocm_RVALID(m_axi_ocm_RVALID),
    .m_axi_ocm_RREADY(m_axi_ocm_RREADY)
  );
endmodule
