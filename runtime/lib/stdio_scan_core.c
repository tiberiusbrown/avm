#include "stdio_scan_internal.h"
#include <stddef.h>

int scan_peek(avm_scan_state *s) {
    if(!s->has_lookahead) {
        s->lookahead = s->reader.read(s->reader.context);
        s->has_lookahead = 1;
    }
    return s->lookahead;
}
int scan_take(avm_scan_state *s) {
    int ch = scan_peek(s);
    s->has_lookahead = 0;
    if(ch != EOF) ++s->consumed;
    return ch;
}
void scan_finish(avm_scan_state *s) {
    if(s->has_lookahead && s->lookahead != EOF)
        s->reader.unread(s->reader.context, s->lookahead);
}
void scan_skip_space(avm_scan_state *s) {
    int ch;
    while((ch = scan_peek(s)) != EOF && isspace((unsigned char)ch)) scan_take(s);
}
/* Ascending internal ranges expand; reversed ranges and edge '-' are literal. */
static int in_set(int ch, const char *first, const char *end) {
    int negate = *first == '^', found = 0;
    if(negate) ++first;
    while(first != end) {
        unsigned char a = (unsigned char)*first++;
        if(first + 1 < end && *first == '-' && a <= (unsigned char)first[1]) {
            unsigned char b = (unsigned char)first[1];
            found |= ch >= a && ch <= b;
            first += 2;
        } else found |= ch == a;
    }
    return found != negate;
}
static int scan_chars(avm_scan_state *s, const avm_scan_conversion *c,
                      const char *set, const char *end, va_list *args) {
    char *out = 0;
    wchar_t *wide = 0;
    unsigned long width = c->width;
    int any = 0;
    if(!c->suppress) {
        if(c->length == SCAN_L) wide = va_arg(*args, wchar_t *);
        else out = va_arg(*args, char *);
    }
    while(width) {
        int ch = scan_peek(s);
        if(ch == EOF) {
            if(c->specifier == 'c' || !any) return SCAN_INPUT;
            break;
        }
        if(c->specifier == 's' && isspace((unsigned char)ch)) break;
        if(c->specifier == '[' && !in_set(ch, set, end)) break;
        scan_take(s); --width; any = 1;
        if(out) *out++ = (char)ch;
        if(wide) *wide++ = (wchar_t)(unsigned char)ch;
    }
    if(!any) return SCAN_MATCH;
    if(c->specifier != 'c') {
        if(out) *out = 0;
        if(wide) *wide = 0;
    }
    return SCAN_OK;
}
int __avm_vscan(avm_scan_reader reader, const char *format, va_list arguments) {
    avm_scan_state state = {reader, 0, 0, 0, 0};
    va_list args;
    va_copy(args, arguments);
    int status = SCAN_OK;
    while(*format) {
        unsigned char ch = (unsigned char)*format++;
        if(isspace(ch)) {
            while(isspace((unsigned char)*format)) ++format;
            scan_skip_space(&state); continue;
        }
        if(ch != '%' || *format == '%') {
            if(ch == '%') ++format;
            int input = scan_peek(&state);
            if(input != ch) { status = input == EOF ? SCAN_INPUT : SCAN_MATCH; break; }
            scan_take(&state); continue;
        }
        avm_scan_conversion c;
        c.width = ULONG_MAX;
        c.suppress = 0;
        c.length = SCAN_NONE;
        if(*format == '*') { c.suppress = 1; ++format; }
        int explicit_width = 0;
        if(*format >= '0' && *format <= '9') {
            explicit_width = 1; c.width = 0;
            do {
                unsigned int digit = (unsigned char)*format++ - '0';
                c.width = c.width > (ULONG_MAX - digit) / 10 ? ULONG_MAX : c.width * 10 + digit;
            } while(*format >= '0' && *format <= '9');
            if(!c.width) break;
        }
        switch(*format) {
        case 'h': ++format; c.length = SCAN_H;
            if(*format == 'h') { ++format; c.length = SCAN_HH; } break;
        case 'l': ++format; c.length = SCAN_L;
            if(*format == 'l') { ++format; c.length = SCAN_LL; } break;
        case 'j': ++format; c.length = SCAN_J; break;
        case 'z': ++format; c.length = SCAN_Z; break;
        case 't': ++format; c.length = SCAN_T; break;
        case 'L': ++format; c.length = SCAN_CAPITAL_L; break;
        }
        if(!*format) break;
        c.specifier = (unsigned char)*format++;
        const char *set = 0, *end = 0;
        if(c.specifier == '[') {
            set = format;
            if(*format == '^') ++format;
            if(*format == ']') ++format;
            while(*format && *format != ']') ++format;
            if(!*format) break;
            end = format++;
        }
        if(c.specifier == 'n') {
            if(!c.suppress) scan_count(c.length, state.consumed, &args);
            continue;
        }
        if(c.specifier != 'c' && c.specifier != '[') scan_skip_space(&state);
        switch(c.specifier) {
        case 'd': case 'i': case 'o': case 'u': case 'x': case 'X': case 'p':
            status = scan_integer(&state, &c, &args); break;
        case 'a': case 'A': case 'e': case 'E': case 'f': case 'F': case 'g': case 'G':
            status = scan_float(&state, &c, &args); break;
        case 'c': case 's': case '[':
            if(c.specifier == 'c' && !explicit_width) c.width = 1;
            status = scan_chars(&state, &c, set, end, &args); break;
        default: status = SCAN_MATCH; break;
        }
        if(status != SCAN_OK) break;
        if(!c.suppress) ++state.assigned;
    }
    scan_finish(&state);
    va_end(args);
    return status == SCAN_INPUT && !state.assigned ? EOF : (int)state.assigned;
}
