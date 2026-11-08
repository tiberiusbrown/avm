#include <math.h>
#include <stdint.h>
#include <avm.h>

/* Thirty-two calls: ordinary values, cancellation/endpoint neighbors, both
   scaling extremes, and subnormals. Setup is outside the measured interval. */
static const AVM_PROGMEM float inputs[] = { C99_INPUTS };
static volatile float result __attribute__((unused));
static volatile int integer_result __attribute__((unused));
int avm_test_main(void)
{
    __avm_debug_break();
    for (uint8_t i=0; i<32; ++i) {
        float x=inputs[i & 15];
        C99_OPERATION;
    }
    __avm_debug_break();
    return 0;
}
