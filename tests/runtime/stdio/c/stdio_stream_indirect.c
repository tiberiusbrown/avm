#include <stdio.h>
static int (*volatile indirect_fgetc)(FILE*) = &fgetc;
#define fgetc indirect_fgetc
static int (*volatile indirect_getc)(FILE*) = &getc;
#define getc indirect_getc
static int (*volatile indirect_getchar)(void) = &getchar;
#define getchar indirect_getchar
static char* (*volatile indirect_gets)(char*) = &gets;
#define gets indirect_gets
static char* (*volatile indirect_fgets)(char*, int, FILE*) = &fgets;
#define fgets indirect_fgets
static int (*volatile indirect_fputc)(int, FILE*) = &fputc;
#define fputc indirect_fputc
static int (*volatile indirect_putc)(int, FILE*) = &putc;
#define putc indirect_putc
static int (*volatile indirect_putchar)(int) = &putchar;
#define putchar indirect_putchar
static int (*volatile indirect_puts)(const char*) = &puts;
#define puts indirect_puts
static int (*volatile indirect_fputs)(const char*, FILE*) = &fputs;
#define fputs indirect_fputs
static int (*volatile indirect_ungetc)(int, FILE*) = &ungetc;
#define ungetc indirect_ungetc
static size_t (*volatile indirect_fread)(void*, size_t, size_t, FILE*) = &fread;
#define fread indirect_fread
static size_t (*volatile indirect_fwrite)(const void*, size_t, size_t, FILE*) = &fwrite;
#define fwrite indirect_fwrite
static int (*volatile indirect_fflush)(FILE*) = &fflush;
#define fflush indirect_fflush
static int (*volatile indirect_fclose)(FILE*) = &fclose;
#define fclose indirect_fclose
static void (*volatile indirect_setbuf)(FILE*, char*) = &setbuf;
#define setbuf indirect_setbuf
static int (*volatile indirect_setvbuf)(FILE*, char*, int, size_t) = &setvbuf;
#define setvbuf indirect_setvbuf
static void (*volatile indirect_clearerr)(FILE*) = &clearerr;
#define clearerr indirect_clearerr
static int (*volatile indirect_feof)(FILE*) = &feof;
#define feof indirect_feof
static int (*volatile indirect_ferror)(FILE*) = &ferror;
#define ferror indirect_ferror
static FILE* (*volatile indirect_fopen)(const char*, const char*) = &fopen;
#define fopen indirect_fopen
static FILE* (*volatile indirect_freopen)(const char*, const char*, FILE*) = &freopen;
#define freopen indirect_freopen
static int (*volatile indirect_remove)(const char*) = &remove;
#define remove indirect_remove
static int (*volatile indirect_rename)(const char*, const char*) = &rename;
#define rename indirect_rename
static FILE* (*volatile indirect_tmpfile)(void) = &tmpfile;
#define tmpfile indirect_tmpfile
static char* (*volatile indirect_tmpnam)(char*) = &tmpnam;
#define tmpnam indirect_tmpnam
static void (*volatile indirect_perror)(const char*) = &perror;
#define perror indirect_perror
static int (*volatile indirect_fseek)(FILE*, long, int) = &fseek;
#define fseek indirect_fseek
static long (*volatile indirect_ftell)(FILE*) = &ftell;
#define ftell indirect_ftell
static int (*volatile indirect_fgetpos)(FILE*, fpos_t*) = &fgetpos;
#define fgetpos indirect_fgetpos
static int (*volatile indirect_fsetpos)(FILE*, const fpos_t*) = &fsetpos;
#define fsetpos indirect_fsetpos
static void (*volatile indirect_rewind)(FILE*) = &rewind;
#define rewind indirect_rewind
#include "stdio_stream.c"
