#include <setjmp.h>
static __attribute__((noinline)) void jump_low(jmp_buf env) { longjmp(env, 1234); }
__attribute__((noinline, section(".high_setjmp_text")))
static int jump_high(void) {
    jmp_buf env;
    switch (setjmp(env)) {
    case 0: jump_low(env);
    case 1234: return 0;
    default: return 1;
    }
}
int avm_test_main(void) { return jump_high(); }
