#ifndef AVM_MATH_TEST_H
#define AVM_MATH_TEST_H

#include <avm.h>
#include <math.h>
#include <stdint.h>
#include "test_hex_output.h"

struct math_case {
    uint32_t a, b, expected;
    uint16_t tolerance;
};

static float from_bits(uint32_t u)
{
    union { uint32_t u; float f; } v = {u};
    return v.f;
}

static int check_result(float result, uint32_t expected, uint16_t tolerance,
                        uint16_t index)
{
    union { float f; uint32_t u; } v = {result};
    uint32_t bits = v.u;
    if ((expected & 0x7fffffffUL) > 0x7f800000UL) {
        if ((bits & 0x7fffffffUL) > 0x7f800000UL) return 0;
    } else if (bits == expected) {
        return 0;
    } else if (((bits ^ expected) & 0x80000000UL) == 0 &&
               (bits & 0x7fffffffUL) < 0x7f800000UL &&
               (expected & 0x7fffffffUL) < 0x7f800000UL) {
        uint32_t distance = bits > expected ? bits - expected : expected - bits;
        if (distance <= tolerance) return 0;
    }
    test_line16("case", index);
    test_line32("actual", bits);
    test_line32("expected", expected);
    return 1;
}

static __attribute__((unused)) int check_unary(
    float (*function)(float), const AVM_PROGMEM struct math_case *cases,
    uint16_t count)
{
    for (uint16_t i = 0; i < count; ++i)
        if (check_result(function(from_bits(cases[i].a)), cases[i].expected,
                         cases[i].tolerance, i)) return 1;
    return 0;
}

static __attribute__((unused)) int check_binary(
    float (*function)(float, float), const AVM_PROGMEM struct math_case *cases,
    uint16_t count)
{
    for (uint16_t i = 0; i < count; ++i)
        if (check_result(function(from_bits(cases[i].a), from_bits(cases[i].b)),
                         cases[i].expected, cases[i].tolerance, i)) return 1;
    return 0;
}

#endif
