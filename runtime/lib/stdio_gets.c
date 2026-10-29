#include <stdio.h>
char* gets(char* s) {
    char* p = s;
    int c;
    while((c = fgetc(stdin)) != EOF && c != '\n') *p++ = (char)c;
    if(c == EOF && p == s) return NULL;
    *p = 0;
    return s;
}
