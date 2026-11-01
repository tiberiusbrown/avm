#include <avm.h>
#include <stdint.h>

// Relaxation shortens the calls and branches between the inlined regions below,
// so every debug range that crosses them must move by the bytes removed before
// it. The volatile reads and writes keep the inlined bodies from being folded,
// and the volatile input keeps the seed from being a compile-time constant.
volatile uint8_t relax_debug_sink;

// Defined here and called from relax_debug_info_base.cpp, which holds the only
// function of its own translation unit.
__attribute__((noinline))
void relax_debug_step(uint8_t value)
{
    relax_debug_sink = value;
}

extern uint8_t relax_debug_base_outer(uint8_t seed);

__attribute__((always_inline)) static inline uint8_t relax_debug_mix(uint8_t a,
                                                                    uint8_t b)
{
    uint8_t result = a ^ b;
    if (result & 1) relax_debug_step(result);
    return result;
}

__attribute__((always_inline)) static inline uint8_t relax_debug_scale(uint8_t a)
{
    uint8_t scaled = static_cast<uint8_t>(a << 1);
    if (scaled > 7) {
        uint8_t inner = static_cast<uint8_t>(scaled + 1);
        relax_debug_step(inner);
    }
    return scaled;
}

__attribute__((noinline))
static uint8_t relax_debug_outer(uint8_t seed)
{
    uint8_t total = 0;
    if (seed & 2) {
        uint8_t mixed = relax_debug_mix(seed, 3);
        relax_debug_step(mixed);
        total = static_cast<uint8_t>(total + mixed);
    }
    {
        uint8_t scaled = relax_debug_scale(seed);
        if (scaled == 0) relax_debug_step(0);
        total = static_cast<uint8_t>(total + scaled);
    }
    uint8_t tail = relax_debug_mix(total, seed);
    relax_debug_step(tail);
    return static_cast<uint8_t>(total + tail);
}

extern "C" int main()
{
    volatile uint8_t input = 6;
    uint8_t seed = input;
    __avm_framebuffer[0] = relax_debug_outer(seed);
    __avm_framebuffer[1] = relax_debug_base_outer(seed);
    for (;;) avm_idle();
}
