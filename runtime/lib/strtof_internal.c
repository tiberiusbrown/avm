#include <stdint.h>
#include <float.h>
#include <avm/pgmspace.h>
#include "strtof_internal.h"
static float from_bits(uint32_t bits) {
    union { uint32_t u; float f; } value = {bits};
    return value.f;
}
/* Round a retained hexadecimal significand with guard/sticky information.
 * This also rounds directly into the subnormal format, without double rounding. */
static uint32_t rounded_shift(uint32_t value, int shift, int sticky) {
    if(shift <= 0) return value << -shift;
    if(shift > 32) return 0;
    if(shift == 32)
        return value > 0x80000000UL || (value == 0x80000000UL && sticky);
    uint32_t half = 1UL << (shift - 1);
    uint32_t tail = value & ((half << 1) - 1);
    uint32_t result = value >> shift;
    if(tail > half || (tail == half && (sticky || (result & 1)))) ++result;
    return result;
}

float __avm_hex_value(uint32_t mantissa, long exponent, int sticky) {
    int top = 0;
    uint32_t m = mantissa;
    if(m >= 0x10000UL) { m >>= 16; top += 16; }
    if(m >= 0x100UL) { m >>= 8; top += 8; }
    if(m >= 0x10UL) { m >>= 4; top += 4; }
    if(m >= 4) { m >>= 2; top += 2; }
    if(m >= 2) ++top;
    long power = exponent + top;
    if(power > 127) return from_bits(0x7f800000UL);
    if(power < -150) return 0.0f;
    if(power < -126)
        return from_bits(rounded_shift(mantissa, (int)(-149 - exponent), sticky));
    uint32_t significand = rounded_shift(mantissa, top - 23, sticky);
    if(significand == 0x1000000UL) {
        significand >>= 1;
        ++power;
    }
    if(power > 127) return from_bits(0x7f800000UL);
    return from_bits(((uint32_t)(power + 127) << 23) | (significand & 0x7fffffUL));
}

/* Nine retained decimal digits fit in a native 32-bit integer. Scale with
 * binary32 operations only; no double or wide-integer precision machinery.
 * Keep intermediate values in binary32 throughout scaling. */
float __avm_decimal_value(uint32_t mantissa, long exponent, int retained, int overflow) {
    static const float AVM_PROGMEM powers[] = {1e1f, 1e2f, 1e4f, 1e8f, 1e16f, 1e32f};
    float value = (float)mantissa;
    long power = exponent + retained - 1;
    if(power > 38 || (power == 38 && overflow))
        return from_bits(0x7f800000UL);
    if(exponent < -54) return 0.0f;
    unsigned int magnitude = (unsigned int)(exponent < 0 ? -exponent : exponent);
    for(int step = 0; step < 6; ++step) {
        int bit = exponent < 0 ? step : 5 - step;
        if(magnitude & (1u << bit))
            value = exponent < 0 ? value / powers[bit] : value * powers[bit];
    }
    if(value > FLT_MAX) return FLT_MAX;
    return value;
}

