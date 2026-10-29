#include <stdio.h>
int _start(char *unused) { int n; (void)unused; return sscanf("123", "%d", &n); }
