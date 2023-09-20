cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-opusfile)

# DOCUMENTATION_START {
hunter_add_package(opusfile)
find_package(opusfile CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC opusfile::opusfile)
# DOCUMENTATION_END }
