#ifndef AVM_STRING_BENCH_H
#define AVM_STRING_BENCH_H

#include <stdint.h>
#include <string.h>

/* Writable RAM inputs: empty, distinct, repeated-prefix, and high-bit bytes.
 * Rows are padded so bounded memory searches may examine all 32 bytes. */
static char string_bench_text[4][32] = {
    "",
    "abcdefghijklmnopqrstuvw",
    "ababababababababac",
    {'a', (char)0xff, 'b', 'a', (char)0x80, 'c', 0}
};
static volatile uint16_t string_bench_result;

/* Encode misses without subtracting a null pointer. */
static inline uint16_t string_bench_offset(const void* found, const char* base)
{
    return found ? (uint16_t)((const char*)found - base + 1) : 0;
}

#endif
