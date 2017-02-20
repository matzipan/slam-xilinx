#include "toplevel.hpp"
#include <hls_math.h>
#include <hls_linear_algebra.h>
#include "fxp_sqrt.h"
#include "cordic_atan2.hpp"

#define MAX_OBSERVED_LANDMARKS 300
#define X_PI 3.14159265358979323846

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
void toplevel(x_union* ocm, x_uint32 n) {
	#pragma HLS INTERFACE m_axi depth=180 port=ocm
	#pragma HLS INTERFACE s_axilite port=n bundle=control register
	#pragma HLS INTERFACE s_axilite port=return bundle=control register

	//@TODO use memcpy for burst mode
	//@TODO array reshape
	//@TODO https://wiki.york.ac.uk/display/RTS/Vivado+HLS+Knowledge+Base#VivadoHLSKnowledgeBase-ForcingandPreventingtheUseofBlockRAMs

	x_union u;
	x_uint12 current_ocm_read_position = 0;
	x_uint12 current_ocm_write_position = 3+2+(2+4)*n;

	for (int i = 0; i < 3; i++) {
		x[i] = ocm[current_ocm_read_position++].f;
	}

	for (int j = 0; j < 2; j++) {
		for (int k = 0; k < 2; k++) {
			R[j][k] = ocm[current_ocm_read_position++].f;
		}
	}

	x_fixed dx, dy;
	x_ufixed d2, d;

	main_loop:for (int i = 0; i < n; i++) {
		#pragma HLS LOOP_TRIPCOUNT max=60 avg=10
		dx = ((x_fixed) ocm[current_ocm_read_position++].f) - x[0]; // xf[0]
		dy = ((x_fixed) ocm[current_ocm_read_position++].f) - x[1]; // xf[1]

		d2 = dx * dx + dy * dy;
		fxp_sqrt(d, d2);

		ocm[current_ocm_write_position++].f = d.to_float(); // zp[0]

		phase_t zn;
		top_atan2(dy, dx, &zn);
		ocm[current_ocm_write_position++].f = trigonometricOffset(zn - x[2]).to_float();  // zp[1]

		// Jacobian wrt. feature states
		Hf[0][0] = dx / d;
		Hf[0][1] = dy / d;
		Hf[1][0] = -dy / d2;
		Hf[1][1] = dx / d2;

		ocm[current_ocm_write_position++].f = Hf[0][0];
		ocm[current_ocm_write_position++].f = Hf[0][1];
		ocm[current_ocm_write_position++].f = Hf[1][0];
		ocm[current_ocm_write_position++].f = Hf[1][1];

		// Jacobian wrt. vehicle states
		Hv[0][0] = -Hf[0][0];
		Hv[0][1] = -Hf[0][1];
		Hv[0][2] = 0;
		Hv[1][0] = -Hf[1][0];
		Hv[1][1] = -Hf[1][1];
		Hv[1][2] = -1;

		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				Pf[j][k] = ocm[current_ocm_read_position++].f;
			}
		}

		hls::matrix_multiply <hls::NoTranspose, hls::NoTranspose, 2, 2, 2, 2, 2, 2, x_fixed, x_fixed> (Hf, Pf, aux);
		hls::matrix_multiply <hls::NoTranspose, hls::Transpose, 2, 2, 2, 2, 2, 2, x_fixed, x_fixed> (aux, Pf, Sf);

		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				ocm[current_ocm_write_position++].f = Sf[j][k] + R[j][k]; // Sf[j][k]
			}
		}
	}
}
