-- (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:toplevel:1.0
-- IP Revision: 1702231810

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY vivado_toplevel_0_0 IS
  PORT (
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_ocm_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ocm_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_ocm_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ocm_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ocm_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ocm_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ocm_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_AWVALID : OUT STD_LOGIC;
    m_axi_ocm_AWREADY : IN STD_LOGIC;
    m_axi_ocm_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ocm_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_WLAST : OUT STD_LOGIC;
    m_axi_ocm_WVALID : OUT STD_LOGIC;
    m_axi_ocm_WREADY : IN STD_LOGIC;
    m_axi_ocm_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ocm_BVALID : IN STD_LOGIC;
    m_axi_ocm_BREADY : OUT STD_LOGIC;
    m_axi_ocm_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ocm_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_ocm_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ocm_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ocm_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ocm_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_ocm_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_ocm_ARVALID : OUT STD_LOGIC;
    m_axi_ocm_ARREADY : IN STD_LOGIC;
    m_axi_ocm_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_ocm_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_ocm_RLAST : IN STD_LOGIC;
    m_axi_ocm_RVALID : IN STD_LOGIC;
    m_axi_ocm_RREADY : OUT STD_LOGIC
  );
END vivado_toplevel_0_0;

ARCHITECTURE vivado_toplevel_0_0_arch OF vivado_toplevel_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF vivado_toplevel_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT toplevel IS
    GENERIC (
      C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CONTROL_DATA_WIDTH : INTEGER;
      C_M_AXI_OCM_ID_WIDTH : INTEGER;
      C_M_AXI_OCM_ADDR_WIDTH : INTEGER;
      C_M_AXI_OCM_DATA_WIDTH : INTEGER;
      C_M_AXI_OCM_AWUSER_WIDTH : INTEGER;
      C_M_AXI_OCM_ARUSER_WIDTH : INTEGER;
      C_M_AXI_OCM_WUSER_WIDTH : INTEGER;
      C_M_AXI_OCM_RUSER_WIDTH : INTEGER;
      C_M_AXI_OCM_BUSER_WIDTH : INTEGER;
      C_M_AXI_OCM_USER_VALUE : INTEGER;
      C_M_AXI_OCM_PROT_VALUE : INTEGER;
      C_M_AXI_OCM_CACHE_VALUE : INTEGER;
      C_M_AXI_OCM_TARGET_ADDR : INTEGER
    );
    PORT (
      s_axi_control_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_control_AWVALID : IN STD_LOGIC;
      s_axi_control_AWREADY : OUT STD_LOGIC;
      s_axi_control_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_WVALID : IN STD_LOGIC;
      s_axi_control_WREADY : OUT STD_LOGIC;
      s_axi_control_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_BVALID : OUT STD_LOGIC;
      s_axi_control_BREADY : IN STD_LOGIC;
      s_axi_control_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_control_ARVALID : IN STD_LOGIC;
      s_axi_control_ARREADY : OUT STD_LOGIC;
      s_axi_control_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_RVALID : OUT STD_LOGIC;
      s_axi_control_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      m_axi_ocm_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ocm_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_ocm_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ocm_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ocm_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ocm_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ocm_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_AWVALID : OUT STD_LOGIC;
      m_axi_ocm_AWREADY : IN STD_LOGIC;
      m_axi_ocm_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ocm_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_WLAST : OUT STD_LOGIC;
      m_axi_ocm_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_WVALID : OUT STD_LOGIC;
      m_axi_ocm_WREADY : IN STD_LOGIC;
      m_axi_ocm_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ocm_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_BVALID : IN STD_LOGIC;
      m_axi_ocm_BREADY : OUT STD_LOGIC;
      m_axi_ocm_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ocm_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_ocm_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ocm_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ocm_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ocm_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_ocm_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_ocm_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_ARVALID : OUT STD_LOGIC;
      m_axi_ocm_ARREADY : IN STD_LOGIC;
      m_axi_ocm_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_ocm_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_ocm_RLAST : IN STD_LOGIC;
      m_axi_ocm_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_ocm_RVALID : IN STD_LOGIC;
      m_axi_ocm_RREADY : OUT STD_LOGIC
    );
  END COMPONENT toplevel;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_ocm_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_ocm RREADY";
BEGIN
  U0 : toplevel
    GENERIC MAP (
      C_S_AXI_CONTROL_ADDR_WIDTH => 5,
      C_S_AXI_CONTROL_DATA_WIDTH => 32,
      C_M_AXI_OCM_ID_WIDTH => 1,
      C_M_AXI_OCM_ADDR_WIDTH => 32,
      C_M_AXI_OCM_DATA_WIDTH => 32,
      C_M_AXI_OCM_AWUSER_WIDTH => 1,
      C_M_AXI_OCM_ARUSER_WIDTH => 1,
      C_M_AXI_OCM_WUSER_WIDTH => 1,
      C_M_AXI_OCM_RUSER_WIDTH => 1,
      C_M_AXI_OCM_BUSER_WIDTH => 1,
      C_M_AXI_OCM_USER_VALUE => 0,
      C_M_AXI_OCM_PROT_VALUE => 0,
      C_M_AXI_OCM_CACHE_VALUE => 3,
      C_M_AXI_OCM_TARGET_ADDR => 0
    )
    PORT MAP (
      s_axi_control_AWADDR => s_axi_control_AWADDR,
      s_axi_control_AWVALID => s_axi_control_AWVALID,
      s_axi_control_AWREADY => s_axi_control_AWREADY,
      s_axi_control_WDATA => s_axi_control_WDATA,
      s_axi_control_WSTRB => s_axi_control_WSTRB,
      s_axi_control_WVALID => s_axi_control_WVALID,
      s_axi_control_WREADY => s_axi_control_WREADY,
      s_axi_control_BRESP => s_axi_control_BRESP,
      s_axi_control_BVALID => s_axi_control_BVALID,
      s_axi_control_BREADY => s_axi_control_BREADY,
      s_axi_control_ARADDR => s_axi_control_ARADDR,
      s_axi_control_ARVALID => s_axi_control_ARVALID,
      s_axi_control_ARREADY => s_axi_control_ARREADY,
      s_axi_control_RDATA => s_axi_control_RDATA,
      s_axi_control_RRESP => s_axi_control_RRESP,
      s_axi_control_RVALID => s_axi_control_RVALID,
      s_axi_control_RREADY => s_axi_control_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      m_axi_ocm_AWADDR => m_axi_ocm_AWADDR,
      m_axi_ocm_AWLEN => m_axi_ocm_AWLEN,
      m_axi_ocm_AWSIZE => m_axi_ocm_AWSIZE,
      m_axi_ocm_AWBURST => m_axi_ocm_AWBURST,
      m_axi_ocm_AWLOCK => m_axi_ocm_AWLOCK,
      m_axi_ocm_AWREGION => m_axi_ocm_AWREGION,
      m_axi_ocm_AWCACHE => m_axi_ocm_AWCACHE,
      m_axi_ocm_AWPROT => m_axi_ocm_AWPROT,
      m_axi_ocm_AWQOS => m_axi_ocm_AWQOS,
      m_axi_ocm_AWVALID => m_axi_ocm_AWVALID,
      m_axi_ocm_AWREADY => m_axi_ocm_AWREADY,
      m_axi_ocm_WDATA => m_axi_ocm_WDATA,
      m_axi_ocm_WSTRB => m_axi_ocm_WSTRB,
      m_axi_ocm_WLAST => m_axi_ocm_WLAST,
      m_axi_ocm_WVALID => m_axi_ocm_WVALID,
      m_axi_ocm_WREADY => m_axi_ocm_WREADY,
      m_axi_ocm_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ocm_BRESP => m_axi_ocm_BRESP,
      m_axi_ocm_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ocm_BVALID => m_axi_ocm_BVALID,
      m_axi_ocm_BREADY => m_axi_ocm_BREADY,
      m_axi_ocm_ARADDR => m_axi_ocm_ARADDR,
      m_axi_ocm_ARLEN => m_axi_ocm_ARLEN,
      m_axi_ocm_ARSIZE => m_axi_ocm_ARSIZE,
      m_axi_ocm_ARBURST => m_axi_ocm_ARBURST,
      m_axi_ocm_ARLOCK => m_axi_ocm_ARLOCK,
      m_axi_ocm_ARREGION => m_axi_ocm_ARREGION,
      m_axi_ocm_ARCACHE => m_axi_ocm_ARCACHE,
      m_axi_ocm_ARPROT => m_axi_ocm_ARPROT,
      m_axi_ocm_ARQOS => m_axi_ocm_ARQOS,
      m_axi_ocm_ARVALID => m_axi_ocm_ARVALID,
      m_axi_ocm_ARREADY => m_axi_ocm_ARREADY,
      m_axi_ocm_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ocm_RDATA => m_axi_ocm_RDATA,
      m_axi_ocm_RRESP => m_axi_ocm_RRESP,
      m_axi_ocm_RLAST => m_axi_ocm_RLAST,
      m_axi_ocm_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_ocm_RVALID => m_axi_ocm_RVALID,
      m_axi_ocm_RREADY => m_axi_ocm_RREADY
    );
END vivado_toplevel_0_0_arch;
