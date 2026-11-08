#include <stdlib.h>
volatile unsigned char input;
__attribute__((noinline))
static void a(void) {
    volatile unsigned char x[20];
    x[input % 20] = 1;
}
__attribute__((noinline))
static void b(void) {
    volatile unsigned char x[30];
    x[input % 30] = 2;
}
int main(void) { return atexit(input ? a : b); }
