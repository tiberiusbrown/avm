#include <stdlib.h>
static void f(void) {}
void dead(void) { atexit(f); }
int main(void) { return 0; }
