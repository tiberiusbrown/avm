#include "time_internal.h"
struct writer { char *s; size_t cap, n; int failed; };
static __attribute__((noinline)) void emit(struct writer *w, char c)
{
    if(w->failed) return;
    /* Stop counting as soon as output cannot fit, including its terminator. */
    if(w->n >= w->cap || w->cap - w->n <= 1) { w->failed = 1; return; }
    w->s[w->n++] = c;
}
static __attribute__((noinline)) void text(struct writer *w, const char AVM_PROGMEM *s, int limit)
{
    while(limit-- && *s && !w->failed) emit(w, *s++);
}
static __attribute__((noinline)) void number(struct writer *w, int32_t n, int width, char pad)
{
    uint32_t v;
    if(n < 0) { emit(w, '-'); v = (uint32_t)(-n); --width; }
    else v = (uint32_t)n;
    uint32_t divisor = 1;
    int digits = 1;
    while(v / divisor >= 10) { divisor *= 10; ++digits; }
    while(width-- > digits) emit(w, pad);
    do { emit(w, (char)('0' + v / divisor)); v %= divisor; divisor /= 10; } while(divisor);
}
static __attribute__((noinline)) void hms(struct writer *w, const struct tm *t, int twelve)
{
    int h = t->tm_hour;
    if(twelve) { h %= 12; if(!h) h = 12; }
    number(w, h, 2, '0'); emit(w, ':'); number(w, t->tm_min, 2, '0');
    emit(w, ':'); number(w, t->tm_sec, 2, '0');
}
static __attribute__((noinline)) void ampm(struct writer *w, const struct tm *t)
{ emit(w, t->tm_hour < 12 ? 'A' : 'P'); emit(w, 'M'); }
static __attribute__((noinline)) void date(struct writer *w, const struct tm *t)
{
    number(w, (int32_t)t->tm_mon + 1, 2, '0'); emit(w, '/');
    number(w, t->tm_mday, 2, '0'); emit(w, '/');
    int32_t y = (int32_t)t->tm_year + 1900;
    number(w, y - __avm_time_floor(y, 100) * 100, 2, '0');
}
/* Thursday determines the ISO year; January 4 determines its first Monday. */
static __attribute__((noinline)) void iso(const struct tm *t, int32_t *year, int32_t *week)
{
    int32_t z = __avm_time_days((int32_t)t->tm_year + 1900, (int32_t)t->tm_mon + 1, t->tm_mday);
    int32_t weekday = (z + 3) % 7;
    if(weekday < 0) weekday += 7;
    int32_t m, d;
    __avm_time_civil(z + 3 - weekday, year, &m, &d);
    int32_t jan4 = __avm_time_days(*year, 1, 4);
    int32_t wd = (jan4 + 3) % 7;
    if(wd < 0) wd += 7;
    *week = (z - (jan4 - wd)) / 7 + 1;
}
static __attribute__((noinline)) void conversion(struct writer *w, char c, const struct tm *t)
{
    int32_t y = (int32_t)t->tm_year + 1900, iy, iw;
    switch(c) {
    case 'a': case 'A':
        if(t->tm_wday >= 0 && t->tm_wday < 7)
            text(w, __avm_time_weekdays[t->tm_wday], c == 'a' ? 3 : 10);
        break;
    case 'b': case 'h': case 'B':
        if(t->tm_mon >= 0 && t->tm_mon < 12)
            text(w, __avm_time_months[t->tm_mon], c == 'B' ? 10 : 3);
        break;
    case 'c':
        if(t->tm_wday >= 0 && t->tm_wday < 7) text(w, __avm_time_weekdays[t->tm_wday], 3);
        emit(w, ' ');
        if(t->tm_mon >= 0 && t->tm_mon < 12) text(w, __avm_time_months[t->tm_mon], 3);
        emit(w, ' '); number(w, t->tm_mday, 2, ' '); emit(w, ' ');
        hms(w, t, 0); emit(w, ' '); number(w, y, 4, '0'); break;
    case 'C': number(w, __avm_time_floor(y, 100), 2, '0'); break;
    case 'd': case 'e': number(w, t->tm_mday, 2, c == 'e' ? ' ' : '0'); break;
    case 'D': case 'x': date(w, t); break;
    case 'F': number(w, y, 4, '0'); emit(w, '-');
        number(w, (int32_t)t->tm_mon + 1, 2, '0'); emit(w, '-'); number(w, t->tm_mday, 2, '0'); break;
    case 'g': case 'G': case 'V':
        iso(t, &iy, &iw);
        number(w, c == 'V' ? iw : c == 'G' ? iy : iy - __avm_time_floor(iy, 100) * 100,
               c == 'G' ? 4 : 2, '0'); break;
    case 'H': number(w, t->tm_hour, 2, '0'); break;
    case 'I': number(w, t->tm_hour % 12 ? t->tm_hour % 12 : 12, 2, '0'); break;
    case 'j': number(w, (int32_t)t->tm_yday + 1, 3, '0'); break;
    case 'm': number(w, (int32_t)t->tm_mon + 1, 2, '0'); break;
    case 'M': number(w, t->tm_min, 2, '0'); break;
    case 'n': emit(w, '\n'); break;
    case 'p': ampm(w, t); break;
    case 'r': hms(w, t, 1); emit(w, ' '); ampm(w, t); break;
    case 'R': number(w, t->tm_hour, 2, '0'); emit(w, ':'); number(w, t->tm_min, 2, '0'); break;
    case 'S': number(w, t->tm_sec, 2, '0'); break;
    case 't': emit(w, '\t'); break;
    case 'T': case 'X': hms(w, t, 0); break;
    case 'u': number(w, t->tm_wday ? t->tm_wday : 7, 1, '0'); break;
    case 'U': number(w, ((int32_t)t->tm_yday + 7 - t->tm_wday) / 7, 2, '0'); break;
    case 'W': number(w, ((int32_t)t->tm_yday + 7 - (t->tm_wday + 6) % 7) / 7, 2, '0'); break;
    case 'w': number(w, t->tm_wday, 1, '0'); break;
    case 'y': number(w, y - __avm_time_floor(y, 100) * 100, 2, '0'); break;
    case 'Y': number(w, y, 4, '0'); break;
    case 'z': if(t->tm_isdst >= 0) { emit(w, '+'); for(int i=0;i<4;++i) emit(w, '0'); } break;
    case 'Z': emit(w, 'U'); emit(w, 'T'); emit(w, 'C'); break;
    case '%': emit(w, '%'); break;
    }
}
size_t strftime(char *restrict s, size_t maxsize, const char *restrict format,
                const struct tm *restrict timeptr)
{
    struct writer w = {s, maxsize, 0, 0};
    while(*format && !w.failed) {
        char c = *format++;
        if(c != '%') emit(&w, c);
        else {
            c = *format++;
            if(c == 'E' || c == 'O') c = *format++;
            if(!c) break;
            conversion(&w, c, timeptr);
        }
    }
    if(w.failed || !maxsize) return 0;
    s[w.n] = 0;
    return w.n;
}
