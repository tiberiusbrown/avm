/* Keep implementation and caller visible to the optimizer, as with LTO. */
#include "../../runtime/lib/string.c"

void avm_clear_dead_buffer(void) {
    unsigned char secret[4];
    memset_explicit(secret, 0, sizeof secret);
}
