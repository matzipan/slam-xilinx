#include "toplevel.hpp"
#include "fstream"
#include "math.h"

int main() {
	int current_ocm_write_position = 0;
	int current_ocm_read_position = 3+2+(2+4)*6;
	x_uint32 n;

    x_union memory[300];

    std::ifstream in("test.in");
    std::ifstream out("test.out");


    for (int i = 0; i < 3; i++) {
        in>>memory[current_ocm_write_position++].f;	// x[i]
    }

    for (int i = 0; i < 4; i++) {
        in>>memory[current_ocm_write_position++].f;	// R[i][j]
    }

    in>>n;

    for (int i = 0; i < n; i++) {
    	for (int j = 0; j < 2; j++) {
            in>>memory[current_ocm_write_position++].f;	// xf[i]
    	}

    	for (int j = 0; j < 4; j++) {
			in>>memory[current_ocm_write_position++].f;	// Pf[i][j]
		}

    }

    toplevel(memory, n);

    int failed = 0;

    for (int i = 0; i < n * (2+4+4); i++) {
    	float test;

    	out>>test;

    	if (abs(test - memory[current_ocm_read_position+i].f) > 0.00001) {
    		printf("%.10f %.10f\n", test, memory[current_ocm_read_position+i].f);
    		failed++;
    	}
    }

    if(failed == 0) {
    	printf("Everything succeeded\n");
    }

    return failed;
}
