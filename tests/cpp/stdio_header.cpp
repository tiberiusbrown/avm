#include <stdio.h>

static int ram_plus_one(char *dst, size_t size,
                        const char *format, va_list args)
{
    return vsnprintf(dst, size, format, args) + 1;
}

static int program_plus_one(char *dst, size_t size,
                            const char AVM_PROGMEM *format, va_list args)
{
    return vsnprintf_P(dst, size, format, args) + 1;
}

static int call_ram_plus_one(char *dst, size_t size, const char *format, ...)
{
    va_list args;
    int result;
    va_start(args, format);
    result = ram_plus_one(dst, size, format, args);
    va_end(args);
    return result;
}

static int call_program_plus_one(
    char *dst, size_t size, const char AVM_PROGMEM *format, ...)
{
    va_list args;
    int result;
    va_start(args, format);
    result = program_plus_one(dst, size, format, args);
    va_end(args);
    return result;
}

extern "C" int avm_test_main(void)
{
    char dst[4];

    if(call_ram_plus_one(dst, sizeof(dst), "%d", 7) != 2 ||
       dst[0] != '7' || dst[1] != '\0')
        return 1;

    if(call_program_plus_one(dst, sizeof(dst), F("%d"), 8) != 2 ||
       dst[0] != '8' || dst[1] != '\0')
        return 2;

    return 0;
}
