# Copyright (c)
# All rights reserved.

cmake_minimum_required(VERSION 3.5)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-theora)

# DOCUMENTATION_START {
hunter_add_package(theora)
find_package(theora REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PUBLIC theora::theora)
# DOCUMENTATION_END }
