#ifndef AVM_MATH_ACCURACY_POLICY_H
#define AVM_MATH_ACCURACY_POLICY_H

/* Shared by the native exhaustive tests, high precision probe, and AVM
 * fixtures. Exceptional values and exact identities are checked separately. */
enum avm_accuracy { AVM_EXACT, AVM_SQRT, AVM_HYPOT, AVM_SIN, AVM_COS,
    AVM_TAN, AVM_ATAN, AVM_ATAN2, AVM_EXP, AVM_LOG, AVM_POW };

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
    case AVM_TAN: absolute = relative = 1e-4; break;
    case AVM_ATAN: case AVM_ATAN2: absolute = 1e-6; break;
    case AVM_LOG: absolute = relative = 1e-6; break;
    case AVM_EXP: relative = 1e-5; break;
    case AVM_POW: relative = 5e-5; break;
    }
    /* Gradual underflow: use the relative budget at the normal boundary,
       plus one binary32 subnormal quantum for final rounding. */
    if ((policy == AVM_EXP || policy == AVM_POW) && avm_abs(reference) < 0x1p-126)
        absolute = relative * 0x1p-126 + 0x1p-149;
    return avm_abs(actual-reference) <= absolute + relative*avm_abs(reference);
}
#endif
