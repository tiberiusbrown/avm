set(AVM_RUNTIME_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_RUNTIME_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(AVM_RUNTIME_OBJECT_DIR "${AVM_RUNTIME_BUILD_DIR}/objects")
set(AVM_RUNTIME_INCLUDE_DIR "${AVM_RUNTIME_SOURCE_DIR}/include")

set(AVM_SYSROOT_DIR
    "${CMAKE_BINARY_DIR}/avm-sysroot"
    CACHE PATH "Staged AVM target sysroot")
set(AVM_SYSROOT_INCLUDE_DIR "${AVM_SYSROOT_DIR}/include")
set(AVM_SYSROOT_LIB_DIR "${AVM_SYSROOT_DIR}/lib")

file(GLOB_RECURSE AVM_RUNTIME_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_INCLUDE_DIR}/*")

set(AVM_RUNTIME_COMMON_FLAGS
    --target=avm-unknown-arduboyfx
    -ffreestanding
    -fomit-frame-pointer
    -fno-stack-protector
    -fno-unwind-tables
    -fno-asynchronous-unwind-tables
    -ffunction-sections
    -fdata-sections
    -Os
    -Wall
    -Wextra
    -Werror
)

function(add_avm_runtime_object OUT_VAR SOURCE OUTPUT_NAME)
    set(options CXX)
    cmake_parse_arguments(ARG "${options}" "" "" ${ARGN})

    set(OUTPUT "${AVM_RUNTIME_OBJECT_DIR}/${OUTPUT_NAME}.o")
    set(LANGUAGE_FLAGS -std=c11)
    if(ARG_CXX)
        set(LANGUAGE_FLAGS
            -std=c++17
            -fno-exceptions
            -fno-rtti
            -fno-threadsafe-statics
            -fno-use-cxa-atexit
        )
    endif()

    add_custom_command(
        OUTPUT "${OUTPUT}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory
                "${AVM_RUNTIME_OBJECT_DIR}"
        COMMAND
            "$<TARGET_FILE:clang>"
            ${AVM_RUNTIME_COMMON_FLAGS}
            ${LANGUAGE_FLAGS}
            -isystem "${AVM_RUNTIME_INCLUDE_DIR}"
            -c "${SOURCE}"
            -o "${OUTPUT}"
        DEPENDS
            clang
            "${SOURCE}"
            ${AVM_RUNTIME_HEADERS}
        COMMENT "Compiling AVM runtime object ${OUTPUT_NAME}"
        VERBATIM
    )

    set(${OUT_VAR} "${OUTPUT}" PARENT_SCOPE)
endfunction()

add_avm_runtime_object(
    AVM_CRT0_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0.c"
    crt0)
add_avm_runtime_object(
    AVM_CRT0_TEST_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_test.c"
    crt0_test)
add_avm_runtime_object(
    AVM_CRT0_SKETCH_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_sketch.c"
    crt0_sketch)

add_avm_runtime_object(
    AVM_RUNTIME_CORE_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/lib/runtime.c"
    runtime)
add_avm_runtime_object(
    AVM_RUNTIME_MATH_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/lib/math.c"
    math)
add_avm_runtime_object(
    AVM_RUNTIME_STRING_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/lib/string.c"
    string)
add_avm_runtime_object(
    AVM_RUNTIME_PGMSPACE_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/lib/pgmspace.c"
    pgmspace)

set(AVM_RUNTIME_LIBRARY_OBJECTS
    "${AVM_RUNTIME_CORE_OBJECT}"
    "${AVM_RUNTIME_MATH_OBJECT}"
    "${AVM_RUNTIME_STRING_OBJECT}"
    "${AVM_RUNTIME_PGMSPACE_OBJECT}"
)

set(AVM_RUNTIME_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm.a")
add_custom_command(
    OUTPUT "${AVM_RUNTIME_LIBRARY}"
    COMMAND "${CMAKE_COMMAND}" -E rm -f "${AVM_RUNTIME_LIBRARY}"
    COMMAND
        "$<TARGET_FILE:llvm-ar>"
        rcs
        "${AVM_RUNTIME_LIBRARY}"
        ${AVM_RUNTIME_LIBRARY_OBJECTS}
    DEPENDS
        llvm-ar
        ${AVM_RUNTIME_LIBRARY_OBJECTS}
    COMMENT "Archiving libavm.a"
    VERBATIM
)

# Keep compiler helper routines in a separate archive. The initial object is
# intentionally empty; future __avm_* arithmetic helpers can be added here
# without changing application link order.
add_avm_runtime_object(
    AVM_BUILTINS_EMPTY_OBJECT
    "${AVM_RUNTIME_SOURCE_DIR}/builtins/empty.c"
    builtins_empty)

set(AVM_BUILTINS_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm-builtins.a")
add_custom_command(
    OUTPUT "${AVM_BUILTINS_LIBRARY}"
    COMMAND "${CMAKE_COMMAND}" -E rm -f "${AVM_BUILTINS_LIBRARY}"
    COMMAND
        "$<TARGET_FILE:llvm-ar>"
        rcs
        "${AVM_BUILTINS_LIBRARY}"
        "${AVM_BUILTINS_EMPTY_OBJECT}"
    DEPENDS
        llvm-ar
        "${AVM_BUILTINS_EMPTY_OBJECT}"
    COMMENT "Archiving libavm-builtins.a"
    VERBATIM
)

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
add_avm_runtime_object(
    AVM_RUNTIME_C_HEADER_CHECK
    "${AVM_RUNTIME_SOURCE_DIR}/tests/header_smoke.c"
    header_smoke_c)
add_avm_runtime_object(
    AVM_RUNTIME_CXX_HEADER_CHECK
    "${AVM_RUNTIME_SOURCE_DIR}/tests/header_smoke.cpp"
    header_smoke_cpp
    CXX)

add_custom_target(avm_runtime_checks
    DEPENDS
        "${AVM_RUNTIME_C_HEADER_CHECK}"
        "${AVM_RUNTIME_CXX_HEADER_CHECK}"
)

set(AVM_SYSROOT_STAMP "${AVM_SYSROOT_DIR}/.runtime-stamp")
add_custom_command(
    OUTPUT "${AVM_SYSROOT_STAMP}"
    COMMAND "${CMAKE_COMMAND}" -E remove_directory
            "${AVM_SYSROOT_INCLUDE_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory
            "${AVM_SYSROOT_INCLUDE_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E make_directory
            "${AVM_SYSROOT_LIB_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E copy_directory
            "${AVM_RUNTIME_INCLUDE_DIR}"
            "${AVM_SYSROOT_INCLUDE_DIR}"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_CRT0_OBJECT}"
            "${AVM_SYSROOT_LIB_DIR}/crt0.o"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_CRT0_TEST_OBJECT}"
            "${AVM_SYSROOT_LIB_DIR}/crt0_test.o"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_CRT0_SKETCH_OBJECT}"
            "${AVM_SYSROOT_LIB_DIR}/crt0_sketch.o"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_RUNTIME_LIBRARY}"
            "${AVM_SYSROOT_LIB_DIR}/libavm.a"
    COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "${AVM_BUILTINS_LIBRARY}"
            "${AVM_SYSROOT_LIB_DIR}/libavm-builtins.a"
    COMMAND "${CMAKE_COMMAND}" -E touch "${AVM_SYSROOT_STAMP}"
    DEPENDS
        ${AVM_RUNTIME_HEADERS}
        "${AVM_CRT0_OBJECT}"
        "${AVM_CRT0_TEST_OBJECT}"
        "${AVM_CRT0_SKETCH_OBJECT}"
        "${AVM_RUNTIME_LIBRARY}"
        "${AVM_BUILTINS_LIBRARY}"
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
