set(AVM_RUNTIME_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_RUNTIME_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(AVM_RUNTIME_OBJECT_DIR "${AVM_RUNTIME_BUILD_DIR}/objects")
set(AVM_RUNTIME_INCLUDE_DIR "${AVM_RUNTIME_SOURCE_DIR}/include")
set(AVM_RUNTIME_MIR_BUILD_DIR "${AVM_RUNTIME_BUILD_DIR}/mir")
set(AVM_RUNTIME_ASM_DIR "${AVM_RUNTIME_BUILD_DIR}/disassembly")
set(AVM_LIBCXX_SOURCE_DIR "${CMAKE_SOURCE_DIR}/deps/llvm-project/libcxx")
set(AVM_LIBCXX_SOURCE_INCLUDE_DIR "${AVM_LIBCXX_SOURCE_DIR}/include")
set(AVM_LIBCXX_GENERATED_INCLUDE_DIR "${AVM_RUNTIME_BUILD_DIR}/libcxx/include")
set(AVM_LIBCXX_OVERRIDE_DIR "${AVM_RUNTIME_SOURCE_DIR}/libcxx-overrides")
file(MAKE_DIRECTORY "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}")

# Target-specific libc++ header configuration from the pinned template.
set(_LIBCPP_ABI_VERSION 1)
set(_LIBCPP_ABI_NAMESPACE __1)
set(_LIBCPP_ABI_FORCE_ITANIUM ON)
set(_LIBCPP_ABI_FORCE_MICROSOFT OFF)
set(_LIBCPP_HAS_THREADS OFF)
# AVM provides steady_clock from the millisecond counter behind clock(), see lib/chrono_steady.cpp.
set(_LIBCPP_HAS_MONOTONIC_CLOCK ON)
set(_LIBCPP_HAS_TERMINAL OFF)
set(_LIBCPP_HAS_MUSL_LIBC OFF)
set(_LIBCPP_HAS_THREAD_API_PTHREAD OFF)
set(_LIBCPP_HAS_THREAD_API_EXTERNAL OFF)
set(_LIBCPP_HAS_THREAD_API_WIN32 OFF)
set(_LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS ON)
set(_LIBCPP_HAS_VENDOR_AVAILABILITY_ANNOTATIONS OFF)
set(_LIBCPP_HAS_FILESYSTEM OFF)
set(_LIBCPP_HAS_RANDOM_DEVICE ON)
set(_LIBCPP_HAS_LOCALIZATION OFF)
set(_LIBCPP_HAS_UNICODE OFF)
# AVM's C runtime provides the wide-character interfaces with an 8-bit wchar_t.
set(_LIBCPP_HAS_WIDE_CHARACTERS ON)
set(_LIBCPP_HAS_TIME_ZONE_DATABASE OFF)
set(_LIBCPP_PSTL_BACKEND_SERIAL ON)
set(_LIBCPP_PSTL_BACKEND_STD_THREAD OFF)
set(_LIBCPP_PSTL_BACKEND_LIBDISPATCH OFF)
set(_LIBCPP_HARDENING_MODE_DEFAULT _LIBCPP_HARDENING_MODE_NONE)
set(_LIBCPP_ASSERTION_SEMANTIC_DEFAULT _LIBCPP_ASSERTION_SEMANTIC_IGNORE)
set(_LIBCPP_LIBC_PICOLIBC OFF)
set(_LIBCPP_LIBC_NEWLIB OFF)
# AVM compiles libc++ with -Werror; newer libc++ ABI annotation pragmas need
# their diagnostic guard active in implementation translation units.
set(_LIBCPP_EXTRA_SITE_DEFINES
    "#define _LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER\n#define _LIBCPP_ABI_USE_SMALL_DEQUE_BLOCK_SIZE")
configure_file("${AVM_LIBCXX_SOURCE_INCLUDE_DIR}/__config_site.in"
    "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__config_site" @ONLY)
configure_file("${AVM_LIBCXX_SOURCE_DIR}/vendor/llvm/default_assertion_handler.in"
    "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__assertion_handler" COPYONLY)
# AVM's threads-off atomic wait, staged over the libc++ header in the sysroot.
file(MAKE_DIRECTORY "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__atomic")
configure_file("${AVM_LIBCXX_OVERRIDE_DIR}/__atomic/atomic_sync.h"
    "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__atomic/atomic_sync.h" COPYONLY)
file(MAKE_DIRECTORY "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__memory_resource")
configure_file(
    "${AVM_LIBCXX_OVERRIDE_DIR}/__memory_resource/unsynchronized_pool_resource.h"
    "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__memory_resource/unsynchronized_pool_resource.h"
    COPYONLY)

# Record the production objects for checked-in disassembly. Diagnostic MIR
# compilations and header smoke tests do not describe shipped runtime code.
function(avm_add_runtime_object)
    cmake_parse_arguments(DISASM "" "SOURCE;OUTPUT" "" ${ARGN})
    avm_add_object(${ARGN})
    set_property(DIRECTORY PROPERTY "AVM_RUNTIME_RECIPE_${DISASM_OUTPUT}" "${ARGN}")
    set_property(DIRECTORY APPEND PROPERTY AVM_RUNTIME_DISASSEMBLY_OBJECTS
        "${DISASM_SOURCE}|${DISASM_OUTPUT}")
endfunction()

set(RUNTIME_SOURCES
    assert atexit audio_tone avm wctype wchar_string wchar_numeric wchar_time wchar_stream
    wchar_format wchar_scan ctype exit fenv font_5x7 font_br4 font_br5 font_br5d_x5 font_br5n
    local_dtor immediate_exit inttypes locale malloc eh_cxa eh_unwind rtti_dynamic dynamic_cast
    dynamic_cast_void multibyte math math_standard math_c23 complex_standard pgmspace qsort
    bsearch runtime trap_lookup trap_report signal stdio stdio_control stdio_error stdio_files
    stdio_format stdio_getchar stdio_gets stdio_input stdio_output stdio_perror stdio_position
    stdio_printf stdio_putchar stdio_puts stdio_scan_core stdio_scan_integer stdio_scan_float
    stdio_scan_string stdio_scan_stream stdio_scan_stdin stdio_stderr stdio_stdin stdio_stdout
    stdlib quick_exit strfrom uchar stdbit strtof strtof_internal string time time_calendar
    time_mktime time_gmtime time_localtime time_names time_asctime time_ctime time_strftime
    time_timespec time_gmtime_r time_localtime_r time_timegm termination
)

set(AVM_SYSROOT_DIR
    "${CMAKE_BINARY_DIR}/avm-sysroot"
    CACHE PATH "Staged AVM target sysroot")
set(AVM_SYSROOT_INCLUDE_DIR "${AVM_SYSROOT_DIR}/include")
set(AVM_SYSROOT_LIB_DIR "${AVM_SYSROOT_DIR}/lib")

file(GLOB_RECURSE AVM_RUNTIME_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_INCLUDE_DIR}/*")
file(GLOB_RECURSE AVM_LIBCXX_HEADERS CONFIGURE_DEPENDS LIST_DIRECTORIES false
    "${AVM_LIBCXX_SOURCE_INCLUDE_DIR}/*")
# AVM's overrides of libc++ headers are build inputs of the same kind, so they are listed here.
list(APPEND AVM_LIBCXX_HEADERS "${AVM_LIBCXX_OVERRIDE_DIR}/__atomic/atomic_sync.h")
list(APPEND AVM_LIBCXX_HEADERS
    "${AVM_LIBCXX_OVERRIDE_DIR}/__memory_resource/unsynchronized_pool_resource.h")
set(AVM_RUNTIME_HEADER_MANIFEST
    "${CMAKE_CURRENT_BINARY_DIR}/runtime-headers.txt")
string(JOIN "\n" AVM_RUNTIME_HEADER_PATHS ${AVM_RUNTIME_HEADERS})
file(GENERATE OUTPUT "${AVM_RUNTIME_HEADER_MANIFEST}"
    CONTENT "${AVM_RUNTIME_HEADER_PATHS}\n")

set(AVM_CRT0_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/crt0.o")
set(AVM_CRT0_TEST_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/crt0_test.o")
set(AVM_CRT0_SKETCH_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/crt0_sketch.o")
set(AVM_CRT_INIT_FINI_HEADER "${AVM_RUNTIME_SOURCE_DIR}/crt/init_fini.h")

avm_add_runtime_object(
    OUTPUT "${AVM_CRT0_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS "${AVM_CRT_INIT_FINI_HEADER}"
)
avm_add_runtime_object(
    OUTPUT "${AVM_CRT0_TEST_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_test.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS "${AVM_CRT_INIT_FINI_HEADER}"
)
avm_add_runtime_object(
    OUTPUT "${AVM_CRT0_SKETCH_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_sketch.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS "${AVM_CRT_INIT_FINI_HEADER}"
)

file(GLOB AVM_RUNTIME_MATH_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_SOURCE_DIR}/lib/math/*.h")
set(AVM_RUNTIME_LIBRARY_OBJECTS)
foreach(RUNTIME_SOURCE ${RUNTIME_SOURCES})
    set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/${RUNTIME_SOURCE}.o")
    set(runtime_source_options)
    set(runtime_extra_dependencies)
    if(RUNTIME_SOURCE MATCHES "^eh_")
        list(APPEND runtime_extra_dependencies "${AVM_RUNTIME_SOURCE_DIR}/lib/eh_unwind_internal.h"
            "${AVM_RUNTIME_SOURCE_DIR}/lib/eh_unwind_layout.h")
    endif()
    if(RUNTIME_SOURCE MATCHES "^(stdio_|wchar_(stream|format|scan)$)")
        list(APPEND runtime_extra_dependencies "${AVM_RUNTIME_SOURCE_DIR}/lib/stdio_internal.h")
    endif()
    if(RUNTIME_SOURCE MATCHES "^(stdio_scan_|wchar_scan$)")
        list(APPEND runtime_extra_dependencies "${AVM_RUNTIME_SOURCE_DIR}/lib/stdio_scan_internal.h")
    endif()
    if(RUNTIME_SOURCE MATCHES "^time_")
        list(APPEND runtime_extra_dependencies "${AVM_RUNTIME_SOURCE_DIR}/lib/time_internal.h")
    endif()
    if(RUNTIME_SOURCE MATCHES "^(strtof|stdio_scan_|wchar_scan$)")
        list(APPEND runtime_extra_dependencies "${AVM_RUNTIME_SOURCE_DIR}/lib/strtof_internal.h")
    endif()
    if(RUNTIME_SOURCE STREQUAL "termination")
        list(APPEND runtime_extra_dependencies "${AVM_CRT_INIT_FINI_HEADER}")
    endif()
    if(RUNTIME_SOURCE MATCHES "^math(_c23)?$")
        set(runtime_source_options -O3 -ffp-contract=off -fwrapv -fno-jump-tables)
    endif()
    # The unwinder never unwinds through its own frames, so its helpers need no
    # CFI. Each FDE would otherwise add an AVEH5 record for every helper.
    if(RUNTIME_SOURCE STREQUAL "eh_unwind")
        set(runtime_source_options -fno-unwind-tables -fno-asynchronous-unwind-tables)
    endif()
    avm_add_runtime_object(
        OUTPUT "${RUNTIME_OBJECT}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/${RUNTIME_SOURCE}.c"
        LANGUAGE C
        COMPILE_OPTIONS ${runtime_source_options}
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        DEPENDS
            ${runtime_extra_dependencies}
    )
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")
endforeach()

# Keep each source in its own archive member. These declarations also supply
# the diagnostic build; flags are never reconstructed from a filename.
function(avm_runtime_cxx stem source)
    if(source MATCHES "^@libcxx/")
        string(REPLACE "@libcxx/" "${AVM_LIBCXX_SOURCE_DIR}/" source "${source}")
    else()
        set(source "${AVM_RUNTIME_SOURCE_DIR}/${source}")
    endif()
    set(object "${AVM_RUNTIME_OBJECT_DIR}/${stem}.o")
    avm_add_runtime_object(OUTPUT "${object}" SOURCE "${source}"
        LANGUAGE CXX INTERNAL_CXX
        INCLUDE_DIRS "${AVM_LIBCXX_SOURCE_DIR}/src" "${AVM_RUNTIME_INCLUDE_DIR}"
        COMPILE_OPTIONS ${ARGN}
        DEPENDS "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__config_site"
            "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__assertion_handler")
    set(AVM_RUNTIME_LIBRARY_OBJECTS ${AVM_RUNTIME_LIBRARY_OBJECTS} "${object}" PARENT_SCOPE)
endfunction()

avm_runtime_cxx(cxxabi lib/cxxabi.cpp)

avm_runtime_cxx(libcxx_algorithm @libcxx/src/algorithm.cpp -D_LIBCPP_BUILDING_LIBRARY -Wno-unused-parameter)

# Header-driven libc++ facilities with small out-of-line runtime pieces.
foreach(LIBCXX_SOURCE
        any expected hash memory memory_resource random stdexcept string valarray variant verbose_abort)
    set(AVM_LIBCXX_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/libcxx_${LIBCXX_SOURCE}.o")
    set(libcxx_source_options -D_LIBCPP_BUILDING_LIBRARY -fexceptions)
    if(LIBCXX_SOURCE STREQUAL "memory_resource")
        list(APPEND libcxx_source_options -Wno-unused-parameter)
    endif()
    if(LIBCXX_SOURCE MATCHES "^(any|expected|memory|random|stdexcept|variant)$")
        list(APPEND libcxx_source_options -frtti)
    endif()
    avm_runtime_cxx(libcxx_${LIBCXX_SOURCE} @libcxx/src/${LIBCXX_SOURCE}.cpp
        ${libcxx_source_options})
endforeach()

# The standard freestanding hash specializations in <memory> use this helper
# when libc++'s configured deployment version exports it from the runtime.
avm_runtime_cxx(libcxx_hash_memory lib/libcxx_hash_memory.cpp -D_LIBCPP_BUILDING_LIBRARY)

# std::function's failure exception has out-of-line ABI members in libc++. Keep
# those members without pulling in libc++'s hash implementation, whose supported
# word sizes do not include AVM's 16-bit size_t.
avm_runtime_cxx(libcxx_functional lib/libcxx_functional.cpp -frtti)

# Standard exception classes and std::bad_typeid live in their own objects, so a
# program that does not name them links none of their RTTI or vtables. The
# -frtti and -fexceptions options follow the SDK defaults, so they take effect.
avm_runtime_cxx(exception_base lib/exception_base.cpp -frtti)

avm_runtime_cxx(eh_bad_typeid lib/eh_bad_typeid.cpp -frtti -fexceptions)

# std::bad_cast and __cxa_bad_cast are a separate object, so a program that never fails a
# reference cast links none of them. It has the same flags as the bad_typeid object.
avm_runtime_cxx(eh_bad_cast lib/eh_bad_cast.cpp -frtti -fexceptions)

# Allocation functions. Each replaceable function is weak in new.o, which needs -fexceptions
# to throw std::bad_alloc through the AVM exception ABI. Each class and function group is in
# its own object, so a program links only the groups that it names.
avm_runtime_cxx(new lib/new.cpp -fexceptions)

# The deallocation functions never throw, so they are a separate object. A program that only
# deletes objects, such as one with a virtual destructor, links no exception classes.
avm_runtime_cxx(delete lib/delete.cpp)

# std::set_new_handler and std::get_new_handler, and std::nothrow and std::__throw_bad_alloc,
# come from the pinned libc++ sources. The helpers throw bad_alloc, so they need -fexceptions.
avm_runtime_cxx(libcxx_new_handler @libcxx/src/new_handler.cpp -D_LIBCPP_BUILDING_LIBRARY)

avm_runtime_cxx(libcxx_new_helpers @libcxx/src/new_helpers.cpp -D_LIBCPP_BUILDING_LIBRARY -fexceptions)

# The standard exception classes for allocation and dynamic-typing failures, which name the
# RTTI and vtable of their key functions, as eh_bad_typeid.o and eh_bad_cast.o do.
avm_runtime_cxx(eh_bad_alloc lib/eh_bad_alloc.cpp -frtti -fexceptions)

avm_runtime_cxx(eh_bad_exception lib/eh_bad_exception.cpp -frtti)

# std::exception_ptr and its operations. The rethrow passes its parameter's reference through
# unwinding, so the object needs -fexceptions for the parameter's destructor.
avm_runtime_cxx(exception_ptr lib/exception_ptr.cpp -frtti -fexceptions)

# std::terminate and its handler slot. A throwing handler reaches the terminate landing pad,
# so the object needs -fexceptions.
avm_runtime_cxx(exception_terminate lib/exception_terminate.cpp -fexceptions)

# std::chrono::steady_clock, which high_resolution_clock names under the monotonic-clock setting
# above.
avm_runtime_cxx(chrono_steady lib/chrono_steady.cpp)

set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/framebuffer.o")
avm_add_runtime_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/framebuffer.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/audio.o")
avm_add_runtime_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/audio.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}")
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

set(RUNTIME_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/setjmp.o")
avm_add_runtime_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/setjmp.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

# Exception support is linked only when a program references these objects.
foreach(eh_asm eh_context eh_cxa_throw eh_cxa_rethrow eh_cxa_rethrow_primary eh_unwind_resume)
    set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/${eh_asm}.o")
    avm_add_runtime_object(
        OUTPUT "${RUNTIME_OBJECT}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/${eh_asm}.asm"
        LANGUAGE ASM
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        DEPENDS "${AVM_RUNTIME_SOURCE_DIR}/lib/eh_unwind_internal.h"
            "${AVM_RUNTIME_SOURCE_DIR}/lib/eh_unwind_layout.h"
    )
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")
endforeach()

set(RUNTIME_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/trap_entry.o")
avm_add_runtime_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/trap_entry.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

# Float-only libm kernels are linked on demand into guest program memory.
set(AVM_MATH_KERNELS
    ef_remainder ef_remquo sf_rint sf_nearbyint sf_lrint sf_lround sf_llrint sf_llround sf_ilogb sf_logb sf_fdim sf_nan sf_fmaxmag sf_fminmag
    ef_gamma ef_erf ef_sinh ef_cosh ef_tanh ef_asinh ef_acosh ef_atanh
    ef_exp2 ef_expm1 ef_log1p ef_cbrt ef_asin ef_acos sf_decompose
    ef_atan2 ef_exp ef_fmod ef_hypot ef_log ef_log10 ef_pow ef_rem_pio2 ef_sqrt
    kf_cos kf_rem_pio2 kf_sin kf_tan
    sf_atan sf_ceil sf_fma sf_copysign sf_cos sf_fabs sf_floor sf_round sf_scalbn
    sf_sin sf_sincos sf_tan sf_trunc
    sf_roundeven sf_fromfp sf_llogb sf_nextup sf_canonicalize sf_extremum sf_iseqsig sf_narrow)
foreach(kernel IN LISTS AVM_MATH_KERNELS)
    set(math_object "${AVM_RUNTIME_OBJECT_DIR}/math_${kernel}.o")
    avm_add_runtime_object(
        OUTPUT "${math_object}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/math/${kernel}.c"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        COMPILE_OPTIONS -O3 -ffp-contract=off -fwrapv -fno-jump-tables)
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${math_object}")
endforeach()

file(GLOB AVM_RUNTIME_COMPLEX_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_SOURCE_DIR}/lib/complex/*.h")
set(AVM_COMPLEX_KERNELS basic exp_log sqrt pow trig hyperbolic inverse)
foreach(kernel IN LISTS AVM_COMPLEX_KERNELS)
    set(complex_object "${AVM_RUNTIME_OBJECT_DIR}/complex_${kernel}.o")
    avm_add_runtime_object(
        OUTPUT "${complex_object}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/complex/${kernel}.c"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        COMPILE_OPTIONS -O3 -ffp-contract=off -fwrapv -fno-jump-tables
        DEPENDS ${AVM_RUNTIME_COMPLEX_HEADERS})
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${complex_object}")
endforeach()

set(AVM_BUILTINS_COMPLEX_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/builtins_complex.o")
avm_add_runtime_object(
    OUTPUT "${AVM_BUILTINS_COMPLEX_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/complex.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    COMPILE_OPTIONS -O3 -ffp-contract=off
    DEPENDS ${AVM_RUNTIME_COMPLEX_HEADERS})

set(AVM_RUNTIME_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm.a")
avm_add_archive(
    OUTPUT "${AVM_RUNTIME_LIBRARY}"
    OBJECTS ${AVM_RUNTIME_LIBRARY_OBJECTS}
)

# Keep compiler helper routines together in the final archive so wide helpers
# can call the 32-bit routines without depending on archive rescanning.
set(AVM_BUILTINS_INTEGER_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/builtins_integer.o")
avm_add_runtime_object(
    OUTPUT "${AVM_BUILTINS_INTEGER_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/integer.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)
set(AVM_BUILTINS_WIDE_INTEGER_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/builtins_wide_integer.o")
avm_add_runtime_object(
    OUTPUT "${AVM_BUILTINS_WIDE_INTEGER_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/wide_integer.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)
set(AVM_BUILTINS_ATOMIC_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/builtins_atomic.o")
avm_add_runtime_object(
    OUTPUT "${AVM_BUILTINS_ATOMIC_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/atomic.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)

set(AVM_BUILTINS_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm-builtins.a")
avm_add_archive(
    OUTPUT "${AVM_BUILTINS_LIBRARY}"
    OBJECTS
        "${AVM_BUILTINS_INTEGER_OBJECT}"
        "${AVM_BUILTINS_WIDE_INTEGER_OBJECT}"
        "${AVM_BUILTINS_ATOMIC_OBJECT}"
        "${AVM_BUILTINS_COMPLEX_OBJECT}"
)

# Disassemble production objects, retaining relocations so calls and constant
# references can be inspected before final-link relaxation. Mirror source paths
# to avoid collisions and keep the output independent of the build directory.
get_property(AVM_RUNTIME_DISASSEMBLY_OBJECTS DIRECTORY
    PROPERTY AVM_RUNTIME_DISASSEMBLY_OBJECTS)
set(AVM_RUNTIME_ASM_OUTPUTS)
foreach(runtime_object IN LISTS AVM_RUNTIME_DISASSEMBLY_OBJECTS)
    string(REPLACE "|" ";" runtime_object_fields "${runtime_object}")
    list(GET runtime_object_fields 0 runtime_source)
    list(GET runtime_object_fields 1 runtime_input)
    if(runtime_source MATCHES "^${AVM_LIBCXX_SOURCE_DIR}/")
        file(RELATIVE_PATH relative "${AVM_LIBCXX_SOURCE_DIR}" "${runtime_source}")
        set(runtime_relative "libcxx/${relative}")
    else()
        file(RELATIVE_PATH runtime_relative "${AVM_RUNTIME_SOURCE_DIR}" "${runtime_source}")
    endif()
    string(REGEX REPLACE "\\.[^.]+$" ".asm" runtime_relative
        "${runtime_relative}")
    set(runtime_disassembly "${AVM_RUNTIME_ASM_DIR}/${runtime_relative}")
    get_filename_component(runtime_asm_dir "${runtime_disassembly}" DIRECTORY)
    add_custom_command(
        OUTPUT "${runtime_disassembly}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${runtime_asm_dir}"
        COMMAND "${CMAKE_COMMAND}"
            "-DAVM_OBJDUMP:FILEPATH=$<TARGET_FILE:llvm-objdump>"
            "-DAVM_INPUT:FILEPATH=${runtime_input}"
            "-DAVM_OUTPUT:FILEPATH=${runtime_disassembly}"
            -DAVM_RELOCATIONS:BOOL=ON
            -P "${AVM_DISASSEMBLE_SCRIPT}"
        DEPENDS llvm-objdump "${runtime_input}" "${AVM_DISASSEMBLE_SCRIPT}"
        COMMENT "Disassembling AVM runtime ${runtime_relative}"
        VERBATIM)
    list(APPEND AVM_RUNTIME_ASM_OUTPUTS "${runtime_disassembly}")
endforeach()
add_custom_target(avm_runtime_asm DEPENDS ${AVM_RUNTIME_ASM_OUTPUTS})

# Diagnostic compilations reuse the production recipe, including per-source
# exception, RTTI and floating-point options.
set(AVM_RUNTIME_MIR_OUTPUTS)
foreach(record IN LISTS AVM_RUNTIME_DISASSEMBLY_OBJECTS)
    string(REPLACE "|" ";" fields "${record}")
    list(GET fields 0 source)
    list(GET fields 1 object)
    if(source MATCHES "\\.asm$")
        continue()
    endif()
    get_filename_component(stem "${object}" NAME_WE)
    get_property(recipe DIRECTORY PROPERTY "AVM_RUNTIME_RECIPE_${object}")
    list(FIND recipe OUTPUT output_index)
    math(EXPR output_index "${output_index} + 1")
    list(REMOVE_AT recipe ${output_index})
    list(INSERT recipe ${output_index} "${AVM_RUNTIME_MIR_BUILD_DIR}/${stem}.o")
    # Append to the existing COMPILE_OPTIONS field by adding the dump flags
    # before its next keyword, rather than introducing a second field.
    list(FIND recipe COMPILE_OPTIONS options_index)
    if(options_index EQUAL -1)
        list(APPEND recipe COMPILE_OPTIONS)
        list(LENGTH recipe options_index)
    else()
        math(EXPR options_index "${options_index} + 1")
    endif()
    list(INSERT recipe ${options_index} -fno-color-diagnostics
        -mllvm -print-before-all -mllvm -print-after-all)
    avm_add_object(${recipe} STDERR_OUTPUT "${AVM_RUNTIME_MIR_BUILD_DIR}/${stem}.mir")
    list(APPEND AVM_RUNTIME_MIR_OUTPUTS "${AVM_RUNTIME_MIR_BUILD_DIR}/${stem}.mir")
endforeach()
add_custom_target(avm_runtime_mir DEPENDS ${AVM_RUNTIME_MIR_OUTPUTS})

add_custom_target(avm_runtime
    DEPENDS
        "${AVM_CRT0_OBJECT}"
        "${AVM_CRT0_TEST_OBJECT}"
        "${AVM_CRT0_SKETCH_OBJECT}"
        "${AVM_RUNTIME_LIBRARY}"
        "${AVM_BUILTINS_LIBRARY}"
)

# Compile-only checks verify that direct call syntax selects the macro path,
# while address-taking and parenthesized calls still name real functions.
set(AVM_RUNTIME_C_HEADER_CHECK
    "${AVM_RUNTIME_OBJECT_DIR}/header_smoke_c.o")
set(AVM_RUNTIME_CXX_HEADER_CHECK
    "${AVM_RUNTIME_OBJECT_DIR}/header_smoke_cpp.o")
avm_add_object(
    OUTPUT "${AVM_RUNTIME_C_HEADER_CHECK}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/tests/header_smoke.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_LIBCXX_HEADERS}
)
avm_add_object(
    OUTPUT "${AVM_RUNTIME_CXX_HEADER_CHECK}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/tests/header_smoke_cpp.cpp"
    LANGUAGE CXX
    INTERNAL_CXX
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS
        "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__config_site"
        "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/__assertion_handler"
)

set(AVM_RUNTIME_WCHAR_C99_CHECK
    "${AVM_RUNTIME_OBJECT_DIR}/wchar_header_c99.o")
avm_add_object(
    OUTPUT "${AVM_RUNTIME_WCHAR_C99_CHECK}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/tests/wchar_header_c99.c"
    LANGUAGE C
    COMPILE_OPTIONS -std=c99 -pedantic-errors
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
)

add_custom_target(avm_runtime_checks
    DEPENDS
        "${AVM_RUNTIME_C_HEADER_CHECK}"
        "${AVM_RUNTIME_CXX_HEADER_CHECK}"
        "${AVM_RUNTIME_WCHAR_C99_CHECK}"
)

# Describe each staged library artifact as source|destination and expand the
# data into a single stamp-producing command.
set(AVM_SYSROOT_STAGE_FILES
    "${AVM_CRT0_OBJECT}|${AVM_SYSROOT_LIB_DIR}/crt0.o"
    "${AVM_CRT0_TEST_OBJECT}|${AVM_SYSROOT_LIB_DIR}/crt0_test.o"
    "${AVM_CRT0_SKETCH_OBJECT}|${AVM_SYSROOT_LIB_DIR}/crt0_sketch.o"
    "${AVM_RUNTIME_LIBRARY}|${AVM_SYSROOT_LIB_DIR}/libavm.a"
    "${AVM_BUILTINS_LIBRARY}|${AVM_SYSROOT_LIB_DIR}/libavm-builtins.a"
)
set(AVM_SYSROOT_STAGE_COMMANDS)
set(AVM_SYSROOT_STAGE_DEPENDS)
set(AVM_SYSROOT_STAGE_BYPRODUCTS)
foreach(STAGE_FILE IN LISTS AVM_SYSROOT_STAGE_FILES)
    string(REPLACE "|" ";" STAGE_FIELDS "${STAGE_FILE}")
    list(GET STAGE_FIELDS 0 STAGE_SOURCE)
    list(GET STAGE_FIELDS 1 STAGE_DESTINATION)
    list(APPEND AVM_SYSROOT_STAGE_COMMANDS
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "${STAGE_SOURCE}" "${STAGE_DESTINATION}")
    list(APPEND AVM_SYSROOT_STAGE_DEPENDS "${STAGE_SOURCE}")
    list(APPEND AVM_SYSROOT_STAGE_BYPRODUCTS "${STAGE_DESTINATION}")
endforeach()

# Resolve each installed header exactly once, with generated overrides winning.
# The build-time synchronizer preserves unchanged timestamps and removes headers
# dropped from the previous manifest.
set(stage_header_sources)
set(stage_header_destinations)
foreach(source IN LISTS AVM_RUNTIME_HEADERS AVM_LIBCXX_HEADERS)
    if(source MATCHES "CMakeLists\\.txt$|\\.in$")
        continue()
    endif()
    if(source MATCHES "^${AVM_RUNTIME_INCLUDE_DIR}/")
        file(RELATIVE_PATH relative "${AVM_RUNTIME_INCLUDE_DIR}" "${source}")
    elseif(source MATCHES "^${AVM_LIBCXX_SOURCE_INCLUDE_DIR}/")
        file(RELATIVE_PATH relative "${AVM_LIBCXX_SOURCE_INCLUDE_DIR}" "${source}")
        set(relative "c++/v1/${relative}")
    else()
        continue()
    endif()
    list(APPEND stage_header_sources "${source}")
    list(APPEND stage_header_destinations "${relative}")
endforeach()
foreach(relative __config_site __assertion_handler __atomic/atomic_sync.h
        __memory_resource/unsynchronized_pool_resource.h)
    set(destination "c++/v1/${relative}")
    list(FIND stage_header_destinations "${destination}" index)
    if(NOT index EQUAL -1)
        list(REMOVE_AT stage_header_destinations ${index})
        list(REMOVE_AT stage_header_sources ${index})
    endif()
    list(APPEND stage_header_sources "${AVM_LIBCXX_GENERATED_INCLUDE_DIR}/${relative}")
    list(APPEND stage_header_destinations "${destination}")
endforeach()
set(header_plan "set(AVM_HEADER_SOURCES")
foreach(source IN LISTS stage_header_sources)
    string(APPEND header_plan " [==[${source}]==]")
endforeach()
string(APPEND header_plan ")\nset(AVM_HEADER_DESTINATIONS")
foreach(relative IN LISTS stage_header_destinations)
    string(APPEND header_plan " [==[${relative}]==]")
endforeach()
string(APPEND header_plan ")\n")
set(AVM_HEADER_PLAN "${CMAKE_CURRENT_BINARY_DIR}/stage-headers.cmake")
file(GENERATE OUTPUT "${AVM_HEADER_PLAN}" CONTENT "${header_plan}")
list(APPEND AVM_SYSROOT_STAGE_COMMANDS
    COMMAND "${CMAKE_COMMAND}" "-DAVM_HEADER_PLAN:FILEPATH=${AVM_HEADER_PLAN}"
        "-DAVM_INCLUDE_DIR:PATH=${AVM_SYSROOT_INCLUDE_DIR}"
        -P "${PROJECT_SOURCE_DIR}/cmake/StageAvmHeaders.cmake")
list(APPEND AVM_SYSROOT_STAGE_DEPENDS ${stage_header_sources}
    "${AVM_HEADER_PLAN}" "${PROJECT_SOURCE_DIR}/cmake/StageAvmHeaders.cmake")

set(AVM_SYSROOT_STAMP "${AVM_SYSROOT_DIR}/.runtime-stamp")
add_custom_command(
    OUTPUT "${AVM_SYSROOT_STAMP}"
    BYPRODUCTS ${AVM_SYSROOT_STAGE_BYPRODUCTS}
    COMMAND "${CMAKE_COMMAND}" -E make_directory
            "${AVM_SYSROOT_INCLUDE_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory
            "${AVM_SYSROOT_LIB_DIR}"
    ${AVM_SYSROOT_STAGE_COMMANDS}
    COMMAND "${CMAKE_COMMAND}" -E touch "${AVM_SYSROOT_STAMP}"
    DEPENDS
        ${AVM_RUNTIME_HEADERS}
        ${AVM_LIBCXX_HEADERS}
        "${AVM_RUNTIME_HEADER_MANIFEST}"
        ${AVM_SYSROOT_STAGE_DEPENDS}
    COMMENT "Staging the AVM runtime sysroot"
    VERBATIM
)

add_custom_target(avm_sysroot
    DEPENDS "${AVM_SYSROOT_STAMP}"
)

add_custom_target(avm_sdk
    DEPENDS
        avm_toolchain
        avm_sysroot
        avm_runtime_checks
)

add_custom_target(avm_runtime_asm_update
    COMMAND "${CMAKE_COMMAND}" -E copy_directory "${AVM_RUNTIME_ASM_DIR}"
        "${AVM_RUNTIME_SOURCE_DIR}/asm"
    DEPENDS avm_runtime_asm VERBATIM)
