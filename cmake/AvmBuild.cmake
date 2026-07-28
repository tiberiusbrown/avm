include_guard(GLOBAL)

include(CMakeParseArguments)

set(AVM_CAPTURE_STDERR_SCRIPT
    "${CMAKE_CURRENT_LIST_DIR}/RunAndCaptureStderr.cmake")

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
    set(one_value_args OUTPUT SOURCE LANGUAGE STDERR_OUTPUT)
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
        if(ARG_STDERR_OUTPUT)
            message(FATAL_ERROR
                "avm_add_object STDERR_OUTPUT is only supported for C/CXX")
        endif()
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

    set(compile_command
        "$<TARGET_FILE:clang>"
        "--target=${AVM_TARGET_TRIPLE}"
        ${AVM_COMMON_COMPILE_OPTIONS}
        ${language_options}
        ${include_options}
        ${ARG_COMPILE_OPTIONS}
        -c "${ARG_SOURCE}"
        -o "${ARG_OUTPUT}"
    )

    set(outputs "${ARG_OUTPUT}")
    set(commands
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${output_dir}")
    set(extra_dependencies)

    if(ARG_STDERR_OUTPUT)
        get_filename_component(diagnostic_dir
            "${ARG_STDERR_OUTPUT}" DIRECTORY)
        list(APPEND outputs "${ARG_STDERR_OUTPUT}")
        list(APPEND commands
            COMMAND "${CMAKE_COMMAND}" -E make_directory "${diagnostic_dir}"
            COMMAND
                "${CMAKE_COMMAND}"
                "-DAVM_STDERR_OUTPUT:FILEPATH=${ARG_STDERR_OUTPUT}"
                -P "${AVM_CAPTURE_STDERR_SCRIPT}"
                --
                ${compile_command}
        )
        list(APPEND extra_dependencies "${AVM_CAPTURE_STDERR_SCRIPT}")
    else()
        list(APPEND commands COMMAND ${compile_command})
    endif()

    add_custom_command(
        OUTPUT ${outputs}
        ${commands}
        DEPENDS
            clang
            "${ARG_SOURCE}"
            ${ARG_DEPENDS}
            ${extra_dependencies}
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
            --development
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

# Build a complete AVM program from a collection of C and C++ sources.
#
# Example:
#   avm_add_project(my_game
#       BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/my_game"
#       SOURCES
#           src/main.cpp
#           src/game.cpp
#           src/assets.c
#       INCLUDE_DIRS include
#       COMPILE_OPTIONS -Wno-unused-parameter
#       ENTRY _start
#       STARTUP "${AVM_SYSROOT_DIR}/lib/crt0.o"
#       LIBRARIES
#           "${AVM_SYSROOT_DIR}/lib/libavm.a"
#           "${AVM_SYSROOT_DIR}/lib/libavm-builtins.a"
#       GC_SECTIONS
#   )
#
# Relative source and include paths are resolved from CMAKE_CURRENT_SOURCE_DIR.
# BUILD_DIR defaults to CMAKE_CURRENT_BINARY_DIR; a relative override is
# resolved from that directory.
function(avm_add_project name)
    set(options ALL GC_SECTIONS)
    set(one_value_args
        BUILD_DIR OUTPUT_NAME ENTRY STARTUP IMAGE DISASSEMBLY)
    set(multi_value_args
        SOURCES INCLUDE_DIRS COMPILE_OPTIONS LIBRARIES DEPENDS)
    cmake_parse_arguments(ARG "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    if(NOT name)
        message(FATAL_ERROR "avm_add_project requires a project name")
    endif()
    if(TARGET "${name}")
        message(FATAL_ERROR
            "avm_add_project target already exists: ${name}")
    endif()
    foreach(required_arg SOURCES)
        if(NOT ARG_${required_arg})
            message(FATAL_ERROR
                "avm_add_project(${name}) requires ${required_arg}")
        endif()
    endforeach()
    if(ARG_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR
            "Unknown avm_add_project arguments: ${ARG_UNPARSED_ARGUMENTS}")
    endif()

    if(NOT ARG_BUILD_DIR)
        set(project_build_dir "${CMAKE_CURRENT_BINARY_DIR}")
    elseif(IS_ABSOLUTE "${ARG_BUILD_DIR}")
        set(project_build_dir "${ARG_BUILD_DIR}")
    else()
        get_filename_component(project_build_dir "${ARG_BUILD_DIR}" ABSOLUTE
            BASE_DIR "${CMAKE_CURRENT_BINARY_DIR}")
    endif()

    if(ARG_OUTPUT_NAME)
        set(output_name "${ARG_OUTPUT_NAME}")
    else()
        set(output_name "${name}")
    endif()

    if(ARG_ENTRY)
        set(entry "${ARG_ENTRY}")
    else()
        set(entry _start)
    endif()

    # Resolve ordinary relative include directories from the project's source
    # directory. Preserve generator expressions verbatim.
    set(include_dirs)
    foreach(include_dir IN LISTS ARG_INCLUDE_DIRS)
        if(include_dir MATCHES "^\\$<" OR IS_ABSOLUTE "${include_dir}")
            list(APPEND include_dirs "${include_dir}")
        else()
            get_filename_component(include_dir_abs "${include_dir}" ABSOLUTE
                BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
            list(APPEND include_dirs "${include_dir_abs}")
        endif()
    endforeach()

    set(project_objects)
    foreach(source IN LISTS ARG_SOURCES)
        if(source MATCHES "^\\$<")
            message(FATAL_ERROR
                "avm_add_project(${name}) does not support generator-expression sources: ${source}")
        elseif(IS_ABSOLUTE "${source}")
            set(source_abs "${source}")
        else()
            get_filename_component(source_abs "${source}" ABSOLUTE
                BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
        endif()

        get_filename_component(source_extension "${source_abs}" EXT)
        string(TOLOWER "${source_extension}" source_extension)
        if(source_extension STREQUAL ".c")
            set(language C)
        elseif(source_extension STREQUAL ".cpp")
            set(language CXX)
        else()
            message(FATAL_ERROR
                "avm_add_project(${name}) cannot infer the language for "
                "${source}; expected a .c or .cpp extension")
        endif()

        # Include a short path hash so equally named files in different source
        # directories cannot overwrite one another's object files.
        get_filename_component(source_stem "${source_abs}" NAME_WE)
        string(MAKE_C_IDENTIFIER "${source_stem}" object_stem)
        string(SHA1 source_hash "${source_abs}")
        string(SUBSTRING "${source_hash}" 0 8 source_hash)
        set(object "${project_build_dir}/${object_stem}_${source_hash}.o")

        avm_add_object(
            OUTPUT "${object}"
            SOURCE "${source_abs}"
            LANGUAGE "${language}"
            INCLUDE_DIRS ${include_dirs}
            COMPILE_OPTIONS ${ARG_COMPILE_OPTIONS}
            DEPENDS ${ARG_DEPENDS}
        )
        list(APPEND project_objects "${object}")
    endforeach()

    set(output_elf "${project_build_dir}/${output_name}.elf")
    set(output_image "${project_build_dir}/${output_name}.bin")

    if(ARG_IMAGE)
        set(output_image "${ARG_IMAGE}")
    endif()

    set(image_options)
    if(ARG_GC_SECTIONS)
        list(APPEND image_options GC_SECTIONS)
    endif()

    set(image_args
        OUTPUT_ELF "${output_elf}"
        OUTPUT_IMAGE "${output_image}"
        ENTRY "${entry}"
        OBJECTS ${project_objects}
        LIBRARIES ${ARG_LIBRARIES}
        DEPENDS ${ARG_DEPENDS}
        ${image_options}
    )
    if(ARG_STARTUP)
        list(APPEND image_args STARTUP "${ARG_STARTUP}")
    endif()
    if(ARG_DISASSEMBLY)
        if(IS_ABSOLUTE "${ARG_DISASSEMBLY}")
            set(disassembly "${ARG_DISASSEMBLY}")
        else()
            set(disassembly "${project_build_dir}/${ARG_DISASSEMBLY}")
        endif()
        list(APPEND image_args DISASSEMBLY "${disassembly}")
    endif()

    avm_add_image(${image_args})

    set(project_outputs "${output_elf}" "${output_image}")
    if(ARG_DISASSEMBLY)
        list(APPEND project_outputs "${disassembly}")
    endif()

    if(ARG_ALL)
        add_custom_target("${name}" ALL DEPENDS ${project_outputs})
    else()
        add_custom_target("${name}" DEPENDS ${project_outputs})
    endif()

    set_property(TARGET "${name}" PROPERTY AVM_ELF "${output_elf}")
    set_property(TARGET "${name}" PROPERTY AVM_IMAGE "${output_image}")
endfunction()
