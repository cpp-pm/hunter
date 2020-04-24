# Copyright (c)
# All rights reserved.

cmake_minimum_required(VERSION 3.2)

# Emulate HunterGate:
# * https://github.com/cpp-pm/gate
include("../common.cmake")

project(download-libbacktrace)

# DOCUMENTATION_START {
hunter_add_package(libbacktrace)
find_package(libbacktrace REQUIRED)

add_executable(boo boo.cpp)
target_link_libraries(boo PUBLIC libbacktrace::libbacktrace)
# DOCUMENTATION_END }
