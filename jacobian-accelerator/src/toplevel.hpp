#ifndef __TOPLEVEL_H_
#define __TOPLEVEL_H_

#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>
#include <stdio.h>
#include <stdlib.h>

typedef ap_uint<32> x_uint32;

typedef union {
	int i;
	float f;
} x_union;

typedef ap_fixed<32, 3> x_fixed;

//Prototypes
void toplevel(x_uint32* input, x_fixed bla);//, hls::stream<int> &output);

#endif
