#include <avm.h>

static int check_slow_rate(uint8_t rate)
{
    avm_set_frame_rate(rate);
    if (avm_next_frame())
        return 1;

    uint16_t start = avm_millis();
    while ((uint16_t)(avm_millis() - start) < 240u)
        avm_idle();
    if (avm_next_frame())
        return 2;

    while ((uint16_t)(avm_millis() - start) < 260u) {
        if (avm_next_frame())
            return 0;
        avm_idle();
    }
    return 3;
}

int avm_test_main(void)
{
    for (uint8_t rate = 0; rate < 4; ++rate) {
        int error = check_slow_rate(rate);
        if (error)
            return (int)(rate * 3 + error);
    }

    while ((uint8_t)avm_millis() < 248)
        avm_idle();
    avm_set_frame_duration(20);
    uint16_t start = avm_millis();
    avm_wait_frame();
    uint16_t elapsed = avm_millis() - start;
    if (elapsed < 19 || elapsed > 20)
        return 13;
    avm_wait_frame();
    elapsed = avm_millis() - start;
    if (elapsed < 39 || elapsed > 40)
        return 14;
    if (avm_next_frame())
        return 15;

    return 0;
}
