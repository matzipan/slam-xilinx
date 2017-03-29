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
#ifdef MULTIPARTICLE
	printf("Multiparticle on\n");
#endif
#ifdef USE_MEMCPY
	printf("UseMemcpy on\n");
#endif

	int current_ocm_write_position = 0;
	int current_ocm_read_position = 0;
#ifdef NATIVE_TESTBENCH
	uint n;
	uint particles_count;
#else
	x_uint32 n;
	x_uint32 particles_count;
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
	for (int i = 0; i < 300; i++) {
		memory[i] = 0;
	}
#endif

#ifdef MULTIPARTICLE
    std::ifstream in("test-multiparticle.in");
    std::ifstream test("test-multiparticle.out");

    in>>particles_count;
#else
    std::ifstream in("test.in");
    std::ifstream test("test.out");

    particles_count = 1;
#endif

#ifdef MULTIPARTICLE
    for(int particle_number = 0; particle_number < particles_count; particle_number++) {
#endif
		in>>n;

#ifdef MULTIPARTICLE
		memory[current_ocm_write_position++] = n;
#endif


		for (int i = 0; i < 3; i++) {
			in>>memory[current_ocm_write_position++];	// x[i]
		}

		for (int i = 0; i < 4; i++) {
			in>>memory[current_ocm_write_position++];	// R[i][j]
		}

		for (int i = 0; i < n; i++) {
			for (int j = 0; j < 2; j++) {
				in>>memory[current_ocm_write_position++];	// xf[i]
			}

			for (int j = 0; j < 4; j++) {
				in>>memory[current_ocm_write_position++];	// Pf[i][j]
			}

		}
#ifdef MULTIPARTICLE
		current_ocm_write_position += (2+4+6+4)*n;

    }
#endif

#ifdef NATIVE_TESTBENCH
    XToplevel xToplevelInstance;

    XToplevel_Initialize(&xToplevelInstance, "toplevel");

#ifdef MULTIPARTICLE
    XToplevel_Set_particles_count_V(&xToplevelInstance, particles_count);
#else
    XToplevel_Set_n_V(&xToplevelInstance, n);
#endif


    XToplevel_Start(&xToplevelInstance);

    while(!XToplevel_IsDone(&xToplevelInstance)) {
        printf("Not done\n");
    }
#else
	#ifdef MULTIPARTICLE
		toplevel(memory, particles_count);
	#else
		toplevel(memory, n);
	#endif
#endif

    int failed = 0;

#ifdef MULTIPARTICLE
    for(int particle_number = 0; particle_number < particles_count; particle_number++) {
    	int n = memory[current_ocm_read_position++];
#endif

		current_ocm_read_position += 3+4+(2+4)*n;

		for (int i = 0; i < n * (2+4+6+4); i++) {
			float comparison;

			test>>comparison;

			if (abs(comparison - memory[current_ocm_read_position+i]) > 0.00001) {
				printf("%u %.10f %.10f\n", current_ocm_read_position+i, comparison, memory[current_ocm_read_position+i]);
				failed++;
			}
		}

#ifdef MULTIPARTICLE
		current_ocm_read_position += (2+4+6+4)*n;

    }
#endif

    if(failed == 0) {
    	printf("Everything succeeded\n");
    }

    return failed;
}
