#include "stdio_scan_helpers.h"
static int streams(void) {
    int a = 99; char ch = 0; wchar_t wide;
    CHECK(stdin_call("%d", &a) == EOF && a == 99 && feof(stdin));
    CHECK(stream_call(stdin, "%d", &a) == EOF);
    CHECK(ungetc('A', stdin) == 'A' && !feof(stdin));
    CHECK(forward(1, 0, "%c", &ch) == 1 && ch == 'A');
    CHECK(fgetc(stdin) == EOF && feof(stdin));
    CHECK(ungetc('x', stdin) == 'x');
    CHECK(fscanf(stdin, "%d", &a) == 0 && fgetc(stdin) == 'x');
    CHECK(ungetc('q', stdin) == 'q');
    CHECK(fscanf(stdin, "z") == 0 && fgetc(stdin) == 'q');
    CHECK(ungetc('+', stdin) == '+');
    CHECK(fscanf(stdin, "%d", &a) == 0 && feof(stdin));
    CHECK(ungetc(0, stdin) == 0 && fscanf(stdin, "%c", &ch) == 1 && ch == 0);
    CHECK(ungetc('7', stdin) == '7' && forward(2, 0, "%d", &a) == 1 && a == 7);
    CHECK(forward(0, "23", "%d", &a) == 1 && a == 23);
    CHECK(ungetc(255, stdin) == 255 && fscanf(stdin, "%lc", &wide) == 1 && wide == 255);
    CHECK(!ferror(stdin));
    return 0;
}

int avm_test_main(void) { return streams(); }
