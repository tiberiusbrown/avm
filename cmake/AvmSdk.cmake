include_guard(GLOBAL)

# Used both by this build and by consumers of the installed SDK.
function(avm_add_program name)
    cmake_parse_arguments(P "PACKAGE" "STARTUP;TITLE;BUILD_DIR" "SOURCES;INCLUDE_DIRS;COMPILE_OPTIONS;LINK_OPTIONS;DEPENDS" ${ARGN})
    if(P_UNPARSED_ARGUMENTS OR NOT P_SOURCES)
        message(FATAL_ERROR "Invalid avm_add_program(${name}): ${P_UNPARSED_ARGUMENTS}")
    endif()
    if(TARGET avm_sdk_tools)
        set(compiler "${AVM_SDK_BUILD_BIN}/avm-clang${CMAKE_EXECUTABLE_SUFFIX}")
        set(tool_dir "${AVM_SDK_BUILD_BIN}")
        set(packer "$<TARGET_FILE:llvm-avm-image>")
        set(firmware "${AVM_INTERPRETER_HEX}")
        set(dependencies avm_sdk_tools avm_sysroot)
    else()
        set(suffix "")
        if(CMAKE_HOST_WIN32)
            set(suffix .exe)
        endif()
        set(compiler "${AVM_SDK_ROOT}/bin/avm-clang${suffix}")
        set(tool_dir "${AVM_SDK_ROOT}/bin")
        set(packer "${AVM_SDK_ROOT}/bin/avm-image${suffix}")
        set(firmware "${AVM_SDK_ROOT}/bin/avm/interp.hex")
        set(dependencies "${compiler}")
    endif()
    if(NOT P_BUILD_DIR)
        set(P_BUILD_DIR "${CMAKE_CURRENT_BINARY_DIR}/${name}")
    endif()
    if(NOT P_STARTUP)
        set(P_STARTUP crt0.o)
    endif()
    set(includes)
    foreach(dir IN LISTS P_INCLUDE_DIRS)
        get_filename_component(dir "${dir}" ABSOLUTE BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
        list(APPEND includes -I "${dir}")
    endforeach()
    set(objects)
    foreach(source IN LISTS P_SOURCES)
        get_filename_component(source "${source}" ABSOLUTE BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
        get_filename_component(stem "${source}" NAME)
        string(SHA1 hash "${source}")
        string(SUBSTRING "${hash}" 0 8 hash)
        set(object "${P_BUILD_DIR}/${stem}_${hash}.o")
        add_custom_command(OUTPUT "${object}"
            COMMAND "${CMAKE_COMMAND}" -E make_directory "${P_BUILD_DIR}"
            COMMAND "${compiler}" --target=avm-unknown-arduboyfx
                -O2 -g -funwind-tables -fasynchronous-unwind-tables -Wall -Wextra -Werror
                ${includes} ${P_COMPILE_OPTIONS} -MD -MF "${object}.d" -MQ "${object}"
                -c "${source}" -o "${object}"
            DEPFILE "${object}.d" DEPENDS "${source}" ${dependencies} ${P_DEPENDS} VERBATIM)
        list(APPEND objects "${object}")
    endforeach()
    set(elf "${P_BUILD_DIR}/${name}.elf")
    set(image "${P_BUILD_DIR}/${name}.bin")
    add_custom_command(OUTPUT "${elf}" "${image}"
        COMMAND "${compiler}" "-B${tool_dir}" --target=avm-unknown-arduboyfx
            "--avm-startup=${P_STARTUP}" ${objects} ${P_LINK_OPTIONS} -o "${elf}"
        DEPENDS ${objects} ${dependencies} ${P_DEPENDS} VERBATIM)
    set(outputs "${elf}" "${image}")
    if(P_PACKAGE)
        set(package "${P_BUILD_DIR}/${name}.arduboy")
        add_custom_command(OUTPUT "${package}"
            COMMAND "${packer}" "${elf}" --interpreter "${firmware}"
                --title "${P_TITLE}" -o "${package}"
            DEPENDS "${elf}" "${firmware}" VERBATIM)
        list(APPEND outputs "${package}")
    endif()
    add_custom_target(${name} DEPENDS ${outputs})
    set_target_properties(${name} PROPERTIES AVM_ELF "${elf}" AVM_IMAGE "${image}")
endfunction()
