#include "init_fini.h"

/*
 * _start holds no register across these calls, so they need not preserve any.
 * Definitions marked preserve_none save less stack; unmarked ones still work.
 */
extern void setup(void) __attribute__((preserve_none));
extern void loop(void) __attribute__((preserve_none));

__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    __builtin_avm_termination_context();
    __avm_run_constructors();
    setup();
    for (;;)
        loop();
}
