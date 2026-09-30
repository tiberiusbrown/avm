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

static void activate_early() {
    static local_object object('s', 'S');
}

static void activate_middle() {
    static local_object object('m', 'M');
}

static void activate_late() {
    static local_object object('t', 'T');
}

struct first_global {
    first_global() {
        activate_early();
        avm_debug_putc('A');
    }

    ~first_global() {
        avm_debug_putc('a');
    }
};

struct second_global {
    second_global() {
        activate_middle();
        avm_debug_putc('B');
    }

    ~second_global() {
        avm_debug_putc('b');
    }
};

static first_global first;
static second_global second;

extern "C" int avm_test_main() {
    activate_late();
    return 0;
}
