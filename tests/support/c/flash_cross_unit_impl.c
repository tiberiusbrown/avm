#include <stdint.h>

// Immutable definitions in this unit live in the flash window, and the test
// unit reaches them through ordinary AS0 references.
const uint8_t impl_table[4] = {0x11, 0x22, 0x33, 0x44};
const char impl_text[] = "cross";
__attribute__((weak)) const uint16_t weak_words[2] = {0x1234, 0xbeef};
const uint16_t *const impl_pointer = weak_words;
