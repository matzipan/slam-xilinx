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
// IP Revision: 1702201157

(* X_CORE_INFO = "toplevel,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "vivado_toplevel_0_0,toplevel,{}" *)
(* CORE_GENERATION_INFO = "vivado_toplevel_0_0,toplevel,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=toplevel,x_ipVersion=1.0,x_ipCoreRevision=1702201157,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_AXILITES_ADDR_WIDTH=5,C_S_AXI_AXILITES_DATA_WIDTH=32,C_M_AXI_OCM_V_ID_WIDTH=1,C_M_AXI_OCM_V_ADDR_WIDTH=32,C_M_AXI_OCM_V_DATA_WIDTH=32,C_M_AXI_OCM_V_AWUSER_WIDTH=1,C_M_AXI_OCM_V_ARUSER_WIDTH=1,C_M_AXI_OCM_V_WUSER_WIDTH=1,C_M_AXI_OCM_V_RUSER_WIDTH=1,C_M_AXI_OCM_V_BUSER_WIDTH=1,C_M_AXI_OCM_V_USE\
R_VALUE=0x00000000,C_M_AXI_OCM_V_PROT_VALUE=000,C_M_AXI_OCM_V_CACHE_VALUE=0011,C_M_AXI_OCM_V_TARGET_ADDR=0x00000000}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module vivado_toplevel_0_0 (
  s_axi_AXILiteS_AWADDR,
  s_axi_AXILiteS_AWVALID,
  s_axi_AXILiteS_AWREADY,
  s_axi_AXILiteS_WDATA,
  s_axi_AXILiteS_WSTRB,
  s_axi_AXILiteS_WVALID,
  s_axi_AXILiteS_WREADY,
  s_axi_AXILiteS_BRESP,
  s_axi_AXILiteS_BVALID,
  s_axi_AXILiteS_BREADY,
  s_axi_AXILiteS_ARADDR,
  s_axi_AXILiteS_ARVALID,
  s_axi_AXILiteS_ARREADY,
  s_axi_AXILiteS_RDATA,
  s_axi_AXILiteS_RRESP,
  s_axi_AXILiteS_RVALID,
  s_axi_AXILiteS_RREADY,
  ap_clk,
  ap_rst_n,
  interrupt,
  m_axi_ocm_V_AWADDR,
  m_axi_ocm_V_AWLEN,
  m_axi_ocm_V_AWSIZE,
  m_axi_ocm_V_AWBURST,
  m_axi_ocm_V_AWLOCK,
  m_axi_ocm_V_AWREGION,
  m_axi_ocm_V_AWCACHE,
  m_axi_ocm_V_AWPROT,
  m_axi_ocm_V_AWQOS,
  m_axi_ocm_V_AWVALID,
  m_axi_ocm_V_AWREADY,
  m_axi_ocm_V_WDATA,
  m_axi_ocm_V_WSTRB,
  m_axi_ocm_V_WLAST,
  m_axi_ocm_V_WVALID,
  m_axi_ocm_V_WREADY,
  m_axi_ocm_V_BRESP,
  m_axi_ocm_V_BVALID,
  m_axi_ocm_V_BREADY,
  m_axi_ocm_V_ARADDR,
  m_axi_ocm_V_ARLEN,
  m_axi_ocm_V_ARSIZE,
  m_axi_ocm_V_ARBURST,
  m_axi_ocm_V_ARLOCK,
  m_axi_ocm_V_ARREGION,
  m_axi_ocm_V_ARCACHE,
  m_axi_ocm_V_ARPROT,
  m_axi_ocm_V_ARQOS,
  m_axi_ocm_V_ARVALID,
  m_axi_ocm_V_ARREADY,
  m_axi_ocm_V_RDATA,
  m_axi_ocm_V_RRESP,
  m_axi_ocm_V_RLAST,
  m_axi_ocm_V_RVALID,
  m_axi_ocm_V_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWADDR" *)
input wire [4 : 0] s_axi_AXILiteS_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWVALID" *)
input wire s_axi_AXILiteS_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS AWREADY" *)
output wire s_axi_AXILiteS_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WDATA" *)
input wire [31 : 0] s_axi_AXILiteS_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WSTRB" *)
input wire [3 : 0] s_axi_AXILiteS_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WVALID" *)
input wire s_axi_AXILiteS_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS WREADY" *)
output wire s_axi_AXILiteS_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BRESP" *)
output wire [1 : 0] s_axi_AXILiteS_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BVALID" *)
output wire s_axi_AXILiteS_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS BREADY" *)
input wire s_axi_AXILiteS_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARADDR" *)
input wire [4 : 0] s_axi_AXILiteS_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARVALID" *)
input wire s_axi_AXILiteS_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS ARREADY" *)
output wire s_axi_AXILiteS_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RDATA" *)
output wire [31 : 0] s_axi_AXILiteS_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RRESP" *)
output wire [1 : 0] s_axi_AXILiteS_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RVALID" *)
output wire s_axi_AXILiteS_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_AXILiteS RREADY" *)
input wire s_axi_AXILiteS_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWADDR" *)
output wire [31 : 0] m_axi_ocm_V_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWLEN" *)
output wire [7 : 0] m_axi_ocm_V_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWSIZE" *)
output wire [2 : 0] m_axi_ocm_V_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWBURST" *)
output wire [1 : 0] m_axi_ocm_V_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWLOCK" *)
output wire [1 : 0] m_axi_ocm_V_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWREGION" *)
output wire [3 : 0] m_axi_ocm_V_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWCACHE" *)
output wire [3 : 0] m_axi_ocm_V_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWPROT" *)
output wire [2 : 0] m_axi_ocm_V_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWQOS" *)
output wire [3 : 0] m_axi_ocm_V_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWVALID" *)
output wire m_axi_ocm_V_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V AWREADY" *)
input wire m_axi_ocm_V_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V WDATA" *)
output wire [31 : 0] m_axi_ocm_V_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V WSTRB" *)
output wire [3 : 0] m_axi_ocm_V_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V WLAST" *)
output wire m_axi_ocm_V_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V WVALID" *)
output wire m_axi_ocm_V_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V WREADY" *)
input wire m_axi_ocm_V_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V BRESP" *)
input wire [1 : 0] m_axi_ocm_V_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V BVALID" *)
input wire m_axi_ocm_V_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V BREADY" *)
output wire m_axi_ocm_V_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARADDR" *)
output wire [31 : 0] m_axi_ocm_V_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARLEN" *)
output wire [7 : 0] m_axi_ocm_V_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARSIZE" *)
output wire [2 : 0] m_axi_ocm_V_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARBURST" *)
output wire [1 : 0] m_axi_ocm_V_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARLOCK" *)
output wire [1 : 0] m_axi_ocm_V_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARREGION" *)
output wire [3 : 0] m_axi_ocm_V_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARCACHE" *)
output wire [3 : 0] m_axi_ocm_V_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARPROT" *)
output wire [2 : 0] m_axi_ocm_V_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARQOS" *)
output wire [3 : 0] m_axi_ocm_V_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARVALID" *)
output wire m_axi_ocm_V_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V ARREADY" *)
input wire m_axi_ocm_V_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V RDATA" *)
input wire [31 : 0] m_axi_ocm_V_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V RRESP" *)
input wire [1 : 0] m_axi_ocm_V_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V RLAST" *)
input wire m_axi_ocm_V_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V RVALID" *)
input wire m_axi_ocm_V_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_ocm_V RREADY" *)
output wire m_axi_ocm_V_RREADY;

  toplevel #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(5),
    .C_S_AXI_AXILITES_DATA_WIDTH(32),
    .C_M_AXI_OCM_V_ID_WIDTH(1),
    .C_M_AXI_OCM_V_ADDR_WIDTH(32),
    .C_M_AXI_OCM_V_DATA_WIDTH(32),
    .C_M_AXI_OCM_V_AWUSER_WIDTH(1),
    .C_M_AXI_OCM_V_ARUSER_WIDTH(1),
    .C_M_AXI_OCM_V_WUSER_WIDTH(1),
    .C_M_AXI_OCM_V_RUSER_WIDTH(1),
    .C_M_AXI_OCM_V_BUSER_WIDTH(1),
    .C_M_AXI_OCM_V_USER_VALUE('H00000000),
    .C_M_AXI_OCM_V_PROT_VALUE('B000),
    .C_M_AXI_OCM_V_CACHE_VALUE('B0011),
    .C_M_AXI_OCM_V_TARGET_ADDR('H00000000)
  ) inst (
    .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
    .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
    .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
    .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
    .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
    .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
    .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
    .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
    .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
    .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .m_axi_ocm_V_AWID(),
    .m_axi_ocm_V_AWADDR(m_axi_ocm_V_AWADDR),
    .m_axi_ocm_V_AWLEN(m_axi_ocm_V_AWLEN),
    .m_axi_ocm_V_AWSIZE(m_axi_ocm_V_AWSIZE),
    .m_axi_ocm_V_AWBURST(m_axi_ocm_V_AWBURST),
    .m_axi_ocm_V_AWLOCK(m_axi_ocm_V_AWLOCK),
    .m_axi_ocm_V_AWREGION(m_axi_ocm_V_AWREGION),
    .m_axi_ocm_V_AWCACHE(m_axi_ocm_V_AWCACHE),
    .m_axi_ocm_V_AWPROT(m_axi_ocm_V_AWPROT),
    .m_axi_ocm_V_AWQOS(m_axi_ocm_V_AWQOS),
    .m_axi_ocm_V_AWUSER(),
    .m_axi_ocm_V_AWVALID(m_axi_ocm_V_AWVALID),
    .m_axi_ocm_V_AWREADY(m_axi_ocm_V_AWREADY),
    .m_axi_ocm_V_WID(),
    .m_axi_ocm_V_WDATA(m_axi_ocm_V_WDATA),
    .m_axi_ocm_V_WSTRB(m_axi_ocm_V_WSTRB),
    .m_axi_ocm_V_WLAST(m_axi_ocm_V_WLAST),
    .m_axi_ocm_V_WUSER(),
    .m_axi_ocm_V_WVALID(m_axi_ocm_V_WVALID),
    .m_axi_ocm_V_WREADY(m_axi_ocm_V_WREADY),
    .m_axi_ocm_V_BID(1'B0),
    .m_axi_ocm_V_BRESP(m_axi_ocm_V_BRESP),
    .m_axi_ocm_V_BUSER(1'B0),
    .m_axi_ocm_V_BVALID(m_axi_ocm_V_BVALID),
    .m_axi_ocm_V_BREADY(m_axi_ocm_V_BREADY),
    .m_axi_ocm_V_ARID(),
    .m_axi_ocm_V_ARADDR(m_axi_ocm_V_ARADDR),
    .m_axi_ocm_V_ARLEN(m_axi_ocm_V_ARLEN),
    .m_axi_ocm_V_ARSIZE(m_axi_ocm_V_ARSIZE),
    .m_axi_ocm_V_ARBURST(m_axi_ocm_V_ARBURST),
    .m_axi_ocm_V_ARLOCK(m_axi_ocm_V_ARLOCK),
    .m_axi_ocm_V_ARREGION(m_axi_ocm_V_ARREGION),
    .m_axi_ocm_V_ARCACHE(m_axi_ocm_V_ARCACHE),
    .m_axi_ocm_V_ARPROT(m_axi_ocm_V_ARPROT),
    .m_axi_ocm_V_ARQOS(m_axi_ocm_V_ARQOS),
    .m_axi_ocm_V_ARUSER(),
    .m_axi_ocm_V_ARVALID(m_axi_ocm_V_ARVALID),
    .m_axi_ocm_V_ARREADY(m_axi_ocm_V_ARREADY),
    .m_axi_ocm_V_RID(1'B0),
    .m_axi_ocm_V_RDATA(m_axi_ocm_V_RDATA),
    .m_axi_ocm_V_RRESP(m_axi_ocm_V_RRESP),
    .m_axi_ocm_V_RLAST(m_axi_ocm_V_RLAST),
    .m_axi_ocm_V_RUSER(1'B0),
    .m_axi_ocm_V_RVALID(m_axi_ocm_V_RVALID),
    .m_axi_ocm_V_RREADY(m_axi_ocm_V_RREADY)
  );
endmodule
