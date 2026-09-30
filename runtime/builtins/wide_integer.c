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

__attribute__((noinline))
uint64_t __avm_ashldi3(uint64_t value, uint16_t count)
{
    avm_u64 bits = {.value = value};
    if (count >= 64)
        return 0;
    if (count >= 32) {
        bits.words.high = bits.words.low << (count - 32);
        bits.words.low = 0;
    } else if (count != 0) {
        bits.words.high = (bits.words.high << count) |
                          (bits.words.low >> (32 - count));
        bits.words.low <<= count;
    }
    return bits.value;
}

__attribute__((noinline))
uint64_t __avm_lshrdi3(uint64_t value, uint16_t count)
{
    avm_u64 bits = {.value = value};
    if (count >= 64)
        return 0;
    if (count >= 32) {
        bits.words.low = bits.words.high >> (count - 32);
        bits.words.high = 0;
    } else if (count != 0) {
        bits.words.low = (bits.words.low >> count) |
                         (bits.words.high << (32 - count));
        bits.words.high >>= count;
    }
    return bits.value;
}

__attribute__((noinline))
int64_t __avm_ashrdi3(int64_t value, uint16_t count)
{
    avm_i64 bits = {.value = value};
    int32_t high = (int32_t)bits.bits.words.high;
    if (count >= 64)
        return value < 0 ? -1 : 0;
    if (count >= 32) {
        bits.bits.words.low = (uint32_t)(high >> (count - 32));
        bits.bits.words.high = high < 0 ? UINT32_MAX : 0;
    } else if (count != 0) {
        bits.bits.words.low = (bits.bits.words.low >> count) |
                              (bits.bits.words.high << (32 - count));
        bits.bits.words.high = (uint32_t)(high >> count);
    }
    return bits.value;
}
