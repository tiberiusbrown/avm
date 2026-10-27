#include "init_fini.h"

extern void setup(void);
extern void loop(void);

__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    __builtin_avm_termination_context();
    avm_run_constructors();
    setup();
    for (;;)
        loop();
}
