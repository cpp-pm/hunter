cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-glu)

# DOCUMENTATION_START {
hunter_add_package(glu)
find_package(glu CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC glu::GLU)
# DOCUMENTATION_END }
