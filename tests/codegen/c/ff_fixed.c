#include <stdint.h>

static volatile float inputs[] = {6.0f, 2.0f, -3.75f, 65535.0f};
static volatile int16_t si = -32767;
static volatile uint16_t ui = 65535;
static volatile int32_t sl = -1234567L;
static volatile uint32_t ul = 3456789012UL;
#define NI __attribute__((noinline))
static NI float arithmetic(float a, float b) {
    float add = a+b, sub = a-b, mul = a*b, div = a/b;
    return add + sub + mul + div + a + b;
}
static NI float compare_live(float a, float b) {
    int less = a < b, greater = a > b, equal = a == b;
    int unordered = __builtin_isunordered(a, b);
    return a + b + (float)(less + 2*greater + 4*equal + 8*unordered);
}
static NI float class_live(float a, float b) {
    int normal = __builtin_isfpclass(a, 0x100);
    int negative = __builtin_isfpclass(b, 0x008);
    return a + b + (float)(normal + 2*negative);
}
static NI float conversions(int16_t a, uint16_t b, int32_t c, uint32_t d) {
    float fa = (float)a, fb = (float)b, fc = (float)c, fd = (float)d;
    return ((int16_t)fa == a && (uint16_t)fb == b && (int32_t)fc == c &&
            (uint32_t)fd == 3456788992UL && a == -32767 && b == 65535 &&
            c == -1234567L && d == 3456789012UL) ? 1.0f : 0.0f;
}
static NI int inline_fixed(float a, float b) {
    register float left __asm__("q2") = a;
    register float right __asm__("q3") = b;
    __asm__("fsub" : "+r"(left) : "r"(right));
    if (left != 4.0f || right != 2.0f) return 0;
    left = a; right = b;
    register uint16_t result __asm__("r6");
    // r6 aliases q3. Capture the result through the low subregister only.
    __asm__("fcmp" : "=r"(result) : "r"(left), "r"(right));
    if (result != 1 || left != a) return 0;
    return __builtin_isfpclass(left, 0x100) && left == a;
}
int avm_test_main(void) {
    float a=inputs[0], b=inputs[1], c=inputs[2];
    if (arithmetic(a,b) != 35.0f || compare_live(a,b) != 10.0f ||
        compare_live(b,a) != 9.0f || compare_live(a,a) != 16.0f ||
        class_live(a,c) != 5.25f || conversions(si,ui,sl,ul) != 1.0f ||
        (int16_t)c != -3 || (int32_t)c != -3 ||
        (uint16_t)inputs[3] != 65535 || (uint32_t)inputs[3] != 65535 ||
        !inline_fixed(a,b)) return 1;
    return 0;
}
