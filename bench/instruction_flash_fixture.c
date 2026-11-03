#include <stdint.h>

/* External linkage, observable from assembly. The AVM auto-flash placement
   predicate must put this initialized AS0 constant into .flash. */
__attribute__((used, aligned(2)))
const uint32_t avm_bench_flash_words[4] = {
    UINT32_C(0x78563412), UINT32_C(0xEFCDAB90),
    UINT32_C(0x44332211), UINT32_C(0x88776655)
};
