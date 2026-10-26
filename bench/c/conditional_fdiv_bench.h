#ifndef AVM_CONDITIONAL_FDIV_BENCH_H
#define AVM_CONDITIONAL_FDIV_BENCH_H
#include <stdint.h>
static volatile float numerators[32];
static volatile float divisors[32];
static volatile uint16_t conditions[32];
static volatile float division_sink;
__attribute__((noinline))
static float conditional_division(float a, float b, uint16_t condition)
{
#ifdef EXPECT_DIVISION
    return __builtin_expect(condition != 0, EXPECT_DIVISION) ? a / b : a;
#else
    return condition ? a / b : a;
#endif
}
int avm_test_main(void)
{
    uint16_t state = 0xace1u;
    for (uint8_t i = 0; i < 32; ++i) {
        numerators[i] = 1.0f + (float)i * 0.03125f;
        divisors[i] = 1.5f + (float)i * 0.015625f;
        state = (uint16_t)((state >> 1) ^ ((uint16_t)-(state & 1u) & 0xb400u));
        conditions[i] = CONDITION;
    }
    __avm_debug_break();
    float acc = 0.0f;
    for (uint8_t repeat = 0; repeat < 8; ++repeat)
        for (uint8_t i = 0; i < 32; ++i)
            acc += conditional_division(numerators[i], divisors[i], conditions[i]);
    division_sink = acc;
    __avm_debug_break();
    return 0;
}
#endif
