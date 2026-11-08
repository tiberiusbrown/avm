#include <stdio.h>
static int (*volatile indirect_printf)(const char*, ...) = &printf;
#undef printf
#define printf indirect_printf
static int (*volatile indirect_fprintf)(FILE*, const char*, ...) = &fprintf;
#undef fprintf
#define fprintf indirect_fprintf
static int (*volatile indirect_vprintf)(const char*, va_list) = &vprintf;
#undef vprintf
#define vprintf indirect_vprintf
static int (*volatile indirect_vfprintf)(FILE*, const char*, va_list) = &vfprintf;
#undef vfprintf
#define vfprintf indirect_vfprintf
static int (*volatile indirect_sprintf)(char*, const char*, ...) = &sprintf;
#undef sprintf
#define sprintf indirect_sprintf
static int (*volatile indirect_vsprintf)(char*, const char*, va_list) = &vsprintf;
#undef vsprintf
#define vsprintf indirect_vsprintf
static int (*volatile indirect_snprintf_P)(char*, size_t, const char AVM_PROGMEM*, ...) = &snprintf_P;
#undef snprintf_P
#define snprintf_P indirect_snprintf_P
#include "stdio_format.c"
