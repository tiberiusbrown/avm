#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P'); avm_debug_putc('\n'); __avm_debug_break();
    for (;;) {}
}
static void done(void) { avm_debug_putc('C'); }
void setup(void) { if (atexit(done)) abort(); avm_debug_putc('S'); }
void loop(void) { avm_debug_putc('L'); exit(9); }
