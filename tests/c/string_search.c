#include <string.h>

/* Volatile function pointers ensure these exercise the runtime entry points. */
static char* (*volatile find_char)(const char*, int) = strchr;
static char* (*volatile find_last)(const char*, int) = strrchr;
static char* (*volatile find_string)(const char*, const char*) = strstr;
static void* (*volatile find_byte)(const void*, int, size_t) = memchr;
static int (*volatile compare)(const char*, const char*, size_t) = strncmp;

int avm_test_main(void) {
    const char s[] = "ababa";
    const char hi[] = {(char)0xff, 'x', 0};
    const char lo[] = {1, 'x', 0};
    const char bytes[] = {'a', 0, (char)0xff, 'b'};
    char tokens[] = ",,one:two;three,,";
    char other[] = "x/y";
    char* state;
    char* other_state;
    char* t;
    static char long_text[302];
    for(size_t i = 0; i < 300; ++i)
        long_text[i] = 'a';
    long_text[300] = 'b';
    long_text[301] = 0;
    if(find_char(long_text, 'b') != long_text + 300 ||
       find_last(long_text, 'a') != long_text + 299 ||
       find_string(long_text, "ab") != long_text + 299 ||
       find_byte(long_text, 'b', 301) != long_text + 300 ||
       strspn(long_text, "a") != 300 || strcspn(long_text, "b") != 300 ||
       strnlen(long_text, 302) != 301)
        return 13;
    if(find_char(s, 'a') != s || find_last(s, 'a') != s + 4 ||
       find_char(s, 0) != s + 5 || find_last(s, 0) != s + 5 ||
       find_char(s, 'z') || find_last("", 'a') ||
       find_char(hi, -1) != hi || find_char(hi, 0x1ff) != hi)
        return 1;
    if(find_string(s, "aba") != s || find_string(s, "bab") != s + 1 ||
       find_string(s, "") != s || find_string(s, "ababab") ||
       find_string("", "x") || find_string("aaab", "aab")[2] != 'b')
        return 2;
    if(find_byte(bytes, 0, 4) != bytes + 1 ||
       find_byte(bytes, -1, 4) != bytes + 2 ||
       find_byte(bytes, 0x1ff, 4) != bytes + 2 ||
       find_byte(bytes, 'b', 3) || find_byte(bytes, 'a', 0))
        return 3;
    if(compare(hi, lo, 1) <= 0 || compare(lo, hi, 1) >= 0 ||
       compare("abc", "abd", 2) || compare("", "x", 0) ||
       compare("a", "ab", 3) >= 0 || compare("ab", "a", 3) <= 0 ||
       compare("a", "a", 100))
        return 4;
    if(strspn(s, "ab") != 5 || strspn(s, "") || strspn("", "ab") ||
       strcspn(s, "b") != 1 || strcspn(s, "") != 5 ||
       strpbrk(s, "bz") != s + 1 || strpbrk(s, "") ||
       strnlen(bytes, 4) != 1 || strnlen(s, 3) != 3 || strnlen(s, 0))
        return 5;
    t = strtok_r(tokens, ",:", &state);
    if(!t || strcmp(t, "one")) return 6;
    t = strtok_r(other, "/", &other_state);
    if(!t || strcmp(t, "x")) return 7;
    t = strtok_r(NULL, ";", &state);
    if(!t || strcmp(t, "two")) return 8;
    t = strtok_r(NULL, ",", &state);
    if(!t || strcmp(t, "three") || strtok_r(NULL, ",", &state) ||
       strtok_r(NULL, ",", &state)) return 9;
    t = strtok_r(NULL, "", &other_state);
    if(!t || strcmp(t, "y") || strtok_r(NULL, "", &other_state)) return 10;
    {
        char text[] = " a  b ";
        t = strtok(text, " ");
        if(!t || strcmp(t, "a")) return 11;
        t = strtok(NULL, " ");
        if(!t || strcmp(t, "b") || strtok(NULL, " ")) return 12;
    }
    return 0;
}
