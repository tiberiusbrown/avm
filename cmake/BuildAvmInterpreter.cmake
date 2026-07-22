cmake_minimum_required(VERSION 3.20)

foreach(required_var
    SOURCE
    OUTPUT_OBJECT
    OUTPUT_ELF
    OUTPUT_MAP
    OUTPUT_LISTING
    OUTPUT_HEX
    TEMP_SIZE_BINARY
    MAX_INTERP_SIZE
)
    if(NOT DEFINED ${required_var} OR "${${required_var}}" STREQUAL "")
        message(FATAL_ERROR "Missing required variable: ${required_var}")
    endif()
endforeach()

function(find_avr_tool variable_name program_name)
    if(DEFINED ${variable_name}
       AND NOT "${${variable_name}}" STREQUAL ""
       AND NOT "${${variable_name}}" MATCHES "-NOTFOUND$")
        if(NOT EXISTS "${${variable_name}}")
            message(FATAL_ERROR
                "${variable_name} does not exist: ${${variable_name}}")
        endif()
        set(${variable_name} "${${variable_name}}" PARENT_SCOPE)
        return()
    endif()

    set(search_hints)
    if(DEFINED AVR_GCC
       AND NOT "${AVR_GCC}" STREQUAL ""
       AND NOT "${AVR_GCC}" MATCHES "-NOTFOUND$")
        get_filename_component(avr_bin_dir "${AVR_GCC}" DIRECTORY)
        list(APPEND search_hints "${avr_bin_dir}")
    endif()

    unset(found_program)
    unset(found_program CACHE)
    find_program(found_program
        NAMES "${program_name}"
        HINTS ${search_hints}
    )
    if(NOT found_program)
        message(FATAL_ERROR
            "Unable to find ${program_name}. Add the AVR toolchain to PATH "
            "or set ${variable_name} in the CMake cache.")
    endif()

    set(${variable_name} "${found_program}" PARENT_SCOPE)
endfunction()

find_avr_tool(AVR_GCC avr-gcc)
find_avr_tool(AVR_OBJCOPY avr-objcopy)
find_avr_tool(AVR_OBJDUMP avr-objdump)

get_filename_component(output_dir "${OUTPUT_ELF}" DIRECTORY)
file(MAKE_DIRECTORY "${output_dir}")

set(final_outputs
    "${OUTPUT_OBJECT}"
    "${OUTPUT_ELF}"
    "${OUTPUT_MAP}"
    "${OUTPUT_LISTING}"
    "${OUTPUT_HEX}"
    "${TEMP_SIZE_BINARY}"
)

# Prevent a failed or oversized rebuild from leaving stale artifacts behind.
file(REMOVE ${final_outputs})

function(run_checked description)
    execute_process(
        COMMAND ${ARGN}
        RESULT_VARIABLE result
        COMMAND_ECHO STDOUT
    )
    if(NOT result EQUAL 0)
        file(REMOVE ${final_outputs})
        message(FATAL_ERROR "${description} failed with exit code ${result}")
    endif()
endfunction()

run_checked(
    "AVR assembly"
    "${AVR_GCC}"
    -c
    -x assembler-with-cpp
    -mmcu=atmega32u4
    "${SOURCE}"
    -o "${OUTPUT_OBJECT}"
)

# Use the avr-gcc driver for linking so it selects the installed ATmega32U4
# linker emulation and script without relying on a platform-specific AVR_HOME.
run_checked(
    "AVR link"
    "${AVR_GCC}"
    -mmcu=atmega32u4
    -nostartfiles
    -nostdlib
    "-Wl,--gc-sections"
    "-Wl,--entry=__vectors"
    "-Wl,--section-start=.text=0x0000"
    "-Wl,-Tdata=0x800A0B"
    "-Wl,-Map=${OUTPUT_MAP}"
    "${OUTPUT_OBJECT}"
    -o "${OUTPUT_ELF}"
)

run_checked(
    "Interpreter size extraction"
    "${AVR_OBJCOPY}"
    -O binary
    -j .text
    "${OUTPUT_ELF}"
    "${TEMP_SIZE_BINARY}"
)

if(NOT EXISTS "${TEMP_SIZE_BINARY}")
    file(REMOVE ${final_outputs})
    message(FATAL_ERROR "Unable to determine interpreter binary size")
endif()

file(SIZE "${TEMP_SIZE_BINARY}" interp_size)
file(REMOVE "${TEMP_SIZE_BINARY}")

message(STATUS
    "Interpreter binary size: ${interp_size} bytes "
    "(limit: ${MAX_INTERP_SIZE} bytes)")

if(interp_size GREATER MAX_INTERP_SIZE)
    file(REMOVE
        "${OUTPUT_OBJECT}"
        "${OUTPUT_ELF}"
        "${OUTPUT_MAP}"
        "${OUTPUT_LISTING}"
        "${OUTPUT_HEX}"
    )
    message(FATAL_ERROR
        "Interpreter binary exceeds the 29 KiB limit")
endif()

execute_process(
    COMMAND
        "${AVR_OBJDUMP}"
        -D
        -z
        -t
        -j .text
        "${OUTPUT_ELF}"
    OUTPUT_FILE "${OUTPUT_LISTING}"
    RESULT_VARIABLE objdump_result
    COMMAND_ECHO STDOUT
)
if(NOT objdump_result EQUAL 0)
    file(REMOVE "${OUTPUT_LISTING}" "${OUTPUT_HEX}")
    message(FATAL_ERROR
        "AVR listing generation failed with exit code ${objdump_result}")
endif()

run_checked(
    "Intel HEX generation"
    "${AVR_OBJCOPY}"
    -O ihex
    "${OUTPUT_ELF}"
    "${OUTPUT_HEX}"
)
