#include <stdio.h>
#include <errno.h>
#include <string.h>

void perror(const char* s) {
    int saved = errno;
    const char* message = strerror(saved);
    if(s && *s) { fputs(s, stderr); fputc(':', stderr); fputc(' ', stderr); }
    fputs(message, stderr);
    fputc('\n', stderr);
    errno = saved;
}
