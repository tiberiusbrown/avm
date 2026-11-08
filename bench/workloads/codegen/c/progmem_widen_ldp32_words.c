#include <avm/pgmspace.h>
#include <stdint.h>

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static uint16_t rotate_left_1(uint16_t value)
{
    return (uint16_t)((uint16_t)(value << 1) | (value >> 15));
}

/*
 * Target transformation:
 *
 *     2 x LDP16_POST  -> 1 x LDP32_POST
 *
 * The calls cover even and odd word counts and a nonzero word offset. The
 * reduction is modulo 16 bits, so grouping two adjacent word additions is
 * semantically exact.
 */
static const uint16_t AVM_PROGMEM program_words[80] = {
    0xb60d, 0xe0f5, 0x5619, 0x8421, 0xf5ed, 0x2855, 0x9ac1, 0xd4d9,
    0x026d, 0x73a5, 0xa399, 0x2c71, 0x7a8d, 0x8885, 0xd971, 0x6d99,
    0xbdad, 0xc175, 0x1ed9, 0xacc1, 0xff4d, 0x0fd5, 0x5f21, 0xef19,
    0x3f0d, 0x5105, 0x8119, 0xcdf1, 0x7d2d, 0xa925, 0xd8f1, 0x0b59,
    0xb34d, 0xe3f5, 0x1359, 0x42a1, 0xf4ed, 0x2a95, 0x5981, 0xf599,
    0x446d, 0x16a5, 0xe0d9, 0xb671, 0x07cd, 0xd7c5, 0xa871, 0x66d9,
    0x342d, 0x8675, 0x5019, 0x2201, 0xf40d, 0x5a15, 0x0821, 0xfa59,
    0xabcd, 0x1245, 0xc059, 0xb2f1, 0x6cad, 0xdda5, 0x89f1, 0x7999,
    0x2c8d, 0x9ef5, 0x5099, 0x3fa1, 0xcfed, 0x9f55, 0x28c1, 0xfed9,
    0x8d6d, 0x5d25, 0xe119, 0xb171, 0x4d0d, 0x1b05, 0xab71, 0x7b19
};

static volatile uint16_t results[3];

static NOINLINE uint16_t
sum_words(const uint16_t AVM_PROGMEM *base,
          uint16_t count,
          uint8_t repeats)
{
    uint16_t checksum = 0;

    for (uint8_t repeat = 0; repeat < repeats; ++repeat) {
        const uint16_t AVM_PROGMEM *p = base;

        for (uint16_t i = 0; i < count; ++i)
            checksum = (uint16_t)(checksum + *p++);

        checksum = (uint16_t)(rotate_left_1(checksum) ^ repeat);
    }

    return checksum;
}

int avm_test_main(void)
{
    __avm_debug_break();

    results[0] = sum_words(program_words, 64, 8);
    results[1] = sum_words(program_words, 65, 8);
    results[2] = sum_words(program_words + 1, 63, 8);

    __avm_debug_break();
    return 0;
}
