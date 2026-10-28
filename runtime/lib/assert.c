#include <assert.h>
#include <stdlib.h>
#include <avm.h>

void __avm_assert_fail(const char AVM_PROGMEM* expression,
                       const char AVM_PROGMEM* file,
                       unsigned long line,
                       const char AVM_PROGMEM* function) {
    avm_debug_printf_P(F("Assertion failed: %S, function %S, file %S, line %lu.\n"),
                       expression, function, file, line);
    abort();
}
