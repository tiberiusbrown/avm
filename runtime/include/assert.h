#ifndef _AVM_RUNTIME_ASSERT_H
#define _AVM_RUNTIME_ASSERT_H

#include <avm/pgmspace.h>
#ifdef __cplusplus
extern "C" {
#endif
void __avm_assert_fail(const char AVM_PROGMEM* expression,
                       const char AVM_PROGMEM* file,
                       unsigned long line,
                       const char AVM_PROGMEM* function)
    __attribute__((noreturn));
#ifdef __cplusplus
}
#endif
#endif

#ifdef assert
#undef assert
#endif

#ifdef NDEBUG
#define assert(expression) ((void)0)
#else
#define assert(expression) ((expression) ? (void)0 : \
    __avm_assert_fail(AVM_PSTR(#expression), AVM_PSTR(__FILE__), \
                      (unsigned long)__LINE__, AVM_PSTR(__func__)))
#endif
