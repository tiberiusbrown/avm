#include <math.h>
#include <stdint.h>

/* Large exponents amplify logarithm errors; all setup precedes timing. */
static volatile float inputs[32][2];
static volatile float result;
int avm_test_main(void)
{
    for (uint8_t i=0; i<32; ++i) {
        inputs[i][0] = 1.0f + (float)((int)i-16)*0x1p-23f;
        inputs[i][1] = (i&1 ? -1.0f : 1.0f)*0x1p24f;
    }
    float sum=0;
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) sum += powf(inputs[i][0],inputs[i][1]);
    result=sum;
    __avm_debug_break();
    return 0;
}
