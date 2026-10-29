#include <stdint.h>
#include <stdio.h>
#include <string.h>
float avm_reference_erff(float);
float avm_reference_erfcf(float);
float avm_reference_sinhf(float);
float avm_reference_coshf(float);
float avm_reference_tanhf(float);
float avm_reference_asinhf(float);
float avm_reference_acoshf(float);
float avm_reference_atanhf(float);
float avm_reference_exp2f(float);
float avm_reference_expm1f(float);
float avm_reference_log1pf(float);
float avm_reference_cbrtf(float);
float avm_reference_asinf(float);
float avm_reference_acosf(float);

float avm_reference_sqrtf(float);
float avm_reference_expf(float);
float avm_reference_logf(float);
float avm_reference_log2f(float);
float avm_reference_log10f(float);
float avm_reference_hypotf(float, float);
float avm_reference_powf(float, float);
float avm_reference_sinf(float);
float avm_reference_cosf(float);
float avm_reference_tanf(float);
float avm_reference_atanf(float);
float avm_reference_atan2f(float, float);
float avm_reference_fmodf(float, float);
void avm_reference_sincosf(float, float *, float *);

/* A persistent, line-oriented bridge to the SAME production objects used by
   shortcuts_reference.c. No host libm is used to compute these results. */
int main(void)
{
    char name[24]; unsigned long a, b;
    while (scanf("%23s %lx %lx", name, &a, &b) == 3) {
        union { uint32_t u; float f; } x = {(uint32_t)a}, y = {(uint32_t)b}, z;
        if (!strcmp(name, "erff")) z.f = avm_reference_erff(x.f);
        else if (!strcmp(name, "erfcf")) z.f = avm_reference_erfcf(x.f);
        else if (!strcmp(name, "sinhf")) z.f = avm_reference_sinhf(x.f);
        else if (!strcmp(name, "coshf")) z.f = avm_reference_coshf(x.f);
        else if (!strcmp(name, "tanhf")) z.f = avm_reference_tanhf(x.f);
        else if (!strcmp(name, "asinhf")) z.f = avm_reference_asinhf(x.f);
        else if (!strcmp(name, "acoshf")) z.f = avm_reference_acoshf(x.f);
        else if (!strcmp(name, "atanhf")) z.f = avm_reference_atanhf(x.f);
        else if (!strcmp(name, "exp2f")) z.f = avm_reference_exp2f(x.f);
        else if (!strcmp(name, "expm1f")) z.f = avm_reference_expm1f(x.f);
        else if (!strcmp(name, "log1pf")) z.f = avm_reference_log1pf(x.f);
        else if (!strcmp(name, "cbrtf")) z.f = avm_reference_cbrtf(x.f);
        else if (!strcmp(name, "asinf")) z.f = avm_reference_asinf(x.f);
        else if (!strcmp(name, "acosf")) z.f = avm_reference_acosf(x.f);
        else if (!strcmp(name, "sqrtf")) z.f = avm_reference_sqrtf(x.f);
        else if (!strcmp(name, "expf")) z.f = avm_reference_expf(x.f);
        else if (!strcmp(name, "logf")) z.f = avm_reference_logf(x.f);
        else if (!strcmp(name, "log2f")) z.f = avm_reference_log2f(x.f);
        else if (!strcmp(name, "log10f")) z.f = avm_reference_log10f(x.f);
        else if (!strcmp(name, "hypotf")) z.f = avm_reference_hypotf(x.f, y.f);
        else if (!strcmp(name, "powf")) z.f = avm_reference_powf(x.f, y.f);
        else if (!strcmp(name, "sinf")) z.f = avm_reference_sinf(x.f);
        else if (!strcmp(name, "cosf")) z.f = avm_reference_cosf(x.f);
        else if (!strcmp(name, "sincos_sinf") || !strcmp(name, "sincos_cosf")) {
            float s,c;
            avm_reference_sincosf(x.f,&s,&c);
            z.f = !strcmp(name,"sincos_sinf") ? s : c;
        }
        else if (!strcmp(name, "tanf")) z.f = avm_reference_tanf(x.f);
        else if (!strcmp(name, "atanf")) z.f = avm_reference_atanf(x.f);
        else if (!strcmp(name, "atan2f")) z.f = avm_reference_atan2f(x.f, y.f);
        else if (!strcmp(name, "fmodf")) z.f = avm_reference_fmodf(x.f, y.f);
        else return 2;
        printf("%08lx\n", (unsigned long)z.u);
    }
    return ferror(stdin) || ferror(stdout);
}
