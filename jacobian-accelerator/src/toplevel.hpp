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
typedef ap_uint<9> x_uint9;
typedef ap_uint<7> x_uint7;

#define DATAFLOW_ENABLED
//#define SMALLER_PRECISION
#define HIGHER_PRECISION
#define USE_MEMCPY
//#define MULTIPARTICLE

#ifdef SMALLER_PRECISION
	typedef ap_fixed<14, 8> x_fixedX;

	typedef ap_fixed<13, 7> x_fixed7;
	typedef ap_ufixed<12, 6> x_ufixed6;
	typedef ap_ufixed<23, 12> x_ufixed12;
	typedef ap_fixed<19, 13> x_fixed13;
	typedef ap_ufixed<10, 0> x_ufixedR;
	typedef ap_fixed<25, 14> x_fixedHSP; // Merged these two so matrix_multiply is easier to set up
	typedef ap_fixed<9, 3> x_fixedTrigonometric; // This is needs to accomodate x_ufixed6 and trigonometricOffset
#else
	#ifdef HIGHER_PRECISION
		typedef ap_fixed<27, 8> x_fixedX;

		typedef ap_fixed<26, 7> x_fixed7;
		typedef ap_ufixed<25, 6> x_ufixed6;
		typedef ap_ufixed<31, 12> x_ufixed12;
		typedef ap_fixed<32, 13> x_fixed13;
		typedef ap_ufixed<16, 0> x_ufixedR;
		typedef ap_fixed<33, 14> x_fixedHSP; // Merged these two so matrix_multiply is easier to set up
		typedef ap_fixed<22, 3> x_fixedTrigonometric; // This is needs to accomodate x_ufixed6 and trigonometricOffset
	#else
		typedef ap_fixed<21, 8> x_fixedX;

		typedef ap_fixed<20, 7> x_fixed7;
		typedef ap_ufixed<19, 6> x_ufixed6;
		typedef ap_ufixed<25, 12> x_ufixed12;
		typedef ap_fixed<26, 13> x_fixed13;
		typedef ap_ufixed<10, 0> x_ufixedR;
		typedef ap_fixed<27, 14> x_fixedHSP; // Merged these two so matrix_multiply is easier to set up
		typedef ap_fixed<16, 3> x_fixedTrigonometric; // This is needs to accomodate x_ufixed6 and trigonometricOffset
	#endif
#endif

//Prototypes
void toplevel(float memory[], x_uint32 n);

#endif
