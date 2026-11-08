#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P'); avm_debug_putc('\n'); __avm_debug_break();
    for (;;) {}
}
#ifndef WITHOUT_CALLBACK
static void callback() { avm_debug_putc('E'); }
#endif
struct first { first() { avm_debug_putc('A'); } ~first() { avm_debug_putc('a'); } } a;
struct second {
    second() {
        avm_debug_putc('B');
#ifndef WITHOUT_CALLBACK
        atexit(callback);
#endif
        exit(3);
    }
    ~second() { avm_debug_putc('F'); }
} b;
struct third { third() { avm_debug_putc('F'); } ~third() { avm_debug_putc('F'); } } c;
extern "C" int avm_test_main() { avm_debug_putc('F'); return 1; }
