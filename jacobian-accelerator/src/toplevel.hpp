#ifndef __TOPLEVEL_H_
#define __TOPLEVEL_H_

#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>
#include <stdio.h>
#include <stdlib.h>

typedef ap_uint<4> x_uint4;
typedef ap_uint<12> x_uint12;
typedef ap_uint<18> x_uint18;
typedef ap_uint<32> x_uint32;

typedef ap_fixed<21, 8> x_fixedX;

typedef ap_fixed<20, 7> x_fixed7;
typedef ap_ufixed<19, 6> x_ufixed6;
typedef ap_ufixed<25, 12> x_ufixed12;
typedef ap_fixed<26, 13> x_fixed13;
typedef ap_ufixed<14, 0> x_ufixedR;
typedef ap_fixed<16, 2> x_fixedHSP; // Merged these two so matrix_multiply is easier to set up
typedef ap_fixed<16, 3> x_fixedTrigonometric; // This is needs to accomodate x_ufixed6 and trigonometricOffset

#define USE_MEMCPY
#define MULTIPARTICLE

//Prototypes
void toplevel(float memory[], x_uint32 n);

#endif
