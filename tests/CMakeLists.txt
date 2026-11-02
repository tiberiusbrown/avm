set(AVM_ASM_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/asm")
set(AVM_C_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/c")
set(AVM_CXX_TEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cpp")
set(AVM_TEST_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/avm_tests.cpp")
set(AVM_ASM_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/asm")
set(AVM_C_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/c")
set(AVM_CXX_TEST_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/cpp")
# Compile every C and C++ fixture at each supported optimization setting.
set(AVM_TEST_OPT_LEVELS O0 O1 O2 O3 Os Oz)
string(JOIN "," AVM_TEST_OPT_LEVELS_CSV ${AVM_TEST_OPT_LEVELS})
# The O0 draw_text_clipping reference renderer needs about 25 emulated seconds.
# Ardens advance() takes picoseconds; allow 60 seconds for each fixture.
set(AVM_TEST_ADVANCE_LIMIT
    "60000000000000" CACHE STRING
    "Maximum emulated time in picoseconds allowed for each AVM test")

# CONFIGURE_DEPENDS makes CMake regenerate when a test is added or removed.
file(GLOB AVM_ASM_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/*.asm")
# Exception-runtime assembly tests link libavm.a, so the ordinary matrix leaves
# them out. avm_eh_catch_all_run builds and runs them.
list(FILTER AVM_ASM_TEST_SOURCES EXCLUDE REGEX "/eh_[^/]*\\.asm$")
file(GLOB AVM_EH_ASM_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/eh_*.asm")
file(GLOB_RECURSE AVM_ASM_TEST_SUPPORT_SOURCES CONFIGURE_DEPENDS
    "${AVM_ASM_TEST_DIR}/include/*")
file(GLOB AVM_C_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_C_TEST_DIR}/*.c")
file(GLOB AVM_C_TEST_HEADERS CONFIGURE_DEPENDS "${AVM_C_TEST_DIR}/*.h")
list(APPEND AVM_C_TEST_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_policy.h")
file(GLOB AVM_CXX_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_CXX_TEST_DIR}/*.cpp")
# Exception fixtures need -fexceptions and the EH runtime, so the ordinary
# matrix leaves them out. avm_eh_catch_all_run builds and runs them instead.
list(FILTER AVM_CXX_TEST_SOURCES EXCLUDE REGEX "/eh_[^/]*\\.cpp$")
file(GLOB AVM_EH_CXX_TEST_SOURCES CONFIGURE_DEPENDS
    "${AVM_CXX_TEST_DIR}/eh_*.cpp")

set(AVM_TEST_IMAGE_OUTPUTS)

foreach(AVM_TEST_ASM IN LISTS AVM_ASM_TEST_SOURCES)
    get_filename_component(AVM_TEST_NAME "${AVM_TEST_ASM}" NAME_WE)
    set(AVM_TEST_OBJECT "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
    set(AVM_TEST_ELF "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
    set(AVM_TEST_IMAGE "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")

    avm_add_object(
        OUTPUT "${AVM_TEST_OBJECT}"
        SOURCE "${AVM_TEST_ASM}"
        LANGUAGE ASM
        INCLUDE_DIRS "${AVM_ASM_TEST_DIR}"
        DEPENDS ${AVM_ASM_TEST_SUPPORT_SOURCES}
    )
    avm_add_image(
        OBJECTS "${AVM_TEST_OBJECT}"
        OUTPUT_ELF "${AVM_TEST_ELF}"
        OUTPUT_IMAGE "${AVM_TEST_IMAGE}"
        ENTRY _start
    )
    list(APPEND AVM_TEST_IMAGE_OUTPUTS "${AVM_TEST_IMAGE}")
endforeach()

# Compile and package freestanding C and C++ tests. Each test is linked with
# crt0_test.o, which prints P or F from main's return value and terminates with
# SYS debug_break so the runner can compare serial output.
foreach(AVM_TEST_LANGUAGE C CXX)
    if(AVM_TEST_LANGUAGE STREQUAL "C")
        set(AVM_COMPILED_TEST_SOURCES ${AVM_C_TEST_SOURCES})
        set(AVM_COMPILED_TEST_BINARY_DIR "${AVM_C_TEST_BINARY_DIR}")
    else()
        set(AVM_COMPILED_TEST_SOURCES ${AVM_CXX_TEST_SOURCES})
        set(AVM_COMPILED_TEST_BINARY_DIR "${AVM_CXX_TEST_BINARY_DIR}")
    endif()

    foreach(AVM_TEST_OPT_LEVEL IN LISTS AVM_TEST_OPT_LEVELS)
      set(AVM_OPT_TEST_BINARY_DIR
          "${AVM_COMPILED_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}")
      foreach(AVM_TEST_SOURCE_FILE IN LISTS AVM_COMPILED_TEST_SOURCES)
        get_filename_component(AVM_TEST_NAME
            "${AVM_TEST_SOURCE_FILE}" NAME_WE)
        set(AVM_TEST_OBJECT
            "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
        set(AVM_TEST_ELF
            "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
        set(AVM_TEST_IMAGE
            "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")
        set(test_objects "${AVM_TEST_OBJECT}")
        set(test_support_sources)
        set(test_source_dependencies)
        if(AVM_TEST_NAME MATCHES "^(wchar_(string|multibyte|numeric|time|stream|format|scan))_indirect$")
            list(APPEND test_source_dependencies
                "${AVM_C_TEST_DIR}/${CMAKE_MATCH_1}.c")
        endif()
        if(AVM_TEST_NAME MATCHES "^wchar_stream(_indirect)?$")
            list(APPEND test_source_dependencies
                "${PROJECT_SOURCE_DIR}/runtime/lib/stdio_internal.h")
        endif()

        if(AVM_TEST_LANGUAGE STREQUAL "CXX")
            if(AVM_TEST_NAME MATCHES "^math_(standard|native|c99_exact|c99_classify|c99_functions|hyperbolic|misc|errno)$")
                list(APPEND test_source_dependencies "${AVM_C_TEST_DIR}/${AVM_TEST_NAME}.c")
            elseif(AVM_TEST_NAME MATCHES "^(stdio_scan_(integers|floats|strings|streams|stress)|wctype|ctype|assert_failure|c99_smalllib|inttypes_interface|string_(search|progmem_search)|stdlib_(integer|conversion|float|multibyte|sort|random))$")
                list(APPEND test_source_dependencies
                    "${AVM_C_TEST_DIR}/${AVM_TEST_NAME}.c" "${AVM_C_TEST_DIR}/stdio_scan_helpers.h")
            elseif(AVM_TEST_NAME STREQUAL "display_system")
                list(APPEND test_source_dependencies
                    "${AVM_C_TEST_DIR}/display_system.c")
            elseif(AVM_TEST_NAME STREQUAL "printf_long_long")
                list(APPEND test_source_dependencies
                    "${AVM_C_TEST_DIR}/printf_long_long.c")
            elseif(AVM_TEST_NAME MATCHES "^time_(clock|calendar|text|strftime|unavailable)$")
                list(APPEND test_source_dependencies
                    "${AVM_C_TEST_DIR}/${AVM_TEST_NAME}.c")
            elseif(AVM_TEST_NAME STREQUAL "separate_compilation")
                set(test_support_sources
                    "${AVM_CXX_TEST_DIR}/support/separate_compilation_impl.cpp")
                list(APPEND test_source_dependencies
                    "${AVM_CXX_TEST_DIR}/support/separate_compilation.h")
            elseif(AVM_TEST_NAME STREQUAL "atexit_lifetime")
                set(test_support_sources "${AVM_CXX_TEST_DIR}/support/atexit_lifetime.cpp")
            elseif(AVM_TEST_NAME STREQUAL "libcxx_freestanding")
                set(test_support_sources
                    "${AVM_CXX_TEST_DIR}/support/libcxx_freestanding_ranges_sort.cpp")
            elseif(AVM_TEST_NAME STREQUAL "multiple_translation_units")
                set(test_support_sources
                    "${AVM_CXX_TEST_DIR}/support/multiple_translation_units_a.cpp"
                    "${AVM_CXX_TEST_DIR}/support/multiple_translation_units_b.cpp")
                list(APPEND test_source_dependencies
                    "${AVM_CXX_TEST_DIR}/support/multiple_translation_units.h")
            endif()
        endif()

        if(AVM_TEST_LANGUAGE STREQUAL "C" AND AVM_TEST_NAME STREQUAL "complex_abi")
            set(test_support_sources "${AVM_C_TEST_DIR}/support/complex_abi_impl.c")
        endif()
        set(test_compile_options "-${AVM_TEST_OPT_LEVEL}")
        set(test_include_dirs "${AVM_SYSROOT_DIR}/include")
        if(AVM_TEST_LANGUAGE STREQUAL "CXX")
            # AVM Clang discovers both libc++ and the C runtime from its
            # computed sysroot; keep explicit C include paths out of C++ builds
            # so the driver's libc++-before-C search order remains effective.
            set(test_include_dirs)
        endif()
        if(AVM_TEST_LANGUAGE STREQUAL "C" AND AVM_TEST_NAME STREQUAL "c23_freestanding")
            list(APPEND test_compile_options -std=c23 -pedantic-errors)
        endif()
        if(AVM_TEST_NAME MATCHES "^(tgmath_real|tgmath_complex|complex_.*)$")
            list(APPEND test_compile_options -std=c99 -pedantic-errors)
        endif()
        if(AVM_TEST_NAME MATCHES "^stdio_(stream|format)(_indirect)?$")
            list(APPEND test_source_dependencies
                "${AVM_C_TEST_DIR}/stdio_stream.c" "${AVM_C_TEST_DIR}/stdio_format.c")
        endif()
        if(AVM_TEST_LANGUAGE STREQUAL "CXX" AND AVM_TEST_NAME MATCHES "^stdio_(stream|format|large)(_indirect)?$")
            list(APPEND test_source_dependencies "${AVM_C_TEST_DIR}/${AVM_TEST_NAME}.c")
        endif()
        if(AVM_TEST_NAME MATCHES "^(ff_fixed|vla)$")
            list(APPEND test_compile_options -mllvm -verify-machineinstrs)
        endif()
        if(AVM_TEST_LANGUAGE STREQUAL "CXX" AND AVM_TEST_NAME STREQUAL "vla")
            list(APPEND test_source_dependencies "${AVM_C_TEST_DIR}/vla.c")
        endif()
        # Exercise whole-program virtual, member-pointer, and lifetime dispatch in the
        # emulator as well as retaining the ordinary compilation matrix.
        if(AVM_TEST_LANGUAGE STREQUAL "CXX" AND
           AVM_TEST_OPT_LEVEL STREQUAL "O2" AND
           AVM_TEST_NAME MATCHES "^(virtual_dispatch|member_pointers|global_lifetime|local_static_lifetime|interleaved_lifetime|atexit_.*|termination_.*)$")
            list(APPEND test_compile_options -flto=full)
        endif()

        if(AVM_TEST_LANGUAGE STREQUAL "C" AND AVM_TEST_OPT_LEVEL STREQUAL "O2"
           AND AVM_TEST_NAME MATCHES "^(atexit_|termination_)")
            list(APPEND test_compile_options -flto=full)
        endif()
        if(AVM_TEST_NAME MATCHES "^(atexit_|termination_)")
            list(APPEND test_source_dependencies ${AVM_C_TEST_SOURCES})
        endif()
        if(AVM_TEST_NAME STREQUAL "termination_early_exit_only")
            list(APPEND test_source_dependencies
                "${AVM_CXX_TEST_DIR}/termination_early_exit.cpp")
        endif()
        avm_add_object(
            OUTPUT "${AVM_TEST_OBJECT}"
            SOURCE "${AVM_TEST_SOURCE_FILE}"
            LANGUAGE ${AVM_TEST_LANGUAGE}
            INCLUDE_DIRS ${test_include_dirs}
            COMPILE_OPTIONS ${test_compile_options}
            DEPENDS avm_sysroot ${test_source_dependencies} ${AVM_C_TEST_HEADERS}
        )
        foreach(test_support_source IN LISTS test_support_sources)
            get_filename_component(test_support_name
                "${test_support_source}" NAME_WE)
            set(test_support_object
                "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}_${test_support_name}.o")
            set(test_support_compile_options ${test_compile_options})
            if(AVM_TEST_NAME STREQUAL "libcxx_freestanding" AND
               AVM_TEST_OPT_LEVEL STREQUAL "O0")
                # The generic ranges sort partition path exceeds the AVM VM
                # stack at O0. Keep the runtime test enabled using the SDK's
                # normal optimized helper body in this one configuration.
                list(APPEND test_support_compile_options -O2)
            endif()
            avm_add_object(
                OUTPUT "${test_support_object}"
                SOURCE "${test_support_source}"
                LANGUAGE ${AVM_TEST_LANGUAGE}
                INCLUDE_DIRS ${test_include_dirs}
                COMPILE_OPTIONS ${test_support_compile_options}
                DEPENDS avm_sysroot ${test_source_dependencies}
            )
            list(APPEND test_objects "${test_support_object}")
        endforeach()
        set(test_link_options)
        if(AVM_TEST_NAME MATCHES "^atexit_capacity([0-9]+)$")
            list(APPEND test_link_options "--avm-atexit-capacity=${CMAKE_MATCH_1}")
        endif()
        if(AVM_TEST_NAME STREQUAL "member_pointer_high_address")
            # Keep data and ordinary code below 64 KiB while placing the
            # member-function target at the reported failing address.
            list(APPEND test_link_options
                "--image-base=0x100"
                "--section-start=.data=0x100"
                "--section-start=.text=0x200"
                "--section-start=.rodata=0x2000"
                "--section-start=.high_member_text=0x101F6")
        elseif(AVM_TEST_NAME STREQUAL "setjmp_high_address")
            list(APPEND test_link_options
                "--image-base=0x100"
                "--section-start=.data=0x100"
                "--section-start=.text=0x200"
                "--section-start=.high_setjmp_text=0x10100")
        elseif(AVM_TEST_NAME STREQUAL "progmem_address_hoisting")
            # Exercise high program bases, low-word carries and wide offsets.
            list(APPEND test_link_options
                "--image-base=0x100"
                "--section-start=.data=0x100"
                "--section-start=.text=0x200"
                "--section-start=.rodata=0x10000"
                "--section-start=.high_program_bytes=0x1FFFC")
        endif()
        set(test_startup "${AVM_SYSROOT_DIR}/lib/crt0_test.o")
        if(AVM_TEST_NAME STREQUAL "termination_main")
            set(test_startup "${AVM_SYSROOT_DIR}/lib/crt0.o")
        elseif(AVM_TEST_NAME STREQUAL "termination_sketch")
            set(test_startup "${AVM_SYSROOT_DIR}/lib/crt0_sketch.o")
        endif()
        avm_add_image(
            OBJECTS ${test_objects}
            OUTPUT_ELF "${AVM_TEST_ELF}"
            OUTPUT_IMAGE "${AVM_TEST_IMAGE}"
            ENTRY _start
            STARTUP "${test_startup}"
            LIBRARIES
                "${AVM_SYSROOT_DIR}/lib/libavm.a"
                "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            GC_SECTIONS
            LINK_OPTIONS ${test_link_options}
            DEPENDS avm_sysroot
        )
        list(APPEND AVM_TEST_IMAGE_OUTPUTS "${AVM_TEST_IMAGE}")
        if(AVM_TEST_NAME MATCHES "^math_")
            list(APPEND AVM_MATH_FULL_IMAGES "${AVM_TEST_IMAGE}")
            if(AVM_TEST_OPT_LEVEL MATCHES "^(O0|O2)$")
                list(APPEND AVM_MATH_FAST_IMAGES "${AVM_TEST_IMAGE}")
            endif()
        endif()
      endforeach()
    endforeach()
endforeach()

add_custom_target(avm_test_images DEPENDS ${AVM_TEST_IMAGE_OUTPUTS})

# Stage 1 catch-all exception fixtures. The images use the standard C++ image
# paths, and the runner selects them by the eh_ prefix. The ordinary matrix
# above does not build them.
set(AVM_EH_TEST_OPT_LEVELS O0 O2)
set(AVM_EH_TEST_IMAGES)
foreach(AVM_TEST_ASM IN LISTS AVM_EH_ASM_TEST_SOURCES)
    get_filename_component(AVM_TEST_NAME "${AVM_TEST_ASM}" NAME_WE)
    set(AVM_TEST_OBJECT "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
    set(AVM_TEST_ELF "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
    set(AVM_TEST_IMAGE "${AVM_ASM_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")
    avm_add_object(
        OUTPUT "${AVM_TEST_OBJECT}"
        SOURCE "${AVM_TEST_ASM}"
        LANGUAGE ASM
        INCLUDE_DIRS "${AVM_ASM_TEST_DIR}"
        DEPENDS avm_sysroot ${AVM_ASM_TEST_SUPPORT_SOURCES}
    )
    avm_add_image(
        OBJECTS "${AVM_TEST_OBJECT}"
        OUTPUT_ELF "${AVM_TEST_ELF}"
        OUTPUT_IMAGE "${AVM_TEST_IMAGE}"
        ENTRY _start
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        DEPENDS avm_sysroot
    )
    list(APPEND AVM_EH_TEST_IMAGES "${AVM_TEST_IMAGE}")
endforeach()

# Headers that exception fixtures include from their support translation units.
set(AVM_EH_SUPPORT_HEADERS
    "${AVM_CXX_TEST_DIR}/support/eh_inheritance.h"
    "${AVM_CXX_TEST_DIR}/support/eh_rtti_identity.h"
    "${AVM_CXX_TEST_DIR}/support/eh_typed.h")
foreach(AVM_TEST_SOURCE_FILE IN LISTS AVM_EH_CXX_TEST_SOURCES)
    get_filename_component(AVM_TEST_NAME "${AVM_TEST_SOURCE_FILE}" NAME_WE)
    foreach(AVM_TEST_OPT_LEVEL IN LISTS AVM_EH_TEST_OPT_LEVELS)
        set(AVM_OPT_TEST_BINARY_DIR
            "${AVM_CXX_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}")
        set(AVM_TEST_OBJECT "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.o")
        set(AVM_TEST_ELF "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.elf")
        set(AVM_TEST_IMAGE "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}.bin")
        # -fexceptions follows the SDK's -fno-exceptions default, so it wins.
        avm_add_object(
            OUTPUT "${AVM_TEST_OBJECT}"
            SOURCE "${AVM_TEST_SOURCE_FILE}"
            LANGUAGE CXX
            COMPILE_OPTIONS "-${AVM_TEST_OPT_LEVEL}" -fexceptions
            DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
        )
        set(AVM_EH_IMAGE_OBJECTS "${AVM_TEST_OBJECT}")
        set(AVM_EH_IMAGE_LINK_OPTIONS)
        if(AVM_TEST_NAME STREQUAL "eh_rtti_identity")
            # The second unit throws the same class, so its descriptor must
            # merge with the one emitted by the main unit.
            set(AVM_EH_UNIT_OBJECT "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}_unit.o")
            avm_add_object(
                OUTPUT "${AVM_EH_UNIT_OBJECT}"
                SOURCE "${AVM_CXX_TEST_DIR}/support/eh_rtti_identity_unit.cpp"
                LANGUAGE CXX
                COMPILE_OPTIONS "-${AVM_TEST_OPT_LEVEL}" -fexceptions
                DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
            )
            list(APPEND AVM_EH_IMAGE_OBJECTS "${AVM_EH_UNIT_OBJECT}")
        elseif(AVM_TEST_NAME STREQUAL "eh_typed")
            # The unit throws Remote, which the main unit catches by exact type.
            set(AVM_EH_UNIT_OBJECT "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}_unit.o")
            avm_add_object(
                OUTPUT "${AVM_EH_UNIT_OBJECT}"
                SOURCE "${AVM_CXX_TEST_DIR}/support/eh_typed_unit.cpp"
                LANGUAGE CXX
                COMPILE_OPTIONS "-${AVM_TEST_OPT_LEVEL}" -fexceptions
                DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
            )
            list(APPEND AVM_EH_IMAGE_OBJECTS "${AVM_EH_UNIT_OBJECT}")
        elseif(AVM_TEST_NAME STREQUAL "eh_inheritance_cross_unit")
            # The unit builds and throws Joined, which the main unit catches by its bases.
            set(AVM_EH_UNIT_OBJECT "${AVM_OPT_TEST_BINARY_DIR}/${AVM_TEST_NAME}_unit.o")
            avm_add_object(
                OUTPUT "${AVM_EH_UNIT_OBJECT}"
                SOURCE "${AVM_CXX_TEST_DIR}/support/eh_inheritance_unit.cpp"
                LANGUAGE CXX
                COMPILE_OPTIONS "-${AVM_TEST_OPT_LEVEL}" -fexceptions
                DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
            )
            list(APPEND AVM_EH_IMAGE_OBJECTS "${AVM_EH_UNIT_OBJECT}")
        elseif(AVM_TEST_NAME STREQUAL "eh_rtti_high_address"
               OR AVM_TEST_NAME STREQUAL "eh_typed_high_address"
               OR AVM_TEST_NAME STREQUAL "eh_inheritance_high_address")
            # Put the descriptors and the destructor above 0xFFFF. The image keeps
            # its data and ordinary code below 64 KiB, as the other high-address
            # fixtures do. Explicit section starts replace the AVM default layout,
            # which would define __avm_heap_start after .data, so the heap start is
            # given here. The 16 bytes of .data end at 0x110.
            list(APPEND AVM_EH_IMAGE_LINK_OPTIONS
                "--image-base=0x100"
                "--section-start=.data=0x100"
                "--section-start=.text=0x200"
                "--section-start=.rodata=0x10000"
                "--section-start=.high_far_text=0x11000"
                "--defsym=__avm_heap_start=0x110")
        endif()
        avm_add_image(
            OBJECTS ${AVM_EH_IMAGE_OBJECTS}
            OUTPUT_ELF "${AVM_TEST_ELF}"
            OUTPUT_IMAGE "${AVM_TEST_IMAGE}"
            ENTRY _start
            STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
            LIBRARIES
                "${AVM_SYSROOT_DIR}/lib/libavm.a"
                "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            LINK_OPTIONS ${AVM_EH_IMAGE_LINK_OPTIONS}
            GC_SECTIONS
            DEPENDS avm_sysroot
        )
        list(APPEND AVM_EH_TEST_IMAGES "${AVM_TEST_IMAGE}")
    endforeach()
endforeach()

add_custom_target(avm_eh_catch_all_images DEPENDS ${AVM_EH_TEST_IMAGES})
# Checks the AVEH4 block of each exception-enabled image against the linked ELF,
# and checks that a program which never references the runtime has none.
set(AVM_EH_VERIFY_ARGS)
foreach(AVM_TEST_OPT_LEVEL IN LISTS AVM_EH_TEST_OPT_LEVELS)
    foreach(AVM_EH_VERIFY_NAME IN ITEMS eh_catch_all eh_call8 eh_cleanup eh_typed)
        set(AVM_EH_ELF "${AVM_CXX_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}/${AVM_EH_VERIFY_NAME}.elf")
        set(AVM_EH_IMAGE "${AVM_CXX_TEST_BINARY_DIR}/${AVM_TEST_OPT_LEVEL}/${AVM_EH_VERIFY_NAME}.bin")
        list(APPEND AVM_EH_VERIFY_ARGS --eh-elf "${AVM_EH_ELF}" --eh-image "${AVM_EH_IMAGE}")
    endforeach()
endforeach()
find_package(Python3 COMPONENTS Interpreter REQUIRED)

# The O2 link-time-optimized variants of the frame-sensitive fixtures. They live
# in their own image directory, so the runners select them with --cpp-bin-dir.
set(AVM_EH_LTO_BIN_DIR "${AVM_CXX_TEST_BINARY_DIR}/lto")
set(AVM_EH_LTO_IMAGES)
foreach(AVM_EH_LTO_NAME IN ITEMS eh_catch_all eh_dynamic_handler eh_cleanup eh_cleanup_object eh_typed
        eh_inheritance eh_inheritance_cross_unit)
    set(AVM_EH_LTO_OBJECT "${AVM_EH_LTO_BIN_DIR}/O2/${AVM_EH_LTO_NAME}.o")
    set(AVM_EH_LTO_ELF "${AVM_EH_LTO_BIN_DIR}/O2/${AVM_EH_LTO_NAME}.elf")
    set(AVM_EH_LTO_IMAGE "${AVM_EH_LTO_BIN_DIR}/O2/${AVM_EH_LTO_NAME}.bin")
    set(AVM_EH_LTO_OBJECTS "${AVM_EH_LTO_OBJECT}")
    avm_add_object(
        OUTPUT "${AVM_EH_LTO_OBJECT}"
        SOURCE "${AVM_CXX_TEST_DIR}/${AVM_EH_LTO_NAME}.cpp"
        LANGUAGE CXX
        COMPILE_OPTIONS -O2 -fexceptions -flto=full
        DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
    )
    if(AVM_EH_LTO_NAME STREQUAL "eh_typed")
        # The unit is compiled with LTO too, so cross-unit descriptors must merge
        # after the whole program is optimized.
        set(AVM_EH_LTO_UNIT_OBJECT "${AVM_EH_LTO_BIN_DIR}/O2/${AVM_EH_LTO_NAME}_unit.o")
        avm_add_object(
            OUTPUT "${AVM_EH_LTO_UNIT_OBJECT}"
            SOURCE "${AVM_CXX_TEST_DIR}/support/eh_typed_unit.cpp"
            LANGUAGE CXX
            COMPILE_OPTIONS -O2 -fexceptions -flto=full
            DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
        )
        list(APPEND AVM_EH_LTO_OBJECTS "${AVM_EH_LTO_UNIT_OBJECT}")
    endif()
    if(AVM_EH_LTO_NAME STREQUAL "eh_inheritance_cross_unit")
        # The unit throws Joined, and the main unit catches its bases. LTO must merge
        # the descriptors and keep the base offsets across the whole program.
        set(AVM_EH_LTO_UNIT_OBJECT "${AVM_EH_LTO_BIN_DIR}/O2/${AVM_EH_LTO_NAME}_unit.o")
        avm_add_object(
            OUTPUT "${AVM_EH_LTO_UNIT_OBJECT}"
            SOURCE "${AVM_CXX_TEST_DIR}/support/eh_inheritance_unit.cpp"
            LANGUAGE CXX
            COMPILE_OPTIONS -O2 -fexceptions -flto=full
            DEPENDS avm_sysroot ${AVM_EH_SUPPORT_HEADERS}
        )
        list(APPEND AVM_EH_LTO_OBJECTS "${AVM_EH_LTO_UNIT_OBJECT}")
    endif()
    avm_add_image(
        OBJECTS ${AVM_EH_LTO_OBJECTS}
        OUTPUT_ELF "${AVM_EH_LTO_ELF}"
        OUTPUT_IMAGE "${AVM_EH_LTO_IMAGE}"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0_test.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        DEPENDS avm_sysroot
    )
    list(APPEND AVM_EH_LTO_IMAGES "${AVM_EH_LTO_IMAGE}")
endforeach()

add_custom_target(avm_eh_catch_all_lto_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_catch_all$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    # A class-typed throw whose destructor is passed to __cxa_throw. Its
    # descriptor and destructor are program addresses, and LTO must keep them.
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_cleanup_object$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    DEPENDS avm_tests "${AVM_EH_LTO_BIN_DIR}/O2/eh_catch_all.bin"
        "${AVM_EH_LTO_BIN_DIR}/O2/eh_cleanup_object.bin"
    VERBATIM
)

set(AVM_EH_NO_THROW_ELF "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_no_throw.elf")
set(AVM_EH_NO_THROW_IMAGE "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_no_throw.bin")
add_custom_target(avm_eh_metadata_verify
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_metadata_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
        ${AVM_EH_VERIFY_ARGS}
        --no-eh-elf "${AVM_EH_NO_THROW_ELF}" --no-eh-image "${AVM_EH_NO_THROW_IMAGE}"
    DEPENDS avm_eh_catch_all_images llvm-avm-image
    VERBATIM
)

# Flash-resident RTTI: program-space placement, descriptor pointers, one descriptor
# per type across translation units, every class hierarchy form, and the header
# captured by a throw whose descriptor and destructor lie above 0xFFFF.
set(AVM_EH_RTTI_VERIFY "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_rtti_verify.py")
add_custom_target(avm_eh_rtti_verify
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_object.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_object.bin"
        --expect _ZTIN12_GLOBAL__N_16ThrownE
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_object.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_object.bin"
        --expect _ZTIN12_GLOBAL__N_16ThrownE
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_cleanup_object.elf"
        --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_cleanup_object.bin"
        --expect _ZTIN12_GLOBAL__N_16ThrownE
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_identity.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_identity.bin"
        --expect _ZTI6Shared --expect _ZTI8Distinct
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_hierarchy.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_hierarchy.bin"
        --expect _ZTIN12_GLOBAL__N_15PlainE --expect _ZTIN12_GLOBAL__N_15BaseAE
        --expect _ZTIN12_GLOBAL__N_15BaseBE --expect _ZTIN12_GLOBAL__N_16SingleE
        --expect _ZTIN12_GLOBAL__N_18MultipleE --expect _ZTIN12_GLOBAL__N_111PolymorphicE
        --expect _ZTIN12_GLOBAL__N_111VirtualBaseE
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_high_address.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_rtti_high_address.bin"
        --expect _ZTIN12_GLOBAL__N_13FarE --high _ZTIN12_GLOBAL__N_13FarE
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --thrown-type _ZTIN12_GLOBAL__N_13FarE
        --destructor _ZN12_GLOBAL__N_13FarD2Ev --size 2
    DEPENDS avm_eh_catch_all_images ${AVM_EH_LTO_IMAGES} avm_eh_stack_probe
        llvm-avm-image
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

# Landing-pad SP, throw context, corrupted metadata, and stack measurements. Each
# step runs the probe and compares the emulator state with the machine code and
# with the packed block. Every step fails the target on a mismatch.
set(AVM_EH_HARDENING_DIR "${AVM_CXX_TEST_BINARY_DIR}")
set(AVM_EH_PROBE_RUN
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_EH_BIN_DIR "$<TARGET_FILE_DIR:llvm-avm-image>")
add_custom_target(avm_eh_hardening_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_dynamic_handler$" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_dynamic_handler$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O0/eh_dynamic_handler.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O0/eh_dynamic_handler.elf"
        --function dynamic_handler --callee throw_eight --callee throw_five
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O2/eh_dynamic_handler.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O2/eh_dynamic_handler.elf"
        --function dynamic_handler --callee throw_eight --callee throw_five
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_throw_context_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O0/eh_catch_all.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O0/eh_catch_all.elf"
        --thrower inner --caller demo_main --entry outer
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O2/eh_call8.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O2/eh_call8.elf"
        --function near_caller --callee throw_near --encoding call8
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_throw_context_verify.py"
        --bin-dir "${AVM_EH_BIN_DIR}" ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O2/eh_catch_all.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O2/eh_catch_all.elf"
        --thrower inner --caller middle --entry inner
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_corruption_verify.py"
        ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O0/eh_corrupt_target.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O0/eh_corrupt_target.elf"
        --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_corruption_verify.py"
        ${AVM_EH_PROBE_RUN}
        --image "${AVM_EH_HARDENING_DIR}/O2/eh_corrupt_target.bin"
        --elf "${AVM_EH_HARDENING_DIR}/O2/eh_corrupt_target.elf"
        --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_EH_HARDENING_DIR}"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)

add_custom_target(avm_eh_catch_all_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_" --opt O0,O2
    DEPENDS avm_tests avm_eh_catch_all_images avm_eh_metadata_verify
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_catch_all_lto_run avm_eh_hardening_run)

# Stage 2 cleanup fixtures. The cleanup chain of the first throw is checked against
# the machine code, the packed AVEH4 block, and the probe's events, at O0, O2, and
# LTO/O2. Each cleanup frame's landing SP is checked: the zero, two, and eight
# argument-byte cases, the r3-based frame, and the relaxed call8 and call16 sites.
# The termination fixtures run here too, since their output is the halt report.
set(AVM_EH_CLEANUP_PROBE_RUN
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_EH_CLEANUP_IMAGE_DIRS
    "${AVM_CXX_TEST_BINARY_DIR}/O0"
    "${AVM_CXX_TEST_BINARY_DIR}/O2"
    "${AVM_EH_LTO_BIN_DIR}/O2")
set(AVM_EH_CLEANUP_COMMANDS)
foreach(AVM_CLEANUP_DIR IN LISTS AVM_EH_CLEANUP_IMAGE_DIRS)
    list(APPEND AVM_EH_CLEANUP_COMMANDS
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_cleanup_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --frame leaf --frame middle --frame outer --frame demonstration
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function leaf --callee __cxa_throw
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function middle --callee leaf
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function stack_argument_frame --callee eight_arguments
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function five_argument_frame --callee five_arguments
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function dynamic_frame --callee eight_arguments
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function near_frame --callee near_throw --encoding call8
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_landing_pad_verify.py"
            --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
            --image "${AVM_CLEANUP_DIR}/eh_cleanup.bin"
            --elf "${AVM_CLEANUP_DIR}/eh_cleanup.elf"
            --function far_frame --callee far_throw --encoding call16
    )
endforeach()

add_custom_target(avm_eh_cleanup_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_cleanup" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_cleanup$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    ${AVM_EH_CLEANUP_COMMANDS}
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_corruption_verify.py"
        --cleanup ${AVM_EH_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_corrupt_target.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_cleanup_corrupt_target.elf"
        --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_corruption_verify.py"
        --cleanup ${AVM_EH_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_corrupt_target.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_cleanup_corrupt_target.elf"
        --nm "$<TARGET_FILE_DIR:llvm-avm-image>/llvm-nm"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_stack_report.py"
        --probe "$<TARGET_FILE:avm_eh_stack_probe>"
        --interpreter "${AVM_INTERPRETER_HEX}"
        --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        --image-dir "${AVM_CXX_TEST_BINARY_DIR}"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        avm_eh_metadata_verify ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_cleanup_run avm_eh_rtti_verify)

# Stage 3 typed catch fixtures. Exact matching is checked at O0, O2, and LTO/O2. The
# probe reports each landing context, and eh_typed_verify checks its selector, its
# first matching clause, and its pad against the packed AVEH4 block and the machine
# code. The block fixture covers malformed metadata, and the high-address fixture
# places its descriptors above program address 0xFFFF.
add_custom_target(avm_eh_typed_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_typed" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_typed$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_block_validation$" --opt O0,O2
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_typed_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_typed_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_typed_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_CLEANUP_PROBE_RUN}
        --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.bin"
        --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_metadata_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>"
        --eh-elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.elf"
        --eh-image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_typed.bin"
        --eh-elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.elf"
        --eh-image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_typed.bin"
        --eh-elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.elf"
        --eh-image "${AVM_EH_LTO_BIN_DIR}/O2/eh_typed.bin"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_typed_run)

# Nonvirtual base catches. The O0 and O2 fixtures also run through avm_eh_catch_all_run.
# This target adds the whole-program and cross-unit LTO runs, the packed base edges, the
# selector and adjustment of each handler against the emulator, and the corrupted RTTI
# fields, which must each fail a throw. Every probe run uses the interpreter boundary.
set(AVM_EH_INHERITANCE_PROBE_RUN
    --probe "$<TARGET_FILE:avm_eh_stack_probe>"
    --interpreter "${AVM_INTERPRETER_HEX}"
    --boundary "${AVM_INTERPRETER_BOUNDARY_METADATA}")
set(AVM_EH_INHERITANCE_CORRUPT_DIR "${CMAKE_CURRENT_BINARY_DIR}/eh_inheritance_corrupt")
add_custom_target(avm_eh_inheritance_run
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_inheritance" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_inheritance$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "$<TARGET_FILE:avm_tests>" --filter "^eh_inheritance_cross_unit$" --opt O2
        --cpp-bin-dir "${AVM_EH_LTO_BIN_DIR}"
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.bin"
        --expect _ZTIN12_GLOBAL__N_14PairE --expect _ZTIN12_GLOBAL__N_17DerivedE
        --expect _ZTIN12_GLOBAL__N_13TopE --expect _ZTIN12_GLOBAL__N_114PrivateDerivedE
        --edge _ZTIN12_GLOBAL__N_17DerivedE:_ZTIN12_GLOBAL__N_14BaseE:0:public
        --edge _ZTIN12_GLOBAL__N_14PairE:_ZTIN12_GLOBAL__N_14LeftE:0:public
        --edge _ZTIN12_GLOBAL__N_14PairE:_ZTIN12_GLOBAL__N_15RightE:2:public
        --edge _ZTIN12_GLOBAL__N_13TopE:_ZTIN12_GLOBAL__N_13MidE:2:public
        --edge _ZTIN12_GLOBAL__N_13MidE:_ZTIN12_GLOBAL__N_12LoE:0:public
        --edge _ZTIN12_GLOBAL__N_13MidE:_ZTIN12_GLOBAL__N_12HiE:2:public
        --edge _ZTIN12_GLOBAL__N_114PrivateDerivedE:_ZTIN12_GLOBAL__N_111PrivateBaseE:0:nonpublic
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.elf"
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.bin"
        --expect _ZTIN12_GLOBAL__N_14BothE --expect _ZTIN12_GLOBAL__N_13FarE
        --high _ZTIN12_GLOBAL__N_14BothE
        --edge _ZTIN12_GLOBAL__N_14BothE:_ZTIN12_GLOBAL__N_13FarE:0:public
        --edge _ZTIN12_GLOBAL__N_14BothE:_ZTIN12_GLOBAL__N_17FartherE:2:public
    COMMAND "${Python3_EXECUTABLE}" -I "${AVM_EH_RTTI_VERIFY}"
        --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.elf"
        --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.bin"
        --expect _ZTI6Joined --expect _ZTI4Lead --expect _ZTI5Trail
        --edge _ZTI6Joined:_ZTI4Lead:0:public
        --edge _ZTI6Joined:_ZTI5Trail:2:public
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance.bin"
        --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_cross_unit.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_cross_unit.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.bin"
        --elf "${AVM_EH_LTO_BIN_DIR}/O2/eh_inheritance_cross_unit.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_high_address.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_verify.py"
        --bin-dir "$<TARGET_FILE_DIR:llvm-avm-image>" ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_high_address.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_high_address.elf"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_corrupt_verify.py"
        ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_corrupt_target.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O0/eh_inheritance_corrupt_target.elf"
        --scratch-dir "${AVM_EH_INHERITANCE_CORRUPT_DIR}/O0"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/debug/eh_inheritance_corrupt_verify.py"
        ${AVM_EH_INHERITANCE_PROBE_RUN}
        --image "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_corrupt_target.bin"
        --elf "${AVM_CXX_TEST_BINARY_DIR}/O2/eh_inheritance_corrupt_target.elf"
        --scratch-dir "${AVM_EH_INHERITANCE_CORRUPT_DIR}/O2"
    DEPENDS avm_tests avm_eh_stack_probe avm_eh_catch_all_images llvm-avm-image
        ${AVM_EH_LTO_IMAGES}
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    VERBATIM
)
add_dependencies(avm_eh_catch_all_run avm_eh_inheritance_run)

# The runner discovers ASM, C, and C++ sources, maps each source to its adjacent
# name_output.txt file and corresponding generated image, loads the interpreter
# and image directly into arduboy_t, and compares cpu.serial_bytes.
add_executable(avm_tests "${AVM_TEST_SOURCE}")
set_target_properties(avm_tests PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")
target_compile_features(avm_tests PRIVATE cxx_std_17)
find_package(Threads REQUIRED)
target_link_libraries(avm_tests PRIVATE ardensdebuggerlib Threads::Threads)
target_compile_definitions(avm_tests PRIVATE
    AVM_TEST_ASM_DIR="${AVM_ASM_TEST_DIR}"
    AVM_TEST_C_DIR="${AVM_C_TEST_DIR}"
    AVM_TEST_CXX_DIR="${AVM_CXX_TEST_DIR}"
    AVM_TEST_BIN_DIR="${AVM_ASM_TEST_BINARY_DIR}"
    AVM_TEST_C_BIN_DIR="${AVM_C_TEST_BINARY_DIR}"
    AVM_TEST_CXX_BIN_DIR="${AVM_CXX_TEST_BINARY_DIR}"
    AVM_TEST_OPT_LEVELS="${AVM_TEST_OPT_LEVELS_CSV}"
    AVM_TEST_INTERPRETER_HEX="${AVM_INTERPRETER_HEX}"
    AVM_TEST_ADVANCE_LIMIT=${AVM_TEST_ADVANCE_LIMIT}ull
)
add_dependencies(avm_tests
    avm_interpreter
)

# Exercise real AVR helpers with independent host arithmetic, SRAM guards and
# register/SREG preservation checks, including both values of the text T bit.
find_package(Python3 COMPONENTS Interpreter REQUIRED)
add_executable(avm_format_long_long_tests interp/format_long_long.cpp)
target_compile_features(avm_format_long_long_tests PRIVATE cxx_std_17)
target_link_libraries(avm_format_long_long_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_format_long_long_tests_run
    COMMAND "$<TARGET_FILE:avm_format_long_long_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
    COMMAND "$<TARGET_FILE:avm_format_long_long_tests>"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.hex"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.lst"
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/format/generate_long_long.py" --check
    DEPENDS avm_format_long_long_tests avm_interpreter avm_interpreter_fxc
    USES_TERMINAL VERBATIM)

# The runner can be built independently; avm_tests_run builds and runs all images.
set(AVM_PUSH16_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/interp")
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/audio.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/audio.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/audio.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/audio.bin"
    ENTRY _start)
add_executable(avm_audio_tests interp/audio.cpp)
target_compile_features(avm_audio_tests PRIVATE cxx_std_17)
target_link_libraries(avm_audio_tests PRIVATE ardensdebuggerlib)
set(audio_hardware_hexes)
foreach(preset MINI FXC)
    set(hardware_dir "${CMAKE_CURRENT_BINARY_DIR}/audio_hardware/${preset}")
    file(GENERATE OUTPUT "${hardware_dir}/preset.asm"
        CONTENT "#define AVM_DEVICE_ARDUBOY_${preset}\n#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    add_custom_command(
        OUTPUT "${hardware_dir}/interp.hex"
        COMMAND "${CMAKE_COMMAND}"
            "-DSOURCE:FILEPATH=${hardware_dir}/preset.asm"
            "-DOUTPUT_OBJECT:FILEPATH=${hardware_dir}/interp.o"
            "-DOUTPUT_ELF:FILEPATH=${hardware_dir}/interp.elf"
            "-DOUTPUT_MAP:FILEPATH=${hardware_dir}/interp.map"
            "-DOUTPUT_LISTING:FILEPATH=${hardware_dir}/interp.lst"
            "-DOUTPUT_HEX:FILEPATH=${hardware_dir}/interp.hex"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${PROJECT_SOURCE_DIR}/interp/interp.asm" "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
            "${hardware_dir}/preset.asm"
        VERBATIM)
    list(APPEND audio_hardware_hexes "${hardware_dir}/interp.hex")
endforeach()
add_custom_target(avm_audio_hardware_checks DEPENDS ${audio_hardware_hexes})
find_package(Python3 COMPONENTS Interpreter QUIET)
set(audio_large_inputs)
if(Python3_Interpreter_FOUND)
    set(audio_large_dir "${CMAKE_CURRENT_BINARY_DIR}/audio_large")
    add_custom_command(
        OUTPUT "${audio_large_dir}/audio_large.h"
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/audio/generate_large_asset.py"
            "${audio_large_dir}/audio_large.h"
        DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/audio/generate_large_asset.py"
            "${PROJECT_SOURCE_DIR}/tools/avm_music.py" VERBATIM)
    foreach(language C CXX)
        if(language STREQUAL "C")
            set(extension c)
        else()
            set(extension cpp)
        endif()
        avm_add_object(
            OUTPUT "${audio_large_dir}/${language}.o"
            SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio_large.${extension}"
            LANGUAGE ${language}
            INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include" "${audio_large_dir}"
            COMPILE_OPTIONS -O2
            DEPENDS avm_sysroot "${audio_large_dir}/audio_large.h"
                "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio_large.c")
        avm_add_image(
            OBJECTS "${audio_large_dir}/${language}.o"
            OUTPUT_ELF "${audio_large_dir}/${language}.elf"
            OUTPUT_IMAGE "${audio_large_dir}/${language}.bin"
            ENTRY _start
            LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a" "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
            GC_SECTIONS DEPENDS avm_sysroot)
        list(APPEND audio_large_inputs "${audio_large_dir}/${language}.bin")
    endforeach()
endif()
# Direct compiled playlist fixture; generated song headers must be current before
# compilation. This replaces demo UI navigation/rendering, not asset/API checks.
set(audio_playlist_headers
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/music.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/z1overw.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/ff1town.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/ff1overw.h"
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/songs/ff1matya.h")
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/audio_playlist.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/audio_playlist.c"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O2
    DEPENDS avm_sysroot avm_audio_demo ${audio_playlist_headers})
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/audio_playlist.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/audio_playlist.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/audio_playlist.bin"
    ENTRY _start
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a" "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS DEPENDS avm_sysroot)

# Independent processes cover the same comprehensive suite. No console pool:
# Ninja may run these alongside one another, including on Windows.
function(avm_add_audio_run target suite image)
    add_custom_target(${target}
        COMMAND "$<TARGET_FILE:avm_audio_tests>" --suite "${suite}"
            "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst" "${image}"
        DEPENDS avm_audio_tests avm_interpreter "${image}" ${ARGN}
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        VERBATIM)
endfunction()
avm_add_audio_run(avm_audio_core_isa_run core-isa "${AVM_PUSH16_TEST_DIR}/audio.bin")
avm_add_audio_run(avm_audio_core_audio_run core-audio "${AVM_PUSH16_TEST_DIR}/audio.bin"
    avm_audio_hardware_checks)
avm_add_audio_run(avm_audio_demo_integration_run demo
    "${PROJECT_SOURCE_DIR}/projects/audio_demo/build/audio_demo.bin" avm_audio_demo)
avm_add_audio_run(avm_audio_playlist_assets_run playlist-assets "${AVM_PUSH16_TEST_DIR}/audio_playlist.bin")
avm_add_audio_run(avm_audio_formatter_run formatter "${AVM_C_TEST_BINARY_DIR}/O0/audio.bin")
add_custom_target(avm_audio_tests_run DEPENDS avm_audio_core_isa_run avm_audio_core_audio_run
    avm_audio_demo_integration_run avm_audio_playlist_assets_run avm_audio_formatter_run)
if(Python3_Interpreter_FOUND)
    avm_add_audio_run(avm_audio_export_c_run export-c "${audio_large_dir}/C.bin")
    avm_add_audio_run(avm_audio_export_cpp_run export-cpp "${audio_large_dir}/CXX.bin")
    add_dependencies(avm_audio_tests_run avm_audio_export_c_run avm_audio_export_cpp_run)
endif()

# All five hardware configurations receive isolated Timer0 ISR, clock,
# pending-tick, button-polling and exact cycle-count validation.
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/timer0.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/timer0.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/timer0.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/timer0.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/timer0.bin"
    ENTRY _start)
add_executable(avm_timer0_tests interp/timer0.cpp)
target_compile_features(avm_timer0_tests PRIVATE cxx_std_17)
target_link_libraries(avm_timer0_tests PRIVATE ardensdebuggerlib)
set(timer0_commands)
set(timer0_outputs)
foreach(wiring FX MINI FXC split shared)
    set(timer0_dir "${CMAKE_CURRENT_BINARY_DIR}/timer0/${wiring}")
    set(timer0_defines "")
    if(wiring STREQUAL "split")
        # Swap UP and B across ports, including their input initialization.
        set(timer0_defines "#define AVM_BUTTON_UP_PIN PINB\n#define AVM_BUTTON_UP_PORT PORTB\n#define AVM_BUTTON_UP_DDR DDRB\n#define AVM_BUTTON_UP_BIT 4\n#define AVM_BUTTON_B_PIN PINF\n#define AVM_BUTTON_B_PORT PORTF\n#define AVM_BUTTON_B_DDR DDRF\n#define AVM_BUTTON_B_BIT 7\n")
    elseif(wiring STREQUAL "shared")
        # Permute shared-port direction bits and exchange A/B pins.
        set(timer0_defines "#define AVM_BUTTON_UP_BIT 6\n#define AVM_BUTTON_RIGHT_BIT 7\n#define AVM_BUTTON_A_PIN PINB\n#define AVM_BUTTON_A_PORT PORTB\n#define AVM_BUTTON_A_DDR DDRB\n#define AVM_BUTTON_A_BIT 4\n#define AVM_BUTTON_B_PIN PINE\n#define AVM_BUTTON_B_PORT PORTE\n#define AVM_BUTTON_B_DDR DDRE\n#define AVM_BUTTON_B_BIT 6\n")
    else()
        set(timer0_defines "#define AVM_DEVICE_ARDUBOY_${wiring}\n")
    endif()
    file(GENERATE OUTPUT "${timer0_dir}/preset.asm"
        CONTENT "${timer0_defines}#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    add_custom_command(
        OUTPUT "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst"
        COMMAND "${CMAKE_COMMAND}"
            "-DSOURCE:FILEPATH=${timer0_dir}/preset.asm"
            "-DOUTPUT_OBJECT:FILEPATH=${timer0_dir}/interp.o"
            "-DOUTPUT_ELF:FILEPATH=${timer0_dir}/interp.elf"
            "-DOUTPUT_MAP:FILEPATH=${timer0_dir}/interp.map"
            "-DOUTPUT_LISTING:FILEPATH=${timer0_dir}/interp.lst"
            "-DOUTPUT_HEX:FILEPATH=${timer0_dir}/interp.hex"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${PROJECT_SOURCE_DIR}/interp/interp.asm" "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
            "${timer0_dir}/preset.asm"
        VERBATIM)
    list(APPEND timer0_outputs "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst")
    list(APPEND timer0_commands
        COMMAND "$<TARGET_FILE:avm_timer0_tests>"
            "${timer0_dir}/interp.hex" "${timer0_dir}/interp.lst"
            "${AVM_PUSH16_TEST_DIR}/timer0.bin" "${wiring}")
endforeach()
add_custom_target(avm_timer0_tests_run
    ${timer0_commands}
    DEPENDS avm_timer0_tests ${timer0_outputs} "${AVM_PUSH16_TEST_DIR}/timer0.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)
avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/push16.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/push16.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/push16.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/push16.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/push16.bin"
    ENTRY _start)
add_executable(avm_push16_tests interp/push16.cpp)
target_compile_features(avm_push16_tests PRIVATE cxx_std_17)
target_link_libraries(avm_push16_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_push16_tests_run
    COMMAND "$<TARGET_FILE:avm_push16_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    DEPENDS avm_push16_tests avm_interpreter "${AVM_PUSH16_TEST_DIR}/push16.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

avm_add_object(
    OUTPUT "${AVM_PUSH16_TEST_DIR}/stack_bounds.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/stack_bounds.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PUSH16_TEST_DIR}/stack_bounds.o"
    OUTPUT_ELF "${AVM_PUSH16_TEST_DIR}/stack_bounds.elf"
    OUTPUT_IMAGE "${AVM_PUSH16_TEST_DIR}/stack_bounds.bin"
    DISASSEMBLY "${AVM_PUSH16_TEST_DIR}/stack_bounds.asm"
    ENTRY _start)
add_executable(avm_stack_bounds_tests interp/stack_bounds.cpp)
target_compile_features(avm_stack_bounds_tests PRIVATE cxx_std_17)
target_link_libraries(avm_stack_bounds_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_stack_bounds_tests_run
    COMMAND "$<TARGET_FILE:avm_stack_bounds_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/stack_bounds.bin" "${AVM_PUSH16_TEST_DIR}/stack_bounds.asm"
    DEPENDS avm_stack_bounds_tests avm_interpreter "${AVM_PUSH16_TEST_DIR}/stack_bounds.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

set(AVM_DISPLAY_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/display_system")
avm_add_object(
    OUTPUT "${AVM_DISPLAY_TEST_DIR}/display_system.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/display_system.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_DISPLAY_TEST_DIR}/display_system.o"
    OUTPUT_ELF "${AVM_DISPLAY_TEST_DIR}/display_system.elf"
    OUTPUT_IMAGE "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
    DISASSEMBLY "${AVM_DISPLAY_TEST_DIR}/display_system.asm"
    ENTRY _start)
add_executable(avm_display_system_tests interp/display_system.cpp)
target_compile_features(avm_display_system_tests PRIVATE cxx_std_17)
target_link_libraries(avm_display_system_tests PRIVATE ardensdebuggerlib)

set(AVM_TRAP_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_dispatch")
avm_add_object(
    OUTPUT "${AVM_TRAP_TEST_DIR}/trap_dispatch.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_dispatch.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_TRAP_TEST_DIR}/trap_dispatch.o"
    OUTPUT_ELF "${AVM_TRAP_TEST_DIR}/trap_dispatch.elf"
    OUTPUT_IMAGE "${AVM_TRAP_TEST_DIR}/trap_dispatch.bin"
    DISASSEMBLY "${AVM_TRAP_TEST_DIR}/trap_dispatch.asm"
    ENTRY _start
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    DEPENDS avm_sysroot)
avm_add_object(
    OUTPUT "${AVM_TRAP_TEST_DIR}/trap_high_entry.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_high.c"
    LANGUAGE C
    DEPENDS avm_sysroot)
avm_add_object(
    OUTPUT "${AVM_TRAP_TEST_DIR}/trap_high.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_high.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_TRAP_TEST_DIR}/trap_high.o" "${AVM_TRAP_TEST_DIR}/trap_high_entry.o"
    OUTPUT_ELF "${AVM_TRAP_TEST_DIR}/trap_high.elf"
    OUTPUT_IMAGE "${AVM_TRAP_TEST_DIR}/trap_high.bin"
    DISASSEMBLY "${AVM_TRAP_TEST_DIR}/trap_high.asm"
    ENTRY _start
    LINK_OPTIONS "--section-start=.high_trap_text=0x10100")
add_executable(avm_trap_dispatch_tests interp/trap_dispatch.cpp)
target_compile_features(avm_trap_dispatch_tests PRIVATE cxx_std_17)
target_link_libraries(avm_trap_dispatch_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_trap_dispatch_tests_run
    COMMAND "$<TARGET_FILE:avm_trap_dispatch_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_TRAP_TEST_DIR}/trap_dispatch.bin" "${AVM_TRAP_TEST_DIR}/trap_dispatch.asm"
        "${AVM_TRAP_TEST_DIR}/trap_high.bin" "${AVM_TRAP_TEST_DIR}/trap_high.asm"
    DEPENDS avm_trap_dispatch_tests avm_interpreter
        "${AVM_TRAP_TEST_DIR}/trap_dispatch.bin" "${AVM_TRAP_TEST_DIR}/trap_high.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Source-aware fatal traps use one fixture built with -g at -O0 and -O2, both
# with the default crash metadata, and at -O2 with NO_CRASH_INFO.
set(AVM_TRAP_SOURCE_TEST_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_source")
foreach(variant IN ITEMS O0 O2 nometa)
    if(variant STREQUAL "O0")
        set(variant_options -g -O0)
        set(variant_crash_info)
    elseif(variant STREQUAL "O2")
        set(variant_options -g -O2)
        set(variant_crash_info)
    else()
        set(variant_options -g -O2)
        set(variant_crash_info NO_CRASH_INFO)
    endif()
    set(variant_dir "${AVM_TRAP_SOURCE_TEST_DIR}/${variant}")
    avm_add_object(
        OUTPUT "${variant_dir}/trap_source.o"
        SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_source.c"
        LANGUAGE C
        COMPILE_OPTIONS ${variant_options}
        DEPENDS avm_sysroot)
    avm_add_image(
        OBJECTS "${variant_dir}/trap_source.o"
        OUTPUT_ELF "${variant_dir}/trap_source.elf"
        OUTPUT_IMAGE "${variant_dir}/trap_source.bin"
        DISASSEMBLY "${variant_dir}/trap_source.asm"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        LINK_OPTIONS "--section-start=.high_text=0x10100"
        GC_SECTIONS
        ${variant_crash_info}
        DEPENDS avm_sysroot)
endforeach()
# A C++ fixture whose trapping function has a demangled name longer than 128
# bytes. It is built at -O0 with -g, so its lookup and fatal trap are verified
# against the complete name.
set(AVM_TRAP_LONG_NAME_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_long_name")
avm_add_object(
    OUTPUT "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_long_name.cpp"
    LANGUAGE CXX
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -g -O0
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.o"
    OUTPUT_ELF "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.elf"
    OUTPUT_IMAGE "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.bin"
    DISASSEMBLY "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.asm"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    LINK_OPTIONS "--section-start=.high_text=0x10100"
    GC_SECTIONS
    DEPENDS avm_sysroot)
# Lookup timing: a fixture whose driver looks up probes the host writes into RAM.
# main references every probe function, so garbage collection keeps them.
# It is run on demand, outside avm_tests_run, to report guest cycles.
set(AVM_TRAP_LOOKUP_BENCH_DIR "${CMAKE_CURRENT_BINARY_DIR}/trap_lookup_bench")
avm_add_object(
    OUTPUT "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/interp/trap_lookup_bench.c"
    LANGUAGE C
    COMPILE_OPTIONS -g -O2
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.o"
    OUTPUT_ELF "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.elf"
    OUTPUT_IMAGE "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.bin"
    DISASSEMBLY "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.asm"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES
        "${AVM_SYSROOT_DIR}/lib/libavm.a"
        "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    LINK_OPTIONS "--section-start=.high_text=0x10100"
    GC_SECTIONS
    DEPENDS avm_sysroot)
add_executable(avm_trap_lookup_bench interp/trap_lookup_bench.cpp)
target_compile_features(avm_trap_lookup_bench PRIVATE cxx_std_17)
target_link_libraries(avm_trap_lookup_bench PRIVATE ardensdebuggerlib)
add_custom_target(avm_trap_lookup_bench_run
    COMMAND "$<TARGET_FILE:avm_trap_lookup_bench>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.bin" "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.asm"
    DEPENDS avm_trap_lookup_bench avm_interpreter "${AVM_TRAP_LOOKUP_BENCH_DIR}/trap_lookup_bench.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

add_executable(avm_trap_source_tests interp/trap_source_tests.cpp)
target_compile_features(avm_trap_source_tests PRIVATE cxx_std_17)
target_link_libraries(avm_trap_source_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_trap_source_tests_run
    COMMAND "$<TARGET_FILE:avm_trap_source_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_TRAP_SOURCE_TEST_DIR}/O0/trap_source.bin" "${AVM_TRAP_SOURCE_TEST_DIR}/O0/trap_source.asm"
        "${AVM_TRAP_SOURCE_TEST_DIR}/O2/trap_source.bin" "${AVM_TRAP_SOURCE_TEST_DIR}/O2/trap_source.asm"
        "${AVM_TRAP_SOURCE_TEST_DIR}/nometa/trap_source.bin" "${AVM_TRAP_SOURCE_TEST_DIR}/nometa/trap_source.asm"
        "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.bin" "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.asm"
    DEPENDS avm_trap_source_tests avm_interpreter
        "${AVM_TRAP_SOURCE_TEST_DIR}/O0/trap_source.bin"
        "${AVM_TRAP_SOURCE_TEST_DIR}/O2/trap_source.bin"
        "${AVM_TRAP_SOURCE_TEST_DIR}/nometa/trap_source.bin"
        "${AVM_TRAP_LONG_NAME_DIR}/trap_long_name.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

set(display_system_outputs)
set(display_system_commands)
set(display_type 0)
foreach(controller SSD1306 SSD1309 SH1106)
    math(EXPR display_type "${display_type} + 1")
    set(controller_dir "${AVM_DISPLAY_TEST_DIR}/${controller}")
    file(GENERATE OUTPUT "${controller_dir}/preset.asm"
        CONTENT "#define AVM_DISPLAY_${controller}\n#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    add_custom_command(
        OUTPUT "${controller_dir}/interp.hex" "${controller_dir}/interp.lst"
        COMMAND "${CMAKE_COMMAND}"
            "-DSOURCE:FILEPATH=${controller_dir}/preset.asm"
            "-DOUTPUT_OBJECT:FILEPATH=${controller_dir}/interp.o"
            "-DOUTPUT_ELF:FILEPATH=${controller_dir}/interp.elf"
            "-DOUTPUT_MAP:FILEPATH=${controller_dir}/interp.map"
            "-DOUTPUT_LISTING:FILEPATH=${controller_dir}/interp.lst"
            "-DOUTPUT_HEX:FILEPATH=${controller_dir}/interp.hex"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${PROJECT_SOURCE_DIR}/interp/interp.asm" "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
            "${controller_dir}/preset.asm"
        VERBATIM)
    list(APPEND display_system_outputs
        "${controller_dir}/interp.hex" "${controller_dir}/interp.lst")
    list(APPEND display_system_commands
        COMMAND "$<TARGET_FILE:avm_display_system_tests>"
            "${controller_dir}/interp.hex" "${controller_dir}/interp.lst"
            "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
            "${AVM_DISPLAY_TEST_DIR}/display_system.asm" "${display_type}")
endforeach()
add_custom_target(avm_display_system_tests_run
    ${display_system_commands}
    DEPENDS avm_display_system_tests ${display_system_outputs}
        "${AVM_DISPLAY_TEST_DIR}/display_system.bin"
        "${AVM_DISPLAY_TEST_DIR}/display_system.asm"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

add_custom_target(avm_tests_run
    COMMAND "$<TARGET_FILE:avm_tests>"
    DEPENDS avm_tests avm_test_images avm_push16_tests_run avm_stack_bounds_tests_run avm_audio_tests_run
        avm_display_system_tests_run avm_timer0_tests_run
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    COMMENT "Running all AVM tests in-process"
    USES_TERMINAL
    VERBATIM
)
add_dependencies(avm_tests_run avm_format_long_long_tests_run)

# A small, independently built debug image exercises nested frames, a live
# global and local, both pointer spaces, button input, and delayed display
# transfer. Keep both an unoptimized and an optimized DWARF variant.
set(AVM_DEBUG_FIXTURE_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/fixture.c")
set(AVM_DEBUG_FIXTURE_OUTPUTS)
foreach(AVM_DEBUG_OPT IN ITEMS O0 O2)
    set(AVM_DEBUG_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/${AVM_DEBUG_OPT}")
    set(AVM_DEBUG_OBJECT "${AVM_DEBUG_DIR}/fixture.o")
    set(AVM_DEBUG_ELF "${AVM_DEBUG_DIR}/fixture.elf")
    set(AVM_DEBUG_IMAGE "${AVM_DEBUG_DIR}/fixture.bin")
    avm_add_object(
        OUTPUT "${AVM_DEBUG_OBJECT}"
        SOURCE "${AVM_DEBUG_FIXTURE_SOURCE}"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS -g "-${AVM_DEBUG_OPT}"
        DEPENDS avm_sysroot
    )
    avm_add_image(
        OBJECTS "${AVM_DEBUG_OBJECT}"
        OUTPUT_ELF "${AVM_DEBUG_ELF}"
        OUTPUT_IMAGE "${AVM_DEBUG_IMAGE}"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES
            "${AVM_SYSROOT_DIR}/lib/libavm.a"
            "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        DEPENDS avm_sysroot
    )
    list(APPEND AVM_DEBUG_FIXTURE_OUTPUTS "${AVM_DEBUG_ELF}" "${AVM_DEBUG_IMAGE}")
endforeach()
add_custom_target(avm_debug_images DEPENDS ${AVM_DEBUG_FIXTURE_OUTPUTS})

set(AVM_PROF_ASM_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/prof-asm")
avm_add_object(
    OUTPUT "${AVM_PROF_ASM_DIR}/fixture.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/prof_fixture.asm"
    LANGUAGE ASM)
avm_add_image(
    OBJECTS "${AVM_PROF_ASM_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_PROF_ASM_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_PROF_ASM_DIR}/fixture.bin"
    ENTRY _start)
add_custom_target(avm_prof_asm_fixture
    DEPENDS "${AVM_PROF_ASM_DIR}/fixture.elf")
add_custom_target(avm_debug_verify
    COMMAND "$<TARGET_FILE:llvm-dwarfdump>" --verify
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
    COMMAND "$<TARGET_FILE:llvm-dwarfdump>" --verify
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O2/fixture.elf"
    DEPENDS avm_debug_images llvm-dwarfdump
    USES_TERMINAL VERBATIM)

# The debug sections must not change the bytes loaded by the interpreter. Source
# lines are part of the default crash metadata, so both sides are packaged with
# --no-crash-info. The comparison then covers the executable payload alone.
set(AVM_NODEBUG_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/nodebug")
avm_add_object(
    OUTPUT "${AVM_NODEBUG_DIR}/fixture.o"
    SOURCE "${AVM_DEBUG_FIXTURE_SOURCE}"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O0
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_NODEBUG_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_NODEBUG_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_NODEBUG_DIR}/fixture.bin"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
              "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    NO_CRASH_INFO
    DEPENDS avm_sysroot)
set(AVM_DEBUG_O0_ELF "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf")
set(AVM_DEBUG_O0_PAYLOAD "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture-no-crash-info.bin")
add_custom_command(
    OUTPUT "${AVM_DEBUG_O0_PAYLOAD}"
    COMMAND "$<TARGET_FILE:llvm-avm-image>"
        --no-crash-info --development
        "${AVM_DEBUG_O0_ELF}" -o "${AVM_DEBUG_O0_PAYLOAD}"
    DEPENDS llvm-avm-image "${AVM_DEBUG_O0_ELF}"
    VERBATIM)
# Unwind tables are nonallocated debug information. The same fixture built
# without them must package the same payload as the default unwind-table build.
set(AVM_NOUNWIND_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/nounwind")
avm_add_object(
    OUTPUT "${AVM_NOUNWIND_DIR}/fixture.o"
    SOURCE "${AVM_DEBUG_FIXTURE_SOURCE}"
    LANGUAGE C
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O0 -fno-unwind-tables -fno-asynchronous-unwind-tables
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_NOUNWIND_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_NOUNWIND_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_NOUNWIND_DIR}/fixture.bin"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
              "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    NO_CRASH_INFO
    DEPENDS avm_sysroot)
add_custom_target(avm_debug_image_equivalence
    COMMAND "${CMAKE_COMMAND}" -E compare_files
        "${AVM_NODEBUG_DIR}/fixture.bin"
        "${AVM_DEBUG_O0_PAYLOAD}"
    COMMAND "${CMAKE_COMMAND}" -E compare_files
        "${AVM_NODEBUG_DIR}/fixture.bin"
        "${AVM_NOUNWIND_DIR}/fixture.bin"
    DEPENDS "${AVM_NODEBUG_DIR}/fixture.bin" "${AVM_DEBUG_O0_PAYLOAD}"
        "${AVM_NOUNWIND_DIR}/fixture.bin" avm_debug_images
    USES_TERMINAL VERBATIM)

# Crash metadata is part of default packaging. These checks cover the packaging
# path that LLDB and the profiler use, the --no-crash-info opt-out, and identical
# execution with and without metadata.
add_executable(avm_crash_metadata_tests debug/crash_metadata_tests.cpp)
target_compile_features(avm_crash_metadata_tests PRIVATE cxx_std_17)
target_link_libraries(avm_crash_metadata_tests PRIVATE avm_debug_emulator)
add_dependencies(avm_crash_metadata_tests avm_debug_images avm_interpreter_boundary)
add_custom_target(avm_crash_metadata_tests_run
    COMMAND "$<TARGET_FILE:avm_crash_metadata_tests>"
        "$<TARGET_FILE:llvm-avm-image>"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
        "${AVM_NODEBUG_DIR}/fixture.elf"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
        "${AVM_DEBUG_O0_PAYLOAD}"
        "${AVM_NODEBUG_DIR}/fixture.bin"
        "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        "${CMAKE_CURRENT_BINARY_DIR}/crash_metadata"
    DEPENDS avm_crash_metadata_tests avm_debug_images avm_debug_image_equivalence
        avm_interpreter_boundary llvm-avm-image
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# A second image tests C++ types and a live code address beyond 64 KiB.
set(AVM_DEBUG_CPP_DIR "${CMAKE_CURRENT_BINARY_DIR}/debug/cpp")
avm_add_object(
    OUTPUT "${AVM_DEBUG_CPP_DIR}/fixture.o"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/fixture.cpp"
    LANGUAGE CXX
    INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -g -O0
    DEPENDS avm_sysroot)
avm_add_image(
    OBJECTS "${AVM_DEBUG_CPP_DIR}/fixture.o"
    OUTPUT_ELF "${AVM_DEBUG_CPP_DIR}/fixture.elf"
    OUTPUT_IMAGE "${AVM_DEBUG_CPP_DIR}/fixture.bin"
    ENTRY _start
    STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
    LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
              "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
    GC_SECTIONS
    LINK_OPTIONS "--image-base=0x100"
                 "--section-start=.data=0x100"
                 "--section-start=.text=0x200"
                 "--section-start=.rodata=0x2000"
                 "--section-start=.high_debug_text=0x10100"
                 "--section-start=.high_debug_rodata=0x11000"
    DEPENDS avm_sysroot)
add_custom_target(avm_debug_cpp_verify
    COMMAND "$<TARGET_FILE:llvm-dwarfdump>" --verify
        "${AVM_DEBUG_CPP_DIR}/fixture.elf"
    DEPENDS "${AVM_DEBUG_CPP_DIR}/fixture.elf" llvm-dwarfdump
    USES_TERMINAL VERBATIM)

# Focused unwind fixtures are compiled with the common unwind-table flags. The
# frame-pointer variant makes r3 the frame base, and the LTO variant produces
# its call-frame information during final code generation. Each variant has
# every shape named in unwind_cfi_fixture.c. unwind_tail_fixture.c is built
# with the same variant options but without disabling sibling-call
# optimization, so its direct returns can become tail jumps.
set(AVM_UNWIND_FIXTURE_SOURCE
    "${CMAKE_CURRENT_SOURCE_DIR}/debug/unwind_cfi_fixture.c")
set(AVM_UNWIND_TAIL_SOURCE
    "${CMAKE_CURRENT_SOURCE_DIR}/debug/unwind_tail_fixture.c")
set(AVM_UNWIND_DIR "${CMAKE_CURRENT_BINARY_DIR}/unwind_cfi")
set(AVM_UNWIND_IMAGE_OUTPUTS)
foreach(variant IN ITEMS O0 O2 O2-fp O2-nodebug LTO)
    if(variant STREQUAL "O0")
        set(variant_options -g -O0 -fomit-frame-pointer)
    elseif(variant STREQUAL "O2")
        set(variant_options -g -O2 -fomit-frame-pointer)
    elseif(variant STREQUAL "O2-fp")
        set(variant_options -g -O2 -fno-omit-frame-pointer)
    elseif(variant STREQUAL "O2-nodebug")
        set(variant_options -O2 -fomit-frame-pointer)
    else()
        set(variant_options -g -O2 -flto -fomit-frame-pointer)
    endif()
    set(variant_dir "${AVM_UNWIND_DIR}/${variant}")
    avm_add_object(
        OUTPUT "${variant_dir}/fixture.o"
        SOURCE "${AVM_UNWIND_FIXTURE_SOURCE}"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS ${variant_options} -fno-optimize-sibling-calls
        DEPENDS avm_sysroot)
    avm_add_object(
        OUTPUT "${variant_dir}/tail.o"
        SOURCE "${AVM_UNWIND_TAIL_SOURCE}"
        LANGUAGE C
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS ${variant_options}
        DEPENDS avm_sysroot)
    avm_add_image(
        OBJECTS "${variant_dir}/fixture.o" "${variant_dir}/tail.o"
        OUTPUT_ELF "${variant_dir}/fixture.elf"
        OUTPUT_IMAGE "${variant_dir}/fixture.bin"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
                  "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        DEPENDS avm_sysroot)
    list(APPEND AVM_UNWIND_IMAGE_OUTPUTS
        "${variant_dir}/fixture.elf" "${variant_dir}/fixture.bin")
endforeach()
add_custom_target(avm_unwind_images DEPENDS ${AVM_UNWIND_IMAGE_OUTPUTS})

find_package(Python3 COMPONENTS Interpreter QUIET)
if(Python3_Interpreter_FOUND)
    add_custom_target(avm_music_tests_run
        COMMAND "${Python3_EXECUTABLE}" -m unittest discover -s tests/audio -v
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}" VERBATIM)
    add_dependencies(avm_audio_tests_run avm_music_tests_run)
    add_custom_target(avm_unwind_cfi_verify
        COMMAND "${Python3_EXECUTABLE}" -I
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/unwind_cfi_verify.py"
            --llvm-dwarfdump "$<TARGET_FILE:llvm-dwarfdump>"
            --llvm-readobj "$<TARGET_FILE:llvm-readobj>"
            --llvm-nm "$<TARGET_FILE:llvm-nm>"
            --llvm-objdump "$<TARGET_FILE:llvm-objdump>"
            --case "O0:${AVM_UNWIND_DIR}/O0/fixture.elf:omit:debug"
            --case "O2:${AVM_UNWIND_DIR}/O2/fixture.elf:omit:debug"
            --case "O2-fp:${AVM_UNWIND_DIR}/O2-fp/fixture.elf:fp:debug"
            --case "O2-nodebug:${AVM_UNWIND_DIR}/O2-nodebug/fixture.elf:omit:nodebug"
            --case "LTO:${AVM_UNWIND_DIR}/LTO/fixture.elf:omit:debug"
        DEPENDS avm_unwind_images llvm-dwarfdump llvm-readobj llvm-nm llvm-objdump
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_dependencies(avm_tests_run avm_unwind_cfi_verify)
    add_custom_target(avm_unwind_cfi_selftest
        COMMAND "${Python3_EXECUTABLE}" -I
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/unwind_cfi_selftest.py"
            --llvm-dwarfdump "$<TARGET_FILE:llvm-dwarfdump>"
            --llvm-readobj "$<TARGET_FILE:llvm-readobj>"
            --llvm-nm "$<TARGET_FILE:llvm-nm>"
            --llvm-objdump "$<TARGET_FILE:llvm-objdump>"
            --case "O0:${AVM_UNWIND_DIR}/O0/fixture.elf:omit:debug"
            --case "O2-fp:${AVM_UNWIND_DIR}/O2-fp/fixture.elf:fp:debug"
            --case "O2-nodebug:${AVM_UNWIND_DIR}/O2-nodebug/fixture.elf:omit:nodebug"
        DEPENDS avm_unwind_images llvm-dwarfdump llvm-readobj llvm-nm llvm-objdump
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_dependencies(avm_tests_run avm_unwind_cfi_selftest)
    # The relaxation fixture is linked with and without relaxation. Its verifier
    # checks that the relaxed DWARF agrees with the relaxed instruction layout
    # after confirming that inlining and relaxation both happened.
    set(AVM_RELAX_DEBUG_DIR "${CMAKE_CURRENT_BINARY_DIR}/relax_debug_info")
    avm_add_object(
        OUTPUT "${AVM_RELAX_DEBUG_DIR}/fixture.o"
        SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/relax_debug_info_fixture.cpp"
        LANGUAGE CXX
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS -g -O2 -flto -fomit-frame-pointer
        DEPENDS avm_sysroot)
    # The base unit holds a single function, so its compile unit has one range and
    # a nonzero DW_AT_low_pc. Its location lists must select a zero base first.
    avm_add_object(
        OUTPUT "${AVM_RELAX_DEBUG_DIR}/base.o"
        SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/debug/relax_debug_info_base.cpp"
        LANGUAGE CXX
        INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
        COMPILE_OPTIONS -g -O2 -flto -fomit-frame-pointer
        DEPENDS avm_sysroot)
    avm_add_image(
        OBJECTS "${AVM_RELAX_DEBUG_DIR}/fixture.o"
                "${AVM_RELAX_DEBUG_DIR}/base.o"
        OUTPUT_ELF "${AVM_RELAX_DEBUG_DIR}/relaxed.elf"
        OUTPUT_IMAGE "${AVM_RELAX_DEBUG_DIR}/relaxed.bin"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
                  "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        DEPENDS avm_sysroot)
    avm_add_image(
        OBJECTS "${AVM_RELAX_DEBUG_DIR}/fixture.o"
                "${AVM_RELAX_DEBUG_DIR}/base.o"
        OUTPUT_ELF "${AVM_RELAX_DEBUG_DIR}/norelax.elf"
        OUTPUT_IMAGE "${AVM_RELAX_DEBUG_DIR}/norelax.bin"
        ENTRY _start
        STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
        LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a"
                  "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
        GC_SECTIONS
        LINK_OPTIONS --no-relax
        DEPENDS avm_sysroot)
    add_custom_target(avm_relax_debug_info_verify
        COMMAND "${Python3_EXECUTABLE}" -I
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/relax_debug_info_verify.py"
            --llvm-dwarfdump "$<TARGET_FILE:llvm-dwarfdump>"
            --llvm-objdump "$<TARGET_FILE:llvm-objdump>"
            --llvm-nm "$<TARGET_FILE:llvm-nm>"
            --relaxed "${AVM_RELAX_DEBUG_DIR}/relaxed.elf"
            --norelax "${AVM_RELAX_DEBUG_DIR}/norelax.elf"
        DEPENDS "${AVM_RELAX_DEBUG_DIR}/relaxed.elf"
                "${AVM_RELAX_DEBUG_DIR}/norelax.elf"
                llvm-dwarfdump llvm-objdump llvm-nm
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_dependencies(avm_tests_run avm_relax_debug_info_verify)
    add_custom_target(avm_prof_integration_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/prof_integration.py"
            "${AVM_SDK_BUILD_BIN}/avm-prof${CMAKE_EXECUTABLE_SUFFIX}"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${AVM_DEBUG_CPP_DIR}/fixture.elf"
            "${AVM_NODEBUG_DIR}/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O2/fixture.elf"
            "${AVM_PROF_ASM_DIR}/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
        DEPENDS avm_prof avm_lldb avm_debug_images
                avm_debug_cpp_verify avm_debug_image_equivalence
                avm_prof_asm_fixture
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_custom_target(avm_lldb_integration_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/integration.py"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${AVM_DEBUG_CPP_DIR}/fixture.elf"
            "${AVM_UNWIND_DIR}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
            "${AVM_RELAX_DEBUG_DIR}/relaxed.elf"
        DEPENDS avm_lldb avm_debug_images avm_debug_cpp_verify avm_unwind_images
                "${AVM_RELAX_DEBUG_DIR}/relaxed.elf"
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    add_custom_target(avm_lldb_long_replay_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/long_replay.py"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
        DEPENDS avm_lldb avm_debug_images
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
endif()

add_executable(avm_boundary_probe debug/boundary_probe.cpp)
target_compile_features(avm_boundary_probe PRIVATE cxx_std_17)
target_link_libraries(avm_boundary_probe PRIVATE ardensdebuggerlib)
add_dependencies(avm_boundary_probe avm_debug_images avm_interpreter_boundary)
add_custom_target(avm_boundary_probe_run
    COMMAND "$<TARGET_FILE:avm_boundary_probe>"
        "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
    DEPENDS avm_boundary_probe
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Host-side stack and snapshot probe used by the exception tests. It reads the
# guest state at each dispatch boundary and never writes guest state.
add_executable(avm_eh_stack_probe debug/avm_eh_stack_probe.cpp)
target_compile_features(avm_eh_stack_probe PRIVATE cxx_std_17)
target_link_libraries(avm_eh_stack_probe PRIVATE ardensdebuggerlib)

add_executable(avm_prof_throughput debug/prof_throughput.cpp)
target_compile_features(avm_prof_throughput PRIVATE cxx_std_17)
target_link_libraries(avm_prof_throughput PRIVATE avm_debug_emulator)
add_dependencies(avm_prof_throughput avm_debug_images
                 avm_interpreter_boundary)
add_custom_target(avm_prof_throughput_run
    COMMAND "$<TARGET_FILE:avm_prof_throughput>"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
        "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}"
    DEPENDS avm_prof_throughput
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

# Verify sampled sqrt significands at both exponent parities, table neighbors
# and exponent/subnormal packing boundaries against host double sqrt. Check the
# large-angle reducer's exact integer product with deterministic mantissa samples.
add_library(avm_math_reference_kernel OBJECT
    math/errno_storage.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sqrt.c")
target_include_directories(avm_math_reference_kernel PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
target_compile_definitions(avm_math_reference_kernel PRIVATE
    sqrtf=avm_reference_sqrtf)
if(MSVC)
    target_compile_options(avm_math_reference_kernel PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_reference_kernel PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_math_reference_tests
    math/sqrt_reference.c math/sqrt_original.c)
if(MSVC)
    target_compile_options(avm_math_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_reference_tests PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
target_link_libraries(avm_math_reference_tests PRIVATE avm_math_reference_kernel)
add_executable(avm_math_reduction_tests math/rem_pio2_product_reference.c)
if(MSVC)
    target_compile_options(avm_math_reduction_tests PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_math_reduction_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_math_reduction_tests PRIVATE m)
endif()
if(NOT MSVC)
    target_link_libraries(avm_math_reference_tests PRIVATE m)
endif()
add_custom_target(avm_math_reference_tests_run
    COMMAND "$<TARGET_FILE:avm_math_reference_tests>"
    COMMAND "$<TARGET_FILE:avm_math_reduction_tests>"
    DEPENDS avm_math_reference_tests avm_math_reduction_tests
    USES_TERMINAL)
add_dependencies(avm_tests_run avm_math_reference_tests_run)

# Compile the production rounding kernels under distinct names so host libm
# supplies an independent reference, including signed zero and NaN handling.
add_library(avm_rounding_reference_kernels OBJECT
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_floor.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_ceil.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_round.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_trunc.c")
target_include_directories(avm_rounding_reference_kernels PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
target_compile_definitions(avm_rounding_reference_kernels PRIVATE
    floorf=avm_reference_floorf ceilf=avm_reference_ceilf
    roundf=avm_reference_roundf truncf=avm_reference_truncf)
if(MSVC)
    target_compile_options(avm_rounding_reference_kernels PRIVATE /fp:strict)
else()
    target_compile_options(avm_rounding_reference_kernels PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_rounding_reference_tests math/rounding_reference.c)
target_link_libraries(avm_rounding_reference_tests PRIVATE
    avm_rounding_reference_kernels)
if(NOT MSVC)
    target_link_libraries(avm_rounding_reference_tests PRIVATE m)
endif()
add_custom_target(avm_rounding_tests_run
    COMMAND "$<TARGET_FILE:avm_rounding_reference_tests>"
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_NM=$<TARGET_FILE:llvm-nm>"
        "-DAVM_OBJECT_DIR=${PROJECT_BINARY_DIR}/runtime/objects"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/math/check_rounding_shifts.cmake"
    DEPENDS avm_rounding_reference_tests avm_sysroot llvm-nm
    USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_rounding_tests_run)

# Run the production shortcuts, sqrt and angle reducer under private names;
# the harness uses host double libm as an independent binary32 reference.
add_library(avm_shortcuts_reference_kernels OBJECT
    math/errno_storage.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_remainder.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_remquo.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_rint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_nearbyint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_lrint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_lround.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_llrint.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_llround.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_ilogb.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_logb.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fdim.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_nan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fmaxmag.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_fminmag.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_round.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_gamma.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_erf.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sinh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_cosh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_tanh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_asinh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_acosh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_atanh.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_exp2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_expm1.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log1p.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_cbrt.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_asin.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_acos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_decompose.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_hypot.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_atan2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_atan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_tan.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_sin.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_cos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_sincos.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_log10.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_pow.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_exp.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_fmod.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/ef_sqrt.c"
    math/rem_pio2_reference_kernel.c
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/kf_rem_pio2.c"
    "${PROJECT_SOURCE_DIR}/runtime/lib/math/sf_scalbn.c")
target_include_directories(avm_shortcuts_reference_kernels PRIVATE
    "${PROJECT_SOURCE_DIR}/runtime/include")
foreach(function lgammaf tgammaf erff erfcf remainderf remquof rintf nearbyintf lrintf lroundf llrintf llroundf ilogbf logbf fdimf nanf fmaxmagf fminmagf roundf sinhf coshf tanhf asinhf acoshf atanhf exp2f expm1f log1pf cbrtf asinf acosf ldexpf frexpf modff nextafterf nexttowardf hypotf atan2f atanf sinf cosf sincosf tanf logf log2f log10f powf expf fmodf sqrtf scalbnf scalblnf fminf fmaxf)
    target_compile_definitions(avm_shortcuts_reference_kernels PRIVATE
        "${function}=avm_reference_${function}")
endforeach()
if(MSVC)
    target_compile_options(avm_shortcuts_reference_kernels PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_shortcuts_reference_kernels PRIVATE
        -ffp-contract=off -fno-fast-math)
endif()
add_executable(avm_math_misc_reference_tests math/misc_reference.c)
target_link_libraries(avm_math_misc_reference_tests PRIVATE avm_shortcuts_reference_kernels)
if(MSVC)
    target_compile_options(avm_math_misc_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_math_misc_reference_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_math_misc_reference_tests PRIVATE m)
endif()
add_custom_target(avm_math_misc_tests_run
    COMMAND "$<TARGET_FILE:avm_math_misc_reference_tests>"
    DEPENDS avm_math_misc_reference_tests USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_math_misc_tests_run)

add_executable(avm_shortcuts_reference_tests math/shortcuts_reference.c)
target_link_libraries(avm_shortcuts_reference_tests PRIVATE avm_shortcuts_reference_kernels)
add_executable(avm_math_accuracy_probe math/accuracy_probe.c)
target_link_libraries(avm_math_accuracy_probe PRIVATE avm_shortcuts_reference_kernels)
add_executable(avm_c99_reference_tests math/c99_reference.c)
target_link_libraries(avm_c99_reference_tests PRIVATE avm_shortcuts_reference_kernels)
if(MSVC)
    target_compile_options(avm_c99_reference_tests PRIVATE /fp:strict)
else()
    target_compile_options(avm_c99_reference_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_c99_reference_tests PRIVATE m)
endif()
add_custom_target(avm_c99_tests_run
    COMMAND "$<TARGET_FILE:avm_c99_reference_tests>"
    COMMAND "$<TARGET_FILE:clang>" --target=x86_64-w64-windows-gnu -std=c++17
        -fsyntax-only -nostdinc -I "${PROJECT_SOURCE_DIR}/runtime/include"
        "${CMAKE_CURRENT_SOURCE_DIR}/math/classify_host.cpp"
    DEPENDS avm_c99_reference_tests clang USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_c99_tests_run)
add_executable(avm_hypot_boundary_tests math/hypot_boundary_reference.c)
if(MSVC)
    target_compile_options(avm_hypot_boundary_tests PRIVATE /fp:strict
        "/FI${CMAKE_CURRENT_SOURCE_DIR}/math/host_compat.h")
else()
    target_compile_options(avm_hypot_boundary_tests PRIVATE -ffp-contract=off -fno-fast-math)
    target_link_libraries(avm_hypot_boundary_tests PRIVATE m)
endif()
add_custom_target(avm_hypot_boundary_tests_run
    COMMAND "$<TARGET_FILE:avm_hypot_boundary_tests>"
    DEPENDS avm_hypot_boundary_tests USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_hypot_boundary_tests_run)
if(NOT MSVC)
    target_link_libraries(avm_shortcuts_reference_tests PRIVATE m)
    target_link_libraries(avm_math_accuracy_probe PRIVATE m)
endif()
add_custom_target(avm_shortcuts_tests_run
    COMMAND "$<TARGET_FILE:avm_shortcuts_reference_tests>"
    DEPENDS avm_shortcuts_reference_tests USES_TERMINAL)
add_dependencies(avm_tests_run avm_shortcuts_tests_run)

if(Python3_FOUND)
    set(AVM_MATH_PYTHON_EXECUTABLE "${Python3_EXECUTABLE}" CACHE FILEPATH
        "Python interpreter with mpmath for high-precision math validation")
    add_custom_target(avm_math_accuracy_tests_run
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_reference.py"
            --probe "$<TARGET_FILE:avm_math_accuracy_probe>"
            --output "${CMAKE_CURRENT_BINARY_DIR}/math-accuracy.json"
            --samples 10000 --rounds 2
        DEPENDS avm_math_accuracy_probe
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        COMMENT "Checking production math against 100-digit mpmath references"
        USES_TERMINAL VERBATIM)
endif()

# Exercise FF/FPOLY arithmetic, ISA behavior and active SPI stream timing.
add_executable(avm_fpoly_tests interp/fpoly.cpp)
target_compile_features(avm_fpoly_tests PRIVATE cxx_std_17)
target_link_libraries(avm_fpoly_tests PRIVATE ardensdebuggerlib)
add_custom_target(avm_fpoly_tests_run
    COMMAND "$<TARGET_FILE:avm_fpoly_tests>"
        "${AVM_INTERPRETER_HEX}" "${PROJECT_SOURCE_DIR}/interp/build/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    COMMAND "$<TARGET_FILE:avm_fpoly_tests>"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.hex"
        "${PROJECT_BINARY_DIR}/interp/fxc/interp.lst"
        "${AVM_PUSH16_TEST_DIR}/push16.bin" FXC
    DEPENDS avm_fpoly_tests avm_interpreter avm_interpreter_fxc
        "${AVM_PUSH16_TEST_DIR}/push16.bin"
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)
add_dependencies(avm_tests_run avm_fpoly_tests_run)

# These image lists never depend on avm_test_images or the unrelated hardware
# suites. O0 is deliberate: guest optimizer/codegen bugs can be O0-only.
add_custom_target(avm_math_fast_images DEPENDS ${AVM_MATH_FAST_IMAGES})
add_custom_target(avm_math_full_images DEPENDS ${AVM_MATH_FULL_IMAGES})
add_custom_target(avm_math_fast
    COMMAND "${CMAKE_COMMAND}" -E time "$<TARGET_FILE:avm_tests>" --filter "^math_" --opt O0,O2
    COMMAND "$<TARGET_FILE:avm_math_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_math_reduction_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_shortcuts_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_c99_reference_tests>" --quick
    COMMAND "$<TARGET_FILE:avm_math_misc_reference_tests>" --quick
    DEPENDS avm_math_fast_images avm_tests avm_math_reference_tests
        avm_math_reduction_tests avm_shortcuts_reference_tests avm_c99_reference_tests avm_math_misc_reference_tests avm_fpoly_tests_run
        avm_hypot_boundary_tests_run
    USES_TERMINAL VERBATIM)
add_custom_target(avm_math_full
    COMMAND "${CMAKE_COMMAND}" -E time "$<TARGET_FILE:avm_tests>" --filter "^math_"
    DEPENDS avm_math_full_images avm_tests avm_math_reference_tests_run
        avm_shortcuts_tests_run avm_c99_tests_run avm_math_misc_tests_run avm_rounding_tests_run avm_fpoly_tests_run
        avm_hypot_boundary_tests_run
    USES_TERMINAL VERBATIM)
add_custom_target(avm_trig_accelerators_run
    COMMAND "${CMAKE_COMMAND}"
        "-DAVM_OBJDUMP:FILEPATH=$<TARGET_FILE:llvm-objdump>"
        "-DAVM_OBJECT_DIR:PATH=${PROJECT_BINARY_DIR}/runtime/objects"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/math/check_trig_accelerators.cmake"
    DEPENDS avm_sysroot llvm-objdump
    VERBATIM)
add_dependencies(avm_math_fast avm_trig_accelerators_run)
add_dependencies(avm_math_full avm_trig_accelerators_run)
if(Python3_FOUND)
    add_custom_target(avm_math_accuracy_fast
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/accuracy_reference.py"
            --probe "$<TARGET_FILE:avm_math_accuracy_probe>"
            --profile fast --samples 64 --rounds 0
            --output "${CMAKE_CURRENT_BINARY_DIR}/math-accuracy-fast.json"
        COMMAND "${AVM_MATH_PYTHON_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/math/generate_reduction_table.py" --check
        DEPENDS avm_math_accuracy_probe USES_TERMINAL VERBATIM)
    add_dependencies(avm_math_fast avm_math_accuracy_fast)
    add_dependencies(avm_math_full avm_math_accuracy_tests_run)
    add_custom_target(avm_validation_full DEPENDS avm_tests_run avm_math_accuracy_tests_run)
else()
    add_custom_target(avm_validation_full DEPENDS avm_tests_run)
endif()

add_subdirectory(termination)

# Inspect a dead-buffer caller with the clearing implementation visible at O3.
set(c23_explicit_ir "${CMAKE_CURRENT_BINARY_DIR}/c23/explicit.ll")
avm_add_object(OUTPUT "${c23_explicit_ir}"
    SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/c23/explicit_codegen.c"
    LANGUAGE C INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
    COMPILE_OPTIONS -O3 -S -emit-llvm
    DEPENDS avm_sysroot "${PROJECT_SOURCE_DIR}/runtime/lib/string.c")
add_custom_target(avm_c23_explicit_check
    COMMAND "${CMAKE_COMMAND}" "-DINPUT:FILEPATH=${c23_explicit_ir}"
        -P "${CMAKE_CURRENT_SOURCE_DIR}/c23/check_explicit.cmake"
    DEPENDS "${c23_explicit_ir}" VERBATIM)
add_dependencies(avm_tests_run avm_c23_explicit_check)
add_dependencies(avm_tests_run avm_termination_checks)

# MSVC has no C99 complex language support; use an independent Linux reference
# through WSL on Windows. This never links host math into guest images.
if(WIN32)
    find_program(AVM_COMPLEX_WSL wsl)
    if(AVM_COMPLEX_WSL)
        set(complex_reference_options --wsl)
    endif()
endif()
if(NOT WIN32 OR AVM_COMPLEX_WSL)
    add_custom_target(avm_complex_reference_tests_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/math/run_complex_reference.py"
            --output "${CMAKE_CURRENT_BINARY_DIR}/complex-reference"
            ${complex_reference_options}
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
endif()

# Check stream extraction in final linked images at every supported optimization.
find_package(Python3 COMPONENTS Interpreter REQUIRED)
foreach(opt IN LISTS AVM_TEST_OPT_LEVELS)
    set(stdio_linkage_images)
    set(stdio_linkage_dir "${CMAKE_CURRENT_BINARY_DIR}/stdio_linkage/${opt}")
    foreach(name scan_literals sscanf fscanf scanf none include snprintf vsnprintf printf fprintf perror getchar fputs stderr generic one two three debug)
        set(obj "${stdio_linkage_dir}/${name}.o")
        avm_add_object(OUTPUT "${obj}"
            SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/stdio_linkage/${name}.c"
            LANGUAGE C INCLUDE_DIRS "${AVM_SYSROOT_DIR}/include"
            COMPILE_OPTIONS "-${opt}" DEPENDS avm_sysroot)
        avm_add_image(OBJECTS "${obj}" ENTRY _start GC_SECTIONS
            OUTPUT_ELF "${stdio_linkage_dir}/${name}.elf"
            OUTPUT_IMAGE "${stdio_linkage_dir}/${name}.bin"
            LIBRARIES "${AVM_SYSROOT_DIR}/lib/libavm.a" "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a")
        list(APPEND stdio_linkage_images "${stdio_linkage_dir}/${name}.bin")
    endforeach()
    add_custom_target(avm_stdio_linkage_${opt}
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/stdio_linkage_test.py" "${stdio_linkage_dir}"
        DEPENDS ${stdio_linkage_images} VERBATIM)
endforeach()
add_custom_target(avm_stdio_linkage_tests
    DEPENDS avm_stdio_linkage_O0 avm_stdio_linkage_O1 avm_stdio_linkage_O2
        avm_stdio_linkage_O3 avm_stdio_linkage_Os avm_stdio_linkage_Oz)
add_dependencies(avm_tests_run avm_stdio_linkage_tests)
