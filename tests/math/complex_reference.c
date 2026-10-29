/* Host C99 libm reference, independent of guest math. Compile with a C99
   compiler that implements complex (e.g. GCC); MSVC does not implement it.
   Finite sweeps allow 1e-5 relative + 1e-6 absolute error per component.
   Signed zero, infinity and NaN are checked separately. */
#include <complex.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#define CX(x,y) __builtin_complex((float)(x),(float)(y))
extern float complex avm_cacosf(float complex);
static float complex ref_cacos(float complex z) { return cacosf(z); }
static float complex run_cacos(float complex z) { return avm_cacosf(z); }
extern float complex avm_casinf(float complex);
static float complex ref_casin(float complex z) { return casinf(z); }
static float complex run_casin(float complex z) { return avm_casinf(z); }
extern float complex avm_catanf(float complex);
static float complex ref_catan(float complex z) { return catanf(z); }
static float complex run_catan(float complex z) { return avm_catanf(z); }
extern float complex avm_ccosf(float complex);
static float complex ref_ccos(float complex z) { return ccosf(z); }
static float complex run_ccos(float complex z) { return avm_ccosf(z); }
extern float complex avm_csinf(float complex);
static float complex ref_csin(float complex z) { return csinf(z); }
static float complex run_csin(float complex z) { return avm_csinf(z); }
extern float complex avm_ctanf(float complex);
static float complex ref_ctan(float complex z) { return ctanf(z); }
static float complex run_ctan(float complex z) { return avm_ctanf(z); }
extern float complex avm_cacoshf(float complex);
static float complex ref_cacosh(float complex z) { return cacoshf(z); }
static float complex run_cacosh(float complex z) { return avm_cacoshf(z); }
extern float complex avm_casinhf(float complex);
static float complex ref_casinh(float complex z) { return casinhf(z); }
static float complex run_casinh(float complex z) { return avm_casinhf(z); }
extern float complex avm_catanhf(float complex);
static float complex ref_catanh(float complex z) { return catanhf(z); }
static float complex run_catanh(float complex z) { return avm_catanhf(z); }
extern float complex avm_ccoshf(float complex);
static float complex ref_ccosh(float complex z) { return ccoshf(z); }
static float complex run_ccosh(float complex z) { return avm_ccoshf(z); }
extern float complex avm_csinhf(float complex);
static float complex ref_csinh(float complex z) { return csinhf(z); }
static float complex run_csinh(float complex z) { return avm_csinhf(z); }
extern float complex avm_ctanhf(float complex);
static float complex ref_ctanh(float complex z) { return ctanhf(z); }
static float complex run_ctanh(float complex z) { return avm_ctanhf(z); }
extern float complex avm_cexpf(float complex);
static float complex ref_cexp(float complex z) { return cexpf(z); }
static float complex run_cexp(float complex z) { return avm_cexpf(z); }
extern float complex avm_clogf(float complex);
static float complex ref_clog(float complex z) { return clogf(z); }
static float complex run_clog(float complex z) { return avm_clogf(z); }
extern float avm_cabsf(float complex);
static float complex ref_cabs(float complex z) { return CX(cabsf(z),0); }
static float complex run_cabs(float complex z) { return CX(avm_cabsf(z),0); }
extern float complex avm_cpowf(float complex,float complex);
static float complex ref_cpow(float complex z) { return cpowf(z,CX(0.7f,-0.2f)); }
static float complex run_cpow(float complex z) { return avm_cpowf(z,CX(0.7f,-0.2f)); }
extern float complex avm_csqrtf(float complex);
static float complex ref_csqrt(float complex z) { return csqrtf(z); }
static float complex run_csqrt(float complex z) { return avm_csqrtf(z); }
extern float avm_cargf(float complex);
static float complex ref_carg(float complex z) { return CX(cargf(z),0); }
static float complex run_carg(float complex z) { return CX(avm_cargf(z),0); }
extern float avm_cimagf(float complex);
static float complex ref_cimag(float complex z) { return CX(cimagf(z),0); }
static float complex run_cimag(float complex z) { return CX(avm_cimagf(z),0); }
extern float avm_crealf(float complex);
static float complex ref_creal(float complex z) { return CX(crealf(z),0); }
static float complex run_creal(float complex z) { return CX(avm_crealf(z),0); }
extern float complex avm_conjf(float complex);
static float complex ref_conj(float complex z) { return conjf(z); }
static float complex run_conj(float complex z) { return avm_conjf(z); }
extern float complex avm_cprojf(float complex);
static float complex ref_cproj(float complex z) { return cprojf(z); }
static float complex run_cproj(float complex z) { return avm_cprojf(z); }
typedef float complex (*fn)(float complex);
static fn ref[]={ref_cacos,ref_casin,ref_catan,ref_ccos,ref_csin,ref_ctan,ref_cacosh,ref_casinh,ref_catanh,ref_ccosh,ref_csinh,ref_ctanh,ref_cexp,ref_clog,ref_cabs,ref_cpow,ref_csqrt,ref_carg,ref_cimag,ref_creal,ref_conj,ref_cproj};
static fn run[]={run_cacos,run_casin,run_catan,run_ccos,run_csin,run_ctan,run_cacosh,run_casinh,run_catanh,run_ccosh,run_csinh,run_ctanh,run_cexp,run_clog,run_cabs,run_cpow,run_csqrt,run_carg,run_cimag,run_creal,run_conj,run_cproj};
static const char *names[]={"cacos","casin","catan","ccos","csin","ctan","cacosh","casinh","catanh","ccosh","csinh","ctanh","cexp","clog","cabs","cpow","csqrt","carg","cimag","creal","conj","cproj"};
static uint32_t seed=0x12345678;
static float random_value(void) { seed=1664525*seed+1013904223;return ((int32_t)(seed>>8)-8388608)*0x1p-20f; }
static int check(float a,float b,double *maxrel,double *maxabs) {
 if(isnan(b))return isnan(a);
 if(isinf(b)||b==0)return a==b&&!!signbit(a)==!!signbit(b);
 double d=fabs((double)a-b),r=d/fabs((double)b);
 if(d>*maxabs)*maxabs=d;
 if(fabs(b)>1e-3 && r>*maxrel)*maxrel=r;
 return isfinite(a)&&d<=1e-6+1e-5*fabs(b);
}
int main(int argc,char **argv) {
 int failed=0,total=0,generate=argc>1&&strcmp(argv[1],"--generate")==0;
 float grid[]={0.0f,-0.0f,0x1p-149f,-0x1p-149f,0x1p-126f,-0x1p-126f,1,-1,2,-2,3.1415927f,-3.1415927f,
 0x1.fffffep-1f,-0x1.fffffep-1f,0x1.000002p0f,-0x1.000002p0f,0x1.fffffep127f,-0x1.fffffep127f,INFINITY,-INFINITY,NAN};
 for(unsigned k=0;k<sizeof(ref)/sizeof(*ref);++k) {
  double mr=0,ma=0;int nf=0;
  for(int j=0;j<2100;++j) {
   float x,y;
   if(j<441){x=grid[j/21];y=grid[j%21];}
   else {x=random_value();y=random_value();}
   float complex z=CX(x,y),a=ref[k](z),b=run[k](z);
   if(generate && j<441) {
    union{float f;uint32_t u;} xx={x},yy={y},rr={crealf(a)},ii={cimagf(a)};
    printf("%u,%08x,%08x,%08x,%08x\n",k,xx.u,yy.u,rr.u,ii.u);continue;
   }
   int ok=check(crealf(b),crealf(a),&mr,&ma)&&check(cimagf(b),cimagf(a),&mr,&ma);
   if(!ok) {
    if(nf<4)printf("FAIL %s (%a,%a) got (%a,%a) expected (%a,%a)\n",names[k],x,y,crealf(b),cimagf(b),crealf(a),cimagf(a));
    ++nf;
   }
   ++total;
  }
  if(!generate)printf("%s failures=%d max_relative=%.9g max_absolute=%.9g\n",names[k],nf,mr,ma);
  failed+=nf;
 }
 if(!generate)printf("components checked in %d pairs; failures=%d\n",total,failed);
 return !generate&&failed!=0;
}
