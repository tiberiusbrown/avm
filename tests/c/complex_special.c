#include <complex.h>
#include <math.h>
#include <stdint.h>
#include <avm/pgmspace.h>
#include "test_hex_output.h"
#define CX(X,Y) __builtin_complex((float)(X),(float)(Y))
#define CHECK(E) do { if(!(E)) { test_line16("line",__LINE__);return 1; } } while(0)
static uint32_t bits(float x) { union {float f;uint32_t u;} v={x};return v.u; }
__extension__ static __attribute__((noinline)) int basics(void) {
 float complex z;union {uint32_t u;float f;} n={0x7fc12345UL};
 z=CX(-0.0f,n.f);CHECK(bits(crealf(z))==0x80000000UL);CHECK(bits(cimagf(conjf(z)))==0xffc12345UL);
 z=cprojf(CX(n.f,-INFINITY));CHECK(isinf(__real__ z)&&!signbit(__real__ z)&&bits(__imag__ z)==0x80000000UL);
 z=cprojf(CX(n.f,-0.0f));CHECK(bits(__real__ z)==0x7fc12345UL&&bits(__imag__ z)==0x80000000UL);
 CHECK(cargf(CX(-1,0))>3.14f&&cargf(CX(-1,-0.0f))< -3.14f);
 CHECK(bits(cabsf(CX(-0.0f,-0.0f)))==0);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_0(void) {
 float complex z;z=csqrtf(CX(-4,-0.0f));CHECK(bits(__real__ z)==0&&__imag__ z== -2);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_1(void) {
 float complex z;z=csqrtf(CX(-4,0));CHECK(bits(__real__ z)==0&&__imag__ z==2);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_2(void) {
 float complex z;z=csqrtf(CX(0x1.fffffep127f,0x1.fffffep127f));CHECK(isfinite(__real__ z)&&isfinite(__imag__ z));
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_3(void) {
 float complex z;z=csqrtf(CX(0x1p-149f,0x1p-149f));CHECK(__real__ z>0&&__imag__ z>0);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_4(void) {
 float complex z;z=clogf(CX(-1,-0.0f));CHECK(__real__ z==0&&__imag__ z< -3.14f);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_5(void) {
 float complex z;z=clogf(CX(0x1.fffffep127f,0x1.fffffep127f));CHECK(isfinite(__real__ z));
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_6(void) {
 float complex z;z=cexpf(CX(-INFINITY,-0.0f));CHECK(bits(__real__ z)==0&&bits(__imag__ z)==0x80000000UL);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots_7(void) {
 float complex z;z=cexpf(CX(INFINITY,-0.0f));CHECK(isinf(__real__ z)&&bits(__imag__ z)==0x80000000UL);
 return 0;
}
__extension__ static __attribute__((noinline)) int scaled_exp(void) {
 float complex z=cexpf(CX(192,0x1p-149f));
 CHECK(isinf(__real__ z)&&isfinite(__imag__ z)&&__imag__ z>3.0e38f);
 return 0;
}
__extension__ static __attribute__((noinline)) int roots(void) { return roots_0()||roots_1()||roots_2()||roots_3()||roots_4()||roots_5()||roots_6()||roots_7(); }
__extension__ static __attribute__((noinline)) int cuts_0(void) {
 float complex z;z=casinf(CX(2,-0.0f));CHECK(__real__ z>1.57f&&__imag__ z<0);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_1(void) {
 float complex z;z=cacosf(CX(2,-0.0f));CHECK(bits(__real__ z)==0&&__imag__ z>0);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_2(void) {
 float complex z;z=cacoshf(CX(-2,-0.0f));CHECK(__real__ z>0&&__imag__ z< -3.14f);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_3(void) {
 float complex z;z=casinhf(CX(-0.0f,2));CHECK(signbit(__real__ z)&&__imag__ z>1.57f);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_4(void) {
 float complex z;z=catanhf(CX(1,-0.0f));CHECK(isinf(__real__ z)&&bits(__imag__ z)==0x80000000UL);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_5(void) {
 float complex z;z=catanhf(CX(-2,-0.0f));CHECK(__real__ z<0&&__imag__ z< -1.57f);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_6(void) {
 float complex z;z=catanf(CX(-0.0f,2));CHECK(__real__ z< -1.57f&&__imag__ z>0);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_7(void) {
 float complex z;z=cacosf(CX(0x1.fffffep-1f,0));CHECK(__real__ z>0.0003f&&__real__ z<0.0004f);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_8(void) {
 float complex z;z=cacoshf(CX(0x1.000002p0f,0));CHECK(__real__ z>0.0004f&&__real__ z<0.0005f);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_9(void) {
 float complex z;z=casinhf(CX(0x1.fffffep127f,0x1.fffffep127f));CHECK(isfinite(__real__ z)&&isfinite(__imag__ z));
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_10(void) {
 float complex z;z=ctanhf(CX(INFINITY,1));CHECK(__real__ z==1&&__imag__ z==0);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts_11(void) {
 float complex z;z=ctanf(CX(1,INFINITY));CHECK(__real__ z==0&&__imag__ z==1);
 return 0;
}
__extension__ static __attribute__((noinline)) int cuts(void) { return cuts_0()||cuts_1()||cuts_2()||cuts_3()||cuts_4()||cuts_5()||cuts_6()||cuts_7()||cuts_8()||cuts_9()||cuts_10()||cuts_11(); }
__extension__ static __attribute__((noinline)) int arithmetic_0(void) { volatile float h=0x1.fffffep127f;float complex a=CX(h,h),b=CX(h,-h),z=a/b;CHECK(__real__ z==0&&__imag__ z==1); return 0; }
__extension__ static __attribute__((noinline)) int arithmetic_1(void) { volatile float t=0x1p-149f;float complex a=CX(t,t),b=CX(t,-t),z=a/b;CHECK(__real__ z==0&&__imag__ z==1); return 0; }
__extension__ static __attribute__((noinline)) int arithmetic_2(void) { volatile float h=INFINITY;float complex a=CX(1,2),b=CX(h,h),z=a/b;CHECK(__real__ z==0&&__imag__ z==0); return 0; }
__extension__ static __attribute__((noinline)) int arithmetic_3(void) { volatile float h=INFINITY;float complex a=CX(h,h),b=CX(1,0),z=a*b;CHECK(isinf(__real__ z)&&isinf(__imag__ z)); return 0; }
__extension__ static __attribute__((noinline)) int arithmetic_4(void) { float complex z=cpowf(CX(0,-0.0f),CX(0,0));CHECK(__real__ z==1&&__imag__ z==0); return 0; }
__extension__ static __attribute__((noinline)) int arithmetic_5(void) { float complex z=cpowf(CX(1,0),CX(NAN,NAN));CHECK(__real__ z==1&&__imag__ z==0); return 0; }
__extension__ static __attribute__((noinline)) int arithmetic_6(void) { float complex z=cpowf(CX(-0.0f,-0.0f),CX(0.5f,0));CHECK(__real__ z==0&&bits(__imag__ z)==0x80000000UL); return 0; }
static int arithmetic(void) {return arithmetic_0()||arithmetic_1()||arithmetic_2()||arithmetic_3()||arithmetic_4()||arithmetic_5()||arithmetic_6();}
struct cx_golden { uint8_t function;uint32_t x,y,re,im; };
#include "complex_golden.h"
static float unbits(uint32_t u) { union {uint32_t u;float f;} v={u};return v.f; }
static int close_value(float a,uint32_t expected) {
 float b=unbits(expected);
 if(isnan(b)) return isnan(a);
 if(b==0 || isinf(b)) return a==b && !!signbit(a)==!!signbit(b);
 return isfinite(a)&&fabsf(a-b)<=1.0e-6f+1.0e-5f*fabsf(b);
}
__extension__ static float complex wrap_cabs(float complex z) {return CX(cabsf(z),0);}
__extension__ static float complex wrap_carg(float complex z) {return CX(cargf(z),0);}
__extension__ static float complex wrap_cimag(float complex z) {return CX(cimagf(z),0);}
__extension__ static float complex wrap_creal(float complex z) {return CX(crealf(z),0);}
__extension__ static volatile float complex power=__builtin_complex(0.7f,-0.2f);
__extension__ typedef float complex (*complex_fn)(float complex);
static complex_fn const AVM_PROGMEM functions[]={
cacosf,casinf,catanf,ccosf,csinf,ctanf,cacoshf,casinhf,catanhf,ccoshf,csinhf,ctanhf,cexpf,clogf,wrap_cabs,0,csqrtf,wrap_carg,wrap_cimag,wrap_creal,conjf,cprojf};

__extension__ static __attribute__((noinline)) int golden_grid(void) {
 for(uint16_t j=0;j<sizeof(golden)/sizeof(golden[0]);++j) {
  if(golden[j].function==15)continue;
  float complex z=functions[golden[j].function](CX(unbits(golden[j].x),unbits(golden[j].y)));
  if(!close_value(__real__ z,golden[j].re)||!close_value(__imag__ z,golden[j].im)) {
   test_line16("golden",j);test_line32("real",bits(__real__ z));test_line32("imag",bits(__imag__ z));return 1;
  }
 }
 return 0;
}

__extension__ static volatile float complex power_result;
__extension__ static __attribute__((noinline)) int golden_power(void) {
 for(uint16_t j=0;j<sizeof(golden)/sizeof(golden[0]);++j) {
  if(golden[j].function!=15)continue;
  power_result=cpowf(CX(unbits(golden[j].x),unbits(golden[j].y)),power);
  if(!close_value(__real__ power_result,golden[j].re)||!close_value(__imag__ power_result,golden[j].im)) {
   test_line16("power",j);return 1;
  }
 }
 return 0;
}
__extension__ int avm_test_main(void) {
 if(basics()||scaled_exp()||roots()||cuts()||arithmetic())return 1;
 return golden_grid()||golden_power();
}
