#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)

static volatile uint16_t left_input, right_input;

static NOINLINE uint16_t widened_add(uint16_t left, uint16_t right)
{
    uint32_t sum = (uint32_t)left + right;
    return sum > UINT16_MAX ? UINT16_MAX : (uint16_t)sum;
}

static NOINLINE uint16_t intrinsic_add(uint16_t left, uint16_t right)
{
    return __builtin_elementwise_add_sat(left, right);
}

static NOINLINE uint32_t masked_add(uint32_t left, uint32_t right)
{
    uint32_t sum = (left & 65535UL) + (right & 65535UL);
    return sum > UINT16_MAX ? UINT16_MAX : sum;
}

static NOINLINE uint16_t shared_add(uint16_t left, uint16_t right,
                                  uint32_t *full_sum)
{
    uint32_t sum = (uint32_t)left + right;
    *full_sum = sum;
    return sum > UINT16_MAX ? UINT16_MAX : (uint16_t)sum;
}

/* An independent bitwise reference, including a carry out of the top bit. */
static NOINLINE uint16_t reference_add(uint16_t left, uint16_t right)
{
    uint8_t overflow = 0;
    while (right) {
        uint16_t carry = left & right;
        if (carry & 0x8000u)
            overflow = 1;
        left ^= right;
        right = (uint16_t)(carry << 1);
    }
    return overflow ? UINT16_MAX : left;
}

static NOINLINE int check_pair(uint16_t left, uint16_t right)
{
    uint16_t expected = reference_add(left, right);
    CHECK(widened_add(left, right) == expected);
    CHECK(widened_add(right, left) == expected);
    CHECK(intrinsic_add(left, right) == expected);
    /* The high bits must be discarded before adding, then return as zero. */
    CHECK(masked_add(0xa5a50000UL | left, 0x5a5a0000UL | right) ==
          (uint32_t)expected);
    uint32_t sum;
    CHECK(shared_add(left, right, &sum) == expected);
    CHECK(sum == (uint32_t)left + right);
    return 0;
}

static NOINLINE uint16_t wide_operand(uint32_t left, uint16_t right)
{
    uint32_t sum = left + right;
    return sum > UINT16_MAX ? UINT16_MAX : (uint16_t)sum;
}

static NOINLINE uint16_t signed_operands(int16_t left, int16_t right)
{
    uint32_t sum = (uint32_t)((int32_t)left + right);
    return sum > UINT16_MAX ? UINT16_MAX : (uint16_t)sum;
}

static NOINLINE uint16_t different_limit(uint16_t left, uint16_t right)
{
    uint32_t sum = (uint32_t)left + right;
    return sum > 65534UL ? 65534u : (uint16_t)sum;
}

int avm_test_main(void)
{
    static const uint16_t boundaries[] = {
        0, 1, 2, 127, 128, 255, 256, 257,
        32767, 32768, 32769, 65533, 65534, 65535
    };
    for (uint8_t i = 0; i < sizeof(boundaries) / sizeof(boundaries[0]); ++i) {
        for (uint8_t j = 0; j < sizeof(boundaries) / sizeof(boundaries[0]); ++j) {
            left_input = boundaries[i];
            right_input = boundaries[j];
            CHECK(check_pair(left_input, right_input) == 0);
        }
    }

    /* Every carry-chain length, exact maximum, and the next two sums. */
    for (uint8_t bit = 0; bit < 16; ++bit) {
        left_input = (uint16_t)(1u << bit);
        right_input = (uint16_t)(UINT16_MAX - left_input);
        CHECK(check_pair(left_input, right_input) == 0);
        CHECK(check_pair(left_input, (uint16_t)(right_input + 1u)) == 0);
        CHECK(check_pair(UINT16_MAX, left_input) == 0);
        CHECK(check_pair((uint16_t)(left_input - 1u), 1) == 0);
    }

    uint16_t state = 0xace1u;
    for (uint16_t i = 0; i < 256; ++i) {
        state = (uint16_t)((state >> 1) ^ ((state & 1u) ? 0xb400u : 0));
        left_input = state;
        state = (uint16_t)((state >> 1) ^ ((state & 1u) ? 0xb400u : 0));
        right_input = state;
        CHECK(check_pair(left_input, right_input) == 0);
    }

    /* Nearby idioms that must retain their wider arithmetic or other limit. */
    left_input = UINT16_MAX;
    right_input = 1;
    CHECK(wide_operand(0x10000UL, right_input) == UINT16_MAX);
    CHECK(wide_operand(0xffffffffUL, right_input) == 0);
    CHECK(signed_operands(-32768, -32768) == UINT16_MAX);
    CHECK(signed_operands(-1, 1) == 0);
    CHECK(signed_operands(-1, 0) == UINT16_MAX);
    CHECK(different_limit(left_input, right_input) == 65534u);
    CHECK(different_limit(32767, 32767) == 65534u);
    test_puts("saturating-add=ok\n");
    return 0;
}
