#include <stdlib.h>
static void f(void) {}
int main(void) { return atexit(f); }
