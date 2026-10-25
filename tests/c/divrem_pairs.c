#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

#define CHECK(condition) do { \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; } \
} while (0)

extern uint32_t __avm_udivmodsi4(uint32_t, uint32_t, uint32_t *);
extern int32_t __avm_divmodsi4(int32_t, int32_t, int32_t *);
extern uint64_t __avm_udivmoddi4(uint64_t, uint64_t, uint64_t *);
extern int64_t __avm_divmoddi4(int64_t, int64_t, int64_t *);

struct divrem32_case { uint32_t n, d, q, r; };
struct divrem64_case { uint64_t n, d, q, r; };

/* Fixed expected values also cover direct helpers' zero/overflow convention. */
static const struct divrem32_case AVM_PROGMEM unsigned32_cases[] = {
    {UINT32_C(0x0), UINT32_C(0x1), UINT32_C(0x0), UINT32_C(0x0)},
    {UINT32_C(0x1), UINT32_C(0x3), UINT32_C(0x0), UINT32_C(0x1)},
    {UINT32_C(0x3), UINT32_C(0x80000000), UINT32_C(0x0), UINT32_C(0x3)},
    {UINT32_C(0xffffffff), UINT32_C(0x1), UINT32_C(0xffffffff), UINT32_C(0x0)},
    {UINT32_C(0xffffffff), UINT32_C(0x3), UINT32_C(0x55555555), UINT32_C(0x0)},
    {UINT32_C(0xffffffff), UINT32_C(0x80000001), UINT32_C(0x1), UINT32_C(0x7ffffffe)},
    {UINT32_C(0xffffffff), UINT32_C(0xffffffff), UINT32_C(0x1), UINT32_C(0x0)},
    {UINT32_C(0x12345678), UINT32_C(0x101), UINT32_C(0x122234), UINT32_C(0x44)},
    {UINT32_C(0x80000000), UINT32_C(0x10001), UINT32_C(0x7fff), UINT32_C(0x8001)},
    {UINT32_C(0xffff0001), UINT32_C(0xffff), UINT32_C(0x10000), UINT32_C(0x1)},
    {UINT32_C(0xabcdef01), UINT32_C(0x0), UINT32_C(0xffffffff), UINT32_C(0xabcdef01)},
};

static __attribute__((noinline))
uint32_t unsigned32_pair(uint32_t n, uint32_t d, uint32_t *r)
{
    uint32_t q = n / d;
    *r = n % d;
    return q;
}

/* Fixed expected values also cover direct helpers' zero/overflow convention. */
static const struct divrem32_case AVM_PROGMEM signed32_cases[] = {
    {UINT32_C(0x75bcd15), UINT32_C(0x3039), UINT32_C(0x2710), UINT32_C(0x1a85)},
    {UINT32_C(0xf8a432eb), UINT32_C(0x3039), UINT32_C(0xffffd8f0), UINT32_C(0xffffe57b)},
    {UINT32_C(0x75bcd15), UINT32_C(0xffffcfc7), UINT32_C(0xffffd8f0), UINT32_C(0x1a85)},
    {UINT32_C(0xf8a432eb), UINT32_C(0xffffcfc7), UINT32_C(0x2710), UINT32_C(0xffffe57b)},
    {UINT32_C(0x80000000), UINT32_C(0x3), UINT32_C(0xd5555556), UINT32_C(0xfffffffe)},
    {UINT32_C(0x80000000), UINT32_C(0xffffffff), UINT32_C(0x80000000), UINT32_C(0x0)},
    {UINT32_C(0x80000000), UINT32_C(0x1), UINT32_C(0x80000000), UINT32_C(0x0)},
    {UINT32_C(0x80000000), UINT32_C(0x80000000), UINT32_C(0x1), UINT32_C(0x0)},
    {UINT32_C(0x3), UINT32_C(0x80000000), UINT32_C(0x0), UINT32_C(0x3)},
    {UINT32_C(0x0), UINT32_C(0xffffffff), UINT32_C(0x0), UINT32_C(0x0)},
    {UINT32_C(0xf8a432eb), UINT32_C(0x0), UINT32_C(0xffffffff), UINT32_C(0xf8a432eb)},
};

static __attribute__((noinline))
int32_t signed32_pair(int32_t n, int32_t d, int32_t *r)
{
    int32_t q = n / d;
    *r = n % d;
    return q;
}

/* Fixed expected values also cover direct helpers' zero/overflow convention. */
static const struct divrem64_case AVM_PROGMEM unsigned64_cases[] = {
    {UINT64_C(0x0), UINT64_C(0x1), UINT64_C(0x0), UINT64_C(0x0)},
    {UINT64_C(0x1), UINT64_C(0x3), UINT64_C(0x0), UINT64_C(0x1)},
    {UINT64_C(0x3), UINT64_C(0x8000000000000000), UINT64_C(0x0), UINT64_C(0x3)},
    {UINT64_C(0xffffffffffffffff), UINT64_C(0x1), UINT64_C(0xffffffffffffffff), UINT64_C(0x0)},
    {UINT64_C(0xffffffffffffffff), UINT64_C(0x3), UINT64_C(0x5555555555555555), UINT64_C(0x0)},
    {UINT64_C(0xffffffffffffffff), UINT64_C(0x8000000000000001), UINT64_C(0x1), UINT64_C(0x7ffffffffffffffe)},
    {UINT64_C(0xffffffffffffffff), UINT64_C(0xffffffffffffffff), UINT64_C(0x1), UINT64_C(0x0)},
    {UINT64_C(0xfedcba9876543210), UINT64_C(0x123456789), UINT64_C(0xe0000000), UINT64_C(0x96543210)},
    {UINT64_C(0xffffffffffffffff), UINT64_C(0x100000001), UINT64_C(0xffffffff), UINT64_C(0x0)},
    {UINT64_C(0x8000000000000000), UINT64_C(0x3), UINT64_C(0x2aaaaaaaaaaaaaaa), UINT64_C(0x2)},
    {UINT64_C(0x123456789abcdef0), UINT64_C(0x0), UINT64_C(0xffffffffffffffff), UINT64_C(0x123456789abcdef0)},
};

static __attribute__((noinline))
uint64_t unsigned64_pair(uint64_t n, uint64_t d, uint64_t *r)
{
    uint64_t q = n / d;
    *r = n % d;
    return q;
}

/* Fixed expected values also cover direct helpers' zero/overflow convention. */
static const struct divrem64_case AVM_PROGMEM signed64_cases[] = {
    {UINT64_C(0x7048860ddf79), UINT64_C(0x12d687), UINT64_C(0x5f5e148), UINT64_C(0x1e281)},
    {UINT64_C(0xffff8fb779f22087), UINT64_C(0x12d687), UINT64_C(0xfffffffffa0a1eb8), UINT64_C(0xfffffffffffe1d7f)},
    {UINT64_C(0x7048860ddf79), UINT64_C(0xffffffffffed2979), UINT64_C(0xfffffffffa0a1eb8), UINT64_C(0x1e281)},
    {UINT64_C(0xffff8fb779f22087), UINT64_C(0xffffffffffed2979), UINT64_C(0x5f5e148), UINT64_C(0xfffffffffffe1d7f)},
    {UINT64_C(0x8000000000000000), UINT64_C(0x3), UINT64_C(0xd555555555555556), UINT64_C(0xfffffffffffffffe)},
    {UINT64_C(0x8000000000000000), UINT64_C(0xffffffffffffffff), UINT64_C(0x8000000000000000), UINT64_C(0x0)},
    {UINT64_C(0x8000000000000000), UINT64_C(0x1), UINT64_C(0x8000000000000000), UINT64_C(0x0)},
    {UINT64_C(0x8000000000000000), UINT64_C(0x8000000000000000), UINT64_C(0x1), UINT64_C(0x0)},
    {UINT64_C(0x3), UINT64_C(0x8000000000000000), UINT64_C(0x0), UINT64_C(0x3)},
    {UINT64_C(0x0), UINT64_C(0xffffffffffffffff), UINT64_C(0x0), UINT64_C(0x0)},
    {UINT64_C(0xffff8fb779f22087), UINT64_C(0x0), UINT64_C(0xffffffffffffffff), UINT64_C(0xffff8fb779f22087)},
};

static __attribute__((noinline))
int64_t signed64_pair(int64_t n, int64_t d, int64_t *r)
{
    int64_t q = n / d;
    *r = n % d;
    return q;
}

static __attribute__((noinline)) int check_unsigned32(void)
{
    for (uint16_t i = 0; i < sizeof(unsigned32_cases) / sizeof(unsigned32_cases[0]); ++i) {
        uint32_t n = (uint32_t)unsigned32_cases[i].n;
        uint32_t d = (uint32_t)unsigned32_cases[i].d;
        struct { uint16_t before; uint32_t value; uint16_t after; } r = {0x1234, 0, 0xabcd};
        uint32_t q = __avm_udivmodsi4(n, d, &r.value);
        CHECK((uint32_t)q == unsigned32_cases[i].q);
        CHECK((uint32_t)r.value == unsigned32_cases[i].r);
        CHECK(r.before == 0x1234 && r.after == 0xabcd);
        if (d != 0) {
            q = unsigned32_pair(n, d, &r.value);
            CHECK((uint32_t)q == unsigned32_cases[i].q);
            CHECK((uint32_t)r.value == unsigned32_cases[i].r);
            CHECK(r.before == 0x1234 && r.after == 0xabcd);
        }
    }
    return 0;
}

static __attribute__((noinline)) int check_signed32(void)
{
    for (uint16_t i = 0; i < sizeof(signed32_cases) / sizeof(signed32_cases[0]); ++i) {
        int32_t n = (int32_t)signed32_cases[i].n;
        int32_t d = (int32_t)signed32_cases[i].d;
        struct { uint16_t before; int32_t value; uint16_t after; } r = {0x1234, 0, 0xabcd};
        int32_t q = __avm_divmodsi4(n, d, &r.value);
        CHECK((uint32_t)q == signed32_cases[i].q);
        CHECK((uint32_t)r.value == signed32_cases[i].r);
        CHECK(r.before == 0x1234 && r.after == 0xabcd);
        if (d != 0 && !(n == INT32_MIN && d == -1)) {
            q = signed32_pair(n, d, &r.value);
            CHECK((uint32_t)q == signed32_cases[i].q);
            CHECK((uint32_t)r.value == signed32_cases[i].r);
            CHECK(r.before == 0x1234 && r.after == 0xabcd);
        }
    }
    return 0;
}

static __attribute__((noinline)) int check_unsigned64(void)
{
    for (uint16_t i = 0; i < sizeof(unsigned64_cases) / sizeof(unsigned64_cases[0]); ++i) {
        uint64_t n = (uint64_t)unsigned64_cases[i].n;
        uint64_t d = (uint64_t)unsigned64_cases[i].d;
        struct { uint16_t before; uint64_t value; uint16_t after; } r = {0x1234, 0, 0xabcd};
        uint64_t q = __avm_udivmoddi4(n, d, &r.value);
        CHECK((uint64_t)q == unsigned64_cases[i].q);
        CHECK((uint64_t)r.value == unsigned64_cases[i].r);
        CHECK(r.before == 0x1234 && r.after == 0xabcd);
        if (d != 0) {
            q = unsigned64_pair(n, d, &r.value);
            CHECK((uint64_t)q == unsigned64_cases[i].q);
            CHECK((uint64_t)r.value == unsigned64_cases[i].r);
            CHECK(r.before == 0x1234 && r.after == 0xabcd);
        }
    }
    return 0;
}

static __attribute__((noinline)) int check_signed64(void)
{
    for (uint16_t i = 0; i < sizeof(signed64_cases) / sizeof(signed64_cases[0]); ++i) {
        int64_t n = (int64_t)signed64_cases[i].n;
        int64_t d = (int64_t)signed64_cases[i].d;
        struct { uint16_t before; int64_t value; uint16_t after; } r = {0x1234, 0, 0xabcd};
        int64_t q = __avm_divmoddi4(n, d, &r.value);
        CHECK((uint64_t)q == signed64_cases[i].q);
        CHECK((uint64_t)r.value == signed64_cases[i].r);
        CHECK(r.before == 0x1234 && r.after == 0xabcd);
        if (d != 0 && !(n == INT64_MIN && d == -1)) {
            q = signed64_pair(n, d, &r.value);
            CHECK((uint64_t)q == signed64_cases[i].q);
            CHECK((uint64_t)r.value == signed64_cases[i].r);
            CHECK(r.before == 0x1234 && r.after == 0xabcd);
        }
    }
    return 0;
}

int avm_test_main(void)
{
    CHECK(check_unsigned32() == 0);
    CHECK(check_signed32() == 0);
    CHECK(check_unsigned64() == 0);
    CHECK(check_signed64() == 0);
    return 0;
}

