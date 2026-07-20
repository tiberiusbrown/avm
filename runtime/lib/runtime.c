#include <avm/runtime.h>

__attribute__((noreturn))
void avm_halt(void) {
    for (;;)
        __asm__ volatile("" ::: "memory");
}
