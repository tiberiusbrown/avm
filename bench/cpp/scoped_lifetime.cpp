#include <stdint.h>

static volatile uint16_t lifetime_result;

struct Scope {
    volatile uint16_t *sink;
    uint16_t value;

    Scope(volatile uint16_t *output, uint16_t seed)
        : sink(output), value(seed) {}

    ~Scope() {
        *sink = (uint16_t)(*sink + value);
    }

    __attribute__((noinline)) void update(uint16_t step) {
        value = (uint16_t)((value << 1) ^ step);
    }
};

extern "C" int avm_test_main()
{
    lifetime_result = 0;

    __avm_debug_break();

    for (uint16_t i = 0; i < 384; ++i) {
        Scope scope(&lifetime_result, (uint16_t)(i + 7u));
        scope.update((uint16_t)(i * 13u));
        if ((i & 3u) == 0)
            continue;
        scope.update((uint16_t)(i ^ 0x55aau));
    }

    __avm_debug_break();
    return 0;
}
