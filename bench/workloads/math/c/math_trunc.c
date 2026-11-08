#include <math.h>
#include "math_rounding_inputs.h"

static volatile float result;

int avm_test_main(void)
{
    init_rounding_inputs();
    float sum = 0.0f;
    __avm_debug_break();
    for (uint8_t i = 0; i < 32; ++i)
        sum += truncf(rounding_inputs[i]);
    result = sum;
    __avm_debug_break();
    return 0;
}
