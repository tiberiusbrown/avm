#include <stdlib.h>
#include <stdint.h>

/* Absolute linker symbol: no capacity word is stored in guest RAM. */
extern const char __avm_atexit_capacity;
extern void __avm_register_exit_callback(void (*func)(void));
extern uint8_t __avm_atexit_count;

/* Keep the analysis-visible registration boundary through optimization/LTO. */
__attribute__((noinline))
int atexit(void (*func)(void)) {
    if (__avm_atexit_count == (uintptr_t)&__avm_atexit_capacity)
        return -1;
    __avm_register_exit_callback(func);
    ++__avm_atexit_count;
    return 0;
}
