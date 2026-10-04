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
        __builtin_avm_stack_dispatch(*entry, 0);
}

static inline void avm_run_destructors(void) {
    __builtin_avm_stack_dispatch(__avm_run_local_dtors, 3);
    for (const avm_init_fini_fn AVM_PROGMEM *entry = __fini_array_end;
         entry != __fini_array_start;)
        __builtin_avm_stack_dispatch(*--entry, 1);
    __builtin_avm_stack_dispatch(__avm_run_local_dtors, 3);
}

#endif
