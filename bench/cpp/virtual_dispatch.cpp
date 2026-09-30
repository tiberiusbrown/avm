#include <stdint.h>

struct Operation {
    virtual uint16_t apply(uint16_t value) const = 0;
};

struct Add : Operation {
    uint16_t increment;
    explicit Add(uint16_t value) : increment(value) {}
    uint16_t apply(uint16_t value) const override {
        return (uint16_t)(value + increment);
    }
};

struct Mix : Operation {
    uint16_t mask;
    explicit Mix(uint16_t value) : mask(value) {}
    uint16_t apply(uint16_t value) const override {
        return (uint16_t)((value ^ mask) + (value >> 3));
    }
};

static volatile uint16_t virtual_dispatch_result;

__attribute__((noinline))
static uint16_t invoke(const Operation *operation, uint16_t value)
{
    return operation->apply(value);
}

extern "C" int avm_test_main()
{
    Add add(37);
    Mix mix(0x55aa);
    const Operation *operations[] = {&add, &mix, &add, &mix};

    __avm_debug_break();

    uint16_t value = 0x1234;
    for (uint16_t i = 0; i < 512; ++i)
        value = invoke(operations[(value ^ i) & 3u], value);
    virtual_dispatch_result = value;

    __avm_debug_break();
    return 0;
}
