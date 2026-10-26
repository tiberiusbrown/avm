#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "accuracy_policy.h"
#include "reference_profile.h"

float avm_reference_hypotf(float, float);
float avm_reference_atan2f(float, float);
float avm_reference_atanf(float);
float avm_reference_tanf(float);
float avm_reference_sinf(float);
float avm_reference_cosf(float);
float avm_reference_logf(float);
float avm_reference_log2f(float);
float avm_reference_log10f(float);
float avm_reference_powf(float, float);
float avm_reference_expf(float);
float avm_reference_fmodf(float, float);

enum { HYPOT, ATAN2, ATAN, TAN, LOG, LOG2, LOG10, POW, EXP, FMOD, SIN, COS, FUNCTIONS };
static const char *names[] = {
    "hypotf", "atan2f", "atanf", "tanf", "logf", "log2f", "log10f", "powf", "expf", "fmodf", "sinf", "cosf"
};
static uint64_t counts[FUNCTIONS];
static uint32_t maximum[FUNCTIONS];
static double tan_away_absolute, tan_away_fraction;
static uint32_t tan_pole_ulps;

static float value(uint32_t u)
{
    float x;
    memcpy(&x, &u, sizeof(x));
    return x;
}

static uint32_t bits(float x)
{
    uint32_t u;
    memcpy(&u, &x, sizeof(u));
    return u;
}

static double max_abs[FUNCTIONS], max_rel[FUNCTIONS];
static uint32_t worst_abs[FUNCTIONS][2], worst_rel[FUNCTIONS][2], worst_ulp[FUNCTIONS][2];
static uint64_t failures[FUNCTIONS], exceptional[FUNCTIONS], distribution[FUNCTIONS][5];
static const enum avm_accuracy policies[] = {
    AVM_HYPOT, AVM_ATAN2, AVM_ATAN, AVM_TAN, AVM_LOG, AVM_LOG, AVM_LOG,
    AVM_POW, AVM_EXP, AVM_EXACT, AVM_SIN, AVM_COS
};

static int check(int function, float x, float y, float actual, double reference)
{
    float expected = (float)reference;
    uint32_t a = bits(actual), b = bits(expected);
    uint32_t distance = a > b ? a-b : b-a;
    ++counts[function];
    if (isnan(expected) && isnan(actual)) return 0;
    int special = !isfinite(expected) || !isfinite(actual) ||
                  (expected == 0 && actual == 0 && a != b) ||
                  ((a^b)&0x80000000U);
    if (special) {
        if (a == b) return 0;
        ++exceptional[function];
    } else {
        /* Ordered distance across zero, for diagnostics only. */
        if ((a ^ b) & 0x80000000U) distance = (a & 0x7fffffffU) + (b & 0x7fffffffU);
        double error = fabs((double)actual-reference);
        double relative = fabs(reference) >= 0x1p-126 ? error/fabs(reference) : 0;
        if (error > max_abs[function]) {
            max_abs[function] = error; worst_abs[function][0] = bits(x); worst_abs[function][1] = bits(y);
        }
        if (relative > max_rel[function]) {
            max_rel[function] = relative; worst_rel[function][0] = bits(x); worst_rel[function][1] = bits(y);
        }
        if (distance > maximum[function]) {
            maximum[function] = distance; worst_ulp[function][0] = bits(x); worst_ulp[function][1] = bits(y);
        }
        ++distribution[function][distance == 0 ? 0 : distance == 1 ? 1 : distance <= 4 ? 2 : distance <= 16 ? 3 : 4];
        /* Single-float reduction uses the documented hybrid rule at poles;
           signs and classifications remain exact checks. */
        int accepted = avm_accuracy_accept(policies[function], actual, reference, distance);
        if (function==TAN) {
            if (fabs(reference)>=1e4) {
                if (distance>tan_pole_ulps) tan_pole_ulps=distance;
            } else {
                double fraction=error/(1e-4*(1+fabs(reference)));
                if (error>tan_away_absolute) tan_away_absolute=error;
                if (fraction>tan_away_fraction) tan_away_fraction=fraction;
            }
        }
        if (accepted) return 0;
    }
    ++failures[function];
    if (failures[function] <= 8)
        printf("FAIL %s(%08lx, %08lx): actual %08lx expected %08lx (%lu ULP)\n",
               names[function], (unsigned long)bits(x), (unsigned long)bits(y),
               (unsigned long)a, (unsigned long)b, (unsigned long)distance);
    return 0; /* Accumulate ALL failures and distributions, never stop at the first. */
}

static int logs(float x)
{
    return check(LOG, x, 0, avm_reference_logf(x), log((double)x)) ||
        check(LOG2, x, 0, avm_reference_log2f(x), log2((double)x)) ||
        check(LOG10, x, 0, avm_reference_log10f(x), log10((double)x));
}

static int unary(float x)
{
    return check(SIN, x, 0, avm_reference_sinf(x), sin((double)x)) ||
        check(COS, x, 0, avm_reference_cosf(x), cos((double)x)) ||
        logs(x) || check(ATAN, x, 0, avm_reference_atanf(x), atan((double)x)) ||
        check(TAN, x, 0, avm_reference_tanf(x), tan((double)x)) ||
        check(EXP, x, 0, avm_reference_expf(x), exp((double)x));
}

static int binary(float x, float y)
{
    uint32_t a = bits(x), b = bits(y);
    int signaling_x = (a & 0x7fffffffU) > 0x7f800000U && !(a & 0x00400000U);
    int signaling_y = (b & 0x7fffffffU) > 0x7f800000U && !(b & 0x00400000U);
    /* The runtime deliberately propagates signaling NaNs for these powers;
       conversion to host double quiets them before host pow sees the input. */
    double power = (signaling_x && !(b & 0x7fffffffU)) || (a == 0x3f800000U && signaling_y)
        ? value(0x7fc00000) : pow((double)x, (double)y);
    return check(HYPOT, x, y, avm_reference_hypotf(x, y), hypot((double)x, (double)y)) ||
        check(ATAN2, x, y, avm_reference_atan2f(x, y), atan2((double)x, (double)y)) ||
        check(POW, x, y, avm_reference_powf(x, y), power) ||
        check(FMOD, x, y, avm_reference_fmodf(x, y), fmod((double)x, (double)y));
}

static uint32_t random_word(uint32_t *state)
{
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

int main(int argc, char **argv)
{
    int quick=reference_quick(argc,argv);
    if (quick<0) return 2;
    static const uint32_t special[] = {
        0, 0x80000000, 1, 0x80000001, 0x007fffff, 0x807fffff, 0x00800000, 0x80800000,
        0x3f7fffff, 0x3f800000, 0x3f800001, 0xbf800000, 0x7f7fffff, 0xff7fffff,
        0x7f800000, 0xff800000, 0x7fc12345, 0xffc12345, 0x7fa12345, 0xffa12345
    };
    for (unsigned i = 0; i < sizeof(special) / sizeof(special[0]); ++i) {
        if (unary(value(special[i]))) return 1;
        for (unsigned j = 0; j < sizeof(special) / sizeof(special[0]); ++j)
            if (binary(value(special[i]), value(special[j]))) return 1;
    }

    /* Dense integer-power checks include nontrivial mantissas and both signs.
       Exponents outside the shortcut's bounds must use the full algorithm. */
    for (int n = -8; n <= 8; ++n) {
        if (n > -3 && n < 3) continue;
        for (uint32_t u = 0x3f000000; u <= 0x40000000; u += (quick ? 4093 : (n >= -5 && n <= 5 ? 1 : 17))) {
            float x = value(u | ((u & 1) << 31));
            if (check(POW, x, (float)n, avm_reference_powf(x, (float)n),
                      pow((double)x, (double)n))) return 1;
        }
        for (int e = -149; e <= 127; ++e) {
            float x = (float)ldexp(1.234567, e);
            if (check(POW, x, (float)n, avm_reference_powf(x, (float)n),
                      pow((double)x, (double)n))) return 1;
        }
    }

    /* Every mantissa in the bounded positive pow path, for signed fractional
       exponents including the largest allowed magnitude. */
    static const float bounded_exponents[] = {-1.25f, -0.75f, -0.25f, 0.25f, 0.75f, 1.25f};
    for (uint32_t u = 0x3f000000; u <= 0x40000000; u += quick ? 4093 : 1) {
        float x = value(u);
        for (unsigned j = 0; j < sizeof(bounded_exponents) / sizeof(bounded_exponents[0]); ++j) {
            float y = bounded_exponents[j];
            if (check(POW, x, y, avm_reference_powf(x, y), pow((double)x, (double)y))) return 1;
        }
    }
    uint32_t bounded_state = 0x1234abcd;
    for (unsigned i = 0; i < (quick ? 10000 : 1000000); ++i) {
        float x = value(0x3f000000U + random_word(&bounded_state) % 0x01000001U);
        float y = (float)(int32_t)random_word(&bounded_state) * 0x1.4p-31f;
        if (check(POW, x, y, avm_reference_powf(x, y), pow((double)x, (double)y))) return 1;
    }

    /* Large-exponent amplification, both sides of the normal/subnormal and
       infinity/zero boundaries, and the near-one specialization endpoints.
       The host double reference supplies the mathematical result, independent
       of every production polynomial and of the former pow implementation. */
    static const double power_boundaries[]={-150,-149,-126,126,127,128};
    for (uint32_t u=0x3f000000; u<=0x40000000; u+=quick ? 8191 : 127) {
        float x=value(u);
        if (x==1) continue;
        for (unsigned j=0;j<sizeof(power_boundaries)/sizeof(power_boundaries[0]);++j) {
            float center=(float)(power_boundaries[j]/log2((double)x));
            for (int d=-2;d<=2;++d) {
                float y=value(bits(center)+d);
                check(POW,x,y,avm_reference_powf(x,y),pow((double)x,(double)y));
            }
        }
    }

    /* Every reduced logarithm mantissa, including every near-one float. */
    for (uint32_t u = 0x3f3504e0; u <= 0x3fb504f3; u += quick ? 4093 : 1)
        if (logs(value(u))) return 1;
    for (int e = -149; e <= 127; ++e) {
        for (int delta = -3; delta <= 3; ++delta) {
            uint32_t u = bits((float)ldexp(1.0, e));
            if ((int64_t)u + delta > 0 && u + delta < 0x7f800000U && logs(value(u + delta))) return 1;
        }
        if (logs((float)ldexp(0.9375, e)) || logs((float)ldexp(1.0625, e))) return 1;
    }

    /* Dense exponential coverage of the entire scaling range, with both
       signs, plus a bit-pattern sweep to expose reduction rounding. */
    for (int i=-1040000; i<=888000; i+=quick ? 1021 : 1) {
        float x=(float)i*0.0001f;
        check(EXP,x,0,avm_reference_expf(x),exp((double)x));
    }
    for (uint32_t u=0x3e000000; u<=0x42b17218; u+=quick ? 8191 : 31) {
        float x=value(u);
        check(EXP,x,0,avm_reference_expf(x),exp((double)x));
        check(EXP,-x,0,avm_reference_expf(-x),exp(-(double)x));
    }

    /* Every float in the high part of the direct atan/tan polynomial range. */
    for (uint32_t u = 0x3e000000; u <= 0x3f800000; u += quick ? 4093 : 1) {
        float x = value(u);
        if (check(SIN, x, 0, avm_reference_sinf(x), sin((double)x)) ||
            check(COS, x, 0, avm_reference_cosf(x), cos((double)x)) ||
            check(TAN, x, 0, avm_reference_tanf(x), tan((double)x)) ||
            check(ATAN, x, 0, avm_reference_atanf(x), atan((double)x))) return 1;
    }
    for (unsigned n = 1; n < 128; ++n) {
        uint32_t center = bits((float)(n * 1.57079632679489661923));
        for (int delta = -16; delta <= 16; ++delta) {
            float x = value(center + delta);
            if (check(TAN, x, 0, avm_reference_tanf(x), tan((double)x)) ||
                check(TAN, -x, 0, avm_reference_tanf(-x), tan(-(double)x))) return 1;
        }
    }

    /* Scaling boundaries and cancellation in the presence of subnormals. */
    for (int e = -149; e <= 127; ++e) {
        float x = (float)ldexp(1.0, e);
        for (int gap = 0; gap < 32; ++gap) {
            float y = (float)ldexp(1.234567, e - gap);
            if (binary(x, y) || binary(-y, x) || binary(x, -y) || binary(-x, -y)) return 1;
        }
    }
    for (uint32_t u = 1; u < 0x00800000; u += quick ? 8191 : 13) {
        float x = value(u), y = value((u >> 2) + 1);
        if (binary(x, y)) return 1;
    }

    uint32_t state = 0x27051025;
    for (unsigned i = 0; i < (quick ? 10000 : 1000000); ++i) {
        float x = value(random_word(&state)), y = value(random_word(&state));
        if (unary(x) || binary(x, y)) return 1;
    }
    int failed = 0;
    printf("tanf_policy: away_max_absolute %.12g, away_max_budget_fraction %.12g, pole_max_ulp %lu\n",
           tan_away_absolute,tan_away_fraction,(unsigned long)tan_pole_ulps);
    for (unsigned i = 0; i < FUNCTIONS; ++i) {
        printf("%s: %llu cases, max_abs %.12g @ %08lx,%08lx, max_rel %.12g @ %08lx,%08lx, "
               "max_ulp %lu @ %08lx,%08lx, failures %llu (%.8g%%), exceptional %llu, "
               "ULP[0,1,2..4,5..16,17+] %llu,%llu,%llu,%llu,%llu\n", names[i],
               (unsigned long long)counts[i], max_abs[i], (unsigned long)worst_abs[i][0], (unsigned long)worst_abs[i][1],
               max_rel[i], (unsigned long)worst_rel[i][0], (unsigned long)worst_rel[i][1],
               (unsigned long)maximum[i], (unsigned long)worst_ulp[i][0], (unsigned long)worst_ulp[i][1],
               (unsigned long long)failures[i], 100.0*(double)failures[i]/(double)counts[i],
               (unsigned long long)exceptional[i],
               (unsigned long long)distribution[i][0], (unsigned long long)distribution[i][1],
               (unsigned long long)distribution[i][2], (unsigned long long)distribution[i][3],
               (unsigned long long)distribution[i][4]);
        failed |= failures[i] != 0;
    }
    return failed;
}
