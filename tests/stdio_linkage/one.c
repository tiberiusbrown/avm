#include <stdio.h>
int _start(char* format) { (void)format; FILE* volatile p = stdout; return p != 0; }
