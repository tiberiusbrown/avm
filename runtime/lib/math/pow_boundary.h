#ifndef AVM_POW_BOUNDARY_H
#define AVM_POW_BOUNDARY_H

/* Used only when the approximate exponent is within 1/128 of overflow or
   zero-underflow. Binary32 rounding of y*log2(x) cannot distinguish the two
   sides of these boundaries. Two-component products retain that information
   without double precision, a second pow implementation, or fdlibm's general
   compensated log/exp machinery. All intermediate magnitudes are bounded. */
typedef struct { float hi,lo; } avm_pow_pair;

static __attribute__((always_inline)) inline avm_pow_pair avm_pow_add(avm_pow_pair a, avm_pow_pair b)
{
    float s=a.hi+b.hi;
    float v=s-a.hi;
    float e=(a.hi-(s-v))+(b.hi-v)+a.lo+b.lo;
    avm_pow_pair r={s+e,e-((s+e)-s)};
    return r;
}

static __attribute__((always_inline)) inline avm_pow_pair avm_pow_mul(avm_pow_pair a, avm_pow_pair b)
{
    uint32_t ia,ib;
    GET_FLOAT_WORD(ia,a.hi);
    GET_FLOAT_WORD(ib,b.hi);
    float ah,bh;
    SET_FLOAT_WORD(ah,ia&0xfffff000UL);
    SET_FLOAT_WORD(bh,ib&0xfffff000UL);
    float al=a.hi-ah, bl=b.hi-bh;
    float p=a.hi*b.hi;
    float e=((ah*bh-p)+ah*bl+al*bh)+al*bl;
    e+=a.hi*b.lo+a.lo*b.hi;
    avm_pow_pair r={p+e,e-((p+e)-p)};
    return r;
}

static __attribute__((noinline)) avm_pow_pair avm_pow_boundary(float a, uint32_t ix, float y)
{
    if (ix>=0x00800000UL && !(ix&0x007fffffUL)) {
        /* Exact integer logarithm: refining its product is sufficient. */
        avm_pow_pair yy={y,0}, ee={(float)((int)(ix>>23)-127),0};
        return avm_pow_mul(yy,ee);
    }
    int exponent;
    float m=avm_log_normalize(a,ix,&exponent);
    float f=m-1.0f;
    avm_pow_pair one={1.0f,0}, mm={m,0};
    avm_pow_pair d=avm_pow_add(mm,one);
    avm_pow_pair t={f/d.hi,0};
    avm_pow_pair td=avm_pow_mul(t,d);
    t.lo=((f-td.hi)-td.lo)/d.hi;
    avm_pow_pair z=avm_pow_mul(t,t);
    /* atanh(t)=t+t^3*(1/3+z*(1/5+z*(1/7+...+z^5/17))).
       |t|<=0.171573; the omitted t^19/19 is below 4e-16.
       Only the leading two series terms need two-component evaluation. */
    float p=AVM_FPOLY6(z.hi,1.0f/17.0f,1.0f/15.0f,1.0f/13.0f,
                       1.0f/11.0f,1.0f/9.0f,1.0f/7.0f);
    avm_pow_pair c5={0x1.99999ap-3f,-0x1.99999ap-29f};
    avm_pow_pair tail={z.hi*p,0};
    avm_pow_pair q=avm_pow_add(c5,tail);
    avm_pow_pair c3={0x1.555556p-2f,-0x1.555556p-27f};
    q=avm_pow_add(c3,avm_pow_mul(z,q));
    q=avm_pow_add(t,avm_pow_mul(avm_pow_mul(t,z),q));
    avm_pow_pair scale={0x1.715476p1f,0x1.4ae0cp-25f};
    avm_pow_pair e={(float)exponent,0}, yy={y,0};
    return avm_pow_mul(avm_pow_add(e,avm_pow_mul(q,scale)),yy);
}
#endif
