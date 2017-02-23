#include "toplevel.hpp"
#include "fstream"
#include "math.h"

int main() {
	int current_ocm_write_position = 0;
	int current_ocm_read_position = 0;
	x_uint32 n;

    float memory[300];

    std::ifstream in("test.in");
    std::ifstream out("test.out");


    for (int i = 0; i < 3; i++) {
        in>>memory[current_ocm_write_position++];	// x[i]
    }

    for (int i = 0; i < 4; i++) {
        in>>memory[current_ocm_write_position++];	// R[i][j]
    }

    in>>n;

    current_ocm_read_position = 3+4+(2+4)*n;

    for (int i = 0; i < n; i++) {
    	for (int j = 0; j < 2; j++) {
            in>>memory[current_ocm_write_position++];	// xf[i]
    	}

    	for (int j = 0; j < 4; j++) {
			in>>memory[current_ocm_write_position++];	// Pf[i][j]
		}

    }

    toplevel(memory, n);

    int failed = 0;

    for (int i = 0; i < n * (2+4+6+4); i++) {
    	float test;

    	out>>test;

    	if (abs(test - memory[current_ocm_read_position+i]) > 0.00001) {
    		printf("%.10f %.10f\n", test, memory[current_ocm_read_position+i]);
    		failed++;
    	}
    }

    if(failed == 0) {
    	printf("Everything succeeded\n");
    }

    return failed;
}
