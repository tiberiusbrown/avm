#ifndef AVM_TANGENT_QUADRANT_BENCH_H
#define AVM_TANGENT_QUADRANT_BENCH_H
#include <math.h>
#include <stdint.h>
static volatile float tangent_inputs[32];
static volatile float tangent_sink;
int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i)
        tangent_inputs[i] = ANGLE_BASE + (float)i * 0.00390625f;
    __avm_debug_break();
    float acc = 0.0f;
    for (uint8_t i = 0; i < 32; ++i) acc += tanf(tangent_inputs[i]);
    tangent_sink = acc;
    __avm_debug_break();
    return 0;
}
#endif
