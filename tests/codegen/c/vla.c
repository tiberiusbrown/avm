#define NOINLINE __attribute__((noinline))
static volatile unsigned input = 3;

static NOINLINE int basic(unsigned n) {
    volatile unsigned char a[n];
    for (unsigned i = 0; i < n; ++i) a[i] = (unsigned char)(i + 3);
    return a[n - 1] + a[0];
}

static NOINLINE unsigned size_test(unsigned n) {
    unsigned short a[n];
    return sizeof a;
}

static NOINLINE unsigned sum8(unsigned a, unsigned b, unsigned c, unsigned d,
                              unsigned e, unsigned f, unsigned g, unsigned h) {
    return a + b + c + d + e + f + g + h;
}

static NOINLINE int nested(unsigned n) {
    volatile unsigned char outer[n];
    outer[0] = 41; outer[n - 1] = 13;
    {
        volatile unsigned long inner[n];
        inner[0] = 0x12345678UL;
        inner[n - 1] = 0x87654321UL;
        outer[0] += inner[0] == 0x12345678UL;
        if (inner[n - 1] != 0x87654321UL) return 1;
    }
    {
        struct element { unsigned char a; unsigned short b; };
        volatile struct element other[n];
        other[n - 1].a = 7; other[n - 1].b = 1234;
        if (other[n - 1].a != 7 || other[n - 1].b != 1234) return 2;
    }
    return outer[0] != 42 || outer[n - 1] != 13;
}

static NOINLINE int exits(unsigned n) {
    unsigned total = 0;
    for (unsigned i = 0; i < 100; ++i) {
        volatile unsigned char a[n];
        a[0] = (unsigned char)i;
        if (i % 3 == 0) continue;
        total += a[0];
    }
    if (total != 3267) return 1;
    for (unsigned i = 0; i < 100; ++i) {
        volatile unsigned short a[n];
        a[n - 1] = i;
        if (a[n - 1] == 7) break;
    }
    {
        volatile unsigned char a[n];
        a[0] = 1;
        if (a[0]) goto outside;
        return 2;
    }
outside:
    return basic(n) != (int)(n + 5);
}

static NOINLINE int fixed_calls(unsigned n) {
    volatile unsigned fixed[8];
    unsigned a = n + 1, b = n + 2, c = n + 3, d = n + 4;
    unsigned e = n + 5, f = n + 6, g = n + 7, h = n + 8;
    for (unsigned i = 0; i < 8; ++i) fixed[i] = n + i;
    volatile unsigned short vla[n];
    vla[0] = 123; vla[n - 1] = 456;
    unsigned result = sum8(a, b, c, d, e, f, g, h);
    for (unsigned i = 0; i < 8; ++i)
        if (fixed[i] != n + i) return 1;
    return result != 8 * n + 36 || vla[0] != 123 || vla[n - 1] != 456;
}

static NOINLINE int large_fixed(unsigned n) {
    volatile unsigned char fixed[136];
    fixed[0] = 19; fixed[135] = 23;
    volatile unsigned char a[n];
    a[0] = 41; a[n - 1] = 42;
    unsigned result = sum8(n, n+1, n+2, n+3, n+4, n+5, n+6, n+7);
    return fixed[0] != 19 || fixed[135] != 23 || a[0] != 41 ||
           a[n - 1] != 42 || result != 8*n + 28;
}

/* Bounds are evaluated once; multidimensional indexing uses runtime strides.
   The parameter also exercises a variably modified pointer type. */
static NOINLINE unsigned matrix_sum(unsigned n, unsigned m, unsigned a[][3]) {
    unsigned result = 0;
    for (unsigned i = 0; i < n; ++i)
        for (unsigned j = 0; j < m; ++j) result += a[i][j];
    return result;
}
#ifndef __cplusplus
static NOINLINE int runtime_stride(unsigned n, unsigned m) {
    volatile unsigned short a[n][m];
    for (unsigned i = 0; i < n; ++i)
        for (unsigned j = 0; j < m; ++j) a[i][j] = 10*i + j;
    for (unsigned i = 0; i < n; ++i)
        for (unsigned j = 0; j < m; ++j)
            if (a[i][j] != 10*i + j) return 1;
    return sizeof a != n*m*sizeof(unsigned short);
}
#endif
static NOINLINE int bounds(unsigned n) {
    unsigned count = n;
    volatile unsigned short a[count++];
    a[n - 1] = 77;
    if (count != n + 1 || sizeof a != 2*n || a[n - 1] != 77) return 1;
    unsigned matrix[n][3];
    for (unsigned i = 0; i < n; ++i)
        for (unsigned j = 0; j < 3; ++j) matrix[i][j] = i + j;
    return matrix_sum(n, 3, matrix) != 3*n*(n-1)/2 + 3*n;
}

int avm_test_main(void) {
    for (unsigned i = 0; i < 3; ++i) {
        unsigned n = input + i;
#ifndef __cplusplus
        if (runtime_stride(n, input)) return 1;
#endif
        if (basic(n) != (int)(n + 5) || size_test(n) != 2*n || nested(n) ||
            exits(n) || fixed_calls(n) || large_fixed(n) || bounds(n)) return 1;
    }
    return 0;
}
