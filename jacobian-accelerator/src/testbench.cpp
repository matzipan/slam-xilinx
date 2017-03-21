#ifdef NATIVE_TESTBENCH
	#include "xtoplevel.h"
	#include <stdexcept>
#else
	#include "toplevel.hpp"
	#include "fstream"
	#include "math.h"

	#define OCM_SIZE 256*1024
	#define OCM_LOC 0xFFFC0000
#endif

int main() {
	int current_ocm_write_position = 0;
	int current_ocm_read_position = 0;
#ifdef NATIVE_TESTBENCH
	uint n;
#else
	x_uint32 n;
#endif

#ifdef NATIVE_TESTBENCH
	printf("Mapping OCM: 256 KB @ 0x%x\n", OCM_LOC);

	// The parameter for open controls whether it uses caching or not.
	int memd = open("/dev/mem" , O_RDWR | O_SYNC);
	if(memd < 0) {
		throw std::runtime_error("Error opening memory device for OCM");
	}

	float* memory = (float*) mmap(NULL, OCM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, memd, OCM_LOC);
#else
    float memory[300];
#endif

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
#ifdef NATIVE_TESTBENCH
    XToplevel xToplevelInstance;

    XToplevel_Initialize(&xToplevelInstance, "toplevel");

    XToplevel_Set_n_V(&xToplevelInstance, n);

    XToplevel_Start(&xToplevelInstance);

    while(!XToplevel_IsDone(&xToplevelInstance)) {
        printf("Not done\n");
    }
#else
    toplevel(memory, n);
#endif

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
