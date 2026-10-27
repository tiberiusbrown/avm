#include <stdlib.h>
#include <avm/runtime.h>

/* Explicit exit also enables construction tracking for an exit from a ctor.
 * A return from main needs only the optional weak registry hooks. */
extern void __avm_run_local_dtors(void);
extern void __avm_terminate(void);

void exit(int status) {
    (void)status;
    __avm_run_local_dtors();
    __avm_terminate();
    avm_halt();
}
