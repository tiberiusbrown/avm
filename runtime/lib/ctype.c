#include <ctype.h>

int isalnum(int c) {
    return isalpha(c) || isdigit(c);
}

int isalpha(int c) {
    return ((unsigned int)c | 0x20u) - 'a' < 26u;
}

int isblank(int c) {
    return c == ' ' || c == '\t';
}

int iscntrl(int c) {
    return (unsigned int)c < 0x20u || c == 0x7f;
}

int isdigit(int c) {
    return (unsigned int)c - '0' < 10u;
}

int isgraph(int c) {
    return (unsigned int)c - 0x21u < 0x5eu;
}

int islower(int c) {
    return (unsigned int)c - 'a' < 26u;
}

int isprint(int c) {
    return (unsigned int)c - 0x20u < 0x5fu;
}

int ispunct(int c) {
    return isgraph(c) && !isalnum(c);
}

int isspace(int c) {
    return c == ' ' || (unsigned int)c - '\t' < 5u;
}

int isupper(int c) {
    return (unsigned int)c - 'A' < 26u;
}

int isxdigit(int c) {
    return isdigit(c) || ((unsigned int)c | 0x20u) - 'a' < 6u;
}

int tolower(int c) {
    return isupper(c) ? c + ('a' - 'A') : c;
}

int toupper(int c) {
    return islower(c) ? c - ('a' - 'A') : c;
}
