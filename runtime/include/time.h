#ifndef _AVM_RUNTIME_TIME_H
#define _AVM_RUNTIME_TIME_H

#include <stdint.h>

typedef uint32_t clock_t;

#define CLOCKS_PER_SEC ((clock_t)1000u)

#ifdef __cplusplus
extern "C" {
#endif

clock_t clock(void);

#ifdef __cplusplus
}
#endif

#endif // _AVM_RUNTIME_TIME_H
