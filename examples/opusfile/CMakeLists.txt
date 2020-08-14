cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-opusfile)

# DOCUMENTATION_START {
hunter_add_package(opusfile)
find_package(opusfile CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC opusfile::opusfile)

if(NOT WIN32 AND NOT MINGW AND NOT MSYS)
    target_link_libraries(main PUBLIC opusfile::opusurl)
endif()
# DOCUMENTATION_END }
