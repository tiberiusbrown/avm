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
avm_add_check(avm_debug_images DEPENDS ${AVM_DEBUG_FIXTURE_OUTPUTS})

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
avm_add_check(avm_prof_asm_fixture
    DEPENDS "${AVM_PROF_ASM_DIR}/fixture.elf")
avm_add_check(avm_debug_verify
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
avm_add_check(avm_debug_image_equivalence
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
avm_add_check(avm_crash_metadata_tests_run
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

# A second image tests C++ types and a live code address beyond 64 KiB. Its immutable
# local initializer is an AS0 flash-window object, so the link pins .flash to its VMA
# and starts .text after the flash image bytes, which end at 0x503.
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
                 "--section-start=.flash=0x0B00"
                 "--section-start=.text=0x503"
                 "--section-start=.rodata=0x2000"
                 "--section-start=.high_debug_text=0x10100"
                 "--section-start=.high_debug_rodata=0x11000"
    DEPENDS avm_sysroot)
avm_add_check(avm_debug_cpp_verify
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
avm_add_check(avm_unwind_images DEPENDS ${AVM_UNWIND_IMAGE_OUTPUTS})

find_package(Python3 COMPONENTS Interpreter QUIET)
if(Python3_Interpreter_FOUND)
    avm_add_check(avm_music_tests_run
        COMMAND "${Python3_EXECUTABLE}" -m unittest discover -s tests/audio -v
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}" VERBATIM)
    add_dependencies(avm_audio_tests_run avm_music_tests_run)
    avm_add_check(avm_unwind_cfi_verify
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
    avm_add_check(avm_unwind_cfi_selftest
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
    avm_add_check(avm_relax_debug_info_verify
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
    if(AVM_BUILD_DEBUGGER)
    avm_add_check(avm_prof_integration_run
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
    avm_add_check(avm_lldb_integration_run
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
    avm_add_check(avm_lldb_long_replay_run
        COMMAND "${Python3_EXECUTABLE}"
            "${CMAKE_CURRENT_SOURCE_DIR}/debug/long_replay.py"
            "${AVM_SDK_BUILD_BIN}/avm-lldb${CMAKE_EXECUTABLE_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
            "${CMAKE_CURRENT_BINARY_DIR}/debug"
        DEPENDS avm_lldb avm_debug_images
        WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
        USES_TERMINAL VERBATIM)
    endif()
endif()

add_executable(avm_boundary_probe debug/boundary_probe.cpp)
target_compile_features(avm_boundary_probe PRIVATE cxx_std_17)
target_link_libraries(avm_boundary_probe PRIVATE ardensdebuggerlib)
add_dependencies(avm_boundary_probe avm_debug_images avm_interpreter_boundary)
avm_add_check(avm_boundary_probe_run
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
avm_add_check(avm_prof_throughput_run
    COMMAND "$<TARGET_FILE:avm_prof_throughput>"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.elf"
        "${CMAKE_CURRENT_BINARY_DIR}/debug/O0/fixture.bin"
        "${AVM_INTERPRETER_HEX}"
        "${AVM_INTERPRETER_BOUNDARY_METADATA}"
    DEPENDS avm_prof_throughput
    WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}"
    USES_TERMINAL VERBATIM)

if(TARGET avm_lldb_integration_run AND TARGET lldb-server)
    add_dependencies(avm_lldb_integration_run lldb-server)
endif()
