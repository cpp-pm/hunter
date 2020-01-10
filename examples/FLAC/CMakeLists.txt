cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-FLAC)

# DOCUMENTATION_START {
hunter_add_package(FLAC)
find_package(FLAC CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC FLAC::FLAC++)
# DOCUMENTATION_END }
