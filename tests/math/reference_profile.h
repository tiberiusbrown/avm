#ifndef AVM_REFERENCE_PROFILE_H
#define AVM_REFERENCE_PROFILE_H
#include <stdio.h>
#include <string.h>
static int reference_quick(int argc, char **argv)
{
    if (argc == 1) return 0;
    if (argc == 2 && strcmp(argv[1], "--quick") == 0) return 1;
    fputs("Usage: reference-test [--quick]\n", stderr);
    return -1;
}
#endif
