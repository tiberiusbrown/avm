#define AVM_PGMSPACE_IMPLEMENTATION
#include <avm/pgmspace.h>

const void AVM_PROGMEM* memchr_P(const void AVM_PROGMEM* src, int value, size_t size) {
    const unsigned char AVM_PROGMEM* p = (const unsigned char AVM_PROGMEM*)src;
    while(size--) {
        if(*p == (unsigned char)value)
            return p;
        ++p;
    }
    return NULL;
}

const char AVM_PROGMEM* strchr_P(const char AVM_PROGMEM* str, int value) {
    const unsigned char c = (unsigned char)value;
    do {
        if((unsigned char)*str == c)
            return str;
    } while(*str++);
    return NULL;
}

const char AVM_PROGMEM* strrchr_P(const char AVM_PROGMEM* str, int value) {
    const unsigned char c = (unsigned char)value;
    const char AVM_PROGMEM* last = NULL;
    do {
        if((unsigned char)*str == c)
            last = str;
    } while(*str++);
    return last;
}

size_t strnlen_P(const char AVM_PROGMEM* str, size_t size) {
    size_t n = 0;
    while(n < size && str[n])
        ++n;
    return n;
}

int strncmp_P(const char* lhs, const char AVM_PROGMEM* rhs, size_t size) {
    while(size--) {
        unsigned char a = (unsigned char)*lhs++;
        unsigned char b = (unsigned char)*rhs++;
        if(a != b || !a)
            return (int)a - (int)b;
    }
    return 0;
}

char* strstr_P(const char* str, const char AVM_PROGMEM* needle) {
    if(!*needle)
        return (char*)str;
    for(; *str; ++str) {
        const char* h = str;
        const char AVM_PROGMEM* n = needle;
        while(*n && *h == *n) {
            ++h;
            ++n;
        }
        if(!*n)
            return (char*)str;
    }
    return NULL;
}

size_t strspn_P(const char* str, const char AVM_PROGMEM* accept) {
    const char* p = str;
    while(*p && strchr_P(accept, (unsigned char)*p))
        ++p;
    return (size_t)(p - str);
}

size_t strcspn_P(const char* str, const char AVM_PROGMEM* reject) {
    const char* p = str;
    while(*p && !strchr_P(reject, (unsigned char)*p))
        ++p;
    return (size_t)(p - str);
}

char* strpbrk_P(const char* str, const char AVM_PROGMEM* accept) {
    str += strcspn_P(str, accept);
    return *str ? (char*)str : NULL;
}

char* strtok_rP(char* str, const char AVM_PROGMEM* delimiters, char** saveptr) {
    if(!str)
        str = *saveptr;
    if(!str)
        return NULL;
    str += strspn_P(str, delimiters);
    if(!*str) {
        *saveptr = str;
        return NULL;
    }
    char* end = str + strcspn_P(str, delimiters);
    if(*end)
        *end++ = '\0';
    *saveptr = end;
    return str;
}

void* memcpy_P(void* dst, void const AVM_PROGMEM* src, size_t size) {
    return __avm_memcpy_P(dst, src, size);
}

int memcmp_P(void const* lhs, void const AVM_PROGMEM* rhs, size_t size) {
    return __avm_memcmp_P(lhs, rhs, size);
}

int strcmp_P(char const* lhs, char const AVM_PROGMEM* rhs) {
    return __avm_strcmp_P(lhs, rhs);
}

size_t strlen_P(char const AVM_PROGMEM* str) {
    return __avm_strlen_P(str);
}

char* strncpy_P(char* dst, char const AVM_PROGMEM* src, size_t size) {
    return __avm_strncpy_P(dst, src, size);
}

char* strncat_P(char* dst, char const AVM_PROGMEM* src, size_t size) {
    return __avm_strncat_P(dst, src, size);
}

char* strcpy_P(char* dst, char const AVM_PROGMEM* src) {
    char* result = dst;
    while((*dst++ = *src++) != '\0') {}
    return result;
}

#undef strcat_P
char* strcat_P(char* dst, char const AVM_PROGMEM* src) {
    return __avm_strncat_P(dst, src, SIZE_MAX);
}
