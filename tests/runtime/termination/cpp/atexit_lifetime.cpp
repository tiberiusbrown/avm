#include <stdlib.h>
#include <avm.h>
static void one() { avm_debug_putc('1'); }
static void two() { avm_debug_putc('2'); }
static void three() { avm_debug_putc('3'); }
static void four() { avm_debug_putc('4'); }
static void six() { avm_debug_putc('6'); }
static void five() { avm_debug_putc('5'); if (atexit(six)) avm_debug_putc('F'); }
static void inside_local() { avm_debug_putc('I'); }
static void during_dtor() { avm_debug_putc('D'); }
struct local {
    char end;
    local(char start, char end) : end(end) {
        avm_debug_putc(start);
        if (start == 'l') atexit(inside_local);
    }
    ~local() { avm_debug_putc(end); }
};
struct first {
    first() { atexit(one); static local l('l', 'L'); atexit(two); avm_debug_putc('A'); }
    ~first() { avm_debug_putc('a'); }
} a;
struct second {
    second() { atexit(three); static local m('m', 'M'); atexit(four); avm_debug_putc('B'); }
    ~second() { avm_debug_putc('b'); atexit(during_dtor); }
} b;
extern void activate_external();
extern "C" int avm_test_main() {
    activate_external();
    static local n('n', 'N');
    return atexit(five) || atexit(five);
}
