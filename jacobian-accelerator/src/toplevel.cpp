#include "toplevel.hpp"
#include <hls_math.h>
#include <hls_linear_algebra.h>
#include "fxp_sqrt.h"
#include "cordic_atan2.hpp"

#define MAX_OBSERVED_LANDMARKS 300
#define X_PI 3.14159265358979323846

typedef ap_ufixed<32, 3> x_ufixed;

x_fixed
	x[3],
	Pf[2][2],
	Hv[2][3], //@TODO  Implementing memory 'toplevel_Hf_V_ram' using block RAMs with power-on initialization.
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
void toplevel(x_uint32* ocm, x_fixed bla) {//, hls::stream<int> &output) {
	#pragma HLS INTERFACE m_axi depth=180 port=ocm
	#pragma HLS INTERFACE s_axilite port=bla bundle=AXILiteS register

	//#pragma HLS INTERFACE axis port=output

	#pragma HLS INTERFACE s_axilite port=return bundle=AXILiteS register

	//@TODO use more hls::Streams
	//@TODO array reshape
	//@TODO https://wiki.york.ac.uk/display/RTS/Vivado+HLS+Knowledge+Base#VivadoHLSKnowledgeBase-ForcingandPreventingtheUseofBlockRAMs

	/*x_union u;

	for (int i = 0; i < 3; i++) {
		u.i = input.read();
		x[i] = u.f;
	}

	for (int j = 0; j < 2; j++) {
		for (int k = 0; k < 2; k++) {
			u.i = input.read();
			R[j][k] = u.f;
		}
	}

	int n = input.read();

	x_fixed dx, dy;
	x_ufixed d2, d;

	main_loop:for (int i = 0; i < n; i++) {
		#pragma HLS LOOP_TRIPCOUNT max=60 avg=10
		u.i = input.read(); // xf[0]
		dx = ((x_fixed) u.f) - x[0];

		u.i = input.read(); // xf[1]
		dy = ((x_fixed) u.f) - x[1];

		d2 = dx * dx + dy * dy;
		fxp_sqrt(d, d2);

		u.f = d.to_float();
		output.write(u.i); // zp[0]

		phase_t zn;
		top_atan2(dy, dx, &zn);
		u.f = trigonometricOffset(zn - x[2]).to_float();
		output.write(u.i); // zp[1]

		//@TODO stream Hf and Hv back
		// Jacobian wrt. feature states
		Hf[0][0] = dx / d;
		u.f = Hf[0][0];
		output.write(u.i);

		Hf[0][1] = dy / d;
		u.f = Hf[0][1];
		output.write(u.i);

		Hf[1][0] = -dy / d2;
		u.f = Hf[1][0];
		output.write(u.i);

		Hf[1][1] = dx / d2;
		u.f = Hf[1][1];
		output.write(u.i);

		// Jacobian wrt. vehicle states
		Hv[0][0] = -Hf[0][0];
		Hv[0][1] = -Hf[0][1];
		Hv[0][2] = 0;
		Hv[1][0] = -Hf[1][0];
		Hv[1][1] = -Hf[1][1];
		Hv[1][2] = -1;

		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				u.i = input.read();
				Pf[j][k] = u.f;
			}
		}

		hls::matrix_multiply <hls::NoTranspose, hls::NoTranspose, 2, 2, 2, 2, 2, 2, x_fixed, x_fixed> (Hf, Pf, aux);
		hls::matrix_multiply <hls::NoTranspose, hls::Transpose, 2, 2, 2, 2, 2, 2, x_fixed, x_fixed> (aux, Pf, Sf);

		for (int j = 0; j < 2; j++) {
			for (int k = 0; k < 2; k++) {
				u.f = Sf[j][k] + R[j][k];
				output.write(u.i); //Sf[j][k]
			}
		}
	}*/
}
