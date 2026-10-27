#ifndef AVM_RINT_KERNEL_H
#define AVM_RINT_KERNEL_H
#include "fdlibm.h"

static __attribute__((always_inline)) inline float avm_rint(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if ((uint16_t)(a >> 16) >= 0x4b00U)
        return a >= 0x7f800000UL ? x+x : x;
    float magnitude;
    SET_FLOAT_WORD(magnitude, a);
    /* Separate binary32 add/subtract operations use the runtime's fixed
       round-to-nearest/even mode. Beyond 2^23 all finite floats are integers. */
    float rounded = magnitude+0x1p23f;
    rounded -= 0x1p23f;
    GET_FLOAT_WORD(a, rounded);
    SET_FLOAT_WORD(rounded, a | (u & 0x80000000UL));
    return rounded;
}

static __attribute__((always_inline)) inline float avm_round_away(float x)
{
#ifdef __AVM__
    register float value __asm__("q2") = x;
    __asm__("fround" : "+r"(value));
    return value;
#else
    return roundf(x);
#endif
}
#endif
