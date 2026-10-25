#include <math.h>
#include <stdint.h>

static volatile float input = 0.25f;
static volatile float result;

int avm_test_main(void)
{
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i) {
        float x = input + (float)i * 0.03125f;
        sum += sinf(x);
    }
    result = sum;
    __avm_debug_break();
    return 0;
}
