#include <stdlib.h>
volatile unsigned char input;
__attribute__((noinline))
static void callback(void) {
    volatile unsigned char frame[240];
    frame[input % 240] = 1;
}
int main(void) { return atexit(callback); }
