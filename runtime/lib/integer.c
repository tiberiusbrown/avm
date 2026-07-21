#include <stdint.h>

#define AVM_ALWAYS_INLINE static __attribute__((always_inline)) inline
#define AVM_NOINLINE __attribute__((noinline))

typedef union {
    uint32_t value;
    struct {
        uint16_t low;
        uint16_t high;
    } words;
} avm_u32_words;

/*
 * Keep all 32-bit shifts inside inline assembly. Writing these as C shifts
 * would lower them back to __avm_ashlsi3, __avm_lshrsi3, or __avm_ashrsi3
 * and recurse.
 */
AVM_ALWAYS_INLINE uint32_t avm_shl32_1(uint32_t value)
{
    __asm__("add32 %0, %0" : "+q"(value));
    return value;
}

AVM_ALWAYS_INLINE uint32_t avm_lshr32_1(uint32_t value)
{
    __asm__("lsr32.1 %0" : "+q"(value));
    return value;
}

AVM_ALWAYS_INLINE int32_t avm_ashr32_1(int32_t value)
{
    __asm__("asr32.1 %0" : "+q"(value));
    return value;
}

AVM_ALWAYS_INLINE uint16_t avm_mul16(uint16_t left, uint16_t right)
{
    __asm__("mul16 %0, %1" : "+r"(left) : "r"(right));
    return left;
}

AVM_ALWAYS_INLINE uint16_t avm_mulu8_w(uint16_t left, uint16_t right)
{
    __asm__("mulu8.w %0, %1" : "+c"(left) : "c"(right));
    return left;
}

AVM_ALWAYS_INLINE uint16_t avm_muls8_w(uint16_t left, uint16_t right)
{
    __asm__("muls8.w %0, %1" : "+c"(left) : "c"(right));
    return left;
}

AVM_ALWAYS_INLINE uint16_t avm_mulsu8_w(uint16_t left, uint16_t right)
{
    __asm__("mulsu8.w %0, %1" : "+c"(left) : "c"(right));
    return left;
}

AVM_ALWAYS_INLINE uint16_t avm_asr16_8(uint16_t value)
{
    __asm__("asr16i %0, 8" : "+c"(value));
    return value;
}

/*
 * Return the complete 32-bit product of two signed 16-bit bit patterns.
 *
 * Each operand is decomposed as:
 *
 *     signed16(x) = unsigned8(x[7:0]) + 256 * signed8(x[15:8])
 *
 * This requires one unsigned byte product, two signed-by-unsigned byte
 * products, and one signed byte product.
 */
AVM_ALWAYS_INLINE uint32_t avm_mul_signed16_full(uint16_t left,
                                                 uint16_t right)
{
    uint16_t left_low = (uint8_t)left;
    uint16_t right_low = (uint8_t)right;
    uint16_t left_high = (uint8_t)(left >> 8);
    uint16_t right_high = (uint8_t)(right >> 8);

    avm_u32_words product = {
        .words = {
            .low = avm_mulu8_w(left_low, right_low),
            .high = avm_muls8_w(left_high, right_high),
        },
    };

    uint16_t partial = avm_mulsu8_w(left_high, right_low);
    uint16_t old_low = product.words.low;
    product.words.low =
        (uint16_t)(product.words.low + (partial << 8));
    product.words.high =
        (uint16_t)(product.words.high + avm_asr16_8(partial) +
                   (product.words.low < old_low));

    partial = avm_mulsu8_w(right_high, left_low);
    old_low = product.words.low;
    product.words.low =
        (uint16_t)(product.words.low + (partial << 8));
    product.words.high =
        (uint16_t)(product.words.high + avm_asr16_8(partial) +
                   (product.words.low < old_low));

    return product.value;
}

AVM_NOINLINE
uint32_t __avm_ashlsi3(uint32_t value, uint32_t count)
{
    if (count >= 32u)
        return 0;

    for (uint16_t i = 0; i < (uint16_t)count; ++i)
        value = avm_shl32_1(value);
    return value;
}

AVM_NOINLINE
uint32_t __avm_lshrsi3(uint32_t value, uint32_t count)
{
    if (count >= 32u)
        return 0;

    for (uint16_t i = 0; i < (uint16_t)count; ++i)
        value = avm_lshr32_1(value);
    return value;
}

AVM_NOINLINE
int32_t __avm_ashrsi3(int32_t value, uint32_t count)
{
    if (count >= 32u)
        return value < 0 ? -1 : 0;

    for (uint16_t i = 0; i < (uint16_t)count; ++i)
        value = avm_ashr32_1(value);
    return value;
}

AVM_NOINLINE
uint32_t __avm_mulsi3(uint32_t left, uint32_t right)
{
    avm_u32_words left_parts = {.value = left};
    avm_u32_words right_parts = {.value = right};

    /*
     * Reinterpret each low word as signed and carry its former sign bit into
     * the corresponding high word:
     *
     *   left = signed16(left.low)
     *        + 65536 * (left.high + (left.low >> 15))  (mod 2^32)
     *
     * The high-word-by-high-word product is multiplied by 2^32 and therefore
     * does not affect the low 32 result.
     */
    uint16_t left_high_adjusted =
        (uint16_t)(left_parts.words.high + (left_parts.words.low >> 15));
    uint16_t right_high_adjusted =
        (uint16_t)(right_parts.words.high + (right_parts.words.low >> 15));

    avm_u32_words result = {
        .value =
            avm_mul_signed16_full(left_parts.words.low,
                                  right_parts.words.low),
    };

    uint16_t cross =
        (uint16_t)(avm_mul16(left_high_adjusted, right_parts.words.low) +
                   avm_mul16(right_high_adjusted, left_parts.words.low));
    result.words.high = (uint16_t)(result.words.high + cross);

    return result.value;
}

/*
 * Shared unsigned restoring division. The extra remainder pointer is passed
 * on the stack after the two 32-bit register arguments under the AVM ABI.
 *
 * Division by zero follows the corresponding AVM 16-bit instruction behavior:
 * quotient = UINT32_MAX and remainder = numerator.
 */
AVM_NOINLINE
uint32_t __avm_udivmodsi4(uint32_t numerator, uint32_t denominator,
                          uint32_t *remainder_out)
{
    uint32_t quotient = 0;
    uint32_t remainder = 0;

    if (denominator == 0) {
        *remainder_out = numerator;
        return 0xffffffffu;
    }

    for (uint16_t i = 0; i < 32; ++i) {
        uint32_t carry = numerator & 0x80000000u;

        numerator = avm_shl32_1(numerator);
        remainder = avm_shl32_1(remainder);
        if (carry != 0)
            remainder |= 1u;

        quotient = avm_shl32_1(quotient);
        if (remainder >= denominator) {
            remainder -= denominator;
            quotient |= 1u;
        }
    }

    *remainder_out = remainder;
    return quotient;
}

AVM_NOINLINE
uint32_t __avm_udivsi3(uint32_t numerator, uint32_t denominator)
{
    uint32_t remainder;
    return __avm_udivmodsi4(numerator, denominator, &remainder);
}

AVM_NOINLINE
uint32_t __avm_umodsi3(uint32_t numerator, uint32_t denominator)
{
    uint32_t remainder;
    (void)__avm_udivmodsi4(numerator, denominator, &remainder);
    return remainder;
}

AVM_ALWAYS_INLINE uint32_t avm_abs_i32_bits(int32_t value)
{
    uint32_t bits = (uint32_t)value;
    return value < 0 ? 0u - bits : bits;
}

AVM_NOINLINE
int32_t __avm_divsi3(int32_t numerator, int32_t denominator)
{
    if (denominator == 0)
        return -1;

    uint32_t quotient =
        __avm_udivsi3(avm_abs_i32_bits(numerator),
                      avm_abs_i32_bits(denominator));

    if ((numerator < 0) != (denominator < 0))
        quotient = 0u - quotient;

    return (int32_t)quotient;
}

AVM_NOINLINE
int32_t __avm_modsi3(int32_t numerator, int32_t denominator)
{
    if (denominator == 0)
        return numerator;

    uint32_t remainder =
        __avm_umodsi3(avm_abs_i32_bits(numerator),
                      avm_abs_i32_bits(denominator));

    if (numerator < 0)
        remainder = 0u - remainder;

    return (int32_t)remainder;
}
