#include <math.h>
#include <stdint.h>

/* Shared evaluation workload; setup and stores match the two-call baseline. */
static volatile float inputs[32];
static volatile float results[32][2];
int avm_test_main(void)
{
    for (uint8_t i=0; i<32; ++i) inputs[i]=(float)((int)i-16)*0.3125f;
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) {
        float s,c;
        sincosf(inputs[i],&s,&c);
        results[i][0]=s;
        results[i][1]=c;
    }
    __avm_debug_break();
    return 0;
}
