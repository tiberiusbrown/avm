#include <stdlib.h>

static void (*volatile sort_call)(void *, size_t, size_t,
    int (*)(const void *, const void *)) = qsort;
static void *(*volatile search_call)(const void *, const void *, size_t,
    size_t, int (*)(const void *, const void *)) = bsearch;

static int compare_int(const void *a, const void *b)
{
    int x = *(const int *)a, y = *(const int *)b;
    return (x > y) ? 91 : (x < y) ? -73 : 0;
}
static int compare_int_desc(const void *a, const void *b)
{
    return compare_int(b, a);
}

static int reverse_order;
static int compare_int_state(const void *a, const void *b)
{
    return reverse_order ? compare_int(b, a) : compare_int(a, b);
}

typedef struct { unsigned char key, payload[2]; } triple;
typedef struct { int key; unsigned char payload[5]; } record;
static triple triples[11];
static int compare_triple(const void *a, const void *b)
{
    unsigned x = ((const triple *)a)->key, y = ((const triple *)b)->key;
    return x < y ? -9 : x > y ? 4 : 0;
}
static int compare_record(const void *a, const void *b)
{
    int x = ((const record *)a)->key, y = ((const record *)b)->key;
    return x < y ? -1 : x > y ? 1 : 0;
}
static int compare_key_record(const void *key, const void *element)
{
    int x = *(const int *)key, y = ((const record *)element)->key;
    return x < y ? -1 : x > y ? 1 : 0;
}

static int check_int_array(const int *source, const int *sorted, size_t n)
{
    size_t i;
    for(i = 1; i < n; ++i) if(sorted[i - 1] > sorted[i]) return 1;
    for(i = 0; i < n; ++i) {
        size_t j, source_count = 0, sorted_count = 0;
        for(j = 0; j < n; ++j) {
            if(source[j] == source[i]) ++source_count;
            if(sorted[j] == source[i]) ++sorted_count;
        }
        if(source_count != sorted_count) return 2;
    }
    return 0;
}

static unsigned char guarded[1 + 33 * sizeof(int) + 1];
static int wide_source[300];
static int short_copy[33];
static unsigned char byte_values[12];
static short word_values[9];
static int compare_byte(const void *a, const void *b)
{
    unsigned char x = *(const unsigned char *)a, y = *(const unsigned char *)b;
    return x < y ? -7 : x > y ? 8 : 0;
}
static int compare_short(const void *a, const void *b)
{
    short x = *(const short *)a, y = *(const short *)b;
    return x < y ? -7 : x > y ? 8 : 0;
}
static record records[24];
static unsigned char record_seen[24];
static int single_byte[1];

static int test_qsort(void)
{
    size_t i;
    int *a = (int *)(guarded + 1);
    guarded[0] = 0xA5; guarded[1 + 33 * sizeof(int)] = 0x5A;
    sort_call(a, 0, sizeof(int), compare_int);
    sort_call((void *)0, 4, 0, compare_int);
    single_byte[0] = 17;
    sort_call(single_byte, 1, sizeof(int), compare_int);
    if(single_byte[0] != 17) return 1;
    a[0] = 2; a[1] = 1; sort_call(a, 2, sizeof(int), compare_int);
    if(a[0] != 1 || a[1] != 2) return 2;
    a[0] = 1; a[1] = 2; sort_call(a, 2, sizeof(int), compare_int);
    for(i = 0; i < 17; ++i) a[i] = (int)i;
    sort_call(a, 17, sizeof(int), compare_int);
    for(i = 0; i < 17; ++i) a[i] = (int)(16 - i);
    sort_call(a, 17, sizeof(int), compare_int);
    for(i = 0; i < 17; ++i) if(a[i] != (int)i) return 3;
    for(i = 7; i <= 9; ++i) {
        size_t j;
        for(j = 0; j < i; ++j) a[j] = (int)(i - j);
        sort_call(a, i, sizeof(int), compare_int);
        for(j = 1; j < i; ++j) if(a[j - 1] > a[j]) return 12;
    }
    for(i = 0; i < 16; ++i) {
        a[i] = short_copy[i] = (i & 1) ? (int)(i / 2) : (int)(15 - i / 2);
    }
    sort_call(a, 16, sizeof(int), compare_int);
    if(check_int_array(short_copy, a, 16)) return 18;
    reverse_order = 1;
    for(i = 0; i < 19; ++i) a[i] = (int)i;
    sort_call(a, 19, sizeof(int), compare_int_state);
    for(i = 1; i < 19; ++i) if(a[i - 1] < a[i]) return 15;
    reverse_order = 0;
    for(i = 0; i < 32; ++i) a[i] = 5;
    sort_call(a, 32, sizeof(int), compare_int);
    for(i = 0; i < 32; ++i) if(a[i] != 5) return 4;
    for(i = 0; i < 33; ++i) a[i] = short_copy[i] = (int)((i * 17) % 9) - 4;
    sort_call(a, 33, sizeof(int), compare_int);
    if(check_int_array(short_copy, a, 33)) return 5;
    for(i = 0; i < 300; ++i) wide_source[i] = (int)((i * 97) % 301) - 150;
    sort_call(wide_source, 300, sizeof(int), compare_int);
    {
        size_t index = 0;
        int expected;
        for(expected = -150; expected <= 150; ++expected) {
            if(expected == 54) continue;
            if(index >= 300 || wide_source[index++] != expected) return 6;
        }
        if(index != 300) return 6;
    }
    for(i = 0; i < 12; ++i) byte_values[i] = (unsigned char)(11 - i);
    sort_call(byte_values, 12, sizeof(byte_values[0]), compare_byte);
    for(i = 0; i < 12; ++i) if(byte_values[i] != i) return 10;
    for(i = 0; i < 9; ++i) word_values[i] = (short)(8 - i);
    sort_call(word_values, 9, sizeof(word_values[0]), compare_short);
    for(i = 0; i < 9; ++i) if(word_values[i] != (short)i) return 11;
    for(i = 0; i < 11; ++i) {
        triples[i].key = (unsigned char)(10 - i);
        triples[i].payload[0] = (unsigned char)(i + 30);
        triples[i].payload[1] = (unsigned char)(i + 60);
    }
    sort_call(triples, 11, sizeof(triple), compare_triple);
    for(i = 0; i < 11; ++i) {
        if(triples[i].key != i) return 16;
        if(triples[i].payload[0] != (unsigned char)(40 - i) ||
           triples[i].payload[1] != (unsigned char)(70 - i)) return 17;
    }
    for(i = 0; i < 24; ++i) {
        unsigned j;
        records[i].key = (int)((23 - i) % 7) - 3;
        for(j = 0; j < 5; ++j) records[i].payload[j] = (unsigned char)(i * 7 + j);
    }
    sort_call(records, 24, sizeof(record), compare_record);
    for(i = 0; i < 24; ++i) record_seen[i] = 0;
    for(i = 0; i < 24; ++i) {
        unsigned k;
        unsigned original_index = records[i].payload[0] / 7;
        if(i && records[i - 1].key > records[i].key) return 7;
        if(original_index >= 24 || record_seen[original_index]) return 8;
        record_seen[original_index] = 1;
        for(k = 0; k < 5; ++k)
            if(records[i].payload[k] != (unsigned char)(original_index * 7 + k)) return 19;
        if(records[i].key != (int)((23 - original_index) % 7) - 3) return 8;
    }
    {
        int wanted = records[10].key;
        if(!bsearch(&wanted, records, 24, sizeof(record), compare_key_record)) return 13;
        wanted = 50;
        if(bsearch(&wanted, records, 24, sizeof(record), compare_key_record)) return 14;
    }
    if(guarded[0] != 0xA5 ||
       guarded[1 + 33 * sizeof(int)] != 0x5A) return 9;
    return 0;
}

static int test_bsearch(void)
{
    int values[9];
    int before[9];
    int key;
    void *found;
    size_t i;
    for(i = 0; i < 9; ++i) {
        values[i] = i == 0 ? -9 : i == 1 ? -4 : i == 2 ? -1 :
            i == 3 ? 0 : i == 4 ? 3 : i == 5 ? 8 :
            i == 6 ? 12 : i == 7 ? 16 : 21;
        before[i] = values[i];
    }
    key = -9; found = search_call(&key, values, 9, sizeof(int), compare_int);
    if(found != &values[0]) return 1;
    key = 21; found = bsearch(&key, values, 9, sizeof(int), compare_int);
    if(found != &values[8]) return 2;
    key = 3; found = bsearch(&key, values, 9, sizeof(int), compare_int);
    if(found != &values[4]) return 3;
    key = -10; if(bsearch(&key, values, 9, sizeof(int), compare_int)) return 4;
    key = 22; if(bsearch(&key, values, 9, sizeof(int), compare_int)) return 5;
    key = 2; if(bsearch(&key, values, 9, sizeof(int), compare_int)) return 6;
    if(bsearch(&key, values, 0, sizeof(int), compare_int)) return 7;
    if(bsearch((const void *)0, (const void *)0, 0, sizeof(int), compare_int)) return 18;
    {
        int descending[4];
        descending[0] = 8; descending[1] = 3;
        descending[2] = -1; descending[3] = -9;
        key = -1;
        if(bsearch(&key, descending, 4, sizeof(int), compare_int_desc) != &descending[2]) return 8;
    }
    key = 0; found = bsearch(&key, values + 2, 5, sizeof(int), compare_int);
    if(found != &values[3]) return 9;
    for(i = 0; i < 9; ++i) if(values[i] != before[i]) return 10;
    key = 4;
    if(bsearch(&key, records, 0, sizeof(record), compare_key_record)) return 11;
    {
        record local[5];
        local[0].key = -5; local[0].payload[0] = 0;
        local[1].key = -1; local[1].payload[0] = 1;
        local[2].key = 2; local[2].payload[0] = 2;
        local[3].key = 7; local[3].payload[0] = 3;
        local[4].key = 9; local[4].payload[0] = 4;
        key = 7;
        found = bsearch(&key, local, 5, sizeof(record), compare_key_record);
        if(found != &local[3]) return 12;
        key = 6;
        if(bsearch(&key, local, 5, sizeof(record), compare_key_record)) return 13;
    }
    {
        triple small[3];
        triple wanted;
        small[0].key = 1; small[0].payload[0] = 4; small[0].payload[1] = 5;
        small[1].key = 2; small[1].payload[0] = 6; small[1].payload[1] = 7;
        small[2].key = 3; small[2].payload[0] = 8; small[2].payload[1] = 9;
        wanted.key = 2;
        found = bsearch(&wanted, small, 3, sizeof(triple), compare_triple);
        if(found != &small[1]) return 14;
    }
    {
        for(i = 0; i < 300; ++i) wide_source[i] = (int)i * 2 - 200;
        key = 398;
        if(bsearch(&key, wide_source, 300, sizeof(int), compare_int) != &wide_source[299]) return 15;
        key = 399;
        if(bsearch(&key, wide_source, 300, sizeof(int), compare_int)) return 16;
    }
    {
        int duplicates[6];
        duplicates[0] = 1; duplicates[1] = 2; duplicates[2] = 2;
        duplicates[3] = 2; duplicates[4] = 4; duplicates[5] = 7;
        key = 2;
        found = bsearch(&key, duplicates, 6, sizeof(int), compare_int);
        if(!found || *(int *)found != key) return 17;
    }
    return 0;
}

int avm_test_main(void)
{
    return test_qsort() || test_bsearch();
}
