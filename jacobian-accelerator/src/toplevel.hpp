#ifndef __TOPLEVEL_H_
#define __TOPLEVEL_H_

#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>
#include <stdio.h>
#include <stdlib.h>

typedef ap_uint<12> x_uint12;
typedef ap_uint<32> x_uint32;

typedef union {
	int i;
	float f;
} x_union;

typedef ap_fixed<36, 10> x_fixed;
typedef ap_ufixed<36, 10> x_ufixed;

//Prototypes
void toplevel(x_union* ocm, x_uint32 n);

#endif
