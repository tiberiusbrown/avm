#define AVM_STRING_IMPLEMENTATION
#include <string.h>

void* memchr(const void* src, int value, size_t size) {
    const unsigned char* p = (const unsigned char*)src;
    while(size--) {
        if(*p == (unsigned char)value)
            return (void*)p;
        ++p;
    }
    return NULL;
}

int strncmp(const char* lhs, const char* rhs, size_t size) {
    while(size--) {
        unsigned char a = (unsigned char)*lhs++;
        unsigned char b = (unsigned char)*rhs++;
        if(a != b || !a)
            return (int)a - (int)b;
    }
    return 0;
}

char* strchr(const char* str, int value) {
    const unsigned char c = (unsigned char)value;
    do {
        if((unsigned char)*str == c)
            return (char*)str;
    } while(*str++);
    return NULL;
}

char* strrchr(const char* str, int value) {
    const unsigned char c = (unsigned char)value;
    const char* last = NULL;
    do {
        if((unsigned char)*str == c)
            last = str;
    } while(*str++);
    return (char*)last;
}

char* strstr(const char* str, const char* needle) {
    if(!*needle)
        return (char*)str;
    for(; *str; ++str) {
        const char* h = str;
        const char* n = needle;
        while(*n && *h == *n) {
            ++h;
            ++n;
        }
        if(!*n)
            return (char*)str;
    }
    return NULL;
}

size_t strspn(const char* str, const char* accept) {
    const char* p = str;
    while(*p && strchr(accept, (unsigned char)*p))
        ++p;
    return (size_t)(p - str);
}

size_t strcspn(const char* str, const char* reject) {
    const char* p = str;
    while(*p && !strchr(reject, (unsigned char)*p))
        ++p;
    return (size_t)(p - str);
}

char* strpbrk(const char* str, const char* accept) {
    str += strcspn(str, accept);
    return *str ? (char*)str : NULL;
}

size_t strnlen(const char* str, size_t size) {
    size_t n = 0;
    while(n < size && str[n])
        ++n;
    return n;
}

char* strtok_r(char* str, const char* delimiters, char** saveptr) {
    if(!str)
        str = *saveptr;
    if(!str)
        return NULL;
    str += strspn(str, delimiters);
    if(!*str) {
        *saveptr = str;
        return NULL;
    }
    char* end = str + strcspn(str, delimiters);
    if(*end)
        *end++ = '\0';
    *saveptr = end;
    return str;
}

char* strtok(char* str, const char* delimiters) {
    static char* next;
    return strtok_r(str, delimiters, &next);
}

void* memcpy(void* dst, const void* src, size_t size) {
    return __avm_memcpy(dst, src, size);
}

void* memset(void* dst, int value, size_t size) {
    return __avm_memset(dst, value, size);
}

void* memmove(void* dst, const void* src, size_t size) {
    return __avm_memmove(dst, src, size);
}

int memcmp(const void* lhs, const void* rhs, size_t size) {
    return __avm_memcmp(lhs, rhs, size);
}

int strcmp(const char* lhs, const char* rhs) {
    return __avm_strcmp(lhs, rhs);
}

size_t strlen(const char* str) {
    return __avm_strlen(str);
}

char* strncpy(char* dst, const char* src, size_t size) {
    return __avm_strncpy(dst, src, size);
}

char* strncat(char* dst, const char* src, size_t size) {
    return __avm_strncat(dst, src, size);
}

#undef strcpy
char* strcpy(char* dst, const char* src) {
    return strncpy(dst, src, SIZE_MAX);
}

#undef strcat
char* strcat(char* dst, const char* src) {
    return strncat(dst, src, SIZE_MAX);
}
