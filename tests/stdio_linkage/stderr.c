#include <stdio.h>
int _start(char* format) { (void)format; return fputs(format, stderr); }
