#include <stdint.h>

static volatile uint64_t unsigned_numerators[4];
static volatile uint64_t unsigned_denominators[4];
static volatile int64_t signed_numerators[4];
static volatile int64_t signed_denominators[4];
static volatile uint64_t result;

int avm_test_main(void)
{
    unsigned_numerators[0] = UINT64_C(0xfedcba9876543210);
    unsigned_numerators[1] = UINT64_C(0x8000000000000001);
    unsigned_numerators[2] = UINT64_C(0x123456789abcdef0);
    unsigned_numerators[3] = UINT64_MAX;
    unsigned_denominators[0] = UINT64_C(0x123456789);
    unsigned_denominators[1] = 3;
    unsigned_denominators[2] = UINT64_C(0x100000001);
    unsigned_denominators[3] = UINT64_C(0x80000001);
    signed_numerators[0] = -INT64_C(123456789012345);
    signed_numerators[1] = INT64_C(123456789012345);
    signed_numerators[2] = INT64_MIN;
    signed_numerators[3] = -INT64_C(98765432109);
    signed_denominators[0] = INT64_C(1234567);
    signed_denominators[1] = -INT64_C(1234567);
    signed_denominators[2] = 3;
    signed_denominators[3] = -INT64_C(101);

    __avm_debug_break();

    uint64_t acc = 0;
    for (uint8_t i = 0; i < 4; ++i) {
        uint64_t un = unsigned_numerators[i];
        uint64_t ud = unsigned_denominators[i];
        int64_t sn = signed_numerators[i];
        int64_t sd = signed_denominators[i];
        acc ^= un / ud;
        acc += un % ud;
        acc ^= (uint64_t)(sn / sd);
        acc += (uint64_t)(sn % sd);
    }
    result = acc;

    __avm_debug_break();
    return 0;
}
