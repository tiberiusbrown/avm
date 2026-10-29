#include <stdio.h>
int _start(char* format) { (void)format; FILE* volatile p = stdout; FILE* volatile q = stderr; return p != q; }
