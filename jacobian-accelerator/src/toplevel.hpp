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

typedef ap_fixed<36, 10> x_fixed;
typedef ap_fixed<36, 13> x_fixed_bigger;
typedef ap_ufixed<36, 13> x_ufixed;

#define USE_MEMCPY
#define MULTIPARTICLE

//Prototypes
void toplevel(float memory[], x_uint32 n);

#endif
