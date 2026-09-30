#include <stdint.h>

#include "test_hex_output.h"

extern uint64_t __avm_muldi3(uint64_t, uint64_t);
extern uint64_t __avm_udivdi3(uint64_t, uint64_t);
extern uint64_t __avm_umoddi3(uint64_t, uint64_t);
extern int64_t __avm_divdi3(int64_t, int64_t);
extern int64_t __avm_moddi3(int64_t, int64_t);
extern uint64_t __avm_ashldi3(uint64_t, uint16_t);
extern uint64_t __avm_lshrdi3(uint64_t, uint16_t);
extern int64_t __avm_ashrdi3(int64_t, uint16_t);

#define CHECK(condition) do {                                      \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; }  \
} while (0)
#define U64(value) UINT64_C(value)

int avm_test_main(void)
{
    volatile uint64_t a = U64(0x123456789abcdef0);
    volatile uint64_t b = U64(0x0fedcba987654321);
    CHECK(a * b == U64(0x2236d88fe5618cf0));
    CHECK(__avm_muldi3(a, b) == U64(0x2236d88fe5618cf0));
    CHECK(__avm_muldi3(UINT64_MAX, a) == U64(0xedcba98765432110));
    CHECK(__avm_muldi3(U64(0x100000001), U64(0x100000001)) ==
          U64(0x200000001));
    CHECK(__avm_muldi3(U64(0xffff0000ffff0000),
                       U64(0x0001ffff0001ffff)) == U64(0x0003fffd00010000));
    CHECK(__avm_muldi3(U64(0x8000000000000000), 2) == 0);

    a = U64(0xfedcba9876543210);
    b = U64(0x123456789);
    CHECK(a / b == U64(0xe0000000));
    CHECK(a % b == U64(0x96543210));
    CHECK(__avm_udivdi3(a, b) == U64(0xe0000000));
    CHECK(__avm_umoddi3(a, b) == U64(0x96543210));
    CHECK(__avm_udivdi3(UINT64_MAX, U64(0x100000001)) ==
          U64(0xffffffff));
    CHECK(__avm_umoddi3(UINT64_MAX, U64(0x100000001)) == 0);
    CHECK(__avm_udivdi3(U64(0x8000000000000000), 3) ==
          U64(0x2aaaaaaaaaaaaaaa));
    CHECK(__avm_umoddi3(U64(0x8000000000000000), 3) == 2);
    CHECK(__avm_udivdi3(3, U64(0x8000000000000000)) == 0);
    CHECK(__avm_umoddi3(3, U64(0x8000000000000000)) == 3);
    CHECK(__avm_udivdi3(UINT64_MAX, U64(0x8000000000000001)) == 1);
    CHECK(__avm_umoddi3(UINT64_MAX, U64(0x8000000000000001)) ==
          U64(0x7ffffffffffffffe));
    CHECK(__avm_udivdi3(a, 0) == UINT64_MAX);
    CHECK(__avm_umoddi3(a, 0) == a);

    volatile int64_t sn = -INT64_C(123456789012345);
    volatile int64_t sd = INT64_C(1234567);
    volatile int64_t multiplier = INT64_C(987654321);
    CHECK((uint64_t)(sn * multiplier) == U64(0x04d182bc78b15557));
    CHECK((uint64_t)(sn / sd) == U64(0xfffffffffa0a1eb8));
    CHECK((uint64_t)(sn % sd) == U64(0xfffffffffffe1d7f));
    CHECK((uint64_t)__avm_divdi3(sn, sd) == U64(0xfffffffffa0a1eb8));
    CHECK((uint64_t)__avm_moddi3(sn, sd) == U64(0xfffffffffffe1d7f));
    CHECK((uint64_t)__avm_divdi3(-sn, -sd) == U64(0xfffffffffa0a1eb8));
    CHECK(__avm_moddi3(-sn, -sd) == INT64_C(123521));
    CHECK(__avm_moddi3(sn, -sd) == -INT64_C(123521));
    CHECK(__avm_divdi3(INT64_MIN, -1) == INT64_MIN);
    CHECK(__avm_moddi3(INT64_MIN, -1) == 0);
    CHECK((uint64_t)__avm_divdi3(INT64_MIN, 3) == U64(0xd555555555555556));
    CHECK(__avm_moddi3(INT64_MIN, 3) == -2);
    CHECK(__avm_divdi3(sn, 0) == -1);
    CHECK(__avm_moddi3(sn, 0) == sn);

    volatile uint64_t bits = U64(0x8123456789abcdef);
    volatile uint32_t count = 1;
    CHECK(bits << count == U64(0x02468acf13579bde));
    CHECK(bits >> count == U64(0x4091a2b3c4d5e6f7));
    CHECK(((int64_t)bits >> count) ==
          (int64_t)U64(0xc091a2b3c4d5e6f7));

#define SHIFTS(n, left, logical, arithmetic) do {                       \
    CHECK(__avm_ashldi3(bits, n) == U64(left));                         \
    CHECK(__avm_lshrdi3(bits, n) == U64(logical));                      \
    CHECK((uint64_t)__avm_ashrdi3((int64_t)bits, n) == U64(arithmetic));\
} while (0)
    SHIFTS(0, 0x8123456789abcdef, 0x8123456789abcdef, 0x8123456789abcdef);
    SHIFTS(1, 0x02468acf13579bde, 0x4091a2b3c4d5e6f7, 0xc091a2b3c4d5e6f7);
    SHIFTS(15, 0xa2b3c4d5e6f78000, 0x000102468acf1357, 0xffff02468acf1357);
    SHIFTS(16, 0x456789abcdef0000, 0x00008123456789ab, 0xffff8123456789ab);
    SHIFTS(31, 0xc4d5e6f780000000, 0x0000000102468acf, 0xffffffff02468acf);
    SHIFTS(32, 0x89abcdef00000000, 0x0000000081234567, 0xffffffff81234567);
    SHIFTS(33, 0x13579bde00000000, 0x000000004091a2b3, 0xffffffffc091a2b3);
    SHIFTS(63, 0x8000000000000000, 0x0000000000000001, 0xffffffffffffffff);
    SHIFTS(64, 0x0000000000000000, 0x0000000000000000, 0xffffffffffffffff);
#undef SHIFTS

    return 0;
}
