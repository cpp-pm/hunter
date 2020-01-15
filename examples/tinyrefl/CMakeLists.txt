# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/hunter-packages/gate
include("../common.cmake")

project(tinyrefl)

# DOCUMENTATION_START {
hunter_add_package(tinyrefl)
find_package(tinyrefl CONFIG REQUIRED)
find_package(tinyrefl_tool CONFIG REQUIRED)

add_executable(boo boo.cpp)
tinyrefl_tool(TARGET boo HEADERS example.hpp)
target_link_libraries(boo PUBLIC tinyrefl::tinyrefl)
# DOCUMENTATION_END }
