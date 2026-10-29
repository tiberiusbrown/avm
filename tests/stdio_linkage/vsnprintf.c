#include <stdio.h>
int _start(char* format) { (void)format; char b[2]; return (vsnprintf)(b, sizeof b, format, (__builtin_va_list)0); }
