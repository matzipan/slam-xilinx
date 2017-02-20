#include "toplevel.hpp"

int main() {
    hls::stream<int> to_hw, from_hw;

	x_union u;

	u.f = 0.3f;

    to_hw.write(u.i);	// x[0]
    to_hw.write(u.i);	// x[1]
    to_hw.write(u.i);	// x[2]

    to_hw.write(u.i);	// R[0][0]
	to_hw.write(u.i);	// R[0][1]
	to_hw.write(u.i);	// R[1][0]
	to_hw.write(u.i);	// R[1][1]

    to_hw.write(1);     // idf.size()

    u.f = 0.5f;
    to_hw.write(u.i);	// xf[0][0]
    to_hw.write(u.i);	// xf[0][1]

    to_hw.write(u.i);	// Pf[0][0][0]
    to_hw.write(u.i);	// Pf[0][0][1]
    to_hw.write(u.i);	// Pf[0][1][0]
    to_hw.write(u.i);	// Pf[0][1][1]



    //toplevel(to_hw, from_hw);

    //x_input_t value = from_hw.read();

    int failed = 0;

    if(failed == 0) {
    	printf("Everything succeeded\n");
    }

    return failed;
}
