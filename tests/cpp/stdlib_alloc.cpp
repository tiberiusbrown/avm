#include <stdlib.h>
#include <stdint.h>
#include <new>
struct item { unsigned char a; unsigned short b; };
extern "C" int avm_test_main() {
    void *(*volatile m)(size_t)=malloc;
    void *(*volatile c)(size_t,size_t)=calloc;
    void *(*volatile r)(void *,size_t)=realloc;
    void (*volatile f)(void *)=free;
    static_assert(alignof(item)==1,"AVM byte alignment");
    void *storage=m(sizeof(item));
    if(!storage) return 1;
    item *p=::new(storage) item{17,0x4321};
    if(p->a!=17 || p->b!=0x4321) return 2;
    p->~item();
    unsigned char *q=static_cast<unsigned char *>(r(storage,20));
    if(!q || q[0]!=17 || q[1]!=0x21 || q[2]!=0x43) return 3;
    f(q);
    q=static_cast<unsigned char *>(c(3,5));
    if(!q) return 4;
    for(unsigned i=0;i<15;++i) if(q[i]) return 5;
    f(q); f(nullptr);
    return 0;
}
