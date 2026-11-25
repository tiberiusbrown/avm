#include <stdint.h>

/* External linkage, observable from assembly. The AVM auto-flash placement
   predicate must put this initialized AS0 constant into .flash. */
__attribute__((used, aligned(2)))
const uint32_t avm_bench_flash_words[4] = {
    UINT32_C(0x78563412), UINT32_C(0xEFCDAB90),
    UINT32_C(0x44332211), UINT32_C(0x88776655)
};

/* Tile maps in the flash window for the tile map service rows: every entry is
   frame one. */
#define ONE8 1, 1, 1, 1, 1, 1, 1, 1
__attribute__((used))
const uint8_t avm_bench_flash_map[64] = {ONE8, ONE8, ONE8, ONE8, ONE8, ONE8, ONE8, ONE8};
__attribute__((used))
const uint16_t avm_bench_flash_map16[32] = {ONE8, ONE8, ONE8, ONE8};
