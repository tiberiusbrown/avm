#ifndef AVM_TIME_INTERNAL_H
#define AVM_TIME_INTERNAL_H
#include <time.h>
#include <avm/pgmspace.h>
int32_t __avm_time_floor(int32_t n, int32_t d);
int32_t __avm_time_days(int32_t y, int32_t m, int32_t d);
void __avm_time_civil(int32_t z, int32_t *y, int32_t *m, int32_t *d);
int __avm_time_split(time_t t, struct tm *out);
extern const char AVM_PROGMEM __avm_time_weekdays[7][10];
extern const char AVM_PROGMEM __avm_time_months[12][10];
#endif
