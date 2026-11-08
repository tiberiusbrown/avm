#include <stdlib.h>
#include <stdint.h>
extern const unsigned char __avm_heap_start;
static volatile unsigned char storage[1000] = {7};
int avm_test_main(void) {
    volatile uintptr_t start=(uintptr_t)&__avm_heap_start;
    size_t available=0x500-start;
    unsigned char *p;
    storage[999]=19;
    if(start<(uintptr_t)storage+sizeof storage || available<3) return 1;
    if(malloc(available-1)) return 2;
    p=(unsigned char *)malloc(available-2);
    if(!p || (uintptr_t)p!=start+2 || (uintptr_t)p+available-2!=0x500) return 3;
    p[0]=31; p[available-3]=47;
    if(malloc(1) || calloc(1,1) || realloc(p,available-1)) return 4;
    if(p[0]!=31 || p[available-3]!=47) return 5;
    free(p);
    p=(unsigned char *)malloc(available-2);
    if(!p || (uintptr_t)p!=start+2) return 6;
    free(p);
    return storage[0]!=7 || storage[999]!=19;
}
