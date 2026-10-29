#include <stdio.h>
int _start(char* format) { (void)format; char b[2]; return (snprintf)(b, sizeof b, format); }
