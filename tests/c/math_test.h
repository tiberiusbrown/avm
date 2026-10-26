#ifndef AVM_MATH_TEST_H
#define AVM_MATH_TEST_H

#include <avm.h>
#include <math.h>
#include <stdint.h>
#include "test_hex_output.h"
#include "../math/accuracy_policy.h"

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

static int check_accuracy_result(float result, uint32_t expected, uint16_t exact,
                                 uint16_t index, enum avm_accuracy policy)
{
    union { float f; uint32_t u; } actual = {result};
    if (!exact || (expected & 0x7fffffffUL) == 0 ||
        (expected & 0x7fffffffUL) >= 0x7f800000UL)
        return check_result(result, expected, 0, index);
    if ((actual.u & 0x7fffffffUL) < 0x7f800000UL &&
        !((actual.u ^ expected) & 0x80000000UL)) {
        uint32_t distance = actual.u > expected ? actual.u-expected : expected-actual.u;
        if (policy==AVM_TAN && avm_abs(from_bits(expected))>=10000.0)
            return check_result(result,expected,4,index);
        if (avm_accuracy_accept(policy, result, from_bits(expected), distance)) return 0;
    }
    return check_result(result, expected, 0, index);
}

static __attribute__((unused)) int check_unary_accuracy(
    float (*function)(float), const AVM_PROGMEM struct math_case *cases,
    uint16_t count, enum avm_accuracy policy)
{
    for (uint16_t i=0; i<count; ++i)
        if (check_accuracy_result(function(from_bits(cases[i].a)), cases[i].expected,
                                  cases[i].tolerance, i, policy)) return 1;
    return 0;
}

static __attribute__((unused)) int check_binary_accuracy(
    float (*function)(float, float), const AVM_PROGMEM struct math_case *cases,
    uint16_t count, enum avm_accuracy policy)
{
    for (uint16_t i=0; i<count; ++i)
        if (check_accuracy_result(function(from_bits(cases[i].a), from_bits(cases[i].b)),
                                  cases[i].expected, cases[i].tolerance, i, policy)) return 1;
    return 0;
}

#endif
