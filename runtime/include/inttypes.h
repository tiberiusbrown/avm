#ifndef _AVM_RUNTIME_INTTYPES_H
#define _AVM_RUNTIME_INTTYPES_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif
typedef struct { intmax_t quot; intmax_t rem; } imaxdiv_t;
intmax_t imaxabs(intmax_t value);
imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom);
intmax_t strtoimax(const char*, char**, int);
uintmax_t strtoumax(const char*, char**, int);
intmax_t wcstoimax(const wchar_t*, wchar_t**, int);
uintmax_t wcstoumax(const wchar_t*, wchar_t**, int);
#ifdef __cplusplus
}
#endif

/* Clang supplies format modifiers for the target's exact-width types.
 * Its freestanding stdint.h aliases least/fast types to those exact types.
 * Pointer and maximum-width formats use their own target type modifiers. */
#define PRId8 __INT8_FMTd__
#define PRIi8 __INT8_FMTi__
#define PRIo8 __UINT8_FMTo__
#define PRIu8 __UINT8_FMTu__
#define PRIx8 __UINT8_FMTx__
#define PRIX8 __UINT8_FMTX__

#define PRId16 __INT16_FMTd__
#define PRIi16 __INT16_FMTi__
#define PRIo16 __UINT16_FMTo__
#define PRIu16 __UINT16_FMTu__
#define PRIx16 __UINT16_FMTx__
#define PRIX16 __UINT16_FMTX__

#define PRId32 __INT32_FMTd__
#define PRIi32 __INT32_FMTi__
#define PRIo32 __UINT32_FMTo__
#define PRIu32 __UINT32_FMTu__
#define PRIx32 __UINT32_FMTx__
#define PRIX32 __UINT32_FMTX__

#define PRId64 __INT64_FMTd__
#define PRIi64 __INT64_FMTi__
#define PRIo64 __UINT64_FMTo__
#define PRIu64 __UINT64_FMTu__
#define PRIx64 __UINT64_FMTx__
#define PRIX64 __UINT64_FMTX__

#define PRIdLEAST8 PRId8
#define PRIiLEAST8 PRIi8
#define PRIoLEAST8 PRIo8
#define PRIuLEAST8 PRIu8
#define PRIxLEAST8 PRIx8
#define PRIXLEAST8 PRIX8

#define PRIdLEAST16 PRId16
#define PRIiLEAST16 PRIi16
#define PRIoLEAST16 PRIo16
#define PRIuLEAST16 PRIu16
#define PRIxLEAST16 PRIx16
#define PRIXLEAST16 PRIX16

#define PRIdLEAST32 PRId32
#define PRIiLEAST32 PRIi32
#define PRIoLEAST32 PRIo32
#define PRIuLEAST32 PRIu32
#define PRIxLEAST32 PRIx32
#define PRIXLEAST32 PRIX32

#define PRIdLEAST64 PRId64
#define PRIiLEAST64 PRIi64
#define PRIoLEAST64 PRIo64
#define PRIuLEAST64 PRIu64
#define PRIxLEAST64 PRIx64
#define PRIXLEAST64 PRIX64

#define PRIdFAST8 PRId8
#define PRIiFAST8 PRIi8
#define PRIoFAST8 PRIo8
#define PRIuFAST8 PRIu8
#define PRIxFAST8 PRIx8
#define PRIXFAST8 PRIX8

#define PRIdFAST16 PRId16
#define PRIiFAST16 PRIi16
#define PRIoFAST16 PRIo16
#define PRIuFAST16 PRIu16
#define PRIxFAST16 PRIx16
#define PRIXFAST16 PRIX16

#define PRIdFAST32 PRId32
#define PRIiFAST32 PRIi32
#define PRIoFAST32 PRIo32
#define PRIuFAST32 PRIu32
#define PRIxFAST32 PRIx32
#define PRIXFAST32 PRIX32

#define PRIdFAST64 PRId64
#define PRIiFAST64 PRIi64
#define PRIoFAST64 PRIo64
#define PRIuFAST64 PRIu64
#define PRIxFAST64 PRIx64
#define PRIXFAST64 PRIX64

#define PRIdMAX __INTMAX_FMTd__
#define PRIiMAX __INTMAX_FMTi__
#define PRIoMAX __UINTMAX_FMTo__
#define PRIuMAX __UINTMAX_FMTu__
#define PRIxMAX __UINTMAX_FMTx__
#define PRIXMAX __UINTMAX_FMTX__

#define PRIdPTR __INTPTR_FMTd__
#define PRIiPTR __INTPTR_FMTi__
#define PRIoPTR __UINTPTR_FMTo__
#define PRIuPTR __UINTPTR_FMTu__
#define PRIxPTR __UINTPTR_FMTx__
#define PRIXPTR __UINTPTR_FMTX__

#define SCNd8 __INT8_FMTd__
#define SCNi8 __INT8_FMTi__
#define SCNo8 __UINT8_FMTo__
#define SCNu8 __UINT8_FMTu__
#define SCNx8 __UINT8_FMTx__

#define SCNd16 __INT16_FMTd__
#define SCNi16 __INT16_FMTi__
#define SCNo16 __UINT16_FMTo__
#define SCNu16 __UINT16_FMTu__
#define SCNx16 __UINT16_FMTx__

#define SCNd32 __INT32_FMTd__
#define SCNi32 __INT32_FMTi__
#define SCNo32 __UINT32_FMTo__
#define SCNu32 __UINT32_FMTu__
#define SCNx32 __UINT32_FMTx__

#define SCNd64 __INT64_FMTd__
#define SCNi64 __INT64_FMTi__
#define SCNo64 __UINT64_FMTo__
#define SCNu64 __UINT64_FMTu__
#define SCNx64 __UINT64_FMTx__

#define SCNdLEAST8 SCNd8
#define SCNiLEAST8 SCNi8
#define SCNoLEAST8 SCNo8
#define SCNuLEAST8 SCNu8
#define SCNxLEAST8 SCNx8

#define SCNdLEAST16 SCNd16
#define SCNiLEAST16 SCNi16
#define SCNoLEAST16 SCNo16
#define SCNuLEAST16 SCNu16
#define SCNxLEAST16 SCNx16

#define SCNdLEAST32 SCNd32
#define SCNiLEAST32 SCNi32
#define SCNoLEAST32 SCNo32
#define SCNuLEAST32 SCNu32
#define SCNxLEAST32 SCNx32

#define SCNdLEAST64 SCNd64
#define SCNiLEAST64 SCNi64
#define SCNoLEAST64 SCNo64
#define SCNuLEAST64 SCNu64
#define SCNxLEAST64 SCNx64

#define SCNdFAST8 SCNd8
#define SCNiFAST8 SCNi8
#define SCNoFAST8 SCNo8
#define SCNuFAST8 SCNu8
#define SCNxFAST8 SCNx8

#define SCNdFAST16 SCNd16
#define SCNiFAST16 SCNi16
#define SCNoFAST16 SCNo16
#define SCNuFAST16 SCNu16
#define SCNxFAST16 SCNx16

#define SCNdFAST32 SCNd32
#define SCNiFAST32 SCNi32
#define SCNoFAST32 SCNo32
#define SCNuFAST32 SCNu32
#define SCNxFAST32 SCNx32

#define SCNdFAST64 SCNd64
#define SCNiFAST64 SCNi64
#define SCNoFAST64 SCNo64
#define SCNuFAST64 SCNu64
#define SCNxFAST64 SCNx64

#define SCNdMAX __INTMAX_FMTd__
#define SCNiMAX __INTMAX_FMTi__
#define SCNoMAX __UINTMAX_FMTo__
#define SCNuMAX __UINTMAX_FMTu__
#define SCNxMAX __UINTMAX_FMTx__

#define SCNdPTR __INTPTR_FMTd__
#define SCNiPTR __INTPTR_FMTi__
#define SCNoPTR __UINTPTR_FMTo__
#define SCNuPTR __UINTPTR_FMTu__
#define SCNxPTR __UINTPTR_FMTx__

#endif // _AVM_RUNTIME_INTTYPES_H
