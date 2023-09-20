cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Opus)

# DOCUMENTATION_START {
hunter_add_package(Opus)
find_package(Opus CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC Opus::opus)
# DOCUMENTATION_END }
