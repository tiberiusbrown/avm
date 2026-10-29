#include <stdio.h>
int _start(char* format) { (void)format; return fputc(42, (FILE*)format); }
