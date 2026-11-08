#ifndef AVM_STRING_PROGMEM_BENCH_H
#define AVM_STRING_PROGMEM_BENCH_H

#include <stdint.h>
#include <string.h>

/* Match the RAM workloads, including padding for bounded memory searches. */
static const char AVM_PROGMEM string_bench_flash[4][32] = {
    "",
    "abcdefghijklmnopqrstuvw",
    "ababababababababac",
    {'a', (char)0xff, 'b', 'a', (char)0x80, 'c', 0}
};

/* Preserve the address space when computing offsets from flash results. */
static inline uint16_t string_bench_flash_offset(
    const void AVM_PROGMEM* found, const char AVM_PROGMEM* base)
{
    return found ? (uint16_t)((const char AVM_PROGMEM*)found - base + 1) : 0;
}

#endif
