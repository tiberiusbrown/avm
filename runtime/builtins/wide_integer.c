#include <stdint.h>

/* The AVM ABI is little endian. Work on 32-bit halves so these routines never
 * lower their own arithmetic back into the i64 libcalls they implement. */
typedef union {
    uint64_t value;
    struct {
        uint32_t low;
        uint32_t high;
    } words;
    uint16_t limbs[4];
} avm_u64;

typedef union {
    int64_t value;
    avm_u64 bits;
} avm_i64;

static inline avm_u64 avm_negate64(avm_u64 value)
{
    avm_u64 result;
    result.words.low = 0u - value.words.low;
    result.words.high = 0u - value.words.high - (value.words.low != 0);
    return result;
}

static inline int avm_less64(avm_u64 left, avm_u64 right)
{
    return left.words.high < right.words.high ||
           (left.words.high == right.words.high &&
            left.words.low < right.words.low);
}

static inline avm_u64 avm_subtract64(avm_u64 left, avm_u64 right)
{
    avm_u64 result;
    result.words.low = left.words.low - right.words.low;
    result.words.high = left.words.high - right.words.high -
                        (left.words.low < right.words.low);
    return result;
}

static inline avm_u64 avm_shift_left_one(avm_u64 value)
{
    avm_u64 result;
    result.words.high = (value.words.high << 1) | (value.words.low >> 31);
    result.words.low = value.words.low << 1;
    return result;
}

__attribute__((noinline))
uint64_t __avm_muldi3(uint64_t left, uint64_t right)
{
    avm_u64 a = {.value = left};
    avm_u64 b = {.value = right};
    avm_u64 result = {.value = 0};

    /* Base-2^16 schoolbook multiplication, retaining the low four limbs.
     * Each 16 x 16 product and its two 16-bit addends fit in uint32_t. */
    for (uint16_t i = 0; i < 4; ++i) {
        uint32_t carry = 0;
        for (uint16_t j = 0; j < 4 - i; ++j) {
            uint32_t sum = (uint32_t)a.limbs[i] * b.limbs[j] +
                           result.limbs[i + j] + carry;
            result.limbs[i + j] = (uint16_t)sum;
            carry = sum >> 16;
        }
    }
    return result.value;
}

/* Restoring division. The extra top bit is kept separately so shifting a
 * 64-bit remainder cannot lose a bit needed for the comparison. */
static avm_u64 avm_udivmod64(avm_u64 numerator, avm_u64 denominator,
                            avm_u64 *remainder_out)
{
    avm_u64 quotient = {.value = 0};
    avm_u64 remainder = {.value = 0};

    /* Match the existing 32-bit helpers and the AVM integer instructions. */
    if (denominator.words.low == 0 && denominator.words.high == 0) {
        *remainder_out = numerator;
        quotient.words.low = UINT32_MAX;
        quotient.words.high = UINT32_MAX;
        return quotient;
    }

    for (uint16_t i = 0; i < 64; ++i) {
        uint32_t incoming = numerator.words.high >> 31;
        uint32_t overflow = remainder.words.high >> 31;
        numerator = avm_shift_left_one(numerator);
        remainder = avm_shift_left_one(remainder);
        remainder.words.low |= incoming;
        quotient = avm_shift_left_one(quotient);

        if (overflow || !avm_less64(remainder, denominator)) {
            remainder = avm_subtract64(remainder, denominator);
            quotient.words.low |= 1u;
        }
    }

    *remainder_out = remainder;
    return quotient;
}

__attribute__((noinline))
uint64_t __avm_udivmoddi4(uint64_t numerator, uint64_t denominator,
                         uint64_t *remainder_out)
{
    avm_u64 n = {.value = numerator};
    avm_u64 d = {.value = denominator};
    avm_u64 remainder;
    avm_u64 quotient = avm_udivmod64(n, d, &remainder);
    *remainder_out = remainder.value;
    return quotient.value;
}

__attribute__((noinline))
uint64_t __avm_udivdi3(uint64_t numerator, uint64_t denominator)
{
    avm_u64 n = {.value = numerator};
    avm_u64 d = {.value = denominator};
    avm_u64 remainder;
    return avm_udivmod64(n, d, &remainder).value;
}

__attribute__((noinline))
uint64_t __avm_umoddi3(uint64_t numerator, uint64_t denominator)
{
    avm_u64 n = {.value = numerator};
    avm_u64 d = {.value = denominator};
    avm_u64 remainder;
    (void)avm_udivmod64(n, d, &remainder);
    return remainder.value;
}

static inline avm_u64 avm_abs64(int64_t value)
{
    avm_i64 bits = {.value = value};
    return value < 0 ? avm_negate64(bits.bits) : bits.bits;
}

__attribute__((noinline))
int64_t __avm_divmoddi4(int64_t numerator, int64_t denominator,
                       int64_t *remainder_out)
{
    if (denominator == 0) {
        *remainder_out = numerator;
        return -1;
    }

    avm_u64 n = avm_abs64(numerator);
    avm_u64 d = avm_abs64(denominator);
    avm_u64 remainder;
    avm_u64 quotient = avm_udivmod64(n, d, &remainder);
    if ((numerator < 0) != (denominator < 0))
        quotient = avm_negate64(quotient);
    if (numerator < 0)
        remainder = avm_negate64(remainder);
    avm_i64 q = {.bits = quotient};
    avm_i64 r = {.bits = remainder};
    *remainder_out = r.value;
    return q.value;
}

__attribute__((noinline))
int64_t __avm_divdi3(int64_t numerator, int64_t denominator)
{
    if (denominator == 0)
        return -1;

    avm_u64 n = avm_abs64(numerator);
    avm_u64 d = avm_abs64(denominator);
    avm_u64 remainder;
    avm_u64 quotient = avm_udivmod64(n, d, &remainder);
    if ((numerator < 0) != (denominator < 0))
        quotient = avm_negate64(quotient);
    avm_i64 result = {.bits = quotient};
    return result.value;
}

__attribute__((noinline))
int64_t __avm_moddi3(int64_t numerator, int64_t denominator)
{
    if (denominator == 0)
        return numerator;

    avm_u64 n = avm_abs64(numerator);
    avm_u64 d = avm_abs64(denominator);
    avm_u64 remainder;
    (void)avm_udivmod64(n, d, &remainder);
    if (numerator < 0)
        remainder = avm_negate64(remainder);
    avm_i64 result = {.bits = remainder};
    return result.value;
}

/* Shift in native words, avoiding three nested 32-bit helper calls for the
 * cross-word pieces. Whole-word moves run before the remaining 1..15-bit
 * shifts, so no C shift has an out-of-range count. */
__attribute__((noinline))
uint64_t __avm_ashldi3(uint64_t value, uint16_t count)
{
    avm_u64 bits = {.value = value};
    if (count == 1) {
        uint16_t carry = bits.limbs[1] >> 15;
        bits.words.low += bits.words.low;
        bits.words.high += bits.words.high;
        bits.limbs[2] |= carry;
        return bits.value;
    }
    if (count >= 64) return 0;
    if (count >= 48) {
        uint16_t high = (uint16_t)(bits.limbs[0] << (count - 48));
        bits.words.low = 0;
        bits.limbs[2] = 0;
        bits.limbs[3] = high;
        return bits.value;
    }
    if (count >= 32) {
        bits.limbs[3] = bits.limbs[1];
        bits.limbs[2] = bits.limbs[0];
        bits.limbs[1] = bits.limbs[0] = 0;
        count -= 32;
    }
    if (count >= 16) {
        bits.limbs[3] = bits.limbs[2];
        bits.limbs[2] = bits.limbs[1];
        bits.limbs[1] = bits.limbs[0];
        bits.limbs[0] = 0;
        count -= 16;
    }
    if (count) {
        unsigned opposite = 16 - count;
        bits.limbs[3] = (uint16_t)((bits.limbs[3] << count) |
                                   (bits.limbs[2] >> opposite));
        bits.limbs[2] = (uint16_t)((bits.limbs[2] << count) |
                                   (bits.limbs[1] >> opposite));
        bits.limbs[1] = (uint16_t)((bits.limbs[1] << count) |
                                   (bits.limbs[0] >> opposite));
        bits.limbs[0] = (uint16_t)(bits.limbs[0] << count);
    }
    return bits.value;
}

__attribute__((noinline))
uint64_t __avm_lshrdi3(uint64_t value, uint16_t count)
{
    avm_u64 bits = {.value = value};
    if (count == 1) {
        uint16_t carry = (uint16_t)(bits.limbs[2] << 15);
        bits.words.low >>= 1;
        bits.words.high >>= 1;
        bits.limbs[1] |= carry;
        return bits.value;
    }
    if (count >= 64) return 0;
    if (count >= 48) {
        uint16_t low = (uint16_t)(bits.limbs[3] >> (count - 48));
        bits.limbs[0] = low;
        bits.limbs[1] = 0;
        bits.words.high = 0;
        return bits.value;
    }
    if (count >= 32) {
        bits.limbs[0] = bits.limbs[2];
        bits.limbs[1] = bits.limbs[3];
        bits.limbs[2] = bits.limbs[3] = 0;
        count -= 32;
    }
    if (count >= 16) {
        bits.limbs[0] = bits.limbs[1];
        bits.limbs[1] = bits.limbs[2];
        bits.limbs[2] = bits.limbs[3];
        bits.limbs[3] = 0;
        count -= 16;
    }
    if (count) {
        unsigned opposite = 16 - count;
        bits.limbs[0] = (uint16_t)((bits.limbs[0] >> count) |
                                   (bits.limbs[1] << opposite));
        bits.limbs[1] = (uint16_t)((bits.limbs[1] >> count) |
                                   (bits.limbs[2] << opposite));
        bits.limbs[2] = (uint16_t)((bits.limbs[2] >> count) |
                                   (bits.limbs[3] << opposite));
        bits.limbs[3] = (uint16_t)(bits.limbs[3] >> count);
    }
    return bits.value;
}

__attribute__((noinline))
int64_t __avm_ashrdi3(int64_t value, uint16_t count)
{
    avm_i64 bits = {.value = value};
    if (count == 1) {
        uint16_t carry = (uint16_t)(bits.bits.limbs[2] << 15);
        bits.bits.words.low >>= 1;
        bits.bits.words.high = (uint32_t)((int32_t)bits.bits.words.high >> 1);
        bits.bits.limbs[1] |= carry;
        return bits.value;
    }
    uint16_t sign = (uint16_t)((int16_t)bits.bits.limbs[3] >> 15);
    if (count >= 64) return sign ? -1 : 0;
    if (count >= 48) {
        uint16_t low = (uint16_t)((int16_t)bits.bits.limbs[3] >> (count - 48));
        bits.bits.limbs[0] = low;
        bits.bits.limbs[1] = sign;
        bits.bits.limbs[2] = bits.bits.limbs[3] = sign;
        return bits.value;
    }
    if (count >= 32) {
        bits.bits.limbs[0] = bits.bits.limbs[2];
        bits.bits.limbs[1] = bits.bits.limbs[3];
        bits.bits.limbs[2] = bits.bits.limbs[3] = sign;
        count -= 32;
    }
    if (count >= 16) {
        bits.bits.limbs[0] = bits.bits.limbs[1];
        bits.bits.limbs[1] = bits.bits.limbs[2];
        bits.bits.limbs[2] = bits.bits.limbs[3];
        bits.bits.limbs[3] = sign;
        count -= 16;
    }
    if (count) {
        unsigned opposite = 16 - count;
        bits.bits.limbs[0] = (uint16_t)((bits.bits.limbs[0] >> count) |
                                        (bits.bits.limbs[1] << opposite));
        bits.bits.limbs[1] = (uint16_t)((bits.bits.limbs[1] >> count) |
                                        (bits.bits.limbs[2] << opposite));
        bits.bits.limbs[2] = (uint16_t)((bits.bits.limbs[2] >> count) |
                                        (bits.bits.limbs[3] << opposite));
        bits.bits.limbs[3] = (uint16_t)((int16_t)bits.bits.limbs[3] >> count);
    }
    return bits.value;
}

/* --------------------------------------------------------------------
 * Unsigned 64-bit integer → binary32 conversion helpers.
 *
 * Both signed and unsigned helpers share avm_u64_to_float_bits()
 * which returns the IEEE-754 binary32 bit pattern of the correctly
 * rounded, non-negative result.
 * -------------------------------------------------------------------- */

typedef union {
    uint32_t bits;
    float value;
} avm_f32_bits;

/* Return the binary32 bit pattern of the correctly rounded (ties-to-even)
 * non-negative value represented by |input|.  input must be > 0. */
static uint32_t avm_u64_to_float_bits(avm_u64 input)
{
    uint32_t high = input.words.high;
    uint32_t low = input.words.low;

    /* Normalize so that the MSB of the original 64-bit value occupies
     * bit 63.  high != 0, so clzl will always find a set bit. */
    uint32_t n = (uint32_t)__builtin_clzl((unsigned long)high);

    uint32_t normalized_high;
    uint32_t normalized_low;

    if (n == 0) {
        normalized_high = high;
        normalized_low = low;
    } else {
        normalized_high = (high << n) | (low >> (32 - n));
        normalized_low = low << n;
    }

    /* Biased exponent: MSB is at position (63 - n), so the exponent
     * is (63 - n) and the bias is 127. */
    uint32_t biased_exponent = 190u - n;

    /* Initial result: biased exponent + top 23 bits of the significand.
     * The implicit leading 1 is not stored. */
    uint32_t result = (biased_exponent << 23) |
                      ((normalized_high >> 8) & 0x7fffffu);

    /* Round to nearest, ties-to-even.
     * Guard bit:   bit 7 of normalized_high
     * Round bits:  bits 0-6 of normalized_high  |  all of normalized_low
     * Tie (LSB):   bit 8 of normalized_high     (retained LSB) */
    if ((normalized_high & 0x80u) != 0 &&
        (((normalized_high & 0x7fu) != 0) ||
         normalized_low != 0 ||
         (normalized_high & 0x100u) != 0)) {
        ++result;
    }

    return result;
}

__attribute__((noinline))
float __floatundisf(uint64_t value)
{
    /* Fast path for zero and values that fit in 32 bits. */
    if (value == 0)
        return 0.0f;

    avm_u64 input = {.value = value};
    if (input.words.high == 0) {
        /* 32-bit fast path — reuse the native conversion. */
        avm_f32_bits output;
        output.value = (float)input.words.low;
        return output.value;
    }

    /* Full 64-bit path. */
    avm_f32_bits output;
    output.bits = avm_u64_to_float_bits(input);
    return output.value;
}

__attribute__((noinline))
float __floatdisf(int64_t value)
{
    avm_i64 bits = {.value = value};

    /* Check sign: bit 31 of the high word. */
    int is_negative = (int32_t)bits.bits.words.high < 0;

    avm_u64 magnitude = is_negative ? avm_negate64(bits.bits) : bits.bits;

    /* Zero magnitude → return signed zero. */
    if (magnitude.value == 0)
        return (float)0.0f;

    uint32_t result_bits;

    /* 32-bit fast path — reuse the native conversion. */
    if (magnitude.words.high == 0) {
        avm_f32_bits output;
        output.value = (float)magnitude.words.low;
        result_bits = output.bits;
    } else {
        result_bits = avm_u64_to_float_bits(magnitude);
    }

    if (is_negative)
        result_bits |= 0x80000000u;

    avm_f32_bits output;
    output.bits = result_bits;
    return output.value;
}

/* --------------------------------------------------------------------
 * Binary32 → signed/unsigned 64-bit integer conversion helpers.
 *
 * All conversions truncate toward zero.  NaN, infinity, and
 * unrepresentable results return zero (deterministic fallback).
 * -------------------------------------------------------------------- */

static avm_u64 avm_float_significand_to_u64(uint32_t significand,
                                             int32_t exponent)
{
    avm_u64 result = {.value = 0};
    int32_t shift = exponent - 23;

    if (shift < 0) {
        /* shift is in [-23, -1] after caller validation. */
        result.words.low = significand >> (uint32_t)(-shift);
        result.words.high = 0;
    } else if (shift == 0) {
        result.words.low = significand;
        result.words.high = 0;
    } else if (shift < 32) {
        /* shift is in [1, 31]. */
        result.words.low = significand << shift;
        result.words.high = significand >> (32 - shift);
    } else {
        /* shift is in [32, 40] because max exponent = 63. */
        result.words.low = 0;
        result.words.high = significand << (shift - 32);
    }

    return result;
}

__attribute__((noinline))
uint64_t __fixunssfdi(float value)
{
    avm_f32_bits representation = {.value = value};
    uint32_t bits = representation.bits;

    uint32_t sign = bits >> 31;
    uint32_t raw_exponent = (bits >> 23) & 0xffu;
    uint32_t fraction = bits & 0x7fffffu;
    int32_t exponent = (int32_t)raw_exponent - 127;

    /* Classification — order matters. */
    if (raw_exponent == 255)
        return 0;               /* NaN / Inf */
    if (exponent < 0)
        return 0;               /* |value| < 1 → truncates to 0 */
    if (exponent > 63)
        return 0;               /* |value| >= 2^64 */
    if (sign != 0)
        return 0;               /* negative → 0 for unsigned */

    /* Normal value: reconstruct the truncated unsigned magnitude. */
    uint32_t significand = 0x800000u | fraction;
    avm_u64 result = avm_float_significand_to_u64(significand, exponent);
    return result.value;
}

__attribute__((noinline))
int64_t __fixsfdi(float value)
{
    avm_f32_bits representation = {.value = value};
    uint32_t bits = representation.bits;

    uint32_t sign = bits >> 31;
    uint32_t raw_exponent = (bits >> 23) & 0xffu;
    uint32_t fraction = bits & 0x7fffffu;
    int32_t exponent = (int32_t)raw_exponent - 127;

    /* Classification — order matters. */
    if (raw_exponent == 255)
        return 0;               /* NaN / Inf */
    if (exponent < 0)
        return 0;               /* |value| < 1 → truncates to 0 */
    if (exponent > 63)
        return 0;               /* |value| > 2^63 */
    if (exponent == 63) {
        /* Only -2^63 (sign==1, fraction==0) is representable. */
        if (sign == 0 || fraction != 0)
            return 0;
        /* -2^63 → INT64_MIN = 0x8000000000000000. */
        return INT64_MIN;
    }

    /* Reconstruct magnitude. */
    uint32_t significand = 0x800000u | fraction;
    avm_u64 magnitude = avm_float_significand_to_u64(significand, exponent);

    if (sign != 0)
        magnitude = avm_negate64(magnitude);

    avm_i64 result = {.bits = magnitude};
    return result.value;
}
