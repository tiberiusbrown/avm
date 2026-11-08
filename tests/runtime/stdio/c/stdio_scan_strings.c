#include "stdio_scan_helpers.h"
static int strings(void) {
    static char buf[12] = {'x','y','z'}; static wchar_t w[6]; int a, n;
    CHECK(sscanf(" a", "%c", buf) == 1 && buf[0] == ' ' && buf[1] == 'y');
    CHECK(sscanf("ab", "%2c", buf) == 1 && buf[0] == 'a' && buf[1] == 'b' && buf[2] == 'z');
    CHECK(sscanf("a", "%2c", buf) == EOF);
    CHECK(sscanf("  hello world", "%5s%n", buf, &n) == 1 && !strcmp(buf, "hello") && n == 7);
    CHECK(sscanf("abc123", "%[a-z]%d", buf, &a) == 2 && !strcmp(buf, "abc") && a == 123);
    CHECK(sscanf("abc123", "%[^0-9]", buf) == 1 && !strcmp(buf, "abc"));
    CHECK(sscanf("]abc9", "%[]a-z]", buf) == 1 && !strcmp(buf, "]abc"));
    CHECK(sscanf("-za!", "%[z-a]", buf) == 1 && !strcmp(buf, "-za"));
    CHECK(sscanf("-abc-!", "%[-a-c]", buf) == 1 && !strcmp(buf, "-abc-"));
    CHECK(sscanf("   a", "%[a-z]", buf) == 0);
    buf[0] = 'q'; CHECK(sscanf("", "%s", buf) == EOF && buf[0] == 'q');
    CHECK(sscanf("ab", "%2lc", w) == 1 && w[0] == 'a' && w[1] == 'b');
    CHECK(sscanf(" abc", "%ls", w) == 1 && w[0] == 'a' && w[3] == 0);
    CHECK(sscanf("ab12", "%l[a-z]", w) == 1 && w[1] == 'b' && w[2] == 0);
    CHECK(sscanf("abc 45", "%*s%d", &a) == 1 && a == 45);
    CHECK(sscanf("abc45", "%*[a-z]%d", &a) == 1 && a == 45);
    CHECK(sscanf("%42", "%%%d", &a) == 1 && a == 42);
    static signed char hh; static short h; static long l; static long long ll;
    static intmax_t j; static int z; static ptrdiff_t t;
    CHECK(sscanf(" a", "%hhn %hn%ln%lln%jn%zn%tn%n", &hh, &h, &l, &ll, &j, &z, &t, &n) == 0 && hh == 0 && h == 1 && l == 1 && ll == 1 && j == 1 && z == 1 && t == 1 && n == 1);
    CHECK(sscanf("x", "x%d", &a) == EOF);
    void *p = &a, *q = 0; static char text[12];
    sprintf(text, "%p", p); CHECK(sscanf(text, "%p", &q) == 1 && q == p);
    sprintf(text, "%p", (void *)0); q = (void *)1;
    CHECK(sscanf(text, "%p", &q) == 1 && q == 0);
    return 0;
}

int avm_test_main(void) { return strings(); }
