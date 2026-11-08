#include <stdlib.h>
#include <stdint.h>
#include <string.h>

extern const unsigned char __avm_heap_start;
static volatile unsigned char pattern[7] = {11,22,33,44,55,66,77};
static volatile unsigned char saved[3] __attribute__((section(".saved"))) = {81,82,83};
static void *(*volatile alloc_call)(size_t) = malloc;
static void *(*volatile zero_call)(size_t,size_t) = calloc;
static void *(*volatile resize_call)(void *,size_t) = realloc;
static void (*volatile release_call)(void *) = free;
#define CHECK(x) do { if (!(x)) return __LINE__; } while (0)
static unsigned header(void *p) {
    unsigned char *b = (unsigned char *)((uintptr_t)p - 2);
    return b[0] | ((unsigned)b[1] << 8);
}
static int bytes(const void *p, unsigned n, unsigned char value) {
    const unsigned char *b = (const unsigned char *)p;
    unsigned i;
    for(i=0;i<n;++i) if(b[i]!=value) return 0;
    return 1;
}
int avm_test_main(void) {
    unsigned char *p[5], *a, *b, *c, *d, *e;
    const unsigned sizes[5] = {1,2,3,20,100};
    unsigned i, j;
    volatile uintptr_t start = (uintptr_t)&__avm_heap_start;
    CHECK(start >= (uintptr_t)pattern + sizeof pattern);
    CHECK(start >= (uintptr_t)saved + sizeof saved);
    release_call(NULL);
    CHECK(!alloc_call(0) && !alloc_call(1023) && !alloc_call(SIZE_MAX));
    for(i=0;i<5;++i) {
        p[i]=(unsigned char *)alloc_call(sizes[i]);
        CHECK(p[i] && (uintptr_t)p[i]>=start+2 && (uintptr_t)p[i]+sizes[i]<=0x500);
        CHECK(header(p[i])==(0x8000u| (sizes[i]+2)));
        if(i) CHECK((uintptr_t)p[i] == (uintptr_t)p[i-1]+sizes[i-1]+2);
        memset(p[i], 30+i, sizes[i]);
    }
    for(i=0;i<5;++i) CHECK(bytes(p[i],sizes[i],30+i));
    free(NULL);
    for(i=0;i<5;++i) free(p[i]);
    for(j=0;j<3;++j) {
        a=(unsigned char *)malloc(20); b=(unsigned char *)malloc(20);
        c=(unsigned char *)malloc(20); d=(unsigned char *)malloc(20);
        CHECK((uintptr_t)a==start+2 && a && b && c && d);
        free(a); free(c); free(b);
        CHECK(header(a)==66);
        e=(unsigned char *)malloc(61+j);
        CHECK(e==a && header(e)==(j==0 ? 0x803fu : 0x8042u));
        free(e); free(d);
    }
    /* First fit must prefer the earlier suitable hole over a later exact fit. */
    a=(unsigned char *)malloc(30); b=(unsigned char *)malloc(7);
    c=(unsigned char *)malloc(20); d=(unsigned char *)malloc(9);
    free(a); free(c);
    e=(unsigned char *)malloc(20); CHECK(e==a);
    free(e); free(b); free(d);
    /* Two-sided coalescing, first fit, and an exact three-byte split. */
    a=(unsigned char *)malloc(20); b=(unsigned char *)malloc(20);
    c=(unsigned char *)malloc(20); d=(unsigned char *)malloc(20);
    free(a); free(c);
    e=(unsigned char *)malloc(17); CHECK(e==a && header(e)==0x8013);
    CHECK(header((void *)((uintptr_t)e+19))==3); free(e); free(b);
    CHECK(header(a)==66); free(d);
    a=(unsigned char *)resize_call(NULL,20); CHECK(a);
    memset(a,0x65,20);
    CHECK(resize_call(a,20)==a && bytes(a,20,0x65));
    CHECK(resize_call(a,19)==a && header(a)==0x8016);
    CHECK(resize_call(a,18)==a && header(a)==0x8016);
    CHECK(resize_call(a,10)==a && header(a)==0x800c && bytes(a,10,0x65));
    b=(unsigned char *)malloc(8); CHECK((uintptr_t)b==(uintptr_t)a+12);
    free(b);
    CHECK(resize_call(a,30)==a && bytes(a,10,0x65));
    CHECK(!resize_call(a,SIZE_MAX) && bytes(a,10,0x65));
    CHECK(!resize_call(a,1022) && bytes(a,10,0x65));
    CHECK(!resize_call(a,0)); CHECK(!resize_call(NULL,0));
    /* Interior shrink merges its remainder with an existing free successor. */
    a=(unsigned char *)malloc(20); b=(unsigned char *)malloc(20);
    c=(unsigned char *)malloc(20); memset(a,0x36,20); free(b);
    CHECK(realloc(a,10)==a && bytes(a,10,0x36));
    CHECK(header((void *)((uintptr_t)a+12))==32);
    free(a); free(c);
    for(j=0;j<4;++j) {
        a=(unsigned char *)malloc(10); b=(unsigned char *)malloc(10);
        c=(unsigned char *)malloc(10); memset(a,0x71,10); free(b);
        CHECK(resize_call(a,19+j)==a && bytes(a,10,0x71));
        CHECK(header(a)==(j==0 ? 0x8015 : 0x8018));
        free(a); free(c);
    }
    a=(unsigned char *)malloc(10); b=(unsigned char *)malloc(10);
    memset(a,0x49,10); memset(b,0x27,10);
    c=(unsigned char *)resize_call(a,40);
    CHECK(c && c!=a && bytes(c,10,0x49) && bytes(b,10,0x27));
    d=(unsigned char *)malloc(10); CHECK(d==a); free(d); free(b); free(c);
    a=(unsigned char *)malloc(30); b=(unsigned char *)malloc(10);
    memset(a,0xff,30); memset(b,0x2c,10); free(a);
    c=(unsigned char *)zero_call(3,7); CHECK(c==a && bytes(c,21,0));
    CHECK(bytes(b,10,0x2c)); free(c); free(b);
    a=(unsigned char *)zero_call(1,13); CHECK(a && bytes(a,13,0)); free(a);
    CHECK(!zero_call(0,7) && !zero_call(7,0));
    CHECK(!zero_call(SIZE_MAX,2) && !zero_call(256,256));
    a=(unsigned char *)malloc(10);
    b=(unsigned char *)malloc(0x500-start-14);
    CHECK(a && b); memset(a,0x35,10); memset(b,0x46,0x500-start-14);
    CHECK(!resize_call(a,20) && bytes(a,10,0x35));
    CHECK(bytes(b,0x500-start-14,0x46)); free(b); free(a);
    a=(unsigned char *)alloc_call(0x500-start-2); CHECK(a);
    memset(a,0x5a,0x500-start-2);
    CHECK(!alloc_call(1) && !zero_call(1,1));
    CHECK(!resize_call(a,0x500-start-1));
    CHECK(bytes(a,0x500-start-2,0x5a)); free(a);
    a=(unsigned char *)malloc(0x500-start-2); CHECK(a && (uintptr_t)a==start+2); free(a);
    for(i=0;i<7;++i) CHECK(pattern[i]==11*(i+1));
    CHECK(saved[0]==81 && saved[1]==82 && saved[2]==83);
    return 0;
}
