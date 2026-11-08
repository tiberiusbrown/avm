#include <avm.h>

struct local_object {
    char finished;

    local_object(char started, char finished) : finished(finished) {
        avm_debug_putc(started);
    }

    ~local_object() {
        avm_debug_putc(finished);
    }
};

static void first() {
    static local_object object('A', 'a');
}

static void second() {
    static local_object object('B', 'b');
}

static void unused() {
    static local_object object('U', 'u');
}

static volatile int initialize_unused;

/* The linker should discard both this dead function and its table slot. */
extern "C" void dead_local_static() {
    static local_object object('Q', 'q');
}

extern "C" int avm_test_main() {
    second();
    first();
    if (initialize_unused)
        unused();
    second();
    first();
    avm_debug_putc('M');
    return 0;
}
