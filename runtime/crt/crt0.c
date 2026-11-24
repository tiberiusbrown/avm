#include <avm/runtime.h>

#include "init_fini.h"

/*
 * _start holds no register across the call, so main need not preserve any.
 * A main defined with preserve_none saves less; any other main still works.
 */
extern int main(void) __attribute__((preserve_none));
extern void __avm_terminate(void);

/*
 * The AVM loader has already initialized .saved and .data, set SP to 0x0A00,
 * cleared CC, and transferred control to this symbol. Raw image entry has no
 * caller return record, so _start must never return.
 */
__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    __builtin_avm_termination_context();
    __avm_run_constructors();
    (void)main();
    __avm_terminate();
    avm_halt();
}
