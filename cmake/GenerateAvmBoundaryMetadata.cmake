if(NOT DEFINED AVM_INTERP_MAP OR NOT DEFINED AVM_INTERP_HEX OR
   NOT DEFINED AVM_BOUNDARY_OUTPUT)
    message(FATAL_ERROR "AVM boundary metadata requires map, hex, and output paths")
endif()

file(READ "${AVM_INTERP_MAP}" avm_map)
string(REGEX MATCH "0x([0-9a-fA-F]+)[ \t]+primary_table([ \r\n]|$)"
    avm_primary_match "${avm_map}")
if(NOT avm_primary_match)
    message(FATAL_ERROR "Interpreter map has no primary_table symbol")
endif()
math(EXPR avm_primary_byte "0x${CMAKE_MATCH_1}")
math(EXPR avm_primary_word "${avm_primary_byte} / 2")
math(EXPR avm_primary_remainder "${avm_primary_byte} % 2")
if(NOT avm_primary_remainder EQUAL 0)
    message(FATAL_ERROR "primary_table is not AVR word aligned")
endif()
file(SHA256 "${AVM_INTERP_HEX}" avm_hex_sha256)
file(WRITE "${AVM_BOUNDARY_OUTPUT}"
    "{\n"
    "  \"schema\": 1,\n"
    "  \"interpreter_hex_sha256\": \"${avm_hex_sha256}\",\n"
    "  \"primary_table_avr_word\": ${avm_primary_word},\n"
    "  \"primary_slot_words\": 4,\n"
    "  \"primary_slot_count\": 256\n"
    "}\n")
