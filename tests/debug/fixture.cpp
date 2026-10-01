#include <avm.h>
#include <stdint.h>

struct DebugPair {
    uint16_t left;
    uint8_t right;
};

volatile uint16_t debug_cpp_result;
static const uint8_t AVM_PROGMEM
    __attribute__((section(".high_debug_rodata"))) debug_cpp_pattern[] = {5, 0};

__attribute__((noinline, section(".high_debug_text")))
static uint16_t debug_far(DebugPair const& pair,
                          uint8_t const AVM_PROGMEM* program_pointer)
{
    volatile uint16_t local = pair.left + pair.right + program_pointer[0];
    debug_cpp_result = local;
    return local;
}

extern "C" int main()
{
    DebugPair pair{3, 4};
    uint16_t result = debug_far(pair, debug_cpp_pattern);
    __avm_framebuffer[0] = static_cast<uint8_t>(result);
    avm_debug_break();
    for (;;) avm_idle();
}
