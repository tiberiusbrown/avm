#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <inttypes.h>
#include <stddef.h>
#include <math.h>
#include <limits.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)

static __attribute__((unused)) int (*volatile string_call)(const char *, const char *, ...) = &sscanf;
static __attribute__((unused)) int (*volatile stream_call)(FILE *, const char *, ...) = &fscanf;
static __attribute__((unused)) int (*volatile stdin_call)(const char *, ...) = &scanf;
static __attribute__((unused)) int (*volatile vs_call)(const char *, const char *, va_list) = &vsscanf;
static __attribute__((unused)) int (*volatile vf_call)(FILE *, const char *, va_list) = &vfscanf;
static __attribute__((unused)) int (*volatile vi_call)(const char *, va_list) = &vscanf;
static __attribute__((unused)) int forward(int which, const char *text, const char *fmt, ...) {
    volatile unsigned char guard[3] = {17, 29, 43};
    va_list ap; va_start(ap, fmt);
    int r = which == 0 ? vs_call(text, fmt, ap) :
            which == 1 ? vf_call(stdin, fmt, ap) : vi_call(fmt, ap);
    va_end(ap);
    return guard[0] == 17 && guard[1] == 29 && guard[2] == 43 ? r : -99;
}
