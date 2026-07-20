#ifndef AVM_RUNTIME_H
#define AVM_RUNTIME_H

#ifdef __cplusplus
extern "C" {
#endif

/* Stop guest execution without returning through a nonexistent caller. */
__attribute__((noreturn)) void avm_halt(void);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // AVM_RUNTIME_H
