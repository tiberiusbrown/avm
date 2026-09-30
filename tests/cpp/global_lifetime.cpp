#include <avm.h>

static int stage;

__attribute__((constructor(101))) static void early_constructor() {
    stage = 1;
    avm_debug_putc('A');
}

__attribute__((destructor(101))) static void late_destructor() {
    avm_debug_putc(stage == 5 ? 'Z' : 'X');
}

struct global_object {
    global_object() {
        stage = stage == 1 ? 2 : -1;
        avm_debug_putc('C');
    }

    ~global_object() {
        avm_debug_putc(stage == 4 ? 'D' : 'X');
        stage = 5;
    }
};

struct second_object {
    second_object() {
        stage = stage == 2 ? 3 : -1;
        avm_debug_putc('B');
    }

    ~second_object() {
        avm_debug_putc(stage == 3 ? 'E' : 'X');
        stage = 4;
    }
};

/* Declaration order differs from init_priority order. */
static second_object second __attribute__((init_priority(300)));
static global_object object __attribute__((init_priority(200)));

extern "C" int avm_test_main() {
    if (stage != 3)
        return 1;
    return 0;
}
