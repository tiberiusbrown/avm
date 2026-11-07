#include <algorithm>
#include <functional>
#include <stdint.h>

static int values[64];
static volatile uint16_t input_seed = 0x1234;
static volatile uint16_t sort_result;

extern "C" int avm_test_main()
{
    uint16_t seed = input_seed;
    __avm_debug_break();

    uint16_t checksum = 0;
    for(unsigned repeat = 0; repeat != 24; ++repeat) {
        for(unsigned i = 0; i != 64; ++i) {
            seed = static_cast<uint16_t>(seed * 109u + 89u);
            values[i] = repeat % 4 == 0 ? static_cast<int>(i) :
                repeat % 4 == 1 ? static_cast<int>(63 - i) :
                repeat % 4 == 2 ? static_cast<int>(seed & 31) : 7;
        }
        // Exercise the generic dispatch rather than libc++'s separately
        // instantiated ascending arithmetic-pointer specialization.
        std::ranges::sort(values, std::greater<>{});
        for(unsigned i = 0; i != 64; ++i)
            checksum += static_cast<uint16_t>(values[i]) * static_cast<uint16_t>(i + 1);
    }
    sort_result = checksum;

    __avm_debug_break();
    return 0;
}
