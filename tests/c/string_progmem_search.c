#include <string.h>

static const char AVM_PROGMEM text[] = "ababa";
static const char AVM_PROGMEM empty[] = "";
static const char AVM_PROGMEM needle[] = "aba";
static const char AVM_PROGMEM late[] = "bab";
static const char AVM_PROGMEM missing[] = "xyz";
static const char AVM_PROGMEM longer[] = "ababab";
static const char AVM_PROGMEM chars[] = "ab";
static const char AVM_PROGMEM high[] = {(char)0xff, 0};
static const char AVM_PROGMEM binary[] = {'a', 0, (char)0xff, 'b'};
#define TEN_A "aaaaaaaaaa"
static const char AVM_PROGMEM long_text[] =
    TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A
    TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A
    TEN_A TEN_A TEN_A TEN_A TEN_A TEN_A "b";
#undef TEN_A

/* Also verify address-taking binds each C++ overload to the C ABI symbol. */
static const char AVM_PROGMEM* (*volatile first)(const char AVM_PROGMEM*, int) = strchr_P;
static const char AVM_PROGMEM* (*volatile last)(const char AVM_PROGMEM*, int) = strrchr_P;
static const void AVM_PROGMEM* (*volatile byte)(const void AVM_PROGMEM*, int, size_t) = memchr_P;
static size_t (*volatile length)(const char AVM_PROGMEM*, size_t) = strnlen_P;
static int (*volatile compare)(const char*, const char AVM_PROGMEM*, size_t) = strncmp_P;
static char* (*volatile substring)(const char*, const char AVM_PROGMEM*) = strstr_P;
static char* (*volatile any)(const char*, const char AVM_PROGMEM*) = strpbrk_P;
static size_t (*volatile span)(const char*, const char AVM_PROGMEM*) = strspn_P;
static size_t (*volatile complement)(const char*, const char AVM_PROGMEM*) = strcspn_P;
static char* (*volatile token)(char*, const char AVM_PROGMEM*) = strtok_P;
static char* (*volatile token_r)(char*, const char AVM_PROGMEM*, char**) = strtok_rP;
static char* (*volatile copy_string)(char*, const char AVM_PROGMEM*) = strcpy_P;

#ifdef __cplusplus
static_assert(sizeof(strchr_P(text, 0)) == 3, "flash search results must retain 24-bit pointers");
static_assert(sizeof(memchr_P(binary, 0, 4)) == 3, "flash memory results must retain 24-bit pointers");
#else
_Static_assert(sizeof(strchr_P(text, 0)) == 3, "flash search results must retain 24-bit pointers");
_Static_assert(sizeof(memchr_P(binary, 0, 4)) == 3, "flash memory results must retain 24-bit pointers");
#endif

int avm_test_main(void)
{
    char ram[] = "ababa";
    char hi[] = {(char)0xff, 0};
    char low[] = {1, 0};
    char buffer[] = ",one:two;three";
    char other[] = "x/y";
    char* state = NULL;
    char* other_state = NULL;
    char* t;
    char guarded[8] = {'!', '?', '?', '?', '?', '?', '?', '!'};
    if(copy_string(guarded + 1, text) != guarded + 1 ||
       strcmp_P(guarded + 1, text) || guarded[0] != '!' || guarded[7] != '!') return 20;
    if(strcpy_P(guarded + 1, empty) != guarded + 1 || guarded[1] ||
       guarded[2] != 'b' || guarded[7] != '!') return 21;
    if((strcpy_P)(guarded + 1, text) != guarded + 1 || guarded[7] != '!') return 22;
    if(first(text, 'a') != text || last(text, 'a') != text + 4 ||
       first(text, 0) != text + 5 || last(text, 0) != text + 5 ||
       first(text, 'x') || last(empty, 'a') ||
       first(high, -1) != high || first(high, 0x1ff) != high ||
       first(long_text, 'b') != long_text + 260 ||
       last(long_text, 'a') != long_text + 259)
        return 1;
    if(byte(binary, 0, 4) != binary + 1 ||
       byte(binary, 0x1ff, 4) != binary + 2 ||
       byte(binary, 'b', 3) || byte(binary, 'a', 0) ||
       byte(long_text, 'b', 261) != long_text + 260 ||
       length(long_text, 300) != 261 || length(long_text, 256) != 256 ||
       length(text, 0) || length(empty, 10))
        return 2;
    if(compare(ram, text, 10) || compare(ram, longer, 5) ||
       compare(ram, longer, 6) >= 0 || compare(low, high, 1) >= 0 ||
       compare(hi, high, 2) || compare(hi, empty, 1) <= 0 ||
       compare(low, high, 0))
        return 3;
    if(substring(ram, needle) != ram || substring(ram, late) != ram + 1 ||
       substring(ram, empty) != ram || substring(ram, missing) ||
       substring(ram, longer) || substring("", needle))
        return 4;
    if(span(ram, chars) != 5 || span(ram, empty) ||
       complement(ram, missing) != 5 || complement(ram, chars) ||
       complement(ram, empty) != 5 || span(hi, high) != 1 ||
       any(ram, late) != ram || any(ram, empty) ||
       any(hi, high) != hi || any("", chars))
        return 5;
    t = token_r(buffer, PSTR(",:"), &state);
    if(!t || strcmp(t, "one")) return 6;
    t = token_r(other, PSTR("/"), &other_state);
    if(!t || strcmp(t, "x")) return 7;
    t = strtok_r(NULL, ";", &state);
    if(!t || strcmp(t, "two")) return 8;
    t = token_r(NULL, empty, &state);
    if(!t || strcmp(t, "three") || token_r(NULL, empty, &state)) return 9;
    t = token_r(NULL, empty, &other_state);
    if(!t || strcmp(t, "y") || token_r(NULL, empty, &other_state)) return 10;
    {
        char mixed[] = "a,b;c:d";
        t = strtok(mixed, ",");
        if(!t || strcmp(t, "a")) return 11;
        t = token(NULL, PSTR(";"));
        if(!t || strcmp(t, "b")) return 12;
        t = strtok(NULL, ":");
        if(!t || strcmp(t, "c")) return 13;
        t = token(NULL, empty);
        if(!t || strcmp(t, "d") || token(NULL, empty)) return 14;
    }
    /* Direct syntax exercises automatic selection separately from pointers. */
    if(strchr_P(text, 'b') != text + 1 || strrchr_P(text, 'b') != text + 3 ||
       memchr_P(binary, -1, 4) != binary + 2 || strnlen_P(text, 3) != 3 ||
       strncmp_P(ram, text, 5) || strstr_P(ram, late) != ram + 1 ||
       strspn_P(ram, chars) != 5 || strcspn_P(ram, missing) != 5 ||
       strpbrk_P(ram, late) != ram)
        return 15;
    return 0;
}
