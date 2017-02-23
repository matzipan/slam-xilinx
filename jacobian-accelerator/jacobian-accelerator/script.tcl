############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project jacobian-accelerator
set_top toplevel
add_files jacobian-accelerator/src/cordic_atan2.cpp
add_files jacobian-accelerator/src/cordic_atan2.hpp
add_files jacobian-accelerator/src/fxp_sqrt.h
add_files jacobian-accelerator/src/toplevel.cpp
add_files jacobian-accelerator/src/toplevel.hpp
add_files -tb jacobian-accelerator/src/test.in
add_files -tb jacobian-accelerator/src/test.out
add_files -tb jacobian-accelerator/src/testbench.cpp
open_solution "jacobian-accelerator"
set_part {xc7z045ffg900-2}
create_clock -period 100MHz -name default
#source "./jacobian-accelerator/jacobian-accelerator/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
