#include <math.h>
#include <stdint.h>

/* Compare bounded squaring with logarithms across the loop crossover. */
static const float exponents[16]={2,3,4,5,6,7,8,12,16,24,31,32,48,64,96,128};
static volatile float inputs[32][2];
static volatile float result;
int avm_test_main(void)
{
    for (uint8_t i=0; i<32; ++i) {
        inputs[i][0]=i&1 ? 0.9921875f : 1.0078125f;
        inputs[i][1]=exponents[i&15]*(i&16 ? -1.0f : 1.0f);
    }
    float sum=0;
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) sum+=powf(inputs[i][0],inputs[i][1]);
    result=sum;
    __avm_debug_break();
    return 0;
}
