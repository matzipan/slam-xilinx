#include "toplevel.hpp"
#include <string.h>
#include <hls_math.h>
#include <hls_linear_algebra.h>
#include "fxp_sqrt.h"
#include "cordic_atan2.hpp"

#define MAX_OBSERVED_LANDMARKS 300
#define X_PI 3.14159265358979323846
#define READ_SIZE(n) (3+4+(2+4)*n)
#define WRITE_SIZE(n) ((2+4+6+4)*n)

#define USE_MEMCPY

#ifdef USE_MEMCPY
	float readBram[READ_SIZE(MAX_OBSERVED_LANDMARKS)];
	float writeBram[WRITE_SIZE(MAX_OBSERVED_LANDMARKS)];
	#define readMemory readBram
	#define writeMemory writeBram
#else
	#define readMemory memory
	#define writeMemory memory
#endif

x_fixed
	x[3],
	Pf[2][2],
	Hv[2][3],
	Hf[2][2],
	Sf[2][2],
	zp[2],
	R[2][2],
	aux[2][2];

x_fixed trigonometricOffset(x_fixed ang) {
#pragma HLS INLINE
	x_fixed pi = X_PI;

	int n;

    if ((ang < -2 * pi) || (ang > 2 * pi)) {
        n = (int) (ang / (2 * pi));
        ang = ang - n * (2 * pi);
    }

    if (ang > X_PI) {
        ang = ang - (2 * pi);
    }

    if (ang < -X_PI) {
        ang = ang + (2 * pi);
    }

    return ang;
}

//Top-level function
void toplevel(float memory[], x_uint32 n) {
	#pragma HLS INTERFACE m_axi port=memory
	#pragma HLS INTERFACE s_axilite port=n bundle=control register
	#pragma HLS INTERFACE s_axilite port=return bundle=control register

	//@TODO array reshape

#ifdef USE_MEMCPY
	memcpy(readMemory, memory, READ_SIZE(n)*sizeof(float));
#endif

	x_uint32 currentMemoryReadPosition = 0;

#ifdef USE_MEMCPY
	x_uint32 currentMemoryWritePosition = 0;
#else
	x_uint32 currentMemoryWritePosition = 3+4+(2+4)*n;
#endif

	for (int i = 0; i < 3; i++) {
		x[i] = readMemory[currentMemoryReadPosition++];
	}


	for (int j = 0; j < 2; j++) {
		for (int k = 0; k < 2; k++) {
			R[j][k] = readMemory[currentMemoryReadPosition++];
		}
	}

	x_fixed dx, dy;
	x_ufixed d2, d;

	main_loop:for (int i = 0; i < n; i++) {
		#pragma HLS LOOP_TRIPCOUNT max=60 avg=10
		dx = ((x_fixed) readMemory[currentMemoryReadPosition++]) - x[0]; // xf[0]
		dy = ((x_fixed) readMemory[currentMemoryReadPosition++]) - x[1]; // xf[1]

		d2 = ((x_fixed_bigger) dx) * ((x_fixed_bigger) dx) + ((x_fixed_bigger) dy) * ((x_fixed_bigger) dy);
		fxp_sqrt(d, d2);

		writeMemory[currentMemoryWritePosition++] = d.to_float(); // zp[0]

		phase_t zn;
		top_atan2(dy, dx, &zn);
		writeMemory[currentMemoryWritePosition++] = trigonometricOffset(zn - x[2]).to_float();  // zp[1]

		// Jacobian wrt. feature states
		Hf[0][0] = dx / d;
		Hf[0][1] = dy / d;
		Hf[1][0] = -dy / d2;
		Hf[1][1] = dx / d2;

		writeMemory[currentMemoryWritePosition++] = Hf[0][0].to_float();
		writeMemory[currentMemoryWritePosition++] = Hf[0][1].to_float();
		writeMemory[currentMemoryWritePosition++] = Hf[1][0].to_float();
		writeMemory[currentMemoryWritePosition++] = Hf[1][1].to_float();

		// Jacobian wrt. vehicle states
		writeMemory[currentMemoryWritePosition++] = (-Hf[0][0]).to_float(); // Hv[0][0]
		writeMemory[currentMemoryWritePosition++] = (-Hf[0][1]).to_float(); // Hv[0][1]
		writeMemory[currentMemoryWritePosition++] = 0; // Hv[0][2]
		writeMemory[currentMemoryWritePosition++] = (-Hf[1][0]).to_float(); // Hv[1][0]
		writeMemory[currentMemoryWritePosition++] = (-Hf[1][1]).to_float(); // Hv[1][1]
		writeMemory[currentMemoryWritePosition++] = -1; // Hv[1][2]

		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				Pf[j][k] = readMemory[currentMemoryReadPosition++];
			}
		}

		hls::matrix_multiply <hls::NoTranspose, hls::NoTranspose, 2, 2, 2, 2, 2, 2, x_fixed, x_fixed> (Hf, Pf, aux);
		hls::matrix_multiply <hls::NoTranspose, hls::Transpose, 2, 2, 2, 2, 2, 2, x_fixed, x_fixed> (aux, Hf, Sf);

		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				writeMemory[currentMemoryWritePosition++] = (Sf[j][k] + R[j][k]).to_float(); // Sf[j][k]
			}
		}
	}

#ifdef USE_MEMCPY
	memcpy(memory+READ_SIZE(n), writeMemory, WRITE_SIZE(n)*sizeof(float));
#endif
}
