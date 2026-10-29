#include <stdio.h>
int _start(char* format) { (void)format; FILE* volatile p = stdout; FILE* volatile q = stderr; FILE* volatile r = stdin; return p != q && p != r; }
