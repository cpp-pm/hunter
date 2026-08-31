cmake_minimum_required(VERSION 3.10)

if(NOT DEFINED SOURCE_DIR)
    message(FATAL_ERROR "SOURCE_DIR is required")
endif()

set(jasper_cmake "${SOURCE_DIR}/CMakeLists.txt")
file(READ "${jasper_cmake}" jasper_contents)

set(old_block "set(JAS_STDC_VERSION \"0L\" CACHE INTERNAL \"The value of __STDC_VERSION__.\")")
set(new_block "if(NOT DEFINED JAS_STDC_VERSION)\n\tset(JAS_STDC_VERSION \"0L\" CACHE INTERNAL \"The value of __STDC_VERSION__.\")\nendif()")

string(FIND "${jasper_contents}" "${new_block}" already_patched)
if(NOT already_patched EQUAL -1)
    return()
endif()

string(FIND "${jasper_contents}" "${old_block}" block_position)
if(block_position EQUAL -1)
    return()
endif()

string(REPLACE "${old_block}" "${new_block}" jasper_contents "${jasper_contents}")
file(WRITE "${jasper_cmake}" "${jasper_contents}")
