cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-gl4es)

# DOCUMENTATION_START {
hunter_add_package(gl4es)
find_package(gl4es CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC gl4es::GL)
# DOCUMENTATION_END }
