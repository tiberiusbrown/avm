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
    avm_add_check(avm_stdio_linkage_${opt}
        COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/stdio_linkage_test.py" "${stdio_linkage_dir}"
        DEPENDS ${stdio_linkage_images} VERBATIM)
endforeach()
avm_add_check(avm_stdio_linkage_tests
    DEPENDS avm_stdio_linkage_O0 avm_stdio_linkage_O1 avm_stdio_linkage_O2
        avm_stdio_linkage_O3 avm_stdio_linkage_Os avm_stdio_linkage_Oz)
add_dependencies(avm_tests_run avm_stdio_linkage_tests)
