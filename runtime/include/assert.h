#ifndef _AVM_RUNTIME_ASSERT_H
#define _AVM_RUNTIME_ASSERT_H
#define __STDC_VERSION_ASSERT_H__ 202311L

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

/* C23 declares assert with an ellipsis, but an enabled assertion accepts
 * exactly one expression. Two or more arguments give
 * __AVM_ASSERT_EXACTLY_ONE_EXPRESSION four arguments, which the preprocessor
 * rejects. Zero arguments reach __AVM_ASSERT_IDENTITY() and fail to parse. */
#define __AVM_ASSERT_UNUSED(...)
#define __AVM_ASSERT_IDENTITY(expression) expression
#define __AVM_ASSERT_EXACTLY_ONE_EXPRESSION(first, second, selected) selected
#define __AVM_ASSERT_EXPRESSION(...) \
    __AVM_ASSERT_EXACTLY_ONE_EXPRESSION(__VA_ARGS__, __AVM_ASSERT_UNUSED, \
                                        __AVM_ASSERT_IDENTITY)(__VA_ARGS__)

#ifdef assert
#undef assert
#endif

#ifdef NDEBUG
#define assert(...) ((void)0)
#else
#define assert(...) ((__AVM_ASSERT_EXPRESSION(__VA_ARGS__)) ? (void)0 : \
    __avm_assert_fail(AVM_PSTR(#__VA_ARGS__), AVM_PSTR(__FILE__), \
                      (unsigned long)__LINE__, AVM_PSTR(__func__)))
#endif
