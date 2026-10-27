#ifndef AVM_INTEGER_ROUND_KERNEL_H
#define AVM_INTEGER_ROUND_KERNEL_H
#include "rint_kernel.h"
#include <limits.h>

static __attribute__((always_inline)) inline long avm_rounded_long(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    /* Like avr-libc, return LONG_MIN on nonfinite / out-of-range input.
       The exact negative endpoint has the same value. Never cast out of range. */
    if ((u & 0x7fffffffUL) >= 0x4f000000UL) return (-2147483647L-1);
    return (long)x;
}

static __attribute__((always_inline)) inline long long avm_rounded_llong(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a >= 0x5f000000UL) return LLONG_MIN;
    if (a < 0x4f000000UL) return (long long)(long)x;

    /* The API requires a 64-bit result, but binary32 inputs here are exact
       integers. Pack two 32-bit halves instead of a float-to-i64 libcall or
       general 64-bit arithmetic. AVM's ABI is little endian. */
    union {
        long long value;
        struct { uint32_t low, high; } words;
    } result;
    uint32_t m = (a & 0x007fffffUL) | 0x00800000UL;
    unsigned shift = (unsigned)(a >> 23)-150;
    if (shift < 32) {
        result.words.low = m << shift;
        result.words.high = m >> (32-shift);
    } else {
        result.words.low = 0;
        result.words.high = m << (shift-32);
    }
    if (u >> 31) {
        result.words.high = 0UL-result.words.high-(result.words.low != 0);
        result.words.low = 0UL-result.words.low;
    }
    return result.value;
}
#endif
