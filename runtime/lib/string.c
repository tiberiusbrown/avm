#define AVM_STRING_IMPLEMENTATION
#include <string.h>
#include <errno.h>

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

// Both delimiter address spaces share the ordinary strtok continuation state.
static char* strtok_next;

char* strtok(char* str, const char* delimiters) {
    return strtok_r(str, delimiters, &strtok_next);
}

char* strtok_P(char* str, const char AVM_PROGMEM* delimiters) {
    return strtok_rP(str, delimiters, &strtok_next);
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

int strcoll(const char* s1, const char* s2) { return strcmp(s1, s2); }

size_t strxfrm(char* dst, const char* src, size_t n) {
    size_t length = strlen(src);
    if(n) {
        size_t copy = length < n - 1 ? length : n - 1;
        for(size_t i = 0; i < copy; ++i) dst[i] = src[i];
        dst[copy] = '\0';
    }
    return length;
}

char* strerror(int errnum) {
    // Only the returned message needs RAM; keep the message table in flash.
    static char buffer[sizeof("Numerical argument out of domain")];
    const char AVM_PROGMEM* message;
    switch(errnum) {
    case EDOM: message = F("Numerical argument out of domain"); break;
    case ERANGE: message = F("Numerical result out of range"); break;
    case EILSEQ: message = F("Illegal byte sequence"); break;
    case ENOSYS: message = F("Function not implemented"); break;
    case EBADF: message = F("Bad file descriptor"); break;
    case ESPIPE: message = F("Illegal seek"); break;
    case EIO: message = F("Input/output error"); break;
    case EINVAL: message = F("Invalid argument"); break;
    default: message = F("Unknown error"); break;
    }
    return strcpy_P(buffer, message);
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

char* strcpy(char* dst, const char* src) {
    char* result = dst;
    while((*dst++ = *src++) != '\0') {}
    return result;
}

#undef strcat
char* strcat(char* dst, const char* src) {
    return strncat(dst, src, SIZE_MAX);
}
