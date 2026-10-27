#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P'); avm_debug_putc('\n'); __avm_debug_break();
    for (;;) {}
}
static void done(void) { avm_debug_putc('C'); }
int main(void) { if (atexit(done)) abort(); avm_debug_putc('R'); return 7; }
