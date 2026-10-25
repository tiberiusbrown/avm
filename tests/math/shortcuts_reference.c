#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

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

static int check(int function, float x, float y, float actual, float expected)
{
    uint32_t a = bits(actual), b = bits(expected);
    uint32_t distance = a > b ? a - b : b - a;
    ++counts[function];
    if ((b & 0x7fffffffU) > 0x7f800000U && (a & 0x7fffffffU) > 0x7f800000U)
        return 0;
    if (a == b) return 0;
    if (((a ^ b) & 0x80000000U) || (a & 0x7fffffffU) >= 0x7f800000U ||
        (b & 0x7fffffffU) >= 0x7f800000U || distance > (function == FMOD ? 0U : 4U)) {
        printf("%s(%08lx, %08lx): actual %08lx expected %08lx (%lu ULP)\n",
               names[function], (unsigned long)bits(x), (unsigned long)bits(y),
               (unsigned long)a, (unsigned long)b, (unsigned long)distance);
        return 1;
    }
    if (distance > maximum[function]) maximum[function] = distance;
    return 0;
}

static int logs(float x)
{
    return check(LOG, x, 0, avm_reference_logf(x), (float)log((double)x)) ||
        check(LOG2, x, 0, avm_reference_log2f(x), (float)log2((double)x)) ||
        check(LOG10, x, 0, avm_reference_log10f(x), (float)log10((double)x));
}

static int unary(float x)
{
    return check(SIN, x, 0, avm_reference_sinf(x), (float)sin((double)x)) ||
        check(COS, x, 0, avm_reference_cosf(x), (float)cos((double)x)) ||
        logs(x) || check(ATAN, x, 0, avm_reference_atanf(x), (float)atan((double)x)) ||
        check(TAN, x, 0, avm_reference_tanf(x), (float)tan((double)x)) ||
        check(EXP, x, 0, avm_reference_expf(x), (float)exp((double)x));
}

static int binary(float x, float y)
{
    uint32_t a = bits(x), b = bits(y);
    int signaling_x = (a & 0x7fffffffU) > 0x7f800000U && !(a & 0x00400000U);
    int signaling_y = (b & 0x7fffffffU) > 0x7f800000U && !(b & 0x00400000U);
    /* The runtime deliberately propagates signaling NaNs for these powers;
       conversion to host double quiets them before host pow sees the input. */
    float power = (signaling_x && !(b & 0x7fffffffU)) || (a == 0x3f800000U && signaling_y)
        ? value(0x7fc00000) : (float)pow((double)x, (double)y);
    return check(HYPOT, x, y, avm_reference_hypotf(x, y), (float)hypot((double)x, (double)y)) ||
        check(ATAN2, x, y, avm_reference_atan2f(x, y), (float)atan2((double)x, (double)y)) ||
        check(POW, x, y, avm_reference_powf(x, y), power) ||
        check(FMOD, x, y, avm_reference_fmodf(x, y), (float)fmod((double)x, (double)y));
}

static uint32_t random_word(uint32_t *state)
{
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

int main(void)
{
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
        for (uint32_t u = 0x3f000000; u <= 0x40000000; u += (n >= -5 && n <= 5 ? 1 : 17)) {
            float x = value(u | ((u & 1) << 31));
            if (check(POW, x, (float)n, avm_reference_powf(x, (float)n),
                      (float)pow((double)x, (double)n))) return 1;
        }
        for (int e = -149; e <= 127; ++e) {
            float x = (float)ldexp(1.234567, e);
            if (check(POW, x, (float)n, avm_reference_powf(x, (float)n),
                      (float)pow((double)x, (double)n))) return 1;
        }
    }

    /* Every mantissa in the bounded positive pow path, for signed fractional
       exponents including the largest allowed magnitude. */
    static const float bounded_exponents[] = {-1.25f, -0.75f, -0.25f, 0.25f, 0.75f, 1.25f};
    for (uint32_t u = 0x3f000000; u <= 0x40000000; ++u) {
        float x = value(u);
        for (unsigned j = 0; j < sizeof(bounded_exponents) / sizeof(bounded_exponents[0]); ++j) {
            float y = bounded_exponents[j];
            if (check(POW, x, y, avm_reference_powf(x, y), (float)pow((double)x, (double)y))) return 1;
        }
    }
    uint32_t bounded_state = 0x1234abcd;
    for (unsigned i = 0; i < 1000000; ++i) {
        float x = value(0x3f000000U + random_word(&bounded_state) % 0x01000001U);
        float y = (float)(int32_t)random_word(&bounded_state) * 0x1.4p-31f;
        if (check(POW, x, y, avm_reference_powf(x, y), (float)pow((double)x, (double)y))) return 1;
    }

    /* Every reduced logarithm mantissa, including every near-one float. */
    for (uint32_t u = 0x3f3504e0; u <= 0x3fb504f3; ++u)
        if (logs(value(u))) return 1;
    for (int e = -149; e <= 127; ++e) {
        for (int delta = -3; delta <= 3; ++delta) {
            uint32_t u = bits((float)ldexp(1.0, e));
            if ((int64_t)u + delta > 0 && u + delta < 0x7f800000U && logs(value(u + delta))) return 1;
        }
        if (logs((float)ldexp(0.9375, e)) || logs((float)ldexp(1.0625, e))) return 1;
    }

    /* Every float in the high part of the direct atan/tan polynomial range. */
    for (uint32_t u = 0x3e000000; u <= 0x3f490fdb; ++u) {
        float x = value(u);
        if (check(SIN, x, 0, avm_reference_sinf(x), (float)sin((double)x)) ||
            check(COS, x, 0, avm_reference_cosf(x), (float)cos((double)x)) ||
            check(TAN, x, 0, avm_reference_tanf(x), (float)tan((double)x)) ||
            check(ATAN, x, 0, avm_reference_atanf(x), (float)atan((double)x))) return 1;
    }
    for (unsigned n = 1; n < 128; ++n) {
        uint32_t center = bits((float)(n * 1.57079632679489661923));
        for (int delta = -16; delta <= 16; ++delta) {
            float x = value(center + delta);
            if (check(TAN, x, 0, avm_reference_tanf(x), (float)tan((double)x)) ||
                check(TAN, -x, 0, avm_reference_tanf(-x), (float)tan(-(double)x))) return 1;
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
    for (uint32_t u = 1; u < 0x00800000; u += 13) {
        float x = value(u), y = value((u >> 2) + 1);
        if (binary(x, y)) return 1;
    }

    uint32_t state = 0x27051025;
    for (unsigned i = 0; i < 1000000; ++i) {
        float x = value(random_word(&state)), y = value(random_word(&state));
        if (unary(x) || binary(x, y)) return 1;
    }
    for (unsigned i = 0; i < FUNCTIONS; ++i)
        printf("%s: %llu cases, maximum %lu ULP\n", names[i],
               (unsigned long long)counts[i], (unsigned long)maximum[i]);
    return 0;
}
