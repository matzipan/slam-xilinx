#include "toplevel.hpp"
#include <string.h>
#include <hls_math.h>
#include <hls_linear_algebra.h>
#include "fxp_sqrt.h"
#include "cordic_atan2.hpp"

#define MAX_OBSERVED_LANDMARKS 20
typedef ap_uint<9> x_landmark_iterator; // 9 = ceil(log2(MAX_OBSERVED_LANDMARKS))

#ifdef MULTIPARTICLE
	#define MAX_PARTICLES 100
	typedef ap_uint<7> x_particle_iterator; // 7 = ceil(log2(MAX_PARTICLES))
#else
	#define MAX_PARTICLES 1
#endif

#define X_PI 3.14159265358979323846
#define X_2PI 6.28318530718
#define X_PI_PHASE ((phase_t) X_PI)
#define X_2PI_FIXED ((phase_t) X_2PI)

#define READ_SIZE(landmarks) ((3+4+(2+4)*landmarks))
#define WRITE_SIZE(landmarks) (((2+4+6+4)*landmarks))

x_fixedTrigonometric trigonometricOffset(phase_t ang) {
#pragma HLS INLINE
	phase_t pi = X_PI;

	int n;

    if ((ang < -X_2PI_FIXED) || (ang > X_2PI_FIXED)) {
        n = (int) (ang / X_2PI_FIXED);
        ang = ang - n * X_2PI_FIXED;
    }

    if (ang > X_PI_PHASE) {
        ang = ang - X_2PI_FIXED;
    }

    if (ang < -X_PI_PHASE) {
        ang = ang + X_2PI_FIXED;
    }

    return ang;
}

#ifdef MULTIPARTICLE
	void processor(float memory[], x_uint32 n) {
	#pragma HLS ALLOCATION instances=processor limit=1 function
#else
	void toplevel(float memory[], x_uint32 n) {
	#pragma HLS INTERFACE m_axi port=memory
	#pragma HLS INTERFACE s_axilite port=n bundle=control register
	#pragma HLS INTERFACE s_axilite port=return bundle=control register
#endif

#ifdef USE_MEMCPY
	float readBram[READ_SIZE(MAX_OBSERVED_LANDMARKS)*MAX_PARTICLES];
	float writeBram[WRITE_SIZE(MAX_OBSERVED_LANDMARKS)*MAX_PARTICLES];
	#define readMemory readBram
	#define writeMemory writeBram
#else
	#define readMemory memory
	#define writeMemory memory
#endif

x_fixedX x[3];
x_ufixedR R[2][2];
x_fixedHSP Hf[2][2], Sf[2][2], Pf[2][2], aux[2][2];

float HfOut[2][2];

#ifdef USE_MEMCPY
	memcpy(readMemory, memory, READ_SIZE(n)*sizeof(float));
#endif

	x_uint32 currentMemoryReadPosition = 0;

#ifdef USE_MEMCPY
	x_uint32 currentMemoryWritePosition = 0;
#else
	x_uint32 currentMemoryWritePosition = 3+4+(2+4)*n;
#endif

	for (x_uint4 i = 0; i < 3; i++) {
		x[i] = readMemory[currentMemoryReadPosition++];
	}


	for (x_uint4 j = 0; j < 2; j++) {
		for (x_uint4 k = 0; k < 2; k++) {
			R[j][k] = readMemory[currentMemoryReadPosition++];
		}
	}

	main_loop:for (x_landmark_iterator i = 0; i < n; i++) {
		x_fixed7 dx, dy;
		x_ufixed6 d;
		x_ufixed12 d2;

		#pragma HLS LOOP_TRIPCOUNT max=60 avg=10
		dx = ((x_fixedX) readMemory[currentMemoryReadPosition++]) - x[0]; // xf[0]
		dy = ((x_fixedX) readMemory[currentMemoryReadPosition++]) - x[1]; // xf[1]

		d2 = ((x_fixed13) dx) * ((x_fixed13) dx) + ((x_fixed13) dy) * ((x_fixed13) dy);

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

		// Using HfOut to avoid having to use .to_float() twice for Hf and Hv
		HfOut[0][0] = Hf[0][0].to_float();
		HfOut[0][1] = Hf[0][1].to_float();
		HfOut[1][0] = Hf[1][0].to_float();
		HfOut[1][1] = Hf[1][1].to_float();


		writeMemory[currentMemoryWritePosition++] = HfOut[0][0];
		writeMemory[currentMemoryWritePosition++] = HfOut[0][1];
		writeMemory[currentMemoryWritePosition++] = HfOut[1][0];
		writeMemory[currentMemoryWritePosition++] = HfOut[1][1];

		// Jacobian wrt. vehicle states
		writeMemory[currentMemoryWritePosition++] = -HfOut[0][0]; // Hv[0][0]
		writeMemory[currentMemoryWritePosition++] = -HfOut[0][1]; // Hv[0][1]
		writeMemory[currentMemoryWritePosition++] = 0; // Hv[0][2]
		writeMemory[currentMemoryWritePosition++] = -HfOut[1][0]; // Hv[1][0]
		writeMemory[currentMemoryWritePosition++] = -HfOut[1][1]; // Hv[1][1]
		writeMemory[currentMemoryWritePosition++] = -1; // Hv[1][2]

		for (x_uint4 j = 0; j < 2; j++) {
			for (x_uint4 k = 0; k < 2; k++) {
				Pf[j][k] = readMemory[currentMemoryReadPosition++];
			}
		}

		hls::matrix_multiply <hls::NoTranspose, hls::NoTranspose, 2, 2, 2, 2, 2, 2, x_fixedHSP, x_fixedHSP> (Hf, Pf, aux); //@TODO $Hf * Pf[i]$ had values in the $[-0.005, 0.003]$
		hls::matrix_multiply <hls::NoTranspose, hls::Transpose, 2, 2, 2, 2, 2, 2, x_fixedHSP, x_fixedHSP> (aux, Hf, Sf); //@TODO When also multiplying with the transpose of \texttt{Hf}, the value range was $[-0.0003, 0.01]$.

		for (x_uint4 j = 0; j < 2; j++) {
			for (x_uint4 k = 0; k < 2; k++) {
				writeMemory[currentMemoryWritePosition++] = (Sf[j][k] + R[j][k]).to_float(); // Sf[j][k]
			}
		}
	}

#ifdef USE_MEMCPY
	memcpy(memory+READ_SIZE(n), writeMemory, WRITE_SIZE(n)*sizeof(float));
#endif
}


#ifdef MULTIPARTICLE
//Top-level function
void toplevel(float memory[], x_uint32 particles_count) {
	#pragma HLS INTERFACE m_axi port=memory
	#pragma HLS INTERFACE s_axilite port=particles_count bundle=control register
	#pragma HLS INTERFACE s_axilite port=return bundle=control register

	x_uint18 address = 0;
	multiparticle_loop: for(x_particle_iterator i = 0; i < particles_count; i++) {
		// x_uint18 because 18 = ceil(log2(256KB))
		// +1 at the end because of the landmark count
		address = i*(READ_SIZE((x_uint18) memory[address]) + WRITE_SIZE((x_uint18) memory[address])+1);

		processor(memory+address+1, (x_uint32) memory[address]);
	}
}
#endif
