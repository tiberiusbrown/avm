set(AVM_RUNTIME_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(AVM_RUNTIME_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}")
set(AVM_RUNTIME_OBJECT_DIR "${AVM_RUNTIME_BUILD_DIR}/objects")
set(AVM_RUNTIME_INCLUDE_DIR "${AVM_RUNTIME_SOURCE_DIR}/include")
set(AVM_RUNTIME_MIR_BUILD_DIR "${AVM_RUNTIME_BUILD_DIR}/mir")

set(AVM_SYSROOT_DIR
    "${CMAKE_BINARY_DIR}/avm-sysroot"
    CACHE PATH "Staged AVM target sysroot")
set(AVM_SYSROOT_INCLUDE_DIR "${AVM_SYSROOT_DIR}/include")
set(AVM_SYSROOT_LIB_DIR "${AVM_SYSROOT_DIR}/lib")

file(GLOB_RECURSE AVM_RUNTIME_HEADERS CONFIGURE_DEPENDS
    "${AVM_RUNTIME_INCLUDE_DIR}/*")

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

avm_add_object(
    OUTPUT "${AVM_CRT0_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
avm_add_object(
    OUTPUT "${AVM_CRT0_TEST_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_test.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
avm_add_object(
    OUTPUT "${AVM_CRT0_SKETCH_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/crt/crt0_sketch.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)

set(AVM_RUNTIME_LIBRARY_OBJECTS)
foreach(RUNTIME_SOURCE avm runtime integer math string pgmspace)
    set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/${RUNTIME_SOURCE}.o")
    avm_add_object(
        OUTPUT "${RUNTIME_OBJECT}"
        SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/${RUNTIME_SOURCE}.c"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        DEPENDS ${AVM_RUNTIME_HEADERS}
    )
    list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")
endforeach()

set(RUNTIME_OBJECT "${AVM_RUNTIME_OBJECT_DIR}/framebuffer.o")
avm_add_object(
    OUTPUT "${RUNTIME_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/lib/framebuffer.asm"
    LANGUAGE ASM
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)
list(APPEND AVM_RUNTIME_LIBRARY_OBJECTS "${RUNTIME_OBJECT}")

set(AVM_RUNTIME_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm.a")
avm_add_archive(
    OUTPUT "${AVM_RUNTIME_LIBRARY}"
    OBJECTS ${AVM_RUNTIME_LIBRARY_OBJECTS}
)

# Keep compiler helper routines in a separate archive. The initial object is
# intentionally empty; future __avm_* arithmetic helpers can be added here
# without changing application link order.
set(AVM_BUILTINS_EMPTY_OBJECT
    "${AVM_RUNTIME_OBJECT_DIR}/builtins_empty.o")
avm_add_object(
    OUTPUT "${AVM_BUILTINS_EMPTY_OBJECT}"
    SOURCE "${AVM_RUNTIME_SOURCE_DIR}/builtins/empty.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
    DEPENDS ${AVM_RUNTIME_HEADERS}
)

set(AVM_BUILTINS_LIBRARY "${AVM_RUNTIME_BUILD_DIR}/libavm-builtins.a")
avm_add_archive(
    OUTPUT "${AVM_BUILTINS_LIBRARY}"
    OBJECTS "${AVM_BUILTINS_EMPTY_OBJECT}"
)

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

    avm_add_object(
        OUTPUT "${AVM_RUNTIME_MIR_OBJECT}"
        SOURCE "${AVM_RUNTIME_MIR_SOURCE}"
        LANGUAGE "${AVM_RUNTIME_MIR_LANGUAGE}"
        INCLUDE_DIRS "${AVM_RUNTIME_INCLUDE_DIR}"
        COMPILE_OPTIONS
            -fno-color-diagnostics
            -mllvm -print-before-all
            -mllvm -print-after-all
        STDERR_OUTPUT "${AVM_RUNTIME_MIR_OUTPUT}"
        DEPENDS ${AVM_RUNTIME_HEADERS}
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
add_dependencies(avm_runtime avm_runtime_mir)

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
foreach(STAGE_FILE IN LISTS AVM_SYSROOT_STAGE_FILES)
    string(REPLACE "|" ";" STAGE_FIELDS "${STAGE_FILE}")
    list(GET STAGE_FIELDS 0 STAGE_SOURCE)
    list(GET STAGE_FIELDS 1 STAGE_DESTINATION)
    list(APPEND AVM_SYSROOT_STAGE_COMMANDS
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
                "${STAGE_SOURCE}" "${STAGE_DESTINATION}")
    list(APPEND AVM_SYSROOT_STAGE_DEPENDS "${STAGE_SOURCE}")
endforeach()

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
    ${AVM_SYSROOT_STAGE_COMMANDS}
    COMMAND "${CMAKE_COMMAND}" -E touch "${AVM_SYSROOT_STAMP}"
    DEPENDS
        ${AVM_RUNTIME_HEADERS}
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
)
