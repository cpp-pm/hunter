cmake_minimum_required(VERSION 3.10)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(download-Alut)

# DOCUMENTATION_START {
hunter_add_package(Alut)
find_package(Alut CONFIG REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC Alut::alut)
# DOCUMENTATION_END }
