#include <stdint.h>

static volatile uint16_t inputs[32];
static volatile uint16_t lambda_capture_result;

template <typename Operation>
__attribute__((noinline)) static uint16_t apply(Operation operation,
                                                 uint16_t value)
{
    return operation(value);
}

extern "C" int avm_test_main()
{
    for (uint8_t i = 0; i < 32; ++i)
        inputs[i] = (uint16_t)(i * 97u + 11u);

    __avm_debug_break();

    uint16_t factor = 7;
    uint16_t checksum = 0x1234;
    auto by_value = [factor](uint16_t value) {
        return (uint16_t)(value * factor + 3u);
    };
    auto by_reference = [&checksum](uint16_t value) {
        checksum = (uint16_t)(checksum ^ value);
        return (uint16_t)(checksum + (value >> 2));
    };
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 32; ++i) {
            checksum += apply(by_value, inputs[i]);
            checksum ^= apply(by_reference, inputs[i]);
        }
    }
    lambda_capture_result = checksum;

    __avm_debug_break();
    return 0;
}
