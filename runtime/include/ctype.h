#ifndef _AVM_RUNTIME_CTYPE_H
#define _AVM_RUNTIME_CTYPE_H

/* Only the fixed C locale (ASCII) is supported. Arguments must be EOF or
 * representable as unsigned char. Classification returns zero or nonzero;
 * case conversion leaves EOF and bytes without a mapping unchanged. */
#ifdef __cplusplus
extern "C" {
#endif

int isalnum(int c);
int isalpha(int c);
int isblank(int c);
int iscntrl(int c);
int isdigit(int c);
int isgraph(int c);
int islower(int c);
int isprint(int c);
int ispunct(int c);
int isspace(int c);
int isupper(int c);
int isxdigit(int c);
int tolower(int c);
int toupper(int c);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // _AVM_RUNTIME_CTYPE_H
