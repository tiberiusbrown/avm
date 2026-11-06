// Unwind through preserve_none code into a C-ABI caller with a dynamic frame.
// The caller's live values must survive in spills, while r3 remains the frame
// pointer across both direct and indirect calls. The callee also runs a cleanup.
#include <stdint.h>

namespace {
volatile uint16_t cleanups;

struct Guard {
    ~Guard() { cleanups = cleanups + 1; }
};

__attribute__((preserve_none, noinline)) void throw_value(uint16_t value) {
    Guard guard;
    __asm__ volatile("ldi16 r0, 0x1357\n\t"
                     "ldi16 r1, 0x2468\n\t"
                     "ldi16 r2, 0x369a\n\t"
                     "ldi16 r3, 0x47ab"
                     : : : "r0", "r1", "r2", "r3");
    throw value;
}

using Thrower = void (__attribute__((preserve_none)) *)(uint16_t);
static_assert(sizeof(Thrower) == 3);
Thrower volatile indirect = throw_value;

__attribute__((noinline)) bool check(uint8_t size, bool use_indirect) {
    volatile uint8_t *buffer = (volatile uint8_t *)__builtin_alloca(size);
    buffer[0] = 0x5a;
    buffer[size - 1] = 0xc3;
    uint16_t a = 0x1234, b = 0x4567;
    __asm__ volatile("" : "+r"(a), "+r"(b));
    try {
        if (use_indirect)
            indirect(0x789a);
        else
            throw_value(0x789a);
    } catch (uint16_t value) {
        __asm__ volatile("" : "+r"(a), "+r"(b));
        return value == 0x789a && a == 0x1234 && b == 0x4567 &&
               buffer[0] == 0x5a && buffer[size - 1] == 0xc3;
    } catch (...) {
        return false;
    }
    return false;
}
}

extern "C" int avm_test_main() {
    if (!check(9, false) || !check(17, true) || !check(13, false))
        return 1;
    return cleanups != 3;
}
