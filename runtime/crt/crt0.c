#include <avm/runtime.h>

extern int main(void);

/*
 * The AVM loader has already initialized .saved and .data, set SP to 0x0A00,
 * cleared CC, and transferred control to this symbol. Raw image entry has no
 * caller return record, so _start must never return.
 */
__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    (void)main();
    avm_halt();
}
