#include <stdio.h>
int _start(FILE *stream) { int n; return fscanf(stream, "%d", &n); }
