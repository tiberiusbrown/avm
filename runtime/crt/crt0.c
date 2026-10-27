#include <avm/runtime.h>

#include "init_fini.h"

extern int main(void);
extern void __avm_terminate(void);

/*
 * The AVM loader has already initialized .saved and .data, set SP to 0x0A00,
 * cleared CC, and transferred control to this symbol. Raw image entry has no
 * caller return record, so _start must never return.
 */
__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    __builtin_avm_termination_context();
    avm_run_constructors();
    (void)main();
    __avm_terminate();
    avm_halt();
}
