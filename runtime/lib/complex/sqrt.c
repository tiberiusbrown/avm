#include "complex_internal.h"
float complex csqrtf(float complex z) {
    float x=__real__ z,y=__imag__ z,a=fabsf(x),b=fabsf(y),u,v,scale=1;
    if(isinf(y)) return CX(INFINITY,y);
    if(isinf(x)) {
        if(x>0) return CX(x,isnan(y)?y:copysignf(0,y));
        return CX(isnan(y)?y:0,copysignf(INFINITY,y));
    }
    if(isnan(x)||isnan(y)) return CX(NAN,NAN);
    if(y==0) {
        if(x<0) return CX(0,copysignf(sqrtf(-x),y));
        return CX(sqrtf(a),y);
    }
    if(a>1.0e37f || b>1.0e37f) { x*=0.25f;y*=0.25f;scale=2; }
    else if(a<1.0e-30f && b<1.0e-30f) { x*=0x1p24f;y*=0x1p24f;scale=0x1p-12f; }
    u=sqrtf(0.5f*hypotf(x,y)+0.5f*fabsf(x));
    v=0.5f*(fabsf(y)/u);
    return x>=0?CX(u*scale,copysignf(v*scale,y)):CX(v*scale,copysignf(u*scale,y));
}
