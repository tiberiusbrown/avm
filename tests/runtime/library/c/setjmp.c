#include <setjmp.h>

#define NOINLINE __attribute__((noinline, disable_tail_calls))
_Static_assert(sizeof(jmp_buf) == 13, "context size");
_Static_assert(_Alignof(jmp_buf) == 1, "context alignment");
static jmp_buf global_env;
static volatile unsigned sink;
static volatile unsigned vla_count = 19;
static volatile unsigned register_values[6] = {28, 51, 0x1225, 108, 119, 0x5669};

/* Volatile arrays force real local stack storage at every call depth. */
static NOINLINE void depth3(jmp_buf env, int value) {
    volatile unsigned data[13];
    data[0] = 33; data[12] = 44;
    sink = data[0] + data[12];
    /* The abandoned callee must really change every saved register. */
    __asm__ volatile("ldi16 r0, 0x1111\n\tldi16 r1, 0x2222\n\t"
                     "ldi16 r2, 0x3333\n\tldi16 r3, 0x4444"
                     : : : "r0", "r1", "r2", "r3");
    longjmp(env, value);
}
static NOINLINE void depth2(jmp_buf env, int value) {
    volatile unsigned data[11];
    data[0] = 22; data[10] = 55;
    depth3(env, value);
    sink = data[0] + data[10];
}
static NOINLINE void depth1(jmp_buf env, int value) {
    volatile unsigned data[9];
    data[0] = 11; data[8] = 66;
    depth2(env, value);
    sink = data[0] + data[8];
}
static NOINLINE unsigned reuse_slot(unsigned n) {
    volatile unsigned data[17];
    data[0] = n; data[16] = n + 1;
    return data[0] + data[16];
}
static NOINLINE int values(void) {
    volatile int phase = 0;
    switch (setjmp(global_env)) {
    case 0:
        if (phase != 0) return 1;
        phase = 1;
        sink = reuse_slot(17);
        depth1(global_env, 1234);
        return 2;
    case 1234:
        if (phase != 1) return 3;
        phase = 2;
        depth1(global_env, 0);
        return 4;
    case 1:
        if (phase != 2) return 5;
        phase = 3;
        depth1(global_env, -1234);
        return 6;
    case -1234:
        if (phase != 3) return 7;
        return 0;
    default: return 8;
    }
}
static NOINLINE int environments(void) {
    jmp_buf outer, inner;
    volatile int modified = 10;
    switch (setjmp(outer)) {
    case 0:
        switch (setjmp(inner)) {
        case 0: modified = 20; depth1(inner, 2); return 9;
        case 2:
            if (modified != 20) return 10;
            modified = 30;
            depth1(outer, 3);
            return 11;
        default: return 12;
        }
    case 3: return modified == 30 ? 0 : 13;
    default: return 14;
    }
}
static NOINLINE int with_vla(unsigned count) {
    volatile unsigned data[count];
    jmp_buf env;
    unsigned i;
    for (i = 0; i < count; ++i) data[i] = i * 7 + 3;
    switch (setjmp(env)) {
    case 0: depth1(env, 7); return 15;
    case 7:
        for (i = 0; i < count; ++i)
            if (data[i] != i * 7 + 3) return 16;
        return 0;
    default: return 17;
    }
}
/* Inputs remain unmodified across the second return. Multiple live values
   exercise register allocation as well as the frame-pointer register. */
static NOINLINE int registers(void) {
    unsigned a = register_values[0], b = register_values[1];
    unsigned c = register_values[2], d = register_values[3];
    unsigned e = register_values[4], f = register_values[5];
    jmp_buf env;
    switch (setjmp(env)) {
    case 0: depth1(env, 9); return 18;
    case 9:
        if (a != 28 || b != 51 || c != (17 ^ 0x1234) || d != 108 ||
            e != 119 || f != (17 ^ 0x5678)) return 19;
        sink = a + b + c + d + e + f;
        return 0;
    default: return 20;
    }
}
int avm_test_main(void) {
    int result = values();
    if (result) return result;
    result = environments();
    if (result) return result;
    result = with_vla(vla_count);
    if (result) return result;
    return registers();
}
