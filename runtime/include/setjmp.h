#ifndef _AVM_RUNTIME_SETJMP_H
#define _AVM_RUNTIME_SETJMP_H

typedef struct {
    unsigned char __state[13];
} jmp_buf[1];

#ifdef __cplusplus
extern "C" {
#endif

int __avm_setjmp(jmp_buf env)
    __attribute__((returns_twice));

void longjmp(jmp_buf env, int value)
    __attribute__((noreturn));

#ifdef __cplusplus
}
#endif

#define setjmp(env) __avm_setjmp(env)

#endif
