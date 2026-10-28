set(AVM_RUNTIME_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_RUNTIME_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(AVM_RUNTIME_OBJECT_DIR "${AVM_RUNTIME_BUILD_DIR}/objects")
set(AVM_RUNTIME_INCLUDE_DIR "${AVM_RUNTIME_SOURCE_DIR}/include")
set(AVM_RUNTIME_MIR_BUILD_DIR "${AVM_RUNTIME_BUILD_DIR}/mir")
set(AVM_RUNTIME_ASM_DIR "${AVM_RUNTIME_SOURCE_DIR}/asm")

# Record the production objects for checked-in disassembly. Diagnostic MIR
# compilations and header smoke tests do not describe shipped runtime code.
function(avm_add_runtime_object)
    cmake_parse_arguments(DISASM "" "SOURCE;OUTPUT" "" ${ARGN})
    avm_add_object(${ARGN})
    set_property(DIRECTORY APPEND PROPERTY AVM_RUNTIME_DISASSEMBLY_OBJECTS
        "${DISASM_SOURCE}|${DISASM_OUTPUT}")
endfunction()

set(RUNTIME_SOURCES
    assert
    atexit
    audio_tone
    avm
    ctype
    exit
    font_5x7
    font_br4
    font_br5
    font_br5d_x5
    font_br5n
    local_dtor
    immediate_exit
    inttypes
    locale
    math
    pgmspace
    qsort
    bsearch
    runtime
    stdio
    stdlib
    strtof
    string
    time
    termination
)

set(AVM_SYSROOT_DIR
    "${CMAKE_BINARY_DIR}/avm-sysroot"
    CACHE PATH "Staged AVM target sysroot")
set(AVM_SYSROOT_INCLUDE_DIR "${AVM_SYSROOT_DIR}/include")
set(AVM_SYSROOT_LIB_DIR "${AVM_SYSROOT_DIR}/lib")

file(GLOB_RECURSE AVM_RUNTIME_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_INCLUDE_DIR}/*")
set(AVM_RUNTIME_HEADER_MANIFEST
    "${CMAKE_CURRENT_BINARY_DIR}/runtime-headers.txt")
string(JOIN "\n" AVM_RUNTIME_HEADER_PATHS ${AVM_RUNTIME_HEADERS})
file(GENERATE OUTPUT "${AVM_RUNTIME_HEADER_MANIFEST}"
    CONTENT "${AVM_RUNTIME_HEADER_PATHS}\n")

# Capture pass-by-pass LLVM IR/MIR for every C and C++ translation unit in the
# runtime. Assembly sources are excluded because they do not pass through LLVM
# code generation and therefore have no MIR to dump.
file(GLOB_RECURSE AVM_RUNTIME_MIR_SOURCES CONFIGURE_DEPENDS
    "${AVM_RUNTIME_SOURCE_DIR}/crt/*.c"
    "${AVM_RUNTIME_SOURCE_DIR}/crt/*.cpp"
    "${AVM_RUNTIME_SOURCE_DIR}/lib/*.c"
    "${AVM_RUNTIME_SOURCE_DIR}/lib/*.cpp"
    "${AVM_RUNTIME_SOURCE_DIR}/builtins/*.c"
    "${AVM_RUNTIME_SOURCE_DIR}/builtins/*.cpp"
    "${AVM_RUNTIME_SOURCE_DIR}/tests/*.c"
    "${AVM_RUNTIME_SOURCE_DIR}/tests/*.cpp")

set(AVM_CRT0_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/crt0.o")
set(AVM_CRT0_TEST_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/crt0_test.o")
set(AVM_CRT0_SKETCH_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/crt0_sketch.o")
set(AVM_CRT_INIT_FINI_HEADER "${AVM_RUNTIME_SOURCE_DIR}/crt/init_fini.h")

avm_add_runtime_object(
    OUTPUT "${AVM_CRT0_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS} "${AVM_CRT_INIT_FINI_HEADER}"
)
avm_add_runtime_object(
    OUTPUT "${AVM_CRT0_TEST_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_test.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS} "${AVM_CRT_INIT_FINI_HEADER}"
)
avm_add_runtime_object(
    OUTPUT "${AVM_CRT0_SKETCH_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_sketch.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS} "${AVM_CRT_INIT_FINI_HEADER}"
)

file(GLOB AVM_RUNTIME_MATH_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_SOURCE_DIR}/lib/math/*.h")
set(AVM_RUNTIME_LIBRARY_OBJECTS)
foreach(RUNTIME_SOURCE ${RUNTIME_SOURCES})
    set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/${RUNTIME_SOURCE}.o")
    set(runtime_math_options)
    set(runtime_extra_dependencies)
    if(RUNTIME_SOURCE STREQUAL "termination")
        list(APPEND runtime_extra_dependencies "${AVM_CRT_INIT_FINI_HEADER}")
    endif()
    if(RUNTIME_SOURCE STREQUAL "math")
        set(runtime_math_options -O3 -ffp-contract=off -fwrapv -fno-jump-tables)
    endif()
    avm_add_runtime_object(
        OUTPUT "${RUNTIME_OBJECT}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/${RUNTIME_SOURCE}.c"
        LANGUAGE C
        COMPILE_OPTIONS ${runtime_math_options}
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        DEPENDS ${AVM_RUNTIME_HEADERS} ${AVM_RUNTIME_MATH_HEADERS}
            ${runtime_extra_dependencies}
    )
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")
endforeach()

set(AVM_RUNTIME_CXX_ABI_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/cxxabi.o")
avm_add_runtime_object(
    OUTPUT "${AVM_RUNTIME_CXX_ABI_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/cxxabi.cpp"
    LANGUAGE CXX
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${AVM_RUNTIME_CXX_ABI_OBJECT}")

set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/framebuffer.o")
avm_add_runtime_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/framebuffer.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/audio.o")
avm_add_runtime_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/audio.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS})
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

# Float-only libm kernels are linked on demand into guest program memory.
set(AVM_MATH_KERNELS
    ef_remainder ef_remquo sf_rint sf_nearbyint sf_lrint sf_lround sf_llrint sf_llround sf_ilogb sf_logb sf_fdim sf_nan sf_fmaxmag sf_fminmag
    ef_sinh ef_cosh ef_tanh ef_asinh ef_acosh ef_atanh
    ef_exp2 ef_expm1 ef_log1p ef_cbrt ef_asin ef_acos sf_decompose
    ef_atan2 ef_exp ef_fmod ef_hypot ef_log ef_log10 ef_pow ef_rem_pio2 ef_sqrt
    kf_cos kf_rem_pio2 kf_sin kf_tan
    sf_atan sf_ceil sf_fma sf_copysign sf_cos sf_fabs sf_floor sf_round sf_scalbn
    sf_sin sf_sincos sf_tan sf_trunc)
foreach(kernel IN LISTS AVM_MATH_KERNELS)
    set(math_object "${AVM_RUNTIME_OBJECT_DIR}/math_${kernel}.o")
    avm_add_runtime_object(
        OUTPUT "${math_object}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/math/${kernel}.c"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        COMPILE_OPTIONS -O3 -ffp-contract=off -fwrapv -fno-jump-tables
        DEPENDS ${AVM_RUNTIME_HEADERS} ${AVM_RUNTIME_MATH_HEADERS})
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${math_object}")
endforeach()

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
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
set(AVM_BUILTINS_WIDE_INTEGER_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/builtins_wide_integer.o")
avm_add_runtime_object(
    OUTPUT "${AVM_BUILTINS_WIDE_INTEGER_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/wide_integer.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
set(AVM_BUILTINS_ATOMIC_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/builtins_atomic.o")
avm_add_runtime_object(
    OUTPUT "${AVM_BUILTINS_ATOMIC_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/atomic.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)

set(AVM_BUILTINS_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm-builtins.a")
avm_add_archive(
    OUTPUT "${AVM_BUILTINS_LIBRARY}"
    OBJECTS
        "${AVM_BUILTINS_INTEGER_OBJECT}"
        "${AVM_BUILTINS_WIDE_INTEGER_OBJECT}"
        "${AVM_BUILTINS_ATOMIC_OBJECT}"
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
    file(RELATIVE_PATH runtime_relative
        "${AVM_RUNTIME_SOURCE_DIR}" "${runtime_source}")
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
add_custom_target(avm_runtime_asm ALL DEPENDS ${AVM_RUNTIME_ASM_OUTPUTS})

# Diagnostic-only duplicate compilations. Preserve each source's relative path
# below mir/ so equal basenames in different runtime directories cannot collide.
set(AVM_RUNTIME_MIR_OUTPUTS)
foreach(AVM_RUNTIME_MIR_SOURCE IN LISTS AVM_RUNTIME_MIR_SOURCES)
    file(RELATIVE_PATH AVM_RUNTIME_MIR_RELATIVE
        "${AVM_RUNTIME_SOURCE_DIR}" "${AVM_RUNTIME_MIR_SOURCE}")
    get_filename_component(AVM_RUNTIME_MIR_EXTENSION
        "${AVM_RUNTIME_MIR_SOURCE}" LAST_EXT)
    string(REGEX REPLACE "\\.[^.]+$" "" AVM_RUNTIME_MIR_STEM
        "${AVM_RUNTIME_MIR_RELATIVE}")

    if(AVM_RUNTIME_MIR_EXTENSION STREQUAL ".c")
        set(AVM_RUNTIME_MIR_LANGUAGE C)
    else()
        set(AVM_RUNTIME_MIR_LANGUAGE CXX)
    endif()

    set(AVM_RUNTIME_MIR_OBJECT
        "${AVM_RUNTIME_MIR_BUILD_DIR}/${AVM_RUNTIME_MIR_STEM}.o")
    set(AVM_RUNTIME_MIR_OUTPUT
        "${AVM_RUNTIME_MIR_BUILD_DIR}/${AVM_RUNTIME_MIR_STEM}.mir")

    set(math_mir_options)
    if(AVM_RUNTIME_MIR_RELATIVE MATCHES "^lib/math[/.]")
        set(math_mir_options -O3 -ffp-contract=off -fwrapv -fno-jump-tables)
    endif()
    avm_add_object(
        OUTPUT "${AVM_RUNTIME_MIR_OBJECT}"
        SOURCE "${AVM_RUNTIME_MIR_SOURCE}"
        LANGUAGE "${AVM_RUNTIME_MIR_LANGUAGE}"
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        COMPILE_OPTIONS
            ${math_mir_options}
            -fno-color-diagnostics
            -mllvm -print-before-all
            -mllvm -print-after-all
        STDERR_OUTPUT "${AVM_RUNTIME_MIR_OUTPUT}"
        DEPENDS ${AVM_RUNTIME_HEADERS} ${AVM_RUNTIME_MATH_HEADERS} "${AVM_CRT_INIT_FINI_HEADER}"
    )
    list(APPEND AVM_RUNTIME_MIR_OUTPUTS
        "${AVM_RUNTIME_MIR_OBJECT}"
        "${AVM_RUNTIME_MIR_OUTPUT}")
endforeach()

add_custom_target(avm_runtime_mir
    DEPENDS ${AVM_RUNTIME_MIR_OUTPUTS})

add_custom_target(avm_runtime
    DEPENDS
        "${AVM_CRT0_OBJECT}"
        "${AVM_CRT0_TEST_OBJECT}"
        "${AVM_CRT0_SKETCH_OBJECT}"
        "${AVM_RUNTIME_LIBRARY}"
        "${AVM_BUILTINS_LIBRARY}"
)
add_dependencies(avm_runtime avm_runtime_mir avm_runtime_asm)

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
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
avm_add_object(
    OUTPUT "${AVM_RUNTIME_CXX_HEADER_CHECK}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/tests/header_smoke_cpp.cpp"
    LANGUAGE CXX
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)

add_custom_target(avm_runtime_checks
    DEPENDS
        "${AVM_RUNTIME_C_HEADER_CHECK}"
        "${AVM_RUNTIME_CXX_HEADER_CHECK}"
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

set(AVM_SYSROOT_STAMP "${AVM_SYSROOT_DIR}/.runtime-stamp")
add_custom_command(
    OUTPUT "${AVM_SYSROOT_STAMP}"
    BYPRODUCTS ${AVM_SYSROOT_STAGE_BYPRODUCTS}
    COMMAND "${CMAKE_COMMAND}" -E remove_directory
            "${AVM_SYSROOT_INCLUDE_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory
            "${AVM_SYSROOT_INCLUDE_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory
            "${AVM_SYSROOT_LIB_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E copy_directory
            "${AVM_RUNTIME_INCLUDE_DIR}"
            "${AVM_SYSROOT_INCLUDE_DIR}"
    ${AVM_SYSROOT_STAGE_COMMANDS}
    COMMAND "${CMAKE_COMMAND}" -E touch "${AVM_SYSROOT_STAMP}"
    DEPENDS
        ${AVM_RUNTIME_HEADERS}
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
        avm_runtime_mir
        avm_runtime_asm
)
