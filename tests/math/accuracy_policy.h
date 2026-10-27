#ifndef AVM_MATH_ACCURACY_POLICY_H
#define AVM_MATH_ACCURACY_POLICY_H

/* Shared by the native exhaustive tests, high precision probe, and AVM
 * fixtures. Exceptional values and exact identities are checked separately. */
enum avm_accuracy { AVM_EXACT, AVM_SQRT, AVM_HYPOT, AVM_SIN, AVM_COS,
    AVM_TAN, AVM_ATAN, AVM_ATAN2, AVM_EXP, AVM_LOG, AVM_POW,
    AVM_EXPM1, AVM_CBRT };

static double avm_abs(double x) { return x < 0 ? -x : x; }

static int avm_accuracy_accept(enum avm_accuracy policy, double actual,
                               double reference, unsigned long ulps)
{
    double absolute = 0, relative = 0;
    switch (policy) {
    case AVM_EXACT: return ulps == 0;
    case AVM_SQRT: return ulps <= 2;
    case AVM_HYPOT: return ulps <= 4;
    case AVM_SIN: case AVM_COS: absolute = 1e-5; break;
    /* Includes pole neighbors for the single-float reducer. Signs and all
       exceptional/zero cases are checked exactly by the calling harness. */
    case AVM_TAN: absolute = relative = 1e-4; break;
    case AVM_ATAN: case AVM_ATAN2: absolute = 1e-6; break;
    case AVM_LOG: absolute = relative = 1e-6; break;
    case AVM_EXP: relative = 1e-5; break;
    case AVM_POW: relative = 5e-5; break;
    /* exp2 shares EXP; inverse trig shares ATAN. expm1's general exp path
       amplifies its relative budget near the 1/2 crossover. Cube root's fit
       and reconstruction round to binary32, comparable to avr-libc's ~1.2e-7. */
    case AVM_EXPM1: relative = 3e-5; break;
    case AVM_CBRT: relative = 3e-7; break;
    }
    /* Gradual underflow: use the relative budget at the normal boundary,
       plus one binary32 subnormal quantum for final rounding. */
    if ((policy == AVM_EXP || policy == AVM_POW) && avm_abs(reference) < 0x1p-126)
        absolute = relative * 0x1p-126 + 0x1p-149;
    return avm_abs(actual-reference) <= absolute + relative*avm_abs(reference);
}
#endif
