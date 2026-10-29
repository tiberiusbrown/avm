#ifndef AVM_STDIO_SCAN_INTERNAL_H
#define AVM_STDIO_SCAN_INTERNAL_H
#include <stdio.h>
#include <stdint.h>
#include <limits.h>
#include <ctype.h>

/* Keep the shared helpers in the implementation's reserved namespace. */
#define scan_peek __avm_scan_peek
#define scan_take __avm_scan_take
#define scan_finish __avm_scan_finish
#define scan_skip_space __avm_scan_skip_space
#define scan_integer __avm_scan_integer
#define scan_float __avm_scan_float
#define scan_count __avm_scan_count

typedef struct {
    void *context;
    int (*read)(void *context);
    int (*unread)(void *context, int ch);
} avm_scan_reader;
typedef struct {
    avm_scan_reader reader;
    unsigned long consumed;
    unsigned int assigned;
    int lookahead;
    unsigned char has_lookahead;
} avm_scan_state;
enum { SCAN_NONE, SCAN_HH, SCAN_H, SCAN_L, SCAN_LL, SCAN_J,
       SCAN_Z, SCAN_T, SCAN_CAPITAL_L };
typedef struct {
    unsigned long width;
    unsigned char suppress, length, specifier;
} avm_scan_conversion;
enum { SCAN_MATCH = 0, SCAN_OK = 1, SCAN_INPUT = -1 };
int scan_peek(avm_scan_state *s);
int scan_take(avm_scan_state *s);
void scan_finish(avm_scan_state *s);
void scan_skip_space(avm_scan_state *s);
int scan_integer(avm_scan_state *s, const avm_scan_conversion *c, va_list *args);
int scan_float(avm_scan_state *s, const avm_scan_conversion *c, va_list *args);
void scan_count(unsigned char length, unsigned long n, va_list *args);
int __avm_vscan(avm_scan_reader reader, const char *format, va_list args);
#include "strtof_internal.h"
#endif
