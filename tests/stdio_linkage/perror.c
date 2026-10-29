#include <stdio.h>
int _start(char* format) { (void)format; perror(format); return 0; }
