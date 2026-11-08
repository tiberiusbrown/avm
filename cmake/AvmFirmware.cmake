include_guard(GLOBAL)

function(avm_add_firmware name)
    cmake_parse_arguments(F "" "DIRECTORY;PREAMBLE" "" ${ARGN})
    if(NOT F_DIRECTORY)
        message(FATAL_ERROR "avm_add_firmware requires DIRECTORY")
    endif()
    set(source "${PROJECT_SOURCE_DIR}/interp/interp.asm")
    if(F_PREAMBLE)
        set(source "${F_DIRECTORY}/preset.asm")
        file(GENERATE OUTPUT "${source}" CONTENT
            "${F_PREAMBLE}#include \"${PROJECT_SOURCE_DIR}/interp/interp.asm\"\n")
    endif()
    set(outputs)
    set(arguments)
    foreach(pair OBJECT:o ELF:elf MAP:map LISTING:lst HEX:hex)
        string(REPLACE ":" ";" fields "${pair}")
        list(GET fields 0 key)
        list(GET fields 1 extension)
        set(output "${F_DIRECTORY}/interp.${extension}")
        list(APPEND outputs "${output}")
        list(APPEND arguments "-DOUTPUT_${key}:FILEPATH=${output}")
        set("${name}_${key}" "${output}" PARENT_SCOPE)
    endforeach()
    add_custom_command(OUTPUT ${outputs}
        COMMAND "${CMAKE_COMMAND}" ${arguments}
            "-DSOURCE:FILEPATH=${source}"
            "-DMAX_INTERP_SIZE:STRING=${AVM_INTERPRETER_MAX_SIZE}"
            "-DAVR_GCC:FILEPATH=${AVM_AVR_GCC}"
            "-DAVR_OBJCOPY:FILEPATH=${AVM_AVR_OBJCOPY}"
            "-DAVR_OBJDUMP:FILEPATH=${AVM_AVR_OBJDUMP}"
            -P "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        DEPENDS "${source}" "${PROJECT_SOURCE_DIR}/interp/interp.asm"
            "${PROJECT_SOURCE_DIR}/interp/native_math.inc"
            "${PROJECT_SOURCE_DIR}/cmake/BuildAvmInterpreter.cmake"
        COMMENT "Building AVR firmware ${name}" VERBATIM)
    add_custom_target(${name} DEPENDS ${outputs})
endfunction()
