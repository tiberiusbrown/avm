#include <avm/runtime.h>
#include "../crt/init_fini.h"

void __avm_terminate(void) {
    avm_run_destructors();
}
