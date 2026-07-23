include_guard(GLOBAL)

include(CMakeParseArguments)

set(AVM_TARGET_TRIPLE "avm-unknown-arduboyfx")
set(AVM_OPT_LEVEL "-O2" CACHE STRING
    "Optimization level used for AVM runtime, tests, and benchmarks")
set(AVM_COMMON_COMPILE_OPTIONS
    -ffreestanding
    -fomit-frame-pointer
    -fno-stack-protector
    -fno-unwind-tables
    -fno-asynchronous-unwind-tables
    -ffunction-sections
    -fdata-sections
    "${AVM_OPT_LEVEL}"
    -Wall
    -Wextra
    -Werror
)

function(avm_add_object)
    set(one_value_args OUTPUT SOURCE LANGUAGE)
    set(multi_value_args INCLUDE_DIRS DEPENDS COMPILE_OPTIONS)
    cmake_parse_arguments(ARG "" "${one_value_args}" "${multi_value_args}" ${ARGN})

    foreach(required_arg OUTPUT SOURCE LANGUAGE)
        if(NOT ARG_${required_arg})
            message(FATAL_ERROR "avm_add_object requires ${required_arg}")
        endif()
    endforeach()
    if(ARG_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR
            "Unknown avm_add_object arguments: ${ARG_UNPARSED_ARGUMENTS}")
    endif()

    get_filename_component(output_dir "${ARG_OUTPUT}" DIRECTORY)

    if(ARG_LANGUAGE STREQUAL "ASM")
        set(include_options)
        foreach(include_dir IN LISTS ARG_INCLUDE_DIRS)
            list(APPEND include_options -I "${include_dir}")
        endforeach()

        add_custom_command(
            OUTPUT "${ARG_OUTPUT}"
            COMMAND "${CMAKE_COMMAND}" -E make_directory "${output_dir}"
            COMMAND
                "$<TARGET_FILE:llvm-mc>"
                "-triple=${AVM_TARGET_TRIPLE}"
                -filetype=obj
                ${include_options}
                ${ARG_COMPILE_OPTIONS}
                "${ARG_SOURCE}"
                -o "${ARG_OUTPUT}"
            DEPENDS
                llvm-mc
                "${ARG_SOURCE}"
                ${ARG_DEPENDS}
            COMMENT "Assembling AVM object ${ARG_OUTPUT}"
            VERBATIM
        )
        return()
    endif()

    if(ARG_LANGUAGE STREQUAL "C")
        set(language_options -std=c11)
    elseif(ARG_LANGUAGE STREQUAL "CXX")
        set(language_options
            -std=c++17
            -fno-exceptions
            -fno-rtti
            -fno-threadsafe-statics
            -fno-use-cxa-atexit
        )
    else()
        message(FATAL_ERROR
            "avm_add_object LANGUAGE must be C, CXX, or ASM, not ${ARG_LANGUAGE}")
    endif()

    set(include_options)
    foreach(include_dir IN LISTS ARG_INCLUDE_DIRS)
        list(APPEND include_options -isystem "${include_dir}")
    endforeach()

    add_custom_command(
        OUTPUT "${ARG_OUTPUT}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${output_dir}"
        COMMAND
            "$<TARGET_FILE:clang>"
            "--target=${AVM_TARGET_TRIPLE}"
            ${AVM_COMMON_COMPILE_OPTIONS}
            ${language_options}
            ${include_options}
            ${ARG_COMPILE_OPTIONS}
            -c "${ARG_SOURCE}"
            -o "${ARG_OUTPUT}"
        DEPENDS
            clang
            "${ARG_SOURCE}"
            ${ARG_DEPENDS}
        COMMENT "Compiling AVM ${ARG_LANGUAGE} object ${ARG_OUTPUT}"
        VERBATIM
    )
endfunction()

function(avm_add_archive)
    set(one_value_args OUTPUT)
    set(multi_value_args OBJECTS DEPENDS)
    cmake_parse_arguments(ARG "" "${one_value_args}" "${multi_value_args}" ${ARGN})

    if(NOT ARG_OUTPUT OR NOT ARG_OBJECTS)
        message(FATAL_ERROR "avm_add_archive requires OUTPUT and OBJECTS")
    endif()
    if(ARG_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR
            "Unknown avm_add_archive arguments: ${ARG_UNPARSED_ARGUMENTS}")
    endif()

    get_filename_component(output_dir "${ARG_OUTPUT}" DIRECTORY)
    add_custom_command(
        OUTPUT "${ARG_OUTPUT}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${output_dir}"
        COMMAND "${CMAKE_COMMAND}" -E rm -f "${ARG_OUTPUT}"
        COMMAND
            "$<TARGET_FILE:llvm-ar>"
            rcs
            "${ARG_OUTPUT}"
            ${ARG_OBJECTS}
        DEPENDS
            llvm-ar
            ${ARG_OBJECTS}
            ${ARG_DEPENDS}
        COMMENT "Archiving AVM library ${ARG_OUTPUT}"
        VERBATIM
    )
endfunction()

function(avm_add_image)
    set(options GC_SECTIONS)
    set(one_value_args
        OUTPUT_ELF OUTPUT_IMAGE ENTRY STARTUP DISASSEMBLY)
    set(multi_value_args OBJECTS LIBRARIES DEPENDS)
    cmake_parse_arguments(ARG "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    foreach(required_arg OUTPUT_ELF OUTPUT_IMAGE ENTRY)
        if(NOT ARG_${required_arg})
            message(FATAL_ERROR "avm_add_image requires ${required_arg}")
        endif()
    endforeach()
    if(NOT ARG_OBJECTS)
        message(FATAL_ERROR "avm_add_image requires OBJECTS")
    endif()
    if(ARG_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR
            "Unknown avm_add_image arguments: ${ARG_UNPARSED_ARGUMENTS}")
    endif()

    get_filename_component(elf_dir "${ARG_OUTPUT_ELF}" DIRECTORY)
    get_filename_component(image_dir "${ARG_OUTPUT_IMAGE}" DIRECTORY)

    set(link_options)
    if(ARG_GC_SECTIONS)
        list(APPEND link_options --gc-sections)
    endif()

    set(outputs "${ARG_OUTPUT_ELF}" "${ARG_OUTPUT_IMAGE}")
    set(commands
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${elf_dir}"
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${image_dir}"
        COMMAND
            "${AVM_LD_LLD}"
            -flavor gnu
            "--entry=${ARG_ENTRY}"
            ${link_options}
            -o "${ARG_OUTPUT_ELF}"
            ${ARG_STARTUP}
            ${ARG_OBJECTS}
            ${ARG_LIBRARIES}
    )
    set(tool_dependencies lld llvm-avm-image)

    if(ARG_DISASSEMBLY)
        if(NOT AVM_DISASSEMBLE_SCRIPT)
            message(FATAL_ERROR
                "AVM_DISASSEMBLE_SCRIPT must be set for linked disassembly")
        endif()
        get_filename_component(disassembly_dir "${ARG_DISASSEMBLY}" DIRECTORY)
        list(APPEND outputs "${ARG_DISASSEMBLY}")
        list(APPEND commands
            COMMAND "${CMAKE_COMMAND}" -E make_directory "${disassembly_dir}"
            COMMAND
                "${CMAKE_COMMAND}"
                "-DAVM_OBJDUMP:FILEPATH=$<TARGET_FILE:llvm-objdump>"
                "-DAVM_INPUT:FILEPATH=${ARG_OUTPUT_ELF}"
                "-DAVM_OUTPUT:FILEPATH=${ARG_DISASSEMBLY}"
                -P "${AVM_DISASSEMBLE_SCRIPT}"
        )
        list(APPEND tool_dependencies
            llvm-objdump
            "${AVM_DISASSEMBLE_SCRIPT}")
    endif()

    list(APPEND commands
        COMMAND
            "$<TARGET_FILE:llvm-avm-image>"
            "${ARG_OUTPUT_ELF}"
            -o "${ARG_OUTPUT_IMAGE}"
    )

    add_custom_command(
        OUTPUT ${outputs}
        ${commands}
        DEPENDS
            ${tool_dependencies}
            ${ARG_STARTUP}
            ${ARG_OBJECTS}
            ${ARG_LIBRARIES}
            ${ARG_DEPENDS}
        COMMENT "Linking and packaging AVM image ${ARG_OUTPUT_IMAGE}"
        VERBATIM
    )
endfunction()
