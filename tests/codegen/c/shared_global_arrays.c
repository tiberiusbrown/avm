#include <stdint.h>
#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expr) do { if (!(expr)) return __LINE__; } while (0)

static volatile int8_t signed_a[32];
static volatile int8_t signed_b[32];
static volatile uint8_t unsigned_a[32];
static volatile uint8_t unsigned_b[32];

static NOINLINE uint16_t compare_arrays(void)
{
    uint16_t matches = 0;
    for (uint8_t repeat = 0; repeat < 4; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            int8_t sa = signed_a[i];
            int8_t sb = signed_b[i];
            uint8_t ua = unsigned_a[i];
            uint8_t ub = unsigned_b[i];
            matches += sa < sb;
            matches += sa >= 0;
            matches += ua <= ub;
            matches += ua == ub;
            matches += sa != (int8_t)ub;
        }
    }
    return matches;
}

static NOINLINE void write_arrays(uint16_t i, uint8_t value)
{
    signed_a[i] = (int8_t)value;
    signed_b[i] = (int8_t)(value ^ 0x80u);
    unsigned_a[i] = (uint8_t)(value + 17u);
    unsigned_b[i] = (uint8_t)(value - 29u);
}

/* Independent calls keep the reference from sharing any array addresses. */
static NOINLINE int8_t read_sa(uint16_t i) { return signed_a[i]; }
static NOINLINE int8_t read_sb(uint16_t i) { return signed_b[i]; }
static NOINLINE uint8_t read_ua(uint16_t i) { return unsigned_a[i]; }
static NOINLINE uint8_t read_ub(uint16_t i) { return unsigned_b[i]; }

int avm_test_main(void)
{
    /* Visit every byte value, including signed and unsigned boundaries, and
     * both ends of each array. Check shared stores against independent reads. */
    for (uint16_t seed = 0; seed < 256; seed += 32) {
        uint16_t expected = 0;
        for (uint16_t i = 0; i < 32; ++i) {
            uint8_t value = (uint8_t)(seed + i);
            write_arrays(i, value);
            CHECK(read_sa(i) == (int8_t)value);
            CHECK(read_sb(i) == (int8_t)(value ^ 0x80u));
            CHECK(read_ua(i) == (uint8_t)(value + 17u));
            CHECK(read_ub(i) == (uint8_t)(value - 29u));
            int8_t sa = read_sa(i);
            int8_t sb = read_sb(i);
            uint8_t ua = read_ua(i);
            uint8_t ub = read_ub(i);
            expected += sa < sb;
            expected += sa >= 0;
            expected += ua <= ub;
            expected += ua == ub;
            expected += sa != (int8_t)ub;
        }
        CHECK(compare_arrays() == (uint16_t)(expected * 4u));
    }
    test_puts("shared-global-arrays=ok\n");
    return 0;
}
