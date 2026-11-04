#ifndef _AVM_RUNTIME_STDARG_H
#define _AVM_RUNTIME_STDARG_H
#define __STDC_VERSION_STDARG_H__ 202311L

typedef __builtin_va_list va_list;

/* C23 makes the second argument of va_start optional. Earlier modes require it. */
#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 202311L
#define va_start(...) __builtin_c23_va_start(__VA_ARGS__)
#else
#define va_start(ap, last) __builtin_va_start((ap), (last))
#endif
#define va_arg(ap, type)   __builtin_va_arg((ap), type)
#define va_end(ap)         __builtin_va_end((ap))
#define va_copy(dst, src)  __builtin_va_copy((dst), (src))

#endif
