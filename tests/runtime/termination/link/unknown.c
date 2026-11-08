#include <stdlib.h>
void (*volatile target)(void);
int main(void) { return atexit(target); }
