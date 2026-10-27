#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P'); avm_debug_putc('\n'); __avm_debug_break();
    for (;;) {}
}
static void first(void) { avm_debug_putc('1'); }
static void second(void) { avm_debug_putc('2'); }
int avm_test_main(void) {
    if (atexit(first) || atexit(second)) abort();
    avm_debug_putc('E');
    exit(7);
}
