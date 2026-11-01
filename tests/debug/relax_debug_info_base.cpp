#include <stdint.h>

// This translation unit holds only relax_debug_base_outer, so its compile unit
// has a single address range and a nonzero DW_AT_low_pc. Its location lists
// must establish a zero base before their absolute addresses.
extern void relax_debug_step(uint8_t value);

__attribute__((always_inline)) static inline uint8_t relax_debug_fold(uint8_t a,
                                                                      uint8_t b)
{
    uint8_t folded = static_cast<uint8_t>(a + b);
    if (folded & 1) relax_debug_step(folded);
    return folded;
}

__attribute__((noinline))
uint8_t relax_debug_base_outer(uint8_t seed)
{
    uint8_t first = relax_debug_fold(seed, 1);
    relax_debug_step(first);
    uint8_t second = relax_debug_fold(first, seed);
    relax_debug_step(second);
    return static_cast<uint8_t>(first + second);
}
