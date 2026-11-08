#include <complex.h>
#include <avm.h>
static volatile float input_real=0.3f,input_imag=0.4f;
static volatile COMPLEX_RESULT result;
#ifdef COMPLEX_CALLER_O0
__attribute__((optnone,noinline))
#endif
int avm_test_main(void) {
    float complex z=__builtin_complex((float)input_real,(float)input_imag);
    __avm_debug_break();
    result=COMPLEX_OPERATION;
    __avm_debug_break();
    return 0;
}
