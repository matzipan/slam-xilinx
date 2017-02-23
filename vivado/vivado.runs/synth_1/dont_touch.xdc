# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# Block Designs: bd/vivado/vivado.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado || ORIG_REF_NAME==vivado}]

# IP: bd/vivado/ip/vivado_processing_system7_0_0/vivado_processing_system7_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_processing_system7_0_0 || ORIG_REF_NAME==vivado_processing_system7_0_0}]

# IP: bd/vivado/ip/vivado_toplevel_0_0/vivado_toplevel_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_toplevel_0_0 || ORIG_REF_NAME==vivado_toplevel_0_0}]

# IP: bd/vivado/ip/vivado_processing_system7_0_axi_periph_0/vivado_processing_system7_0_axi_periph_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_processing_system7_0_axi_periph_0 || ORIG_REF_NAME==vivado_processing_system7_0_axi_periph_0}]

# IP: bd/vivado/ip/vivado_rst_processing_system7_0_100M_0/vivado_rst_processing_system7_0_100M_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_rst_processing_system7_0_100M_0 || ORIG_REF_NAME==vivado_rst_processing_system7_0_100M_0}]

# IP: bd/vivado/ip/vivado_axi_mem_intercon_0/vivado_axi_mem_intercon_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_axi_mem_intercon_0 || ORIG_REF_NAME==vivado_axi_mem_intercon_0}]

# IP: bd/vivado/ip/vivado_auto_pc_0/vivado_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_auto_pc_0 || ORIG_REF_NAME==vivado_auto_pc_0}]

# IP: bd/vivado/ip/vivado_auto_pc_1/vivado_auto_pc_1.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==vivado_auto_pc_1 || ORIG_REF_NAME==vivado_auto_pc_1}]

# XDC: bd/vivado/ip/vivado_processing_system7_0_0/vivado_processing_system7_0_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==vivado_processing_system7_0_0 || ORIG_REF_NAME==vivado_processing_system7_0_0}] {/inst }]/inst ]]

# XDC: bd/vivado/ip/vivado_toplevel_0_0/constraints/toplevel_ooc.xdc

# XDC: bd/vivado/ip/vivado_rst_processing_system7_0_100M_0/vivado_rst_processing_system7_0_100M_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==vivado_rst_processing_system7_0_100M_0 || ORIG_REF_NAME==vivado_rst_processing_system7_0_100M_0}] {/U0 }]/U0 ]]

# XDC: bd/vivado/ip/vivado_rst_processing_system7_0_100M_0/vivado_rst_processing_system7_0_100M_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==vivado_rst_processing_system7_0_100M_0 || ORIG_REF_NAME==vivado_rst_processing_system7_0_100M_0}] {/U0 }]/U0 ]]

# XDC: bd/vivado/ip/vivado_rst_processing_system7_0_100M_0/vivado_rst_processing_system7_0_100M_0_ooc.xdc

# XDC: bd/vivado/ip/vivado_auto_pc_0/vivado_auto_pc_0_ooc.xdc

# XDC: bd/vivado/ip/vivado_auto_pc_1/vivado_auto_pc_1_ooc.xdc

# XDC: bd/vivado/vivado_ooc.xdc