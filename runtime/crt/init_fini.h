#ifndef AVM_CRT_INIT_FINI_H
#define AVM_CRT_INIT_FINI_H

#include <avm/pgmspace.h>

typedef void (*avm_init_fini_fn)(void);

/* The linker defines these program-space bounds even when an array is empty. */
extern const avm_init_fini_fn AVM_PROGMEM __init_array_start[];
extern const avm_init_fini_fn AVM_PROGMEM __init_array_end[];
extern const avm_init_fini_fn AVM_PROGMEM __fini_array_start[];
extern const avm_init_fini_fn AVM_PROGMEM __fini_array_end[];

/* An unresolved weak reference is null when no local dtor registry is linked. */
extern void __avm_run_local_dtors(void) __attribute__((weak));

static inline void avm_run_constructors(void) {
    for (const avm_init_fini_fn AVM_PROGMEM *entry = __init_array_start;
         entry != __init_array_end; ++entry)
        (*entry)();
}

static inline void avm_run_destructors(void) {
    if (__avm_run_local_dtors)
        __avm_run_local_dtors();
    for (const avm_init_fini_fn AVM_PROGMEM *entry = __fini_array_end;
         entry != __fini_array_start;)
        (*--entry)();
    if (__avm_run_local_dtors)
        __avm_run_local_dtors();
}

#endif
